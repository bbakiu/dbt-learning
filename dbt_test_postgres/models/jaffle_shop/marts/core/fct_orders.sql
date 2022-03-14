with orders as (

    select 
        order_id,
        customer_id,
        amount/100 as amount
    from {{ ref('stg_payments')}}

)
select * from orders