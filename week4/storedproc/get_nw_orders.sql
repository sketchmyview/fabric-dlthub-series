CREATE PROC [gold].[get_nw_orders]
AS
BEGIN
    SELECT dc.company_name
       ,dc.address AS company_address
       ,dc.phone AS company_phone
       ,dd.full_date AS order_date
       ,dd.month_name AS order_month
       ,pc.postal_code
       ,dct.city_name AS shipping_city
       ,dcy.country_name AS shipping_country
       ,dr.region_name AS shipping_region
       ,fo.freight
    FROM gold.factorder fo
        JOIN gold.dimcustomer dc
            ON dc.customer_key = fo.customer_key
        JOIN gold.dimdate dd
            ON dd.date_key = fo.order_date_key
        JOIN gold.dimcity dct
            ON dct.city_key = fo.city_key
        JOIN gold.dimpostalcode pc
            ON pc.postal_key = fo.postal_key
        JOIN gold.dimcountry dcy
            ON dcy.country_key = fo.country_key
        JOIN gold.dimregion dr
            ON dr.region_key = fo.region_key
END