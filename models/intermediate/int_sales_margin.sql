select
   a.orders_id,
   a.date_date,
   b.product_id,
   sum(a.revenue) as revenue,
   sum(a.quantity) as quantity,
   sum(purchase_price) as purchase_price,
   sum(purchase_price * quantity) as purchase_cost,
   sum(revenue - (purchase_price * quantity)) as margin
from {{ ref('stg_raw__sales') }} as a
left join {{ ref('stg_raw__products') }} as b on a.product_id = b.product_id
group by a.date_date, a.orders_id, b.product_id