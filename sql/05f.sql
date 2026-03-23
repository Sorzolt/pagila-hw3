select title
from (
    select f2.title
    from film f1
    join film_category fc1 on f1.film_id = fc1.film_id
    join film_category fc2 on fc1.category_id = fc2.category_id
    join film f2 on fc2.film_id = f2.film_id
    where f1.title = 'AMERICAN CIRCUS'
    group by f2.film_id, f2.title
    having count(distinct fc2.category_id) >= 2

    intersect

    select distinct f2.title
    from film f1
    join film_actor fa1 on f1.film_id = fa1.film_id
    join film_actor fa2 on fa1.actor_id = fa2.actor_id
    join film f2 on fa2.film_id = f2.film_id
    where f1.title = 'AMERICAN CIRCUS'
) x
order by title asc;
