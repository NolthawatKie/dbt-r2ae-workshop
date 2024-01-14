{{ config(
    tags=["raw"]
    )
}}

WITH src_hosts AS (
   SELECT
       *
   FROM
       R2AE_DATABASE.SRC.SRC_HOSTS
   WHERE
        id IS NOT NULL
        AND name IS NOT NULL
)

SELECT
   id AS host_id,
   name AS host_name,
   is_superhost
FROM
   src_hosts