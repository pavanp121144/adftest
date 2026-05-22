-- Intermediate model: Joining orders with customers
-- Model Type: EPHEMERAL (temporary, not stored)
{{ config(
    materialized = 'ephemeral',
    tags = ['intermediate', 'orders']
) }}

select
    o.order_id,
    o.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    o.order_date,
    o.amount,
    o.status,
    case
        when o.status = 'completed' then 'success'
        when o.status = 'pending' then 'in_progress'
        when o.status = 'cancelled' then 'failed'
        else 'unknown'
    end as order_status_category
from {{ ref('stg_orders') }} o
left join {{ ref('stg_customers') }} c on o.customer_id = c.customer_id
