with
    int_products as (
        select *
        from {{ref('int_products_enriched')}}
    )
select *
from int_products