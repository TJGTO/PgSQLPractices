/*//select Queries//////////////////////////*/
SELECT * FROM directors;

SELECT first_name, last_name FROM directors; //select columns

/*//Where Clause //////////////////////////////*/
SELECT * FROM movies
WHERE age_certificate = '15'
AND movie_lang = 'Chinese';

SELECT * FROM movies
WHERE age_certificate = '15'
OR movie_lang = 'Chinese';

/*//Logical Operators(" <, >,<=,>=")/////////////////////////////*/

SELECT movie_name, movie_length FROM movies
WHERE movie_length >= 120;

SELECT * FROM movies
WHERE release_date > '1999-12-31'; // Logical Operators on Date

SELECT * FROM movies
WHERE movie_lang > 'English'; // will search alphabatically after 'E' 

/*// IN and not in //////////////////////////////////////////*/
SELECT first_name, last_name FROM actors
WHERE  first_name IN ('Bruce','John','Peter'); //select on multiple values

SELECT first_name, last_name FROM actors
WHERE  first_name NOT IN ('Bruce','John','Peter');

/*/LIKE //////////////////////////////////////*/
SELECT * FROM actors
WHERE first_name LIKE 'P%'; //return all the first_name started with P

SELECT * FROM actors
WHERE first_name LIKE '_ete_'; // _ is like pattern , it will search for exactly one character.return Peter

/*/Between //////////////////////////////////////*/
SELECT movie_name , release_date FROM movies
WHERE release_date BETWEEN '1995-01-01' AND '1999-12-31';

SELECT movie_name , movie_length FROM movies
WHERE movie_length BETWEEN 90 AND 120;

/*/Order BY //////////////////////////////////////*/
SELECT first_name,last_name,date_of_birth FROM actors
ORDER BY first_name; // default it is ascending

SELECT first_name,last_name,date_of_birth FROM actors
/*we can put where clause before Order By*/
ORDER BY first_name DESC;

/*/LIMIT//////////////////////////////////////*/

SELECT * FROM movie_reveneues
ORDER BY domestic_takings
LIMIT 3; 
/*will return lowest 3 domestic returns*/
SELECT * FROM movie_reveneues
ORDER BY revenue_id
LIMIT 5 OFFSET 3;  
/*will return 5 rows by ignoring first 3*/

/*/FETCH//////////////////////////////////////*/

SELECT movie_id, movie_name FROM movies
FETCH FIRST ROW ONLY;

SELECT movie_id, movie_name FROM movies
FETCH FIRST 10 ROW ONLY;
/*fetch first 10 row*/

SELECT movie_id, movie_name FROM movies
OFFSET 8 ROWS
FETCH FIRST 10 ROW ONLY;
/*return id 9 to 18*/

/*/DISTINCT//////////////////////////////////////*/

SELECT DISTINCT movie_lang FROM movies
ORDER BY movie_lang;

SELECT DISTINCT movie_lang, age_certificate FROM movies
ORDER BY movie_lang;
/*return the distinct combinations of 2 columns*/

/*/NULL //////////////////////////////////////*/

SELECT * FROM actors
WHERE date_of_birth IS NULL;

SELECT * FROM actors
WHERE date_of_birth IS NOT NULL;

/*/alias //////////////////////////////////////*/

SELECT last_name AS surname FROM directors;

SELECT last_name AS surname FROM directors
WHERE last_name LIKE 'A%'
ORDER BY surname;
/*SQL orders the data after fetching so it will allows us to order ny alias name*/
/*But it is not allowed to use in where clause*/

/*/Concatenate //////////////////////////////////////*/

SELECT CONCAT(first_name , last_name) AS full_name FROM actors;
SELECT CONCAT(first_name ,'-', last_name) AS full_name FROM actors;
SELECT CONCAT_WS(' ',first_name,middle_name, last_name) AS full_name FROM actors;
/*Ws means with separetor, it will result 'first_name middle_name last_name'*/
