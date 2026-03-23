select country
from customer
join address using (address_id)
join city using (city_id)
join country using (country_id)
group by country
order by count(*) desc, country asc
limit 1;
