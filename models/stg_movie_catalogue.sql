{{
    config(
        materialized='view'
    )
}}

select
        movie_id,
        movie_title,
        COALESCE(genre, 'unknown') AS genre,
        studio
from {{ source('silver_screen', 'movie_catalogue') }}