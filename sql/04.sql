select distinct
    first_name,
    last_name
from actor
where actor_id in (
    select actor_id
    from film_actor
    join film_category using (film_id)
    join category using (category_id)
    where name = 'Children'
)
and actor_id not in (
    select actor_id
    from film_actor
    join film_category using (film_id)
    join category using (category_id)
    where name = 'Horror'
)
order by last_name asc, first_name asc;
