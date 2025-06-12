{{
    config(
        materialized='table'
    )
}}

SELECT
    i.month,
    m.movie_id,
    m.movie_title,
    m.genre,
    m.studio,
    i.location_id,
    i.rental_cost
FROM {{ ref('stg_movie_catalogue') }} m
LEFT JOIN {{ ref('stg_invoices') }} i
ON m.movie_id = i.movie_id