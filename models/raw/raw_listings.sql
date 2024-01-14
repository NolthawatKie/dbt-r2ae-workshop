{{ config(
    tags=["raw"]
    )
}}

WITH src_listings AS (
     SELECT
         *
     FROM
         R2AE_DATABASE.SRC.SRC_LISTINGS
     WHERE
         id IS NOT NULL
         AND listing_url IS NOT NULL
         AND name IS NOT NULL
         AND room_type IS NOT NULL
         AND price IS NOT NULL
         AND neighbourhood IS NOT NULL
)

SELECT
     id AS listing_id,
     name AS listing_name,
     listing_url,
     room_type,
     price AS price_str,
     neighbourhood
FROM
     src_listings