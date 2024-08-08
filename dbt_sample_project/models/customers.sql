-- models/customers.sql

-- models/my_model.sql

with raw_data as (
    select * from raw_customers
)

select
    
    sum(customer_id) as total_column
from raw_data
