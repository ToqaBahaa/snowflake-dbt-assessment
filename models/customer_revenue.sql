select
    c.c_custkey as CUSTOMER_KEY,
    SUM (l.l_extendedprice * (1 - l.l_discount)) as total_revenue
from {{ source("snowflake_tpch", "orders") }} o
join {{ source("snowflake_tpch", "customer") }} c on c.c_custkey = o.o_custkey
join {{ source("snowflake_tpch", "lineitem") }} l on l.l_orderkey = o.o_orderkey
group by c.c_custkey
