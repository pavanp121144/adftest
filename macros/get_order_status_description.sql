-- Macro: Get description for order status
{% macro get_order_status_description(status) %}
    case
        when {{ status }} = 'completed' then 'Order successfully completed'
        when {{ status }} = 'pending' then 'Order is pending processing'
        when {{ status }} = 'cancelled' then 'Order was cancelled'
        when {{ status }} = 'processing' then 'Order is being processed'
        else 'Unknown status'
    end
{% endmacro %}
