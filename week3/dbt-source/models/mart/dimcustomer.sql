select (row_number() over (order by customer_id) - 1) as customer_key
       ,customer_id
       ,company_name
       ,contact_name
       ,contact_title
       ,address
       ,city
       ,postal_code
       ,country
       ,phone
       ,fax
       ,region
from {{ ref('silver_nw_customer') }}

union

select -1 as customer_key
       ,'unkown' as customer_id
       ,'unkown' as company_name
       ,'unkown' as contact_name
       ,'unkown' as contact_title
       ,'unkown' as address
       ,'unkown' as city
       ,'unkown' as postal_code
       ,'unkown' as country
       ,'unkown' as phone
       ,'unkown' as fax
       ,'unkown' as region