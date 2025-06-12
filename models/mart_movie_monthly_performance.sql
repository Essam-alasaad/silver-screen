{{
    config(
        materialized='table'
    )
}}

SELECT 
    m.month,
    m.movie_id,
    m.movie_title,
    m.genre,
    m.studio,
    m.location_id AS location,
    m.rental_cost,
    l.total_tickets AS ticket_sold,
    l.revenue
FROM {{ ref('movie_details') }} m 
JOIN {{ ref('locations_monthly_sales') }} l 
  ON m.location_id = l.location_id
 AND m.movie_id = l.movie_id
 AND EXTRACT(MONTH FROM m.month) = l.month

