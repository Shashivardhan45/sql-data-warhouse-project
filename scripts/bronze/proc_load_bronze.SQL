
create or alter procedure bronze.load_bronze as 
begin
	declare @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	begin try
		set @batch_start_time = GETDATE();
		print '=====================================';
		print 'Loading Bronze Layer';
		print '=====================================';

		print '--------------------------------------';
		print 'Loading CRM Tables';
		print '--------------------------------------';

		set @start_time = GETDATE();
		print '>> Truncating Table : bronze.crm_cust_info'
		TRUNCATE TABLE bronze.crm_cust_info;

		print '>> inserting data into Table : bronze.crm_cust_info'
		BULK INSERT bronze.crm_cust_info
		from 'C:\Users\battu\Desktop\SQL full course\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DATEDIFF(second, @start_time, @end_time) as nvarchar) + 'seconds';
		print '>> ------------------';
		---  SELECT * FROM bronze.crm_cust_info

		---  SELECT COUNT(*) FROM bronze.crm_cust_info

		set @start_time = GETDATE();
		print '>> Truncating Table : bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info;

		print '>> inserting data into Table : bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info
		from 'C:\Users\battu\Desktop\SQL full course\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DATEDIFF(second, @start_time, @end_time) as nvarchar) + 'seconds';
		print '>> ------------------';

		set @start_time = GETDATE();
		print '>> Truncating Table : bronze.crm_sls_datails'
		TRUNCATE TABLE bronze.crm_sls_details;

		print '>> inserting data into Table : bronze.crm_sls_datails'
		BULK INSERT bronze.crm_sls_details
		from 'C:\Users\battu\Desktop\SQL full course\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DATEDIFF(second, @start_time, @end_time) as nvarchar) + 'seconds';
		print '>> ------------------';

		print '--------------------------------------';
		print 'Loading ERP Tables';
		print '--------------------------------------';

		set @start_time = GETDATE();
		print '>> Truncating Table : bronze.erp_cust_az12'
		TRUNCATE TABLE bronze.erp_cust_az12;

		print '>> inserting data into Table : bronze.erp_cust_az12'
		BULK INSERT bronze.erp_cust_az12
		from 'C:\Users\battu\Desktop\SQL full course\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		with (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DATEDIFF(second, @start_time, @end_time) as nvarchar) + 'seconds';
		print '>> ------------------';

		set @start_time = GETDATE();
		print '>> Truncating Table : bronze.erp_loc_a101'
		TRUNCATE TABLE bronze.erp_loc_a101;

		print '>> inserting data into Table : bronze.erp_loc_a101'
		BULK INSERT bronze.erp_loc_a101
		from 'C:\Users\battu\Desktop\SQL full course\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		with (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DATEDIFF(second, @start_time, @end_time) as nvarchar) + 'seconds';
		print '>> ------------------';

		set @start_time = GETDATE();
		print '>> Truncating Table : bronze.erp_px_cat_g1v2'
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		print '>> inserting data into Table : bronze.erp_px_cat_g1v2'
		BULK INSERT bronze.erp_px_cat_g1v2
		from 'C:\Users\battu\Desktop\SQL full course\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		with (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		set @end_time = GETDATE();
		print '>> Load Duration: ' + cast(DATEDIFF(second, @start_time, @end_time) as nvarchar) + 'seconds';
		print '>> ------------------';

		set @batch_end_time = GETDATE();
		print '>> ===============================================';
		print 'Loading Bronze Layer is Completed'
		print '>> Load Duration: ' + cast(DATEDIFF(second, @batch_start_time, @batch_end_time) as nvarchar) + 'seconds';
		print '>> ===============================================';
	end try
	begin catch
		print '================================================'
		print 'Error occured During Loading Bronze Layer'
		print 'error message' + error_message();
		print 'error message' + cast(error_number() as nvarchar);
		print 'error message' + cast(error_state() as nvarchar);
		print '================================================'
	end catch
end



---exec bronze.load_bronze
