-- Intermediate:

-- Join the necessary tables to find the total quantity of each pizza category ordered.
select pizza_types.category , sum( order_details.quantity ) as total_quantity
from order_details
join pizzas
on order_details.pizza_id = pizzas.pizza_id
join pizza_types
on pizza_types.pizza_type_id = pizzas.pizza_type_id
group by pizza_types.category
order by total_quantity desc;

-- Determine the distribution of orders by hour of the day.
select hour(order_time) , count(order_id) 
from orders
group by hour(order_time);

-- Join relevant tables to find the category-wise distribution of pizzas.
select pizza_types.category ,  count(pizzas.pizza_type_id)  as distribution
from pizza_types
join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
group by  pizza_types.category
order by distribution desc;

-- Group the orders by date and calculate the average number of pizzas ordered per day.
select day(order_date) , avg(order_id)
from orders
group by day(order_date);

-- Determine the top 3 most ordered pizza types based on revenue.
SELECT pizza_types.name , sum(order_details.quantity*pizzas.price) as total_revenue
from order_details
join pizzas
on order_details.pizza_id = pizzas.pizza_id
join pizza_types
on pizzas.pizza_type_id= pizza_types.pizza_type_id
group by pizza_types.name
order by total_revenue desc
limit 3;



