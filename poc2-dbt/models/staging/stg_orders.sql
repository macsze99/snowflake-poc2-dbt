select
    order_id,
    customer_id,
    product_name,
    amount,
    file_name,
    loaded_at
from {{ source('raw', 'LANDING_ORDERS') }}
