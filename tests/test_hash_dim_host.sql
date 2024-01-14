SELECT *
FROM {{ ref("dim_hosts") }}
WHERE LEN(host_name) <> 32