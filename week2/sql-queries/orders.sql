SELECT order_id
       ,customer_id
       ,employee_id
       ,CAST(strftime(CAST(order_date AS DATE), '%Y/%m/%d') AS DATE) AS order_date
       ,CAST(strftime(CAST(required_date AS DATE), '%Y/%m/%d') AS DATE) AS required_date
       ,CAST(strftime(CAST(shipped_date AS DATE), '%Y/%m/%d') AS DATE) AS shipped_date
       ,ship_via
       ,freight
       ,ship_name
       ,ship_address
       ,ship_city
       ,ship_postal_code
       ,ship_country
       ,COALESCE(ship_region, 'unknown') AS ship_region
FROM read_json('__FILE_PATH__', __OPTIONS_STR__)