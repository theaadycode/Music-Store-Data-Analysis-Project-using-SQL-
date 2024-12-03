/*	Question Set 1 - Easy */

--q1: who is the senior most employee based on job role

select * from employee
order BY levels desc
limit 3

--q2 : which contries have the most invoices

SELECT COUNT(*) AS e, billing_country
FROM invoice
GROUP BY billing_country
ORDER BY e DESC

--q3: what are the top 3 values of the total invoice

SELECT * FROM invoice
ORDER by total desc
limit 3

--q3: Which city has the best customers? We would like to throw a promotional Music 
--Festival in the city we made the most money. Write a query that returns one city that 
--has the highest sum of invoice totals. Return both the city name & sum of all invoice 
--totals 

SELECT billing_city,SUM(total) AS InvoiceTotal
FROM invoice
GROUP BY billing_city
ORDER BY InvoiceTotal DESC
LIMIT 1;

--q3: Who is the best customer? The customer who has spent the most money will be 
--declared the best customer. Write a query that returns the person who has spent the 
--most money 

SELECT customer.customer_id, first_name, last_name, SUM(total) AS total_spending
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total_spending DESC
LIMIT 1;
