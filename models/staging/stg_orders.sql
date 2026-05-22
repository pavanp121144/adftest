-- Staging model: Raw data transformation
-- Model Type: VIEW (ephemeral in production)
{{ config(
    materialized = 'view',
    tags = ['staging', 'orders']
) }}

select
    order_id,
    customer_id,
    order_date,
    amount,
    status,
    created_at,
    updated_at
from {{ source('raw_data', 'raw_orders') }}
where status is not null
