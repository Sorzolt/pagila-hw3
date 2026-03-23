with film_revenue as (
    select
        f.film_id,
        f.title,
        sum(payment.amount) as revenue
    from film f
    join inventory using (film_id)
    join rental using (inventory_id)
    join payment using (rental_id)
    group by f.film_id, f.title
),
ranked as (
    select
        a.actor_id,
        a.first_name,
        a.last_name,
        fr.film_id,
        fr.title,
        rank() over (
            partition by a.actor_id
            order by fr.revenue desc, fr.film_id asc
        ) as rank,
        fr.revenue
    from actor a
    join film_actor using (actor_id)
    join film_revenue fr using (film_id)
)
select
    actor_id,
    first_name,
    last_name,
    film_id,
    title,
    rank,
    revenue
from ranked
where rank <= 3
order by actor_id asc, rank asc, film_id asc;
