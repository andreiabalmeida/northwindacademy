with
    source as (
     select *
     from {{ source('erp', 'products') }}
    ),

    renamed as (
        select
            cast (ID as int) as product_pk
            ,cast (SUPPLIERID as int) as supplier_fk
            ,cast (CATEGORYID as int) as category_fk
            ,cast (PRODUCTNAME as string) as product_name
            ,cast (QUANTITYPERUNIT as string) as product_quantity_per_unit
            ,cast (UNITPRICE as numeric (18,2)) as product_unit_price
            ,cast (UNITSINSTOCK as int) as product_units_in_stock
            ,cast (UNITSONORDER as int) as product_units_on_order
            ,cast (REORDERLEVEL as int) as product_reornder_level
            ,DISCONTINUED as is_discontinued
        from source

    )

select *
from renamed