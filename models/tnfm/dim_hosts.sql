WITH raw_hosts AS (
     SELECT
         *
     FROM
         {{ ref("raw_hosts") }}
)
SELECT
    host_id,
    MD5(host_name) AS host_name,
    CASE WHEN is_superhost = 't' THEN TRUE ELSE FALSE END AS is_superhost
FROM
 raw_hosts