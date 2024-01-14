{{ config(
    materialized='ephemeral',
    )
}}


SELECT * FROM {{ ref("my_first_dbt_model")}}