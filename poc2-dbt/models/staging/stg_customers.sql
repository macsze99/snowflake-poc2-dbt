select
    customer_id,
    trim(first_name) as first_name,
    trim(last_name) as last_name,
    trim(address) as address,
    file_name,
    loaded_at
from {{ source('raw', 'LANDING_CUSTOMERS') }}
