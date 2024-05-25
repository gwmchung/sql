-- Cross Join
/*1. Suppose every vendor in the `vendor_inventory` table had 5 of each of their products to sell to **every** 
customer on record. How much money would each vendor make per product? 
Show this by vendor_name and product name, rather than using the IDs.

HINT: Be sure you select only relevant columns and rows. 
Remember, CROSS JOIN will explode your table rows, so CROSS JOIN should likely be a subquery. 
Think a bit about the row counts: how many distinct vendors, product names are there (x)?
How many customers are there (y). 
Before your final group by you should have the product of those two queries (x*y).  */
with x as 
(
	select distinct vendor_id, product_id, original_price 
	from vendor_inventory ),
z as 
(
	select distinct customer_id, vendor_id, product_id, original_price*5 as sales
	from customer y
	cross join x
)
select v.vendor_name, p.product_name, sum(z.sales) as sales_per_product
from z
left join vendor v on z.vendor_id = v.vendor_id
left join product p on z.product_id = p.product_id
group by z.vendor_id, z.product_id
order by vendor_name, product_name


-- INSERT
/*1.  Create a new table "product_units". 
This table will contain only products where the `product_qty_type = 'unit'`. 
It should use all of the columns from the product table, as well as a new column for the `CURRENT_TIMESTAMP`.  
Name the timestamp column `snapshot_timestamp`. */
drop table if exists product_units;
create table product_units as
select *, datetime('now') as snapshot_timestamp 
from product 
where lower(trim(product_qty_type)) = 'unit';


/*2. Using `INSERT`, add a new row to the product_units table (with an updated timestamp). 
This can be any product you desire (e.g. add another record for Apple Pie). */
insert into product_units(product_id, product_name, product_size, product_category_id, product_qty_type, snapshot_timestamp)
values(24, 'Kiwi', '1 lb', 1, 'unit', datetime('now'))


-- DELETE
/* 1. Delete the older record for the whatever product you added. 


HINT: If you don't specify a WHERE clause, you are going to have a bad time.*/
delete from product_units 
where product_id = 24;

-- UPDATE
/* 1.We want to add the current_quantity to the product_units table. 
First, add a new column, current_quantity to the table using the following syntax.

ALTER TABLE product_units
ADD current_quantity INT;

Then, using UPDATE, change the current_quantity equal to the last quantity value from the vendor_inventory details.

HINT: This one is pretty hard. 
First, determine how to get the "last" quantity per product. 
Second, coalesce null values to 0 (if you don't have null values, figure out how to rearrange your query so you do.) 
Third, SET current_quantity = (...your select statement...), remembering that WHERE can only accommodate one column. 
Finally, make sure you have a WHERE statement to update the right row, 
	you'll need to use product_units.product_id to refer to the correct row within the product_units table. 
When you have all of these components, you can run the update statement. */
ALTER TABLE product_units
ADD current_quantity INT;

update product_units set current_quantity = null

select * from product_units

update product_units
set current_quantity = 
		coalesce(
			(select quantity from vendor_inventory vi1
			 where market_date = (select max(market_date) 
								  from vendor_inventory vi2 
								  where vi2.product_id = vi1.product_id) 
			 and product_id = product_units.product_id ), 
				0),
	snapshot_timestamp = datetime('now')


