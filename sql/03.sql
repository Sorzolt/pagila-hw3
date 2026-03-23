select
    country,
    sum(amount) as total_payments
from payment
join customer using (customer_id)
join address using (address_id)
join city using (city_id)
join country using (country_id)
group by country
order by total_payments desc, country asc;
