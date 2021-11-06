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