-- Generic test to check for unique order IDs
{% test unique_order_id(model, column_name) %}

select
    {{ column_name }}
from {{ model }}
group by {{ column_name }}
having count(*) > 1

{% endtest %}
