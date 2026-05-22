-- Macro: Convert cents to dollars
{% macro cents_to_dollars(column_name) %}
    ({{ column_name }} / 100.0) as {{ column_name }}_dollars
{% endmacro %}
