WITH raw_listings AS (
     SELECT
         *
     FROM
         {{ ref("raw_listings") }}
)
SELECT
     listing_id,
     listing_name,
     listing_url,
     room_type,
     CAST(REPLACE(REPLACE(price_str,'$',''),',','') AS DECIMAL(10,2)) AS price,
     src.neighbourhood AS neighbourhood,
     nbh.neighbourhood_group AS tier
FROM
 raw_listings AS src
LEFT JOIN {{ ref("seed_neighbourhood") }} AS nbh
ON nbh.neighbourhood = src.neighbourhood