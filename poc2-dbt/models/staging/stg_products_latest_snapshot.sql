with latest_file as (

    select
        file_name
    from {{ ref('stg_products') }}

    qualify row_number() over (
        order by loaded_at desc, file_name desc
    ) = 1

)

select
    p.product_id,
    p.product_name,
    p.price,
    p.file_name,
    p.loaded_at
from {{ ref('stg_products') }} p
join latest_file f
    on p.file_name = f.file_name