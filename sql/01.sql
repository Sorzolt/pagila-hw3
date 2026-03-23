select count(*)
from customer
join address using (address_id)
join city using (city_id)
join country using (country_id)
where country <> 'United States';
