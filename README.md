# dvdrental-sql-odevler

Bu repo; PostgreSQL **dvdrental** örnek veritabanı üzerinde 4 ödev için SQL dosyalarını ve kullanımı içerir.

```
.
├─ README.md               ← bu dosya
└─ sql/
   ├─ odev1.sql
   ├─ odev2.sql
   ├─ odev3.sql
   └─ odev4.sql
```

---

## README.md (kopyala/yapıştır)

### Gereksinimler

* PostgreSQL 12+ (öneri: 14/15/16/17)
* dvdrental örnek veritabanı (tar/sql dump)

---

## sql/odev1.sql

```sql
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
```

---

## sql/odev2.sql

```sql
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
```

---

## sql/odev3.sql

```sql
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
```

---

## sql/odev4.sql

```sql
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
```
