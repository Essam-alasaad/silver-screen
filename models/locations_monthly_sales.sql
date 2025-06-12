{{
    config(
        materialized='table'
    )
}}

SELECT *
FROM {{ ref('stg_nj_001') }}

UNION ALL

SELECT *
FROM {{ ref('stg_nj_002') }}

UNION ALL

SELECT*
FROM {{ ref('stg_nj_003') }}

