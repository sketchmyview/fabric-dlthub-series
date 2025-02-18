with stg_region as 
(
       select distinct(ship_region) as region_name 
       from {{ ref('silver_nw_orders') }}
       where ship_region != 'unknown'
),
final_region as 
(
       select (row_number() over (order by region_name) - 1) as region_key
              ,region_name
       from stg_region
)

select *
from final_region

union

select -1 as region_key
       ,'unkown' as region_name