//create statement/////////////////////////////////////
INSERT INTO examples (first_name , last_name , email , nationality, age)
VALUES ('Value1','Value1','Value1@gmail.com','Value1',55),
('Value2','Value2','Value2@gmail.com','Value2',54),
('Value3','Value3','Value3@gmail.com','Value3',56)
;

//update statement/////////////////////////////////////
UPDATE examples 
SET email = 'davidmitchel@gmail.com'
WHERE example_id = 1;

UPDATE examples
SET nationality = 'CAN'
WHERE natonality = 'USA';

UPDATE examples
SET first_name = 'JAMES' , age = 55 //multiple colums update
WHERE example_id = 5;

//Delete statement/////////////////////////////////////

DELETE FROM examples
WHERE nationality = 'GBR';

DELETE FROM examples; //delete all the rows from the table
