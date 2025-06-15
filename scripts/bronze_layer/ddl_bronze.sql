-- Create the 'olist' database
CREATE DATABASE olist;
GO

USE olist;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

/*
==================================================================================
DDL Script: Create Bronze Tables
==================================================================================
Script Purpose:
	This script creates tables in the 'bronze' schema, dropping existing tables
	if they already exist.
	Run this script to re-define the DDL structure of 'bronze' tables
===================================================================================
*/
USE olist;

IF OBJECT_ID('bronze.olist_customers', 'U') IS NOT NULL
	DROP TABLE bronze.olist_customers;

CREATE TABLE bronze.olist_customers (
	customer_id                         NVARCHAR(255),
	customer_unique_id					NVARCHAR(255),
	customer_zip_code					NVARCHAR(50),
	customer_city						NVARCHAR(50),
	customer_state						NVARCHAR(50)			
);

IF OBJECT_ID('bronze.olist_geolocation', 'U') IS NOT NULL
	DROP TABLE bronze.olist_geolocation;

CREATE TABLE bronze.olist_geolocation (
	geolocation_zip_code			NVARCHAR(50),
	geolocation_lat					NVARCHAR(50),
	geolocation_lng					NVARCHAR(50),
	geolocation_city				NVARCHAR(50),
	geolocation_state				NVARCHAR(50)
);

IF OBJECT_ID('bronze.olist_order_items', 'U') IS NOT NULL
	DROP TABLE bronze.olist_order_items;

CREATE TABLE bronze.olist_order_items (
	order_id						NVARCHAR(50),
	order_item_id					INT,
	product_id						NVARCHAR(50),
	seller_id						NVARCHAR(50),
	shipping_limit_date				DATETIME,
	price							FLOAT,
	freight_value					FLOAT
);

IF OBJECT_ID('bronze.olist_order_payments', 'U') IS NOT NULL
	DROP TABLE bronze.olist_order_payments;


CREATE TABLE bronze.olist_order_payments (
	order_id						NVARCHAR(50),
	payment_sequential				INT,
	payment_type					NVARCHAR(50),
	payment_installments			INT,
	payment_value					FLOAT
);

IF OBJECT_ID('bronze.olist_order_reviews', 'U') IS NOT NULL
	DROP TABLE bronze.olist_order_reviews;

CREATE TABLE bronze.olist_order_reviews (
	review_id						NVARCHAR(50),
	order_id						NVARCHAR(50),
	review_score					INT,
	review_comment_title			NVARCHAR(50),
	review_comment_message			NVARCHAR(255),
	review_creation_date			DATETIME,
	review_answer_timestamp			DATETIME
);

IF OBJECT_ID('bronze.olist_orders', 'U') IS NOT NULL
	DROP TABLE bronze.olist_orders;

CREATE TABLE bronze.olist_orders (
	order_id						NVARCHAR(50),
	customer_id						NVARCHAR(50),
	order_status					NVARCHAR(50),
	order_purchase_timestamp		DATETIME,
	order_approved_at				DATETIME,
	order_delivered_carrier_date	DATETIME,
	order_delivered_customer_date	DATETIME,
	order_estimated_delivery_date	DATETIME
);

IF OBJECT_ID('bronze.olist_products', 'U') IS NOT NULL
	DROP TABLE bronze.olist_products;

CREATE TABLE bronze.olist_products (
	product_id						NVARCHAR(50),
	product_category_name			NVARCHAR(50),
	product_name_lenght				INT,
	product_description_lenght		INT,
	product_photos_qty				INT,
	product_weight_g				INT,
	product_length_cm				INT,
	product_height_cm				INT,
	product_width_cm				INT,
);

IF OBJECT_ID('bronze.olist_sellers', 'U') IS NOT NULL
	DROP TABLE bronze.olist_sellers;

CREATE TABLE bronze.olist_sellers (
	seller_id						NVARCHAR(50),
	seller_zip_code					NVARCHAR(50),
	seller_city						NVARCHAR(50),
	seller_state					NVARCHAR(10)
);

IF OBJECT_ID('bronze.product_category_name_trns', 'U')	IS NOT NULL
	DROP TABLE bronze.product_category_name_trns;

CREATE TABLE bronze.product_category_name_trns (
	product_category_name			NVARCHAR(50),
	product_category_name_en		NVARCHAR(50)	
);
