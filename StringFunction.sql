                               /* UPPER and LOWER*/

SELECT first_name , UPPER(last_name) AS last_name FROM actors;

SELECT first_name , LOWER(last_name) AS last_name FROM actors;

                               /* INITCAP(initial capitalisation)*/

SELECT INITCAP('eXamplE sTRING'); -- returns Example String
/*First letter of a word become be capital and others become small*/
SELECT INITCAP(movie_name) FROM movies;

                               /*LEFT and RIGHT functions*/

SELECT LEFT('string', 3);--return str
SELECT LEFT('string', -4);--return st count starts from end of the string

SELECT LEFT(movie_name , 5) FROM movies;

SELECT RIGHT('example', 2);--return le
SELECT LEFT('example', -4);--return mple

SELECT RIGHT(movie_name , 2) FROM movies;

                               /* REVERSE */

SELECT movie_name , REVERSE(movie_name) FROM movies;

-- 1. Select the directors first and last names and movie names in upper case.

SELECT UPPER(d.first_name), UPPER(d.last_name), UPPER(m.movie_name) FROM directors d
JOIN movies m ON d.director_id = m.director_id;

-- 2. Select the first and last names, in initial capitalisation format, of all the actors
-- who have starred in a Chinese or Korean movie.

SELECT DISTINCT INITCAP(a.first_name), INITCAP(a.last_name) FROM actors a 
JOIN movies_actors ma ON a.actor_id = ma.actor_id 
JOIN movies m ON m.movie_id = ma.movie_id
WHERE m.movie_lang IN ('Chinese','Korean');

-- 3. Retrieve the reversed first and last names of each directors and the first three 
-- characters of their nationality. 

SELECT REVERSE(first_name), REVERSE(last_name), LEFT(nationality, 3) FROM directors;

-- 4. Retrieve the initials of each director and display it in one column named ‘initials’. 

SELECT CONCAT_WS('.',LEFT(first_name, 1),LEFT(last_name, 1)) AS initials, first_name, last_name 
FROM directors;

                               /* SUBSTRING*/

SELECT SUBSTRING('long string', 5 ,3); -- returns st started at 5 and take 3 char

SELECT first_name , SUBSTRING(first_name , 3,4) FROM actors;

                               /* REPLACE*/

SELECT REPLACE('a cat plays with another dog','cat','dog') -- a dog plays with another dog

UPDATE directors
SET nationality = REPLACE(nationality , 'American', 'USA')
WHERE nationality = 'American';

                               /* SPLIT_PART*/

SELECT SPLIT_PART('first_name.last_name@gmail.com','@',1);-- returns first_name.last_name

SELECT SPLIT_PART('first_name.last_name@gmail.com','@',2);-- returns gmail.com

SELECT movie_name , SPLIT_PART(movie_name, ' ', 1) AS first_word,
SPLIT_PART(movie_name, ' ', 2) AS seond_word
FROM movies;

                               /* Casting*/

SELECT date_of_birth::TEXT FROM directors;

SELECT SPLIT_PATH(date_of_birth::VARCHAR(30),'-',1) FROM directors;--only returns year if 1999/02/07 then it will return 1999

-- 1. Use the substring function to retrieve the first 6 characters of each movie 
-- name and the year they released.

SELECT SUBSTRING(movie_name, 1, 6) AS movie_name, SUBSTRING(release_date::TEXT, 1, 4) AS year
FROM movies;

-- 2. Retrieve the first name initial and last name of every actor born in May.

SELECT SUBSTRING(first_name, 1, 1) AS fn_initial, last_name, date_of_birth FROM actors
WHERE SPLIT_PART(date_of_birth::TEXT, '-', 2) = '05';

-- 3. Replace the movie language for all English language movies, with age certificate
-- rating 18, to ‘Eng’. 

UPDATE movies 
SET movie_lang = REPLACE(movie_lang, 'English', 'Eng')
WHERE age_certificate = '18';

SELECT * FROM movies;
