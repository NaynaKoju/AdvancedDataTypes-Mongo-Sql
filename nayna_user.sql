-- DROP TABLES
-- Yo Section ma muni banako tables haru remove garne.
DROP TABLE Customer;
DROP TABLE CustomerReview;

-- DROP TYPES
-- Yo Section ma muni banako types haru remove garne.
DROP TYPE NestedAddressType;
DROP TYPE AddressType;
DROP TYPE CustomerType;
DROP TYPE PersonType;
/

-- Creating Types

-- Address ko Nested Type Baneko. Assignment ma nested type use garne vaneko xa so at least eauta include garne. Location vaneko thau ma AddressType le replace garne uml class diagram ma.
CREATE TYPE AddressType as OBJECT(
    street VARCHAR2(30),
    town VARCHAR2(20),
    postcode VARCHAR2(8)
) NOT FINAL;
/

CREATE TYPE NestedAddressType AS TABLE OF AddressType;
/

-- Inhertitance ko lagi
-- PersonType vaneko parent ho yeslai Customer ra Employee le use garxa.
CREATE TYPE PersonType AS OBJECT(
    person_id NUMBER,
    person_name VARCHAR2(30),
    person_email VARCHAR(40),
    person_phone NUMBER(10),
    person_address NestedAddressType
) NOT FINAL;
/

-- CustomerType le PersonType Inherit garxa.
CREATE TYPE CustomerType UNDER PersonType(
    customer_payment NUMBER(10)
) NOT FINAL;
/

-- Creating Tables

-- Customer ko table banako mathi ko CustomerType use garera.
CREATE TABLE Customer OF CustomerType(
    person_id PRIMARY KEY
)
NESTED TABLE person_address STORE AS personAddressTable;
/

-- Arko table banako ani Customer lai foreign key relationship lagako
CREATE TABLE CustomerReview(
    customer_review_id NUMBER PRIMARY KEY,
    customer_id REFERENCES Customer(person_id),
    rating NUMBER,
    customer_comment VARCHAR2(500)
);
/

-- Insert Data
-- Data Insert Garnu parne part
INSERT INTO Customer VALUES(
    1,
    'Prabin Shrestha',
    'prabinprabin315@gmail.com',
    9874561230,
    NestedAddressType(),
    120
);
INSERT INTO TABLE(SELECT c.person_address FROM Customer c WHERE c.person_id = 1) VALUES ('Pepsicola', 'Kathmandu', '4600'); 
/

INSERT INTO CustomerReview VALUES (1, 1, 5,'Comment');
/