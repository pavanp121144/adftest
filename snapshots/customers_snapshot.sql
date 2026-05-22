-- Snapshot model: Track changes to customer data over time
-- Model Type: SNAPSHOT
{% snapshot customers_snapshot %}

    {{
        config(
            target_schema='snapshots',
            unique_key='customer_id',
            strategy='timestamp',
            updated_at='updated_at',
        )
    }}

    select
        customer_id,
        first_name,
        last_name,
        email,
        phone,
        country,
        created_at,
        current_timestamp() as updated_at
    from {{ ref('stg_customers') }}

{% endsnapshot %}
