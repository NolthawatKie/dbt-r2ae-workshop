{% snapshot raw_hosts_scd %}
{{
    config(
        target_schema='dbt_raw',
        unique_key='id',
        strategy='check',
        check_cols='all',
        invalidate_hard_deletes=True
    )
}}

select * FROM {{ source("snowflake","src_hosts") }}
{% endsnapshot %}