with customer_totals as (
    select
        c.customer_id,
        c.first_name || ' ' || c.last_name as name,
        sum(p.amount) as total_payment
    from customer c
    join payment p using (customer_id)
    group by c.customer_id, c.first_name, c.last_name
),
ranked as (
    select
        customer_id,
        name,
        total_payment,
        ntile(100) over (order by total_payment asc) as percentile
    from customer_totals
)
select
    customer_id,
    name,
    total_payment,
    percentile
from ranked
where percentile >= 90
order by name asc;
