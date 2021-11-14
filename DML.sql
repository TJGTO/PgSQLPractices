--//create statement/////////////////////////////////////
INSERT INTO examples (first_name , last_name , email , nationality, age)
VALUES ('Value1','Value1','Value1@gmail.com','Value1',55),
('Value2','Value2','Value2@gmail.com','Value2',54),
('Value3','Value3','Value3@gmail.com','Value3',56)
;

--//update statement/////////////////////////////////////
UPDATE examples 
SET email = 'davidmitchel@gmail.com'
WHERE example_id = 1;

UPDATE examples
SET nationality = 'CAN'
WHERE natonality = 'USA';

UPDATE examples
SET first_name = 'JAMES' , age = 55 --//multiple colums update
WHERE example_id = 5;

--//Delete statement/////////////////////////////////////

DELETE FROM examples
WHERE nationality = 'GBR';

DELETE FROM examples; --//delete all the rows from the table

-- 1. Insert the data into the owners table

INSERT INTO owners (first_name, last_name, city, state, email)
VALUES ('Samuel','Smith','Boston','MA','samsmith@gmail.com'),
('Emma','Johnson','Seattle','WA','emjohnson@gmail.com'),
('John','Oliver','New York','NY','johnoliver@gmail.com'),
('Olivia','Brown','San Francisco','CA','oliviabrown@gmail.com'),
('Simon','Smith','Dallas','TX','sismith@gmail.com'),
(null,'Maxwell',null,'CA','lordmaxwell@gmail.com');

SELECT * FROM owners;

-- 2. Insert the data into the pets table

INSERT INTO pets (species, full_name, age, owner_id)
VALUES ('Dog','Rex',6,1),
('Rabbit','Fluffy',2,5),('Cat','Tom',8,2),('Mouse','Jerry',2,2),
('Dog','Biggles',4,2),('Tortoise','Squirtle',42,3);

SELECT * FROM pets;

-- 3. Update Fluffy the rabbits age to 3

UPDATE pets
SET age = 3
WHERE full_name = 'Fluffy';

SELECT * FROM pets;

-- 4. Delete Mr Maxwell from the owners table

SELECT * FROM owners;

DELETE FROM owners
WHERE last_name = 'Maxwell';

