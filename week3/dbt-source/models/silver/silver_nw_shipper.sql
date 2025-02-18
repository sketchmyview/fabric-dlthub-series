select shipper_id
      ,company_name
      ,phone
from {{ source('lakehouse_raw', 'raw__northwind__shippers') }}