with latest_file as (

    select file_name
    from {{ ref('stg_customers') }}

    qualify row_number() over (
        order by loaded_at desc, file_name desc
    ) = 1

)

select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.address,
    c.file_name,
    c.loaded_at
from {{ ref('stg_customers') }} c
join latest_file f
    on c.file_name = f.file_name