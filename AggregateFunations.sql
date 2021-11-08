///////////////////////*AGGREGATE FUNCTIONS *///////////////////////////

                            /*COUNT*/
                            
SELECT COUNT(*) FROM movie_reveneues;
SELECT COUNT(international_takings) FROM movie_reveneues;
/*does not count where international_takings is null*/

                         /*SUM*/

SELECT SUM(domestic_takings) FROM movie_revenues
WHERE domestic_takings > 100;
/*Sum is not applied omn VARCAR , only applied on INTEGER and NUMERIC data types*/

                        /*MAX*/

SELECT MAX(movie_length) FROM movies;
SELECT MIN(movie_length) FROM movies;
/*Max can also be applied on dates and VARCHAR and strings*/    
                       /*AVG*/

SELECT AVG(movie_length) FROM movies;                   

                      /* GROUPING */

SELECT movie_lang, COUNT(movie_lang) FROM movies
GROUP BY movie_lang;

SELECT movie_lang, AVG(movie_length) FROM movies
GROUP BY movie_lang;

SELECT movie_lang,age_certificate AVG(movie_length) FROM movies
GROUP BY movie_lang,age_certificate;

SELECT movie_lang , MIN(movie_length) , MAX(movie_length) FROM movies
WHERE age_certificate = '15'
GROUP BY movie_lang;

                      /* Having */

SELECT movie_lang , COUNT(movie_lang) FROM movies
GROUP BY movie_lang
HAVING COUNT(movie_lang) > 1;
/*where count(movie_labg) > 1 will gives you a error*/
/*you cannot use agg function with where clause*/
/*you can use where and having in same query*/
SELECT movie_lang , COUNT(movie_lang) FROM movies
where movie_length > 120
GROUP BY movie_lang
HAVING COUNT(movie_lang) > 1;

                        /* Mathematical Expressions */
                        /* + - / * % */
SELECT movie_id , (domestic_takings + international_takings) AS total_takings FROM movie_reveneues;
SELECT movie_id , (domestic_takings - international_takings) AS total_takings FROM movie_reveneues;
SELECT movie_id , (domestic_takings * international_takings) AS total_takings FROM movie_reveneues;
SELECT movie_id , (domestic_takings / international_takings) AS total_takings FROM movie_reveneues;
SELECT movie_id , (domestic_takings % international_takings) AS total_takings FROM movie_reveneues;