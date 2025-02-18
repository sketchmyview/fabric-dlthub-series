select order_id
       ,customer_id
       ,employee_id
       ,order_date
       ,required_date
       ,shipped_date
       ,ship_via
       ,freight
       ,ship_name
       ,ship_address
       ,ship_city
       ,ship_postal_code
       ,ship_country
       ,COALESCE(ship_region, 'unknown') AS ship_region
from {{ source('lakehouse_raw', 'raw__northwind__orders') }}