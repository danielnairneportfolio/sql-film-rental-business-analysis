/* 
1. My partner and I want to come by each of the stores in person and meet the managers. 
Please send over the managers’ names at each store, with the full address 
of each property (street address, district, city, and country please).  
*/ 

SELECT
manager_name
district
city
country

FROM
stores;


	
/*
2.	I would like to get a better understanding of all of the inventory that would come along with the business. 
Please pull together a list of each inventory item you have stocked, including the store_id number, 
the inventory_id, the name of the film, the film’s rating, its rental rate and replacement cost. 
*/

SELECT
store_ID
inventory_ID
film_name
film_rating
rental_rate
replacement_cost

FROM
inventory;




/* 
3.	From the same list of films you just pulled, please roll that data up and provide a summary level overview 
of your inventory. We would like to know how many inventory items you have with each rating at each store. 
*/

SELECT
store_ID
rating
COUNT(*) AS numof_inventoryitems

FROM inventory;



/* 
4. Similarly, we want to understand how diversified the inventory is in terms of replacement cost. We want to 
see how big of a hit it would be if a certain category of film became unpopular at a certain store.
We would like to see the number of films, as well as the average replacement cost, and total replacement cost, 
sliced by store and film category. 
*/ 

SELECT
fim_category
store_ID
COUNT(*) as numberof_films
AVG(replacement_cost) as avg_replacementcost
SUM(replacement_cost) as total_replacementcost

FROM
inventory

GROUP BY
store_ID, film_category;



/*
5.	We want to make sure you folks have a good handle on who your customers are. Please provide a list 
of all customer names, which store they go to, whether or not they are currently active, 
and their full addresses – street address, city, and country. 
*/


SELECT
customer_name
store_ofchoice
active_status
st_address
city
country

FROM
customers;




/*
6.	We would like to understand how much your customers are spending with you, and also to know 
who your most valuable customers are. Please pull together a list of customer names, their total 
lifetime rentals, and the sum of all payments you have collected from them. It would be great to 
see this ordered on total lifetime value, with the most valuable customers at the top of the list. 
*/

SELECT
customer_name
COUNT(*) as lifetime_rentals
SUM(payment) as payments

FROM
customers

ORDER BY
payments DESC;

    
/*
7. My partner and I would like to get to know your board of advisors and any current investors.
Could you please provide a list of advisor and investor names in one table? 
Could you please note whether they are an investor or an advisor, and for the investors, 
it would be good to include which company they work with. 
*/

SELECT
advisor_name
investor_name
company

FROM
advisors
investors;


/*
8. We're interested in how well you have covered the most-awarded actors. 
Of all the actors with three types of awards, for what % of them do we carry a film?
And how about for actors with two types of awards? Same questions. 
Finally, how about actors with just one award? 
*/

SELECT
WITH three_awards AS (
SELECT
COUNT(DISTINCT actor_ID) as total
FROM 
actors
Where
total_award = 3),

two_awards AS (
SELECT
COUNT(DISTINCT actor_ID) as total
FROM 
actors
Where
total_award = 2),


one_award AS (
SELECT
COUNT(DISTINCT actor_ID) as total
FROM 
actors
Where
total_award = 1)

SELECT
(three_awards * 100.0 / 3) As percentage_three_awards),
(two_awards * 100.0 / 2) AS percentage_two_awards),
(one_award * 100.0 / 1) as percent_one_award)

FROM
awards;