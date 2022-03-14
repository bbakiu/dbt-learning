with stripe_payments as (
    
    select 
        orderid as order_id,
        max(user_id) as customer_id,
        sum(amount) as amount
    from {{ source('stripe', 'js_stripe_payments') }} as payments
    join {{ source('jaffle_shop', 'js_orders') }} as orders on  payments.orderid = orders.id
    where payments.status='success'
    group by order_id

    
)

select * from stripe_payments