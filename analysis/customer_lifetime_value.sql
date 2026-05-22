-- Analysis: Customer Lifetime Value by region
select
    c.country,
    count(distinct c.customer_id) as total_customers,
    count(distinct o.order_id) as total_orders,
    sum(o.amount) as total_revenue,
    round(sum(o.amount) / count(distinct c.customer_id), 2) as avg_customer_lifetime_value
from {{ ref('dim_customers') }} c
left join {{ ref('fct_orders') }} o on c.customer_id = o.customer_id
group by c.country
order by total_revenue desc
