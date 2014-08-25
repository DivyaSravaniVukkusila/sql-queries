-- We can use "AS" to relabel a field inside a particular query.
-- This not only makes the report look nicer by displaying a more useful
-- header name, but it makes it easier to reference a field elsewhere
-- in the query.

-- "invoices" table

-- A list of the top 5 countries by number of invoices
SELECT billing_country, COUNT(*) AS invoice_count
FROM invoices
GROUP BY billing_country
ORDER BY invoice_count DESC
LIMIT 5;

-- A list of the top 8 countries by gross/total invoice size
SELECT billing_country, SUM(total) AS gross_sales
FROM invoices
GROUP BY billing_country
ORDER BY gross_sales DESC
LIMIT 8;

-- A list of the top 10 countries by average invoice size
SELECT billing_country, AVG(total) AS avg_invoice_size
FROM invoices
GROUP BY billing_country
ORDER BY avg_invoice_size DESC
LIMIT 10;

-- Sales volume and receipts by year
-- See: http://www.sqlite.org/lang_datefunc.html
-- "STRFTIME" means "string format time" and is used to format the output of
-- dates, times, and timestamps.
-- See: http://cl.ly/image/0C1m372r233t
SELECT STRFTIME('%Y', invoice_date) AS year,
       COUNT(*) AS invoice_count,
       SUM(total) AS invoice_total
FROM invoices
GROUP BY year
ORDER BY year ASC;

-- Sales volume and receipts by year and month
-- You can group by multiple fields
-- You can order by multiple fields (here, year first then month)
-- See: http://cl.ly/image/2e2H3w052H2o

SELECT STRFTIME('%Y', invoice_date) AS year,
       STRFTIME('%m', invoice_date) AS month,
       COUNT(*) AS invoice_count,
       SUM(total) AS invoice_total
FROM invoices
GROUP BY year, month
ORDER BY year ASC, month ASC;

-- A list of the top 5 US states by number of invoices
-- Hint: You'll need to filter the results with WHERE billing_country = 'USA'

SELECT billing_state, count(*) FROM INVOICES WHERE billing_country IS "USA" GROUP BY billing_state ORDER BY COUNT(*) DESC LIMIT 5;

-- A list of the top 5 US states by gross sales

SELECT billing_state, SUM(TOTAL) as total_sales FROM INVOICES WHERE billing_country IS "USA" GROUP BY billing_state ORDER BY total_sales DESC LIMIT 5;
-- http://cl.ly/image/0f2D1I2J0D0i

-- A list of the top 5 US states by average invoice size
SELECT billing_state, AVG(TOTAL) as average_sales FROM INVOICES WHERE billing_country IS "USA" GROUP BY billing_state ORDER BY average_sales DESC LIMIT 5; 
-- http://cl.ly/image/1c3b0h2l282Q

-- A list of the top 10 US cities by number of invoices
SELECT billing_state, COUNT(*) as qty_invoices FROM INVOICES WHERE billing_country IS "USA" GROUP BY billing_state ORDER BY qty_invoices DESC LIMIT 10;
-- http://cl.ly/image/2t0M2P3c0V2S

-- A list of the top 10 US cities by gross sales
SELECT billing_city, SUM(total) AS total_sales FROM invoices WHERE billing_country IS "USA" GROUP BY billing_city ORDER BY total_sales DESC LIMIT 10 ;
-- http://cl.ly/image/1k0s3t0b071T

-- A list of the top 10 US cities by average invoice size
SELECT billing_city, AVG(total) AS average_sales FROM invoices WHERE billing_country IS "USA" GROUP BY billing_city ORDER BY average_sales DESC LIMIT 10 ;
-- http://cl.ly/image/3h2h3b41081i
-- A list of the top 3 cities in California by number of invoices
-- Hint: You'll need a WHERE clause filtering by both billing_country and billing_state

select * from invoices where billing_state LIKE "ca"
-- this is wierd query given this data

-- A list of the top 3 cities in California by gross sales
SELECT billing_city, SUM(total) AS gross_sales FROM invoices WHERE billing_country IS "USA" AND billing_state IS "CA" GROUP BY billing_city ORDER BY gross_sales;
-- http://cl.ly/image/3c1S0V0r1H2H

-- A list of the top 3 cities in California by average invoice size
SELECT billing_city, AVG(total) AS avg_sales FROM invoices WHERE billing_country IS "USA" AND billing_state IS "CA" GROUP BY billing_city ORDER BY avg_sales;
-- http://cl.ly/image/0x1E0Y1h052b

-- "customers" table
-- Remember: run ".schema customers" to see what fields (columns) the customers table contains.

-- A list of the top 3 countries by total number of customers
SELECT country, COUNT(*) FROM customers GROUP BY country ORDER BY COUNT(*) DESC LIMIT 3 ;
-- http://cl.ly/image/190Q3y2v1g15
-- A list of the top 7 cities (anywhere) by total number of customers
SELECT city , COUNT(*) as qty_customers FROM CUSTOMERS GROUP BY CITY ORDER BY qty_customers DESC LIMIT 7 ;
-- http://cl.ly/image/3D3Z0y183S2B
