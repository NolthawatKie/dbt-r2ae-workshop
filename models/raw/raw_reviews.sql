{{ config(
    tags=["raw"]
    )
}}

WITH src_reviews AS (
   SELECT
       *
   FROM
       R2AE_DATABASE.SRC.SRC_REVIEWS
   WHERE
        listing_id IS NOT NULL
        AND date IS NOT NULL
        AND reviewer_name IS NOT NULL
        AND comments IS NOT NULL
)

SELECT
   id AS review_id,
   listing_id,
   host_id,
   date AS review_date,
   reviewer_name,
   comments AS review_text
FROM
   src_reviews