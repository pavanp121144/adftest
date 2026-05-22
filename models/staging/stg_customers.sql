-- Staging model: Raw customer data transformation
-- Model Type: VIEW
{{ config(
    materialized = 'view',
    tags = ['staging', 'customers']
) }}

select
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    country,
    created_at
from {{ source('raw_data', 'raw_customers') }}
where customer_id is not null
