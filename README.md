# Snowflake dbt Project

This is a comprehensive dbt project configured to work with Snowflake, demonstrating all model types and best practices.

## Project Structure

```
.
├── models/
│   ├── staging/           # Staging models (VIEWs)
│   │   ├── stg_orders.sql
│   │   └── stg_customers.sql
│   ├── intermediate/      # Intermediate models (EPHEMERAL)
│   │   └── int_order_details.sql
│   ├── marts/            # Fact and Dimension tables
│   │   ├── fct_orders.sql
│   │   ├── dim_customers.sql
│   │   └── agg_order_metrics.sql
│   └── schema.yml
├── tests/
│   ├── generic/          # Reusable test macros
│   └── singular/         # One-off test queries
├── snapshots/            # Snapshot models (SCD Type 2)
│   └── customers_snapshot.sql
├── macros/               # Custom macros
├── seeds/                # Static CSV data
├── analysis/             # Analytical queries
├── dbt_project.yml       # dbt project configuration
├── profiles.yml          # Snowflake connection config
└── README.md
```

## Model Types Included

### 1. **VIEW Models** (Staging Layer)
- `stg_orders.sql` - Raw orders transformation
- `stg_customers.sql` - Raw customers transformation
- **Use case**: Initial data cleaning and renaming

### 2. **EPHEMERAL Models** (Intermediate Layer)
- `int_order_details.sql` - Temporary intermediate logic
- **Use case**: Reusable logic that won't be materialized as a table

### 3. **TABLE Models** (Marts/Analytics Layer)
- `fct_orders.sql` - Fact table with order metrics
- `dim_customers.sql` - Dimension table with customer attributes
- `agg_order_metrics.sql` - Aggregated customer metrics
- **Use case**: Final analytical tables for BI tools

### 4. **SNAPSHOT Models**
- `customers_snapshot.sql` - SCD Type 2 snapshot
- **Use case**: Track historical changes to customer data

## Getting Started

### 1. Install Dependencies
```bash
pip install -r requirements.txt
```

### 2. Configure Snowflake Connection
Update `profiles.yml` with your Snowflake credentials:
```yaml
snowflake_profile:
  outputs:
    dev:
      type: snowflake
      account: [YOUR_ACCOUNT_ID]
      user: [YOUR_USERNAME]
      password: [YOUR_PASSWORD]
      role: [YOUR_ROLE]
      database: [YOUR_DATABASE]
      schema: [YOUR_SCHEMA]
```

### 3. Verify Connection
```bash
dbt debug
```

### 4. Run dbt
```bash
# Run all models
dbt run

# Run specific model
dbt run --select stg_orders

# Run tests
dbt test

# Generate documentation
dbt docs generate
dbt docs serve

# Create snapshots
dbt snapshot
```

## Key Features

✅ **Complete model hierarchy** - Staging → Intermediate → Marts  
✅ **All model materializations** - Views, Tables, Ephemeral, Snapshots  
✅ **Data quality tests** - Unique, Not null, Referential integrity  
✅ **Custom macros** - Reusable SQL logic  
✅ **Seeds** - Static reference data  
✅ **Documentation** - YAML descriptions and lineage  
✅ **Analytics** - Customer lifetime value analysis  

## Best Practices Demonstrated

- ✓ Modular SQL with refs and sources
- ✓ Semantic layer with schemas and tests
- ✓ Proper tagging for filtering
- ✓ Clear naming conventions
- ✓ DRY (Don't Repeat Yourself) with macros
- ✓ Configuration management in YAML
- ✓ Version control friendly

## Variables

Configure in `dbt_project.yml`:
```yaml
vars:
  environment: "dev"
  date_format: "%Y-%m-%d"
```

## Useful Commands

```bash
# Parse all models without running
dbt parse

# Run with specific var
dbt run --vars '{"environment": "prod"}'

# Run tests on specific models
dbt test --select fct_orders

# Generate lineage
dbt docs generate

# Refresh materializations
dbt run --full-refresh
```

## Documentation

Generate and serve dbt documentation:
```bash
dbt docs generate
dbt docs serve
```

Visit `http://localhost:8000` to explore the project lineage.

## Support

For questions, refer to:
- [dbt Documentation](https://docs.getdbt.com/)
- [Snowflake dbt Adapter](https://docs.getdbt.com/reference/warehouse-setups/snowflake-setup)
