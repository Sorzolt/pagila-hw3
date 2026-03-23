with film_rentals as (
    select
        c.name,
        f.title,
        count(*) as "total rentals"
    from category c
    join film_category fc using (category_id)
    join film f using (film_id)
    join inventory i using (film_id)
    join rental r using (inventory_id)
    group by c.category_id, c.name, f.film_id, f.title
),
ranked as (
    select
        name,
        title,
        "total rentals",
        row_number() over (
            partition by name
            order by "total rentals" desc, title desc
        ) as rn
    from film_rentals
)
select
    name,
    title,
    "total rentals"
from ranked
where rn <= 5
order by name asc, "total rentals" desc, title asc;
