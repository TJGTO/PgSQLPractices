One to one ----------->

one to one, relationships are the simplest of the three types of database relationships, but they are not that common within databases.

A One-to-one relationship is where a primary key value of one table can appear, a maximum of once in the foreign key column of another table.

So for each row of data in the primary key table, there is either zero or one row of data in the foreign.

one to many ----------->

A one to many relationship is where a primary key Collum value can appear multiple times in the foreign key column.

One To many relationship would be a company tracking customer orders so they would have a customer's table

containing customer information such as name, email address and an order table containing order information.

A customer can place as many orders as they like with the company, but any single order can only be

associated with one with one customer.

So the customers and orders table contain a one to many relationship.

Another example would be Instagram users and Instagram photos and Instagram user can post many photos,

but a photo can only belong to one user.

So there is a one to many relationship between the users and the photos table.

many to many ----------->

A many to many relationship is where two tables can have multiple instances of each other, examples

of many to many relationships would be authors and books.

So an author can write many books and a book can have many authors.

For example, the authors, Terry Pratchett and Neil Gaiman wrote the book Good Omens.

Another example would be Terry Pratchett and Stephen Baxter, who co-authored the Long Earth series

of books.

So an author's table and books table would have a many to many relationship, even though most books

just have one author.

For many to many relationships, we can't just use primary keys and foreign keys because this would

violate the uniqueness of the primary key columns.

we can't simply use primary key and foreign key columns to link two tables in a many to many relationship.

We need to use a third table.

And this third table is known as a junction table.