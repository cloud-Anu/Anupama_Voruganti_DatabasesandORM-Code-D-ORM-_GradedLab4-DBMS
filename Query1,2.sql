/* 1. You are required to create tables for supplier,customer,category,product,supplier_pricing,order,rating to store the data for the
E-commerce with the schema definition given below. 
2. You are required to develop SQL based programs (Queries) to facilitate the Admin team of the E-Commerce company to retrieve the data in
summarized format - The Data Retrieval needs are described below.*/

-- Create a Ecommerce database 
create database Ecommerce;

-- Use database
use Ecommerce;
 
-- Creation of Supplier table and check table
CREATE TABLE supplier (
    SUPP_ID INT PRIMARY KEY,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50) NOT NULL,
    SUPP_PHONE VARCHAR(50) NOT NULL
);

select * from Supplier;

-- Creation of Customer table and check table
CREATE TABLE customer (
    CUS_ID INT PRIMARY KEY,
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    CUS_GENDER CHAR
);

select * from customer;

-- Creation of category table and check table
CREATE TABLE category (
    CAT_ID INT PRIMARY KEY,
    CAT_NAME VARCHAR(20) NOT NULL
);

select * from category;

-- Creation of product table and check table
CREATE TABLE product (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    PRO_DESC VARCHAR(60),
    CAT_ID INT,
    FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
    );

select * from product;

-- Creation of supplier_pricing table and check table
CREATE TABLE supplier_pricing (
    PRICING_ID INT PRIMARY KEY,
    PRO_ID INT,
    SUPP_ID INT,
    SUPP_PRICE INT DEFAULT 0,
    FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID),
    FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
    );
    
select * from supplier_pricing;

-- Creation of orders table and check table
CREATE TABLE orders (
    ORD_ID INT PRIMARY KEY,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT,
    PRICING_ID INT,
    FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
    FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

select * from orders;

-- Creation of orders table and check table
CREATE TABLE rating (
    RAT_ID INT PRIMARY KEY,
    ORD_ID INT,
    RAT_RATSTARS INT NOT NULL,
    FOREIGN KEY (ORD_ID) REFERENCES orders(ORD_ID)
);

select * from rating;



 



