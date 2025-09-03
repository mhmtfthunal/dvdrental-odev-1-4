-- Ödev 1 — dvdrental
-- 1) film: title ve description’ı sırala
SELECT title, description
FROM film
ORDER BY title ASC, description ASC;


-- 2) film: length > 60 ve < 75
SELECT *
FROM film
WHERE length > 60
AND length < 75
ORDER BY length ASC, title ASC;


-- 3) film: rental_rate = 0.99 VE (replacement_cost = 12.99 VEYA 28.99)
SELECT *
FROM film
WHERE rental_rate = 0.99
AND replacement_cost IN (12.99, 28.99)
ORDER BY replacement_cost, title;


-- 4) customer: first_name = 'Mary' olan(ların) last_name’i
-- Birden fazla satır olabilir; hepsini getirir.
SELECT DISTINCT last_name
FROM customer
WHERE first_name = 'Mary';


-- 5) film: length 50’den büyük OLMAYAN ve rental_rate 2.99/4.99 OLMAYAN
SELECT *
FROM film
WHERE length <= 50
AND rental_rate NOT IN (2.99, 4.99)
ORDER BY length, title;
