with recent_rentals as (
    select
        r.customer_id,
        f.film_id,
        row_number() over (
            partition by r.customer_id
            order by r.rental_date desc, r.rental_id desc
        ) as rn
    from rental r
    join inventory i using (inventory_id)
    join film f using (film_id)
),
top5 as (
    select
        rr.customer_id,
        rr.rn,
        case
            when exists (
                select 1
                from film_category fc
                join category c using (category_id)
                where fc.film_id = rr.film_id
                  and c.name = 'Action'
            ) then 1
            else 0
        end as is_action
    from recent_rentals rr
    where rr.rn <= 5
)
select
    c.customer_id,
    c.first_name,
    c.last_name
from customer c
join top5 t using (customer_id)
group by c.customer_id, c.first_name, c.last_name
having sum(is_action) >= 4
order by c.customer_id asc;
