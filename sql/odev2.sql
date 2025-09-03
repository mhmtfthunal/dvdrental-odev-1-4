-- Ödev 2 — dvdrental
-- 1) film: replacement_cost 12.99 >= ve 16.99 < (BETWEEN kullan)
-- BETWEEN uçları dahil ettiğinden, ödev şartıyle en çok uyuşan pratik çözüm:
SELECT *
FROM film
WHERE replacement_cost BETWEEN 12.99 AND 16.99
ORDER BY replacement_cost, title;


-- (Alternatif, matematiksel olarak tam karşılığı)
-- SELECT * FROM film
-- WHERE replacement_cost >= 12.99 AND replacement_cost < 16.99
-- ORDER BY replacement_cost, title;


-- 2) actor: first_name 'Penelope' veya 'Nick' veya 'Ed'
SELECT first_name, last_name
FROM actor
WHERE first_name IN ('Penelope','Nick','Ed')
ORDER BY first_name, last_name;


-- 3) film: rental_rate IN (0.99, 2.99, 4.99) VE replacement_cost IN (12.99, 15.99, 28.99)
SELECT *
FROM film
WHERE rental_rate IN (0.99, 2.99, 4.99)
AND replacement_cost IN (12.99, 15.99, 28.99)
ORDER BY rental_rate, replacement_cost, title;
