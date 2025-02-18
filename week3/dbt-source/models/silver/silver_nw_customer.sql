select customer_id
       ,company_name
       ,contact_name
       ,contact_title
       ,address
       ,city
       ,postal_code
       ,country
       ,phone
       ,fax
       ,COALESCE(region, 'unknown') AS region
from {{ source('lakehouse_raw', 'raw__northwind__customers') }}