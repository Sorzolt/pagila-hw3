select f.title
from rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
where r.customer_id in (
    select distinct r2.customer_id
    from rental r2
    join inventory i2 on r2.inventory_id = i2.inventory_id
    join film f2 on i2.film_id = f2.film_id
    where f2.title = 'BUCKET BROTHERHOOD'
)
and f.title <> 'BUCKET BROTHERHOOD'
group by f.film_id, f.title
having count(distinct r.customer_id) >= 3
order by f.title asc;
