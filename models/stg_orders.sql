select
    o.o_orderkey as ORDER_KEY,
    c.c_name as customer_name,
    extract(year from o.o_orderdate) as order_year,
    o.o_totalprice as total_price
from {{ source("snowflake_tpch", "orders") }} o
join {{ source("snowflake_tpch", "customer") }} c on c.c_custkey = o.o_custkey