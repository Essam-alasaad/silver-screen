-- This is a singular test to confirm that we have no null values in Genre column in our final table
select *
from {{ ref('mart_movie_monthly_performance') }}
where genre is null