select distinct
    a2.first_name || ' ' || a2.last_name as "Actor Name"
from actor a2
where a2.actor_id in (
    select fa2.actor_id
    from actor a0
    join film_actor fa0 on a0.actor_id = fa0.actor_id
    join film_actor fa1 on fa0.film_id = fa1.film_id
    join film_actor fa1b on fa1.actor_id = fa1b.actor_id
    join film_actor fa2 on fa1b.film_id = fa2.film_id
    where a0.first_name = 'RUSSELL'
      and a0.last_name = 'BACALL'
)
and a2.actor_id not in (
    select a.actor_id
    from actor a
    where a.first_name = 'RUSSELL'
      and a.last_name = 'BACALL'

    union

    select fa2.actor_id
    from actor a0
    join film_actor fa0 on a0.actor_id = fa0.actor_id
    join film_actor fa2 on fa0.film_id = fa2.film_id
    where a0.first_name = 'RUSSELL'
      and a0.last_name = 'BACALL'
)
order by "Actor Name" asc;
