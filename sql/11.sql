select
    c.first_name,
    c.last_name,
    x.title,
    x.rental_date
from customer c
join lateral (
    select
        f.title,
        r.rental_date
    from rental r
    join inventory i using (inventory_id)
    join film f using (film_id)
    where r.customer_id = c.customer_id
    order by r.rental_date desc, r.rental_id desc
    limit 1
) x on true
order by c.last_name asc, c.first_name asc;
