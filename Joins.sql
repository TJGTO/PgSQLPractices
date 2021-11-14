                             /* Inner Join */

SELECT directors.director_id, directors.first_name, directors.last_name, movies.movie_name
FROM directors
INNER JOIN movies ON director_id.director_id = movies.director_id
WHERE movies.movie_lang = 'Japanese'
ORDER BY movies.movie_length;
/*here directors is left table and movies is right table*/
/*but you can change them for inner join , it does not change the result*/

SELECT d.director_id, d.first_name, d.last_name, mo.movie_name
FROM directors d
JOIN movies mo ON d.director_id = mo.director_id
WHERE mo.movie_lang = 'Japanese'
ORDER BY mo.movie_length;

SELECT mo.movie_name , mr.domestic_takings FROM movies mo
JOIN movie_revenues mr USING (movie_id)
WHERE mo.age_certificate IN ('12','15','18');
/*You can use USING clause if two tables have same column name*/

-- 1. Select the directors first and last names, the movie names and release dates for all 
-- Chinese, Korean and Japanese movies. 

SELECT d.first_name, d.last_name, mo.movie_name, mo.release_date FROM directors d
JOIN movies mo ON d.director_id = mo.director_id
WHERE mo.movie_lang IN ('Chinese','Japanese','Korean');

-- 2. Select the movie names, release dates and international takings of all English language
-- movies.

SELECT mo.movie_name, mo.release_date, mr.international_takings FROM movies mo 
JOIN movie_revenues mr ON mo.movie_id = mr.movie_id
WHERE mo.movie_lang = 'English';

-- 3. Select the movie names, domestic takings and international takings for all movies 
-- with either missing domestic takings or missing international takings and order the results 
-- by movie name.

SELECT mo.movie_name, mr.international_takings, mr.domestic_takings FROM movies mo
JOIN movie_revenues mr ON mo.movie_id = mr.movie_id 
WHERE mr.domestic_takings IS NULL
OR mr.international_takings IS NULL
ORDER BY mo.movie_name;

                        /*Left Join*/

SELECT d.director_id , d.first_name , d.last_name, mo.movie_name FROM directors d
LEFT JOIN movies mo ON d.director_id = mo.director_id;
/*here directors is left table amd movies is right table*/
SELECT d.director_id , d.first_name , d.last_name, COUNT(mo.movie_id) FROM directors d
LEFT JOIN movies mo ON d.director_id = mo.director_id
GROUP BY d.first_name, d.last_name;

                        /*Right Join*/

SELECT d.director_id , d.first_name , d.last_name, mo.movie_name FROM directors d
RIGHT JOIN movies mo ON d.director_id = mo.director_id;
/*here directors is left table amd movies is right table*/

                        /*Full Join*/

SELECT d.director_id , d.first_name , d.last_name, mo.movie_name FROM directors d
FULL JOIN movies mo ON d.director_id = mo.director_id;

-- 1. Use a left join to select the first and last names of all British directors and 
-- the names and age certificates of the movies that they directed.

SELECT d.first_name, d.last_name, mo.movie_name, mo.age_certificate FROM directors d 
LEFT JOIN movies mo ON d.director_id = mo.director_id 
WHERE d.nationality = 'British';

-- 2. Count the number of movies that each director has directed.

SELECT d.first_name, d.last_name, COUNT(mo.movie_id) FROM directors d
LEFT JOIN movies mo ON d.director_id = mo.director_id 
GROUP BY d.first_name, d.last_name;

                            /* Joining 3 tables */

SELECT d.first_name , d.last_name , mo.movie_name , mr.international_takings, mr.domestic_takings
FROM directors d
JOIN movies mo ON d.director_id = mo.director_id
JOIN movie_revenues mr ON mr.movie_id = mo.movie_id;

SELECT d.first_name , d.last_name , SUM(mr.domestic_takings) AS total_dom_takings FROM director_id
JOIN movies mo ON d.director_id = mo.director_id
JOIN movie_revenues mr ON mo.movie_id = mr.movie_id
WHERE mr.domestic_takings IS NOT NULL
GROUP BY d.first_name , d.last_name
ORDER BY total_dom_takings domestic_takings
LIMIT 1;

-- 1. Select the first and last names of all the actors who have starred in movies 
-- directed by Wes Anderson. 

SELECT ac.first_name, ac.last_name FROM actors ac 
JOIN movies_actors ma ON ac.actor_id = ma.actor_id 
JOIN movies mo ON mo.movie_id = ma.movie_id
JOIN directors d ON d.director_id = mo.director_id
WHERE d.first_name = 'Wes'
AND d.last_name = 'Anderson';

-- 2. Which director has the highest total domestic takings.

SELECT d.first_name, d.last_name, SUM(mr.domestic_takings) AS total_dom_takings FROM directors d
JOIN movies mo ON d.director_id = mo.director_id 
JOIN movie_revenues mr ON mo.movie_id = mr.movie_id 
WHERE mr.domestic_takings IS NOT NULL
GROUP BY d.first_name, d.last_name
ORDER BY total_dom_takings DESC
LIMIT 1;


                          /* UNION */

SELECT first_name, last_name FROM directors
UNION
SELECT first_name, last_name FROM actors;
/*you need to select same number of columns for both tables and the datattypes shoule be same for coresponding columns*/
SELECT first_name, last_name FROM directors
WHERE nationality = 'American'
/*ORDER BY first_name; if you use order by after 1 st table it does not guarantee that result will right*/
UNION
SELECT first_name, last_name FROM actors
WHERE gender = 'F'
ORDER BY first_name;

                          /* UNION ALL*/

SELECT first_name, last_name FROM directors
UNION ALL
SELECT first_name, last_name FROM actors;
/*Union remove the duplicates values but Union ALl does not*/

-- 1. Select the first names, last names and dates of birth from directors and actors. 
-- Order the results by the date of birth.

SELECT first_name, last_name, date_of_birth FROM directors 
UNION ALL 
SELECT first_name, last_name, date_of_birth FROM actors 
ORDER BY date_of_birth;

-- 2. Select the first and last names of all directors and actors born in the 1960s. 
-- Order the results by last name. 

SELECT first_name, last_name FROM directors
WHERE date_of_birth BETWEEN '1960-01-01' AND '1969-12-31'
UNION ALL 
SELECT first_name, last_name FROM actors
WHERE date_of_birth BETWEEN '1960-01-01' AND '1969-12-31'
ORDER BY last_name;

                          /*INTERSECT*/

SELECT first_name from directors
INTERSECT
SELECT first_name FROM actors;
/*its returns only the first names, values which are found in both the director's table and the actors table.*/

                          /*Except*/
SELECT first_name from directors
EXCEPT
SELECT first_name FROM actors;

SELECT first_name from directors
WHERE nationality = 'American'
EXCEPT
SELECT first_name FROM actors;
/*So unlike Union and Intersect, except doesn't return any data from table two at all, and it only returns

data from table one if it's not returned by table two.*/

-- 1. Intersect the first name, last name and date of birth columns in the directors 
-- and actors tables.

SELECT first_name, last_name, date_of_birth FROM directors
INTERSECT 
SELECT first_name, last_name, date_of_birth FROM actors;

-- 2. Retrieve the first names of male actors unless they have the same first name as any
-- British directors.

SELECT first_name FROM actors 
WHERE gender = 'M'
EXCEPT 
SELECT first_name FROM directors 
WHERE nationality = 'British';
