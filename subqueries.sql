                         /*Uncorrelated subqueries*/

SELECT movie_name, movie_length FROM movies
WHERE movie_length >
(SELECT AVG(movie_length) FROM movies);

SELECT first_name, last_name FROM directors
WHERE date_of_birth >
(SELECT date_of_birth FROM directors
WHERE first_name = 'James'
AND last_name = 'Cameron');

SELECT movie_name FROM movies
WHERE movie_id IN
(SELECT movie_id FROM movie_revenues
WHERE international_takings > domestic_takings); 

-- 1. Select the first and last names of all the actors older than Marlon Brando. 

SELECT first_name, last_name FROM actors 
WHERE date_of_birth < 
(SELECT date_of_birth FROM actors
WHERE first_name = 'Marlon'
AND last_name = 'Brando');

-- 2. Select the movie names of all movies that have domestic takings above 300 million. 

SELECT movie_name FROM movies
WHERE movie_id IN
(SELECT movie_id FROM movie_revenues
WHERE domestic_takings > 300.0);

-- 3. Return the shortest and longest movie length for movies with an above average 
--    domestic takings.

SELECT MIN(movie_length), MAX(movie_length) FROM movies 
WHERE movie_id IN
(SELECT movie_id FROM movie_revenues 
WHERE domestic_takings > 
(SELECT AVG(domestic_takings) FROM movie_revenues));

                              /*correlated subqueries*/

SELECT d1.first_name , d1.last_name , d1.date_of_birth
FROM directors d1
WHERE d1.date_of_birth = 
(SELECT MIN(date_of_birth) FROM directors d2
WHERE d2.nationality = d1.nationality);

-- 1. Select the first name, last name and date of birth for the oldest actors of each gender. 

SELECT ac1.first_name, ac1.last_name, ac1.date_of_birth FROM actors ac1
WHERE ac1.date_of_birth = 
(SELECT MIN(ac2.date_of_birth) FROM actors ac2 
WHERE ac2.gender = ac1.gender);

-- 2. Select the movie name, movie length and age certificate for movies with an
-- above average length for their age certificate. 

SELECT mo1.movie_name, mo1.movie_length, mo1.age_certificate FROM movies mo1
WHERE movie_length > 
(SELECT AVG(mo2.movie_length) FROM movies mo2
WHERE mo2.age_certificate = mo1.age_certificate)
ORDER BY mo1.age_certificate;

