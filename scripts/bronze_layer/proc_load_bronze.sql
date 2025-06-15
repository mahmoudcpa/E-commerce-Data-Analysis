/*
====================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
====================================================================================
Script Purpose:
	This stored procedure loads data into the 'bronze' schema from external CSV files.
	It performs the following:
	- Truncates the bronze tables before loading data.
	- Uses the 'BULK INSERT' method to load data from csv files into bronze tables.

Parameters:
	None.
	This stored procedure does not accept any parameters or return any values.

Usage Example:
	EXEC bronze.load_bronze;
====================================================================================
*/ 
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '==========================================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '==========================================================================';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.olist_customers';
		TRUNCATE TABLE bronze.olist_customers;

		PRINT 'Inserting Data Into Table: ronze.olist_customers';
		BULK INSERT bronze.olist_customers
		FROM 'F:\Mn\MN_Learn\SQL\Brazilian_E_Commerce_Public_Dataset\olist_customers_dataset.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '==========================================================================';
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '==========================================================================';


		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.olist_geolocation';
		TRUNCATE TABLE bronze.olist_geolocation;

		PRINT 'Inserting Data Into Table: bronze.olist_geolocation';
		BULK INSERT bronze.olist_geolocation
		FROM 'F:\Mn\MN_Learn\SQL\Brazilian_E_Commerce_Public_Dataset\olist_geolocation_dataset.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '==========================================================================';
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '==========================================================================';



		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.olist_order_items';
		TRUNCATE TABLE bronze.olist_order_items;

		PRINT 'Inserting Data Into Table: bronze.olist_order_items';
		BULK INSERT bronze.olist_order_items
		FROM 'F:\Mn\MN_Learn\SQL\Brazilian_E_Commerce_Public_Dataset\olist_order_items_dataset.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '==========================================================================';
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '==========================================================================';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.olist_order_payments';
		TRUNCATE TABLE bronze.olist_order_payments;

		BULK INSERT bronze.olist_order_payments
		FROM 'F:\Mn\MN_Learn\SQL\Brazilian_E_Commerce_Public_Dataset\olist_order_payments_dataset.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '==========================================================================';
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '==========================================================================';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.olist_order_reviews';
		TRUNCATE TABLE bronze.olist_order_reviews;

		BULK INSERT bronze.olist_order_reviews
		FROM 'F:\Mn\MN_Learn\SQL\Brazilian_E_Commerce_Public_Dataset\olist_order_reviews_dataset.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '==========================================================================';
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '==========================================================================';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.olist_orders';
		TRUNCATE TABLE bronze.olist_orders;

		BULK INSERT bronze.olist_orders
		FROM 'F:\Mn\MN_Learn\SQL\Brazilian_E_Commerce_Public_Dataset\olist_orders_dataset.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '==========================================================================';
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '==========================================================================';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.olist_products';
		TRUNCATE TABLE bronze.olist_products;

		BULK INSERT bronze.olist_products
		FROM 'F:\Mn\MN_Learn\SQL\Brazilian_E_Commerce_Public_Dataset\olist_products_dataset.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '==========================================================================';
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '==========================================================================';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.olist_sellers';
		TRUNCATE TABLE bronze.olist_sellers;

		BULK INSERT bronze.olist_sellers
		FROM 'F:\Mn\MN_Learn\SQL\Brazilian_E_Commerce_Public_Dataset\olist_sellers_dataset.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '==========================================================================';
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '==========================================================================';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.product_category_name_trns';
		TRUNCATE TABLE bronze.product_category_name_trns;

		BULK INSERT bronze.product_category_name_trns
		FROM 'F:\Mn\MN_Learn\SQL\Brazilian_E_Commerce_Public_Dataset\product_category_name_translation.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '==========================================================================';
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '==========================================================================';


		SET @batch_end_time = GETDATE();
		PRINT '==========================================================================';
		PRINT 'Loading Bronze Layer is Completed';
		PRINT ' - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds'; 
		PRINT '==========================================================================';
	END TRY
	BEGIN CATCH
		PRINT '==========================================================================';
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'Error Message: ' + ERROR_MESSAGE();
		PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '==========================================================================';
	END CATCH
END

