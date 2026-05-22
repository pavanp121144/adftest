-- Dimension model: Customer attributes
-- Model Type: TABLE
{{ config(
    materialized = 'table',
    tags = ['mart', 'dimensions']
) }}

select distinct
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    country,
    created_at,
    current_timestamp() as dbt_loaded_at
from {{ ref('stg_customers') }}
order by customer_id
