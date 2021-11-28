<h1>Dynamic Form for CRUD operations, all configurable.</h1>

Visit: http://dyn-form-demo.herokuapp.com
You can search and modify a toy music database!

This is a dynamic form demo, <b>production ready</b>, working on Front End (Angular 8 with Material) and Back end (Spring Boot).
You can create or modify forms in a few minutes, with all the functionalities for free.
All you have to do is to build the configuration file in json format, register the new form in the DB (through the dynamic form itself!) and stop... the form is ready!

The configuration is defined in a simple file in <b>json</b> format. This configuration determines:
 - the Search panel, where all the columns configured become fields to search on, depending on their typology: string, date, boolean etc. You can apply different operations: equal to, less/greater than, is null or not, etc;
 - the result table, with pagination;
 - the panel for modification: every column is treated congruently, based on its typology.


In my professional life, I have made a lot of forms for CRUD operations.
CRUD operations are operations for reading or modifying data on a Database. In particular:
 - <b>C</b> for Create: insert new rows;
 - <b>R</b> for Read: search rows, eventually applying filters on some field;
 - <b>U</b> for Update: modify one or more rows;
 - <b>D</b> for Delete: remove one or more rows.

This kind of forms have functionalities very similar: if you sell books, you have to manage the catalog of books, authors, publishers, customers, sells, and so on.


Some years ago, I decided to build an engine for generating dynamic forms. I wanted to build all the forms with simple configuration, avoiding writing code to do the same operations every time...
My life has changed! At the beginning, I developed the engine for Java applets and Tomcat, then for web application in Angular JS and IIS server. The engine interfaces with Oracle, Postgres, SqlServer.

Now, this engine is working on <b>Angular 8</b> as Front End and <b>Spring Boot</b> as Back End.

<h2>Installation on your localhost</h2>
This demo requires <a href="https://www.docker.com">Docker</a>
 - clone this repository on your machine;
 - go to the project directory;
 - launch <b>docker build --tag dyn-form-demo .</b> to build the image
 - launch <b>docker run -p 3000:3001 --name dyn-form-demo -d dyn-form-demo</b> to run the container;
 - open your browser and launch <b>localhost:3000</b>. You shold be able to view the application and have fun with it!
 
 You can configure the application to manage all the databases you want. You have to follow few steps to reach this.
