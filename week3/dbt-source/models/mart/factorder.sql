with stg_order as 
(
       select order_id
              ,customer_id
              ,datepart(year, order_date) AS order_year
              ,datepart(month, order_date) AS order_month
              ,datepart(day, order_date) AS order_day
              ,ship_via
              ,freight
              ,ship_name
              ,ship_city
              ,ship_postal_code
              ,ship_country
              ,ship_region
       from {{ ref('silver_nw_orders') }}
       where ship_region != 'unknown'
),
final_order as (
    select coalesce(dc.customer_key, -1) as customer_key
           ,coalesce(dt.date_key, -1) as order_date_key
           ,coalesce(dcy.city_key, -1) as city_key
           ,coalesce(dpc.postal_key, -1) as postal_key
           ,coalesce(dct.country_key, -1) as country_key
           ,coalesce(dr.region_key, -1) as region_key
           ,coalesce(ds.shipper_key, -1) as shipper_key
           ,coalesce(so.freight, 0.0) as freight
     from stg_order as so
        left join {{ ref('dimcustomer') }} as dc
            on dc.customer_id = so.customer_id
        left join {{ ref('dimcountry') }} as dct
            on dct.country_name = so.ship_country
        left join {{ ref('dimpostalcode') }} as dpc
            on dpc.postal_code = so.ship_postal_code
        left join {{ ref('dimregion') }} as dr
            on dr.region_name = so.ship_region
        left join {{ ref('dimcity') }} as dcy
            on dcy.city_name = so.ship_city
        left join {{ ref('dimshipper') }} as ds
            on ds.shipper_id = so.ship_via
        left join {{ source('lakehouse_gold', 'dimdate') }} as dt
            on dt.year = so.order_year
                and dt.month = so.order_month
                and dt.day = so.order_day
)

select * 
from final_order