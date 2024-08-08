-- models/fact_sales_model.sql

with dim_product as (
    select * from {{ source('sqlite_source', 'DimProduct') }}
),

dim_date as (
    select * from {{ source('sqlite_source', 'DimDate') }}
),

fact_sales as (
    select * from {{ source('sqlite_source', 'FactSales') }}
)

select 
    p.ProductName, 
    sum(f.Quantity) as TotalQuantity, 
    sum(f.TotalAmount) as TotalSales
from 
    fact_sales f
join 
    dim_product p on f.ProductID = p.ProductID
group by 
    p.ProductName
