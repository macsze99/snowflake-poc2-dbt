{% snapshot customers_snapshot %}

{{
    config(
        target_schema='CONFORMED',
        unique_key='CUSTOMER_ID',
        strategy='check',
        check_cols=[
            'FIRST_NAME',
            'LAST_NAME',
            'ADDRESS'
        ]
    )
}}

select
    customer_id,
    first_name,
    last_name,
    address
from {{ ref('stg_customers_latest_snapshot') }}

{% endsnapshot %}