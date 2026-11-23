{% snapshot products_snapshot %}

{{
    config(
        target_schema='CONFORMED',
        unique_key='PRODUCT_ID',
        strategy='check',
        check_cols=[
            'PRODUCT_NAME',
            'PRICE'
        ]
    )
}}

select
    product_id,
    product_name,
    price,
    file_name,
    loaded_at
from {{ ref('stg_products_latest_snapshot') }}

{% endsnapshot %}