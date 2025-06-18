with
    --import models
    products as (
        select *
        from {{ ref('stg_erp__products') }}
    )
    ,suppliers as (
        select *
        from {{ ref('stg_erp__suppliers') }}
    )
    ,categories as (
        select *
        from {{ ref('stg_erp__categories') }}
    )
    --transformation
    ,joined as (
        select
            products.product_pk
            ,products.product_name
            ,products.product_quantity_per_unit
            ,products.product_unit_price
            ,products.product_units_in_stock
            ,products.product_units_on_order
            ,products.product_reornder_level
            ,products.is_discontinued
            ,suppliers.supplier_companyname
            ,suppliers.supplier_city
            ,suppliers.supplier_country
            ,categories.category_name
        from products
        left join suppliers on products.supplier_fk = suppliers.supplier_pk
        left join categories on products.category_fk = categories.category_pk
    )

select *
from joined