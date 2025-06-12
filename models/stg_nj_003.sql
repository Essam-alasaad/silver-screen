{{
    config(
        materialized='view'
    )
}}

select
    details AS movie_id,
    date_trunc(month , timestamp) AS month,
    'NJ_003' AS location_id,
    SUM(amount) AS total_tickets,
    SUM(total_value) AS revenue
from {{ source('silver_screen', 'nj_003') }}
where product_type = 'ticket'
group by 1, 2