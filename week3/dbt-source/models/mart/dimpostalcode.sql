with stg_postalcode as 
(
       select distinct(ship_postal_code) as postal_code 
       from {{ ref('silver_nw_orders') }}
),
final_postalcode as 
(
       select (row_number() over (order by postal_code) - 1) as postal_key
              ,postal_code
       from stg_postalcode
)

select *
from final_postalcode

union

select -1 as postal_key
       ,'unkown' as postal_code