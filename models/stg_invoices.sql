{{
    config(
        materialized='view'
    )
}}


SELECT
    movie_id,
    month,
    location_id,
    SUM(total_invoice_sum) AS rental_cost
FROM {{ source('silver_screen', 'invoices') }}
group by 1,2, 3