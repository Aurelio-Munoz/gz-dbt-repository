Select
date_date as date,
COUNT(distinct orders_id) as nb_transactions,
ROUND (sum(revenue),0) as total_revenue,
ROUND (avg(revenue),1) as avg_basket,
ROUND(sum(revenue)/COUNT(orders_id),1) AS average_basket_bis,
ROUND (sum(operational_margin),0) as operational_margin,
ROUND (sum(purchase_cost), 0)as total_purchase_cost,
ROUND (sum(shipping_fee),0) as total_shipping_cost,
ROUND (sum(logcost),0) as total_log_cost,
ROUND(sum (shipping_fee),0) AS shipping_fee,
ROUND (sum(quantity),0) as total_quantity_of_products_sold,
SUM(quantity) AS quantity
from {{ref("int_orders_operational")}}
group by date_date
order by date_date desc