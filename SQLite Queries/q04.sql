-- TPC TPC-H Parameter Substitution (Version 2.17.0 build 0)
-- using default substitutions


select
	o_orderpriority,
	count(*) as order_count
from
	orders
where
	o_orderdate >= date('1993-07-01')
	and o_orderdate < date('1993-07-01', '3 months')
	and exists (
		select
			*
		from
			lineitem
		where
			l_orderkey = o_orderkey
			and l_commitdate < l_receiptdate
	)
group by
	o_orderpriority
order by
	o_orderpriority;
