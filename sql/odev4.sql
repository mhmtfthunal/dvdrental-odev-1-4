-- Ödev 4 — dvdrental
-- 1) film: replacement_cost sütunundaki birbirinden farklı değerler
SELECT DISTINCT replacement_cost
FROM film
ORDER BY replacement_cost;


-- 2) film: replacement_cost sütununda kaç farklı değer var?
SELECT COUNT(DISTINCT replacement_cost) AS distinct_replacement_cost_count
FROM film;


-- 3) film: title 'T' ile başlar VE rating 'G' olan kaç tane?
SELECT COUNT(*) AS count_title_T_and_rating_G
FROM film
WHERE title LIKE 'T%'
AND rating = 'G';


-- 4) country: adı 5 karakter olan kaç ülke var?
SELECT COUNT(*) AS count_country_len_5
FROM country
WHERE LENGTH(country) = 5;


-- 5) city: adı 'R' veya 'r' ile biten kaç şehir var?
SELECT COUNT(*) AS count_city_end_with_r
FROM city
WHERE city ILIKE '%r';
