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