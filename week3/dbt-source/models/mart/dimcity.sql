with stg_city as 
(
       select distinct(ship_city) as city_name 
       from {{ ref('silver_nw_orders') }}
),
final_city as 
(
       select (row_number() over (order by city_name) - 1) as city_key
              ,city_name
       from stg_city
)

select *
from final_city

union

select -1 as city_key
       ,'unkown' as city_name