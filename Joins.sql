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