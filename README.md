# _Hair Salon_

### _Ruby: Independent Project Week 3_

##### _Version as of 7/19/2016_

#### By _**Matt Wilkin**_

## Description

_A simple web application that allows a salon owner to create a list of clients and a list of stylists. It will provide a way to view, add, update and delete records from both lists. Finally, it allows the a particular client to be associated with a particular stylist._

## Setup/Installation Requirements:

* _Follow Database Setup Instructions below_
* _ _

## Database Setup Instructions:

* _In PSQL:_

* CREATE DATABASE hair_salon;
* Guest=#\c hair_salon;
* CREATE TABLE stylists (id serial PRIMARY KEY, name VARCHAR, phone_number VARCHAR);
* CREATE TABLE clients (id serial PRIMARY KEY, name VARCHAR, phone_number VARCHAR, stylist_id INT);
* CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;



## Known Bugs

_There are no known bugs at this time._

## Support and contact details

_If you any issues or have questions, ideas or concerns.  Please contact me at <mailto:mwilkin22@gmail.com>_

## Technologies Used

* _Ruby_
* _JavaScript_
* _CSS_
* _HTML_
* _Sinatra_
* _Capybara_
* _Postgres_
* _SQL_



### License

*This application is licensed under the MIT License (MIT) <http://opensource.org/license/MIT>*

Copyright (c) 2016 **_{Matt Wilkin}_**
