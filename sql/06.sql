select distinct
    a2.first_name || ' ' || a2.last_name as "Actor Name"
from actor a1
join film_actor fa1 on a1.actor_id = fa1.actor_id
join film_actor fa2 on fa1.film_id = fa2.film_id
join actor a2 on fa2.actor_id = a2.actor_id
where a1.first_name = 'RUSSELL'
  and a1.last_name = 'BACALL'
  and not (a2.first_name = 'RUSSELL' and a2.last_name = 'BACALL')
order by "Actor Name" asc;
