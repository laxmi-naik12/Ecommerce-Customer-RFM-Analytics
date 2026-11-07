Create database EcommerceCustomerAnalytics;
use EcommerceCustomerAnalytics;
CREATE TABLE online_retail_I (
    Invoice VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    Price DECIMAL(10,2),
    `Customer ID` INT NULL,
    Country VARCHAR(100)
);
LOAD DATA LOCAL INFILE 'C:/Users/Rajesh Srivastav/Desktop/data_analyst/IKEA/IKEA Gifting Dataset/online_retail_II page 1.csv'
INTO TABLE online_retail_I
CHARACTER SET latin1
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    Invoice,
    StockCode,
    Description,
    Quantity,
    @InvoiceDate,
    Price,
    @CustomerID,
    Country
)
SET
    InvoiceDate = STR_TO_DATE(@InvoiceDate, '%d-%m-%Y %H:%i'),
    `Customer ID` = NULLIF(@CustomerID, '');
    
SET GLOBAL local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile';

-- merged both in new table
create table online_retail_merged as
select * from online_retail_i
union all 
select * from online_retail_ii;

-- show all table
select * from online_retail_ii;
select * from online_retail_i;
select * from online_retail_merged;

-- check row counts after import
select count(*) as total_rows from online_retail_i;
select count(*) as total_rows from online_retail_ii;
select count(*) as total_rows from online_retail_merged;

-- confirm the convertion cleanly
select count(*) as total_rows from online_retail_merged;
select count(*) as failed_dates from online_retail_merged where InvoiceDate is null;
select count(*) as failed_prices from online_retail_merged where Price is null;
-- check 1 - Missing customerID
select count(*) as Missing_CustomerID
from online_retail_merged where `Customer ID` is null;
-- check 2  negative and zero quantity
select count(*) as negaive_Qty
from online_retail_merged where Quantity <=0;

-- check 3 MIssing descripiton
select count(*) as missing_description 
from online_retail_merged
where Description is null;
-- check duplicate rows
select Invoice, StockCode, Description, Quantity, InvoiceDate, Price , `Customer ID`, Country,count(*) as duplicate_count
from online_retail_merged
group by Invoice, StockCode, Description, Quantity, InvoiceDate, Price , `Customer ID`, Country
having count(*) >1;

-- deduplicate the procuce the final cleaned table
create table online_retail_cleaned as
with deduped as (
select *, 
row_number() over(
partition by Invoice, StockCode, Description, Quantity, InvoiceDate, Price , `Customer ID`, Country
order by (select null)
) as RowNum
from online_retail_merged
)
select Invoice, StockCode, Description, Quantity, InvoiceDate, Price , `Customer ID`, Country
from deduped
where RowNum=1;

select * from online_retail_cleaned;
show variables like 'secure_file_priv';

select * from online_retail_cleaned
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/online_retail_cleaned.csv'
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n';
