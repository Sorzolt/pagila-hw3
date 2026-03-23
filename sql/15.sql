select
    title,
    actors
from nicer_but_slower_film_list
where category = 'Documentary'
  and rating = 'G'
order by title asc;
