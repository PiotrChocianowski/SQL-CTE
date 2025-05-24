/*what percent of all done orders regarding every customer*/
with 
custord  as 
(
select 
	customer_id
	,count(distinct order_id) 	as order_cust
from orders o
group by 1
order by 1 
),
total_orders as 
(
select 
	count(order_id) 			as total_orders
from  orders
)
select 
cu.customer_id
,cu.order_cust 
,to1.total_orders
,(select round(cu.order_cust/count(order_id)*100,4) from orders) as perc_of_all_orders
from custord cu
cross join total_orders to1
group by 1,2,3
order by perc_of_all_orders desc 






