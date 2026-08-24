
-- 'Question 1 Solution'
SELECT c.first_name, c.last_name, c.email 
FROM customer c
ORDER BY c.last_name;

-- 'Question 2 Solution'
SELECT t.name, t.unit_price 
FROM track t
WHERE t.unit_price > 0.99
ORDER BY t.unit_price DESC;

-- 'Question 3 Solution'
SELECT COUNT(*) num_tracks
FROM track t;

-- 'Question 4 Solution'
SELECT c.customer_id, c.first_name, c.last_name, COUNT(*)
FROM customer c JOIN invoice i
  ON c.customer_id = i.customer_id
GROUP BY c.customer_id 
HAVING COUNT(*)>3
ORDER BY customer_id;

-- 'Question 5 Solution'
SELECT t.name, COUNT(*) quantity_sold
FROM track t
  JOIN invoice_line il
  ON t.track_id = il.track_id
  JOIN invoice i
  ON il.invoice_id = i.invoice_id
GROUP BY t.track_id, t.name
ORDER BY quantity_sold DESC
LIMIT 5;

-- 'Question 6 Solution'
SELECT Alb.title, a.name, COUNT(*) num_tracks
FROM track t
  JOIN album Alb 
  ON t.album_id = Alb.album_id
  JOIN artist a
  ON Alb.artist_id = a.artist_id
GROUP BY a.name, Alb.title
ORDER BY num_tracks DESC;

-- 'Question 7 Solution'
SELECT c.first_name, c.last_name, e.first_name, e.last_name, c.country AS Customer_country, e.country AS Sales_Rep_Country
FROM customer c
JOIN employee e 
  ON c.support_rep_id = e.employee_id
WHERE c.country = e.country;

-- 'Question 8 Solution'
SELECT g.name, SUM(i.invoice_id) Total_Revenue
FROM genre g 
  JOIN track t
  ON t.genre_id = g.genre_id
  JOIN invoice_line il 
  ON t.track_id = il.track_id
  JOIN invoice i
  ON il.invoice_id = i.invoice_id
GROUP BY g.name
ORDER BY Total_Revenue DESC

-- 'Question 10 Solution'
SELECT c.first_name, c.last_name, c.email, g.name
FROM customer c
  LEFT JOIN invoice i
  ON c.customer_id = i.customer_id
  LEFT JOIN invoice_line il 
  ON i.invoice_id = il.invoice_id
  LEFT JOIN track t
  ON il.track_id = t.track_id
  LEFT JOIN genre g
  ON t.genre_id = g.genre_id
WHERE g.name != 'Rock';

-- 'Question 12 Solution'
SELECT t.name, Alb.title, a.name
FROM track t
  LEFT JOIN invoice_line il
  ON t.track_id = il.track_id
  LEFT JOIN album Alb 
  ON t.album_id = Alb.album_id
  LEFT JOIN artist a
  ON a.artist_id = Alb.artist_id
WHERE il.invoice_id is NULL;

