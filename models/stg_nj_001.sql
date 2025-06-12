{{
    config(
        materialized='view'
    )
}}

select
    movie_id,
    date_trunc (month , timestamp) AS month,
    'NJ_001' AS location_id,
    SUM(ticket_amount) AS total_tickets,
    SUM(transaction_total) AS revenue
from {{ source('silver_screen', 'nj_001') }}
group by 1, 2