if object_id ('bronze.crm_cust_info', 'U') is not null
	drop table bronze.crm_cust_info;

create table bronze.crm_cust_info(
	cst_id int,
	cst_key nvarchar(50),
	cst_firstname nvarchar(50),
	cst_lastname nvarchar(50),
	cst_marital_status nvarchar(50),
	cst_gndr nvarchar(50),
	cst_create_date DATE
);

if object_id ('bronze.crm_prd_info', 'U') is not null
	drop table bronze.crm_prd_info;

create table bronze.crm_prd_info(
	prd_id int,
	prd_key nvarchar(50),
	prd_nm nvarchar(50),
	prd_cost int,
	prd_line nvarchar(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
);

if object_id ('bronze.crm_sls_details', 'U') is not null
	drop table bronze.crm_sls_details;

create table bronze.crm_sls_details(
	sls_ord_num nvarchar(50),
	sls_prd_key nvarchar(50),
	sls_cst_id int,
	sls_order_dt int,
	sls_ship_date int,
	sls_due_dt int,
	sls_sales int,
	sls_quantity int,
	sls_price int
);



if object_id ('bronze.erp_loc_a101', 'U') is not null
	drop table bronze.erp_loc_a101;

create table bronze.erp_loc_a101(
	cid nvarchar(50),
	cntry varchar(30)
);

if object_id ('bronze.erp_cust_az12', 'U') is not null
	drop table bronze.erp_cust_az12;

create table bronze.erp_cust_az12(
	cid nvarchar(50),
	bdate date,
	gen nvarchar(20)
);

if object_id ('bronze.erp_px_cat_g1v2', 'U') is not null
	drop table bronze.erp_px_cat_g1v2;

create table bronze.erp_px_cat_g1v2(
	id nvarchar(50),
	cat nvarchar(50),
	subcat nvarchar(30),
	maintanance nvarchar(20)
);
