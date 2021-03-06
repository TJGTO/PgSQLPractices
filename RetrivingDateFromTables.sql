/*//select Queries//////////////////////////*/
SELECT * FROM directors;

SELECT first_name, last_name FROM directors; --//select columns

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
WHERE release_date > '1999-12-31'; --// Logical Operators on Date

SELECT * FROM movies
WHERE movie_lang > 'English'; --// will search alphabatically after 'E' 

-- 1. Select the movie_name and release_date of every movie. 

SELECT movie_name, release_date FROM movies;

-- 2. Select the first and last names of all American directors. 

SELECT first_name, last_name FROM directors 
WHERE nationality = 'American';

-- 3. Select all male actors born after the 1st of January 1970. 

SELECT * FROM actors
WHERE gender = 'M'
AND date_of_birth > '1970-01-01';

-- 4. Select the names of all movies which are over 90 minutes long and movie
-- language is English.

SELECT movie_name FROM movies
WHERE movie_length > 90 
AND movie_lang = 'English';


/*// IN and not in //////////////////////////////////////////*/
SELECT first_name, last_name FROM actors
WHERE  first_name IN ('Bruce','John','Peter');-- //select on multiple values

SELECT first_name, last_name FROM actors
WHERE  first_name NOT IN ('Bruce','John','Peter');

/*/LIKE //////////////////////////////////////*/
SELECT * FROM actors
WHERE first_name LIKE 'P%'; --//return all the first_name started with P

SELECT * FROM actors
WHERE first_name LIKE '_ete_'; --// _ is like pattern , it will search for exactly one character.return Peter

/*/Between //////////////////////////////////////*/
SELECT movie_name , release_date FROM movies
WHERE release_date BETWEEN '1995-01-01' AND '1999-12-31';

SELECT movie_name , movie_length FROM movies
WHERE movie_length BETWEEN 90 AND 120;

-- 1.Select the movie names and movie language of all movies with a movie language of English, 
-- Spanish or Korean. 

SELECT movie_name, movie_lang FROM movies
WHERE movie_lang IN ('English','Spanish','Korean');

-- Select the first and last names of the actors whose last name begins with M and were born 
-- between 01/01/1940 and 31/12/1969. 

SELECT first_name, last_name FROM actors
WHERE last_name LIKE 'M%'
AND date_of_birth BETWEEN '1940-01-01' AND '1969-12-31';

-- Select the first and last names of the directors with nationality of British, French or 
-- German born between 01/01/1950 and 31/12/1980. 

SELECT first_name, last_name FROM directors
WHERE nationality IN ('British','French','German')
AND date_of_birth BETWEEN '1950-01-01' AND '1980-12-31';


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

-- 1. Select the American directors ordered from oldest to youngest. 

SELECT * FROM directors
WHERE nationality = 'American'
ORDER BY date_of_birth;

-- 2. Return the distinct nationalities from the directors table. 

SELECT DISTINCT nationality FROM directors;

-- 3. Return the first names, last names and date of births of the 10 youngest female actors.

SELECT first_name, last_name, date_of_birth FROM actors
WHERE gender = 'F'
ORDER BY date_of_birth DESC
LIMIT 10;


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

-- 1. Return the top 3 movies with the highest international takings. 

SELECT * FROM movie_revenues
WHERE international_takings IS NOT NULL
ORDER BY international_takings DESC
LIMIT 3;

-- 2. Concatenate the first and last names of the directors, separated by a space, 
-- and call this new column full_name. 

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM directors;

-- 3. Return the actors with missing first_names or missing date_of_births. 

SELECT * FROM actors
WHERE first_name IS NULL 
OR date_of_birth IS NULL;

