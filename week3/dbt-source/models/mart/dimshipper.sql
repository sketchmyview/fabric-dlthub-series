with stg_shipper as 
(
       select shipper_id
              ,company_name
              ,phone
       from {{ ref('silver_nw_shipper') }}
),
final_shipper as 
(
       select (row_number() over (order by shipper_id) - 1) as shipper_key
              ,shipper_id
              ,company_name
              ,phone
       from stg_shipper
)

select *
from final_shipper

union

select -1 as shipper_key
       ,-1 as shipper_id
       ,'unkown' as company_name
       ,'unkown' as phone