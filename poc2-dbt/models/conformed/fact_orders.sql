{{ config(
    materialized='table',
    schema='CONFORMED'
) }}

with latest_file as (

    select
        file_name
    from {{ ref('stg_orders') }}

    qualify row_number() over (
        order by loaded_at desc, file_name desc
    ) = 1

)

select
    o.order_id,
    o.customer_id,
    o.product_name,
    o.amount,
    o.loaded_at as insert_timestamp
from {{ ref('stg_orders') }} o
join latest_file f
    on o.file_name = f.file_name