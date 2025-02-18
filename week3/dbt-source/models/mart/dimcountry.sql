with stg_country as 
(
       select distinct(ship_country) as country_name 
       from {{ ref('silver_nw_orders') }}
),
final_country as 
(
       select (row_number() over (order by country_name) - 1) as country_key
              ,country_name
       from stg_country
)

select *
from final_country

union

select -1 as country_key
       ,'unkown' as country_name