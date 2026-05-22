-- Aggregate model: Business metrics aggregated by customer
-- Model Type: TABLE
{{ config(
    materialized = 'table',
    tags = ['mart', 'aggregates']
) }}

select
    customer_id,
    first_name,
    last_name,
    count(distinct order_id) as total_orders,
    sum(amount) as total_amount_spent,
    avg(amount) as avg_order_amount,
    max(order_date) as last_order_date,
    min(order_date) as first_order_date,
    count(case when status = 'completed' then 1 end) as completed_orders,
    count(case when status = 'cancelled' then 1 end) as cancelled_orders,
    current_timestamp() as dbt_loaded_at
from {{ ref('fct_orders') }}
group by customer_id, first_name, last_name
