{{ config(
    materialized='incremental',
    on_schema_change='fail'
    )
}}

WITH cte AS (
    SELECT * FROM {{ ref("my_first_dbt_model")}}
)

SELECT * FROM cte
WHERE id IS NOT NULL
{% if is_incremental() %}
    AND id > (SELECT max(id) from {{ this }})
{% endif%}