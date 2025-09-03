-- Ödev 3 — dvdrental
-- 1) country: 'A' ile başlayıp 'a' ile bitenler
SELECT country
FROM country
WHERE country LIKE 'A%a'
ORDER BY country;


-- 2) country: en az 6 karakter ve 'n' ile bitenler
SELECT country
FROM country
WHERE LENGTH(country) >= 6
AND country LIKE '%n'
ORDER BY country;


-- 3) film title: en az 4 adet (büyük/küçük fark etmeksizin) 'T' içerenler
-- Yaklaşım: title’daki t/T dışındaki her şeyi çıkar, kalan 't' sayısı >= 4
SELECT title
FROM film
WHERE LENGTH(REGEXP_REPLACE(LOWER(title), '[^t]', '', 'g')) >= 4
ORDER BY title;


-- 4) film: title 'C' ile başlayıp, length > 90 ve rental_rate = 2.99 olanlar
SELECT *
FROM film
WHERE title LIKE 'C%'
AND length > 90
AND rental_rate = 2.99
ORDER BY title;
