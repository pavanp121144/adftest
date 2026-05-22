-- Fact model: Core business metrics for orders
-- Model Type: TABLE
{{ config(
    materialized = 'table',
    tags = ['mart', 'facts'],
    indexes=[{'columns': ['order_id', 'customer_id', 'order_date'], 'type': 'unique', 'unique': true}]
) }}

select
    order_id,
    customer_id,
    first_name,
    last_name,
    email,
    order_date,
    amount,
    status,
    order_status_category,
    year(order_date) as order_year,
    month(order_date) as order_month,
    dayofweek(order_date) as order_day_of_week,
    current_timestamp() as dbt_loaded_at
from {{ ref('int_order_details') }}
