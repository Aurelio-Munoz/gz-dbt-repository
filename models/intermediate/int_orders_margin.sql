select
   orders_id,
   date_date,
   Sum(revenue) as revenue,
   sum(quantity) as quantity,
   sum(purchase_price * quantity) as purchase_cost,
   sum(revenue - (purchase_price * quantity)) as margin
from {{ ref("int_sales_margin") }}
group by date_date, orders_id
order by orders_id