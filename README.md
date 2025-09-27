**Welcome to snowflake-dbt-assessment Repository!**

This repository contains a dbt project built on **Snowflake** using the **SNOWFLAKE_SAMPLE_DATA**. The project demonstrates a simple ETL workflow using dbt's medallion architecture (silver and gold layers) and is fully developed using dbt Cloud UI.

---

## **Project Structure**

- **Models (`models/`)**:
  - **stg_orders** (Silver layer)
    - This model combines TPCH_SF1 `orders` with `customer` data to include order_key, customer_name, order_year and total_price 
    - Tests:
      - `order_key` is `not_null` and `unique`.

  - **customer_revenue** (Gold layer)  
    - This model combines TPCH_SF1 `orders`, `customer`  and `lineitem` to aggregates total revenue per customer.  
    - Tests:
      - `customer_key` is `not_null`.

- **Schema (`models/schema.yml`)**: contains column level documentation and tests.  
- **Sources (`models/sources.yml`)**: defines raw TPCH tables as sources (`customer`, `orders`, `lineitem`) from the database `SNOWFLAKE_SAMPLE_DATA` and schema     `TPCH_SF1`.

---

## **Environment Setup (dbt Cloud)**

1. Sign in to your SnowFlake account, make sure you have a running virtual warehouse (ex: DEV_WH) and an active schema for dbt models (ex:DBT_Schema)
2. This projects reads data from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1 so make sure it is availabe in your SnowFlake account
3. Log in / Sign up for a **dbt Cloud account** and connect it to your Snowflake account
4. Create a new project on dbt Cloud and configure its connection to use the warehouse, database and schema you created on SnowFlake to build the models in
5. Connect the project to this GitHub repository (snowflake-dbt-assessment)

---

## **Running the Project in dbt Cloud**

1- Build all models:

  In dbt Cloud Studio, you can each model individually by clicking on Run
  
2- Tests defined in schema.yml will run automatically after build.

3 - Generate and view documentation:
  In your project environment, create a job with these commands to build your project and generate docs
  dbt build
  dbt docs generate
  
