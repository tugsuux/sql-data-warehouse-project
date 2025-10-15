/*SCRIPT PURPOSE:
THIS STORED PROCEDURE LOADS DATA INTO THE'BRONZE' SCHEMA FROM EXTERNAL CSV FILES. TRUNCATES AND BULK INSERT TO BRONZE TABLES*/
CREATE OR ALTER	PROCEDURE bronze.load_bronze AS
BEGIN
	BEGIN TRY
		PRINT'==============================================================================';
		PRINT'LOADING BRONZE LAYER';
		PRINT'==============================================================================';

		PRINT'------------------------------------------------------------------------------';
		PRINT'LOADING CRM TABLES';
		PRINT'------------------------------------------------------------------------------';

		PRINT'>> TRUNCATING TABLE: CRM_CUST_INFO'
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT'>> INSERTING DATA INTO: CRM_CUST_INFO'
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\Dell\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		PRINT'>> TRUNCATING TABLE: CRM_PRD_INFO'
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT'>> INSERTING DATA INTO: crm_prd_info'
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Dell\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		PRINT'>> TRUNCATING TABLE: crm_sales_details'
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT'>> INSERTING DATA INTO: crm_sales_details'
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\Dell\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		PRINT'------------------------------------------------------------------------------';
		PRINT'LOADING ERP TABLES';
		PRINT'------------------------------------------------------------------------------';

		PRINT'>> TRUNCATING TABLE: erp_cust_az12'
		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT'>> INSERTING DATA INTO: bronze.erp_cust_az12'
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\Dell\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		PRINT'>> TRUNCATING TABLE: erp_loc_a101'
		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT'>> INSERTING DATA INTO: bronze.erp_loc_a101'
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Dell\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		PRINT'>> TRUNCATING TABLE: bronze.erp_px_cat_g1v2'
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT'>> INSERTING DATA INTO: erp_px_cat_g1v2'
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\Dell\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
	END TRY
	BEGIN CATCH
		PRINT'=========================================='
		PRINT'ERROR OCCURED'
		PRINT'=========================================='
	END CATCH
END
