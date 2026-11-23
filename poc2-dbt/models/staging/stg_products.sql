select
    product_id,
    trim(product_name) as product_name,
    price,
    file_name,
    loaded_at
from {{ source('raw', 'LANDING_PRODUCTS') }}