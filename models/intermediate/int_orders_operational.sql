select
   a.orders_id,
   a.date_date,
   a.revenue,
   a.quantity,
   a.purchase_cost,
   a.margin,
   ((margin + shipping_fee) - (logcost + ship_cost)) as operational_margin,
   b.shipping_fee as shipping_fee,
   b.logcost as logcost,
   b.ship_cost as ship_cost
from {{ ref("int_orders_margin") }} as a
left join {{ ref("stg_raw__ship") }} as b on a.orders_id = b.orders_id
order by a.orders_id desc