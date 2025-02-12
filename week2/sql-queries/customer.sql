SELECT customer_id
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
FROM read_json('__FILE_PATH__', __OPTIONS_STR__)