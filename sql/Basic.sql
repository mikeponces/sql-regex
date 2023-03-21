-- BETWEEN

SELECT p.first_name, p.last_name FROM person p WHERE p.contacted BETWEEN 1 AND 20;

-- GROUP BY

select p.first_name, count(*) from person p group by p.first_name;

-- HAVING

select p.first_name, count(*) as FirstNameCount from person p 
group by p.first_name
having FirstNameCount > 1;

-- JOIN

select p.first_name, e.email_address from person p
inner join email_address e on p.id = e.person_id;

-- INSERT

INSERT INTO contacts (first_name, last_name) VALUES ('Jon', 'Flanders');
INSERT INTO contacts (first_name, last_name) VALUES ('Jon', 'Flanders'),
																										('Foo', 'Bar');
INSERT INTO contacts values (SELECT * FROM OLD_CONTACTS);

-- UPDATE

UPDATE contacts SET last_name = 'Ahern' WHERE id = 1;

-- DELETE

DELETE FROM contacts WHERE id = 2;

-- CREATE DATABASE

CREATE DATABASE CONTACT;
USE DATABASE CONTACT;

-- CREATE TABLE

CREATE TABLE
email_address
(
id INTEGER,
person_id INTEGER,
email_address VARCHAR(55) NOT NULL,
date_created TIMESTAMP
);

-- CREATE PRIMARY KEY

CREATE TABLE
email_address
(
id INTEGER PRIMARY KEY,
person_id INTEGER,
email_address VARCHAR(55) NOT NULL,
date_created TIMESTAMP,
CONSTRAINT pk_id PRIMARY KEY(id)
);

-- ADD CONSTRAINTS
ALTER TABLE
email_address
ADD CONSTRAINT fk_person_id
FOREIGN KEY (person_id) REFERENCES person (id);

ALTER TABLE
email_address
ADD UNIQUE CONSTRAINT uk_email_address (email_address);