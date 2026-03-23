select title
from (
    select f2.title
    from film f1
    join film_actor fa1 on f1.film_id = fa1.film_id
    join film_actor fa2 on fa1.actor_id = fa2.actor_id
    join film f2 on fa2.film_id = f2.film_id
    where f1.title = 'AMERICAN CIRCUS'

    intersect

    select f2.title
    from film f1
    join film_actor fa1 on f1.film_id = fa1.film_id
    join film_actor fa2 on fa1.actor_id = fa2.actor_id
    join film f2 on fa2.film_id = f2.film_id
    where f1.title = 'ACADEMY DINOSAUR'

    intersect

    select f2.title
    from film f1
    join film_actor fa1 on f1.film_id = fa1.film_id
    join film_actor fa2 on fa1.actor_id = fa2.actor_id
    join film f2 on fa2.film_id = f2.film_id
    where f1.title = 'AGENT TRUMAN'
) x
order by title asc;
