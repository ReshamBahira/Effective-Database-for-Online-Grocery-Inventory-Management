if not exists(select * from sys.databases where name='OnlineGroceryIM')
-- Creating a database named OnlineGroceryIM
Create Database OnlineGroceryIM;
Go

-- Use Database OnlineGroceryIM
Use OnlineGroceryIM;
Go

-- DOWN

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_shippingwarehouses_shippingwarehouse_warehouse_id')
    alter table shippingwarehouses drop constraint fk_shippingwarehouses_shippingwarehouse_warehouse_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_shippingwarehouses_shippingwarehouse_shipping_id')
    alter table shippingwarehouses drop constraint fk_shippingwarehouses_shippingwarehouse_shipping_id

drop table if exists shippingwarehouses

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_warehouseproducts_warehouseproduct_warehouse_id')
    alter table warehouseproducts drop constraint fk_warehouseproducts_warehouseproduct_warehouse_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_warehouseproducts_warehouseproduct_product_id')
    alter table warehouseproducts drop constraint fk_warehouseproducts_warehouseproduct_product_id

drop table if exists warehouseproducts

drop table if exists Warehouses

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_productsuppliers_productsupplier_product_id')
    alter table productsuppliers drop constraint fk_productsuppliers_productsupplier_product_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_productsuppliers_productsupplier_supplier_id')
    alter table productsuppliers drop constraint fk_productsuppliers_productsupplier_supplier_id

drop table if exists productsuppliers

drop table if exists Suppliers

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_reviews_review_customer_id')
    alter table reviews drop constraint fk_reviews_review_customer_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_reviews_review_product_id')
    alter table reviews drop constraint fk_reviews_review_product_id

drop table if exists reviews

drop table if exists Suppliers

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_ordershippings_ordershipping_order_id')
    alter table ordershippings drop constraint fk_ordershippings_ordershipping_order_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_ordershippings_ordershipping_product_id')
    alter table ordershippings drop constraint fk_ordershippings_ordershipping_product_id

drop table if exists ordershippings

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_productorders_productorder_order_id')
    alter table productorders drop constraint fk_productorders_productorder_order_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_productorders_productorder_product_id')
    alter table productorders drop constraint fk_productorders_productorder_product_id

drop table if exists productorders

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_shippings_shipping_order_id')
    alter table shippings drop constraint fk_shippings_shipping_order_id

drop table if exists shippings

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_productsuggestions_productsuggestion_customer_id')
    alter table productsuggestions drop constraint fk_productsuggestions_productsuggestion_customer_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_productsuggestions_productsuggestion_product_id')
    alter table productsuggestions drop constraint fk_productsuggestions_productsuggestion_product_id

drop table if exists productsuggestions

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_wishlistmappings_wishlistmapping_wishlist_id')
    alter table wishlistmappings drop constraint fk_wishlistmappings_wishlistmapping_wishlist_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_wishlistmappings_wishlistmapping_product_id')
    alter table wishlistmappings drop constraint fk_wishlistmappings_wishlistmapping_product_id

drop table if exists wishlistmappings

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_wishlists_wishlist_customer_id')
    alter table wishlists drop constraint fk_wishlists_wishlist_customer_id

drop table if exists wishlists

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_orders_order_invoice_id')
    alter table orders drop constraint fk_orders_order_invoice_id

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_orders_order_customer_id')
    alter table orders drop constraint fk_orders_order_customer_id

drop table if exists orders
 
drop table if exists Invoices

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_carddetails_carddetail_customer_id')
    alter table carddetails drop constraint fk_carddetails_carddetail_customer_id

drop table if exists carddetails

if exists(select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
    where CONSTRAINT_NAME='fk_addresses_address_customer_id')
    alter table addresses drop constraint fk_addresses_address_customer_id

drop table if exists addresses

drop table if exists products

drop table if exists customers

GO

-- UP METADATA

-- Table Customers
Create Table Customers
(
customer_id int identity not null,
customer_firstname varchar(30) Not NULL,
customer_lastname varchar(30) Not NULL,
customer_username varchar(30) Not NULL,
customer_password varchar(20) Not NULL,
customer_email varchar(50) not null,
customer_contactnumber varchar(10) Not NULL,
constraint pk_customers_customer_id primary key (customer_id),
constraint u_customer_email unique (customer_email),
CONSTRAINT u_customer_username UNIQUE (customer_username)
);

-- Table Products
Create Table Products
(
product_id int IDENTITY Not NULL,
product_name varchar(50) Not NULL,
product_description varchar(50) Not NULL,
product_category varchar(20) Not NULL,
product_price money NOT NULL,
CONSTRAINT pk_products_product_id PRIMARY KEY (product_id)
);

-- Table Address for storing Customer's Address
Create Table Addresses
(
address_id int identity Not NULL,
address_streetaddress1 varchar(50) Not NULL,
address_streetaddress2 varchar(50),
address_city varchar(30) Not NULL,
address_state varchar(20) Not NULL,
address_country varchar(30) Not NULL,
address_zipcode int Not NULL,
address_customer_id int not null,
CONSTRAINT pk_addresses_address_id PRIMARY KEY (address_id)
);

alter table addresses
    add constraint fk_addresses_address_customer_id FOREIGN KEY (address_customer_id)
        REFERENCES customers(customer_id)

-- Table CardDetails for storing Customer's Payment Information
Create Table CardDetails
(
carddetail_id int IDENTITY Not NULL,
carddetail_cardnumber varchar(16) Not NULL,
carddetail_cardname varchar(30) Not NULL,
carddetail_cardcompany varchar(30) Not NULL,
carddetail_cardtype varchar(10) Not NULL,
carddetail_customer_id int Not NULL,
constraint pk_carddetails_carddetail_id PRIMARY KEY (carddetail_id)
);

alter table CardDetails
    add constraint fk_carddetails_carddetail_customer_id FOREIGN KEY (carddetail_customer_id)
        REFERENCES customers(customer_id)

-- Table Invoice for storing Invoice Information for an Order
Create Table Invoices
(
invoice_id int identity Not NULL,
invoice_amount money Not NULL,
invoice_generationdate date Not NULL,
CONSTRAINT pk_invoices_invoice_id PRIMARY KEY (invoice_id)
);

-- Table Orders for storing Customer's Order Information
Create Table Orders
(
order_id int IDENTITY Not NULL,
order_status varchar(20) Not NULL,
order_price money Not NULL,
order_placedate date Not NULL,
order_estdeliverydate date Not NULL,
order_invoice_id int Not NULL,
order_customer_id int Not NULL,
CONSTRAINT pk_orders_order_id PRIMARY KEY (order_id)
);

alter table Orders
    add constraint fk_orders_order_invoice_id FOREIGN KEY (order_invoice_id)
        REFERENCES invoices(invoice_id)

alter table Orders
    add constraint fk_orders_order_customer_id FOREIGN KEY (order_customer_id)
        REFERENCES customers(customer_id)

-- Table WishList for storing Customer's WishList Products Information
Create Table WishLists
(
wishlist_id int IDENTITY Not NULL,
wishlist_customer_id int Not NULL,
constraint pk_wishlists_wishlist_id PRIMARY KEY (wishlist_id)
);

alter table WishLists
    add constraint fk_wishlists_wishlist_customer_id FOREIGN KEY (wishlist_customer_id)
        REFERENCES customers(customer_id)

-- Table WishListMapping for mapping Customer's WishList Information to Product Information
Create Table WishListMappings
(
wishlistmapping_id int identity Not NULL,
wishlistmapping_wishlist_id int Not NULL,
wishlistmapping_product_id int Not NULL,
constraint pk_wishlistmappings_wishlistmapping_id PRIMARY KEY (wishlistmapping_id)
);

alter table WishListMappings
    add constraint fk_wishlistmappings_wishlistmapping_wishlist_id FOREIGN KEY (wishlistmapping_wishlist_id)
        REFERENCES WishLists(wishlist_id)

alter table WishListMappings
    add constraint fk_wishlistmappings_wishlistmapping_product_id FOREIGN KEY (wishlistmapping_product_id)
        REFERENCES Products(product_id)

-- Table ProductSuggestions for storing the mapping of Product-Customer
-- According to the Products suggested to the Customer
Create Table ProductSuggestions
(
productsuggestion_id int identity Not NULL,
productsuggestion_customer_id int Not NULL,
productsuggestion_product_id int Not NULL,
constraint pk_productsuggestions_productsuggestion_id PRIMARY KEY (productsuggestion_id)
);

alter table ProductSuggestions
    add constraint fk_productsuggestions_productsuggestion_customer_id FOREIGN KEY (productsuggestion_customer_id)
        REFERENCES customers(customer_id)

alter table ProductSuggestions
    add constraint fk_productsuggestions_productsuggestion_product_id FOREIGN KEY (productsuggestion_product_id)
        REFERENCES products(product_id)

-- Table Shipping for storing the shipping Information for an Order
Create Table Shippings
(
shipping_id int IDENTITY Not NULL,
shipping_shippingcompany varchar(30) Not NULL,
shipping_fare money Not NULL,
shipping_order_id int Not NULL,
constraint pk_shippings_shipping_id PRIMARY KEY (shipping_id)
);

alter table Shippings
    add constraint fk_shippings_shipping_order_id FOREIGN KEY (shipping_order_id)
        REFERENCES orders(order_id)

-- Table ProductOrder for mapping the Product Information for an Order
Create Table ProductOrders
(
productorder_id int IDENTITY Not NULL,
productorder_productquantity int Not NULL,
productorder_order_id int Not NULL,
productorder_product_id int Not NULL,
constraint pk_productorders_productorder_id PRIMARY KEY (productorder_id)
);

alter table ProductOrders
    add constraint fk_productorders_productorder_order_id FOREIGN KEY (productorder_order_id)
        REFERENCES orders(order_id)

alter table ProductOrders
    add constraint fk_productorders_productorder_product_id FOREIGN KEY (productorder_product_id)
        REFERENCES products(product_id)

-- Table OrderShipping for mapping the Shipping Information for an Order
-- There can be more than one Shipping for just one Order
Create Table OrderShippings
(
ordershipping_id int IDENTITY Not NULL,
ordershipping_order_id int Not NULL,
ordershipping_product_id int Not NULL,
constraint pk_ordershippings_ordershipping_id PRIMARY KEY (ordershipping_id)
);

alter table OrderShippings
    add constraint fk_ordershippings_ordershipping_order_id FOREIGN KEY (ordershipping_order_id)
        REFERENCES orders(order_id)

alter table OrderShippings
    add constraint fk_ordershippings_ordershipping_product_id FOREIGN KEY (ordershipping_product_id)
        REFERENCES products(product_id)

-- Table Reviews for storing the reviews for a particular Product
-- There can be more than one reviwes for just one Product
-- The comments can be by both concerned parties: the customer and the product owner
Create Table Reviews
(
review_id int IDENTITY Not NULL,
review_rating int Not NULL,
review_customernotes varchar(30),
review_productownernotes varchar(30),
review_customer_id int Not NULL,
review_product_id int Not NULL,
CONSTRAINT pk_reviews_review_id PRIMARY KEY (review_id)
);

alter table Reviews
    add constraint fk_reviews_review_customer_id FOREIGN KEY (review_customer_id)
        REFERENCES customers(customer_id)

alter table Reviews
    add constraint fk_reviews_review_product_id FOREIGN KEY (review_product_id)
        REFERENCES products(product_id)

-- Table Suppliers for storing the Information about the Suppliers for a particular Product
Create Table Suppliers
(
supplier_id int IDENTITY Not NULL,
supplier_name varchar(30) Not NULL, -- no firstname or lastname bcz suppliers are companies that supply food products
supplier_contact varchar(10) Not NULL,
supplier_email varchar(30) Not NULL,
supplier_address varchar(50) Not NULL,
constraint pk_suppliers_supplier_id PRIMARY KEY (supplier_id)
);

-- Table ProductSupplier for mapping the Suppliers to the Products
-- Many-to-Many relationship
Create Table ProductSuppliers
(
productsupplier_id int identity Not NULL,
productsupplier_product_id int Not NULL,
productsupplier_supplier_id int Not NULL,
constraint pk_productsuppliers_productsupplier_id PRIMARY KEY (productsupplier_id)
);

alter table ProductSuppliers
    add constraint fk_productsuppliers_productsupplier_product_id FOREIGN KEY (productsupplier_product_id)
        REFERENCES products(product_id)

alter table ProductSuppliers
    add constraint fk_productsuppliers_productsupplier_supplier_id FOREIGN KEY (productsupplier_supplier_id)
        REFERENCES suppliers(supplier_id)

-- Table Warehouse for storing the Information about the warehouse
-- This is also useful for shipping
Create Table Warehouses
(
warehouse_id int IDENTITY Not NULL,
warehouse_streetaddress varchar(50) Not NULL,
warehouse_city varchar(30) Not NULL,
warehouse_state varchar(30) Not NULL,
warehouse_zipcode int Not NULL,
constraint pk_warehouses_warehouse_id PRIMARY KEY (warehouse_id)
);

-- Table WarehouseProduct for mapping the products to a particular warehouse
-- Same products maybe in multiple warehouses
Create Table WarehouseProducts
(
warehouseproduct_id int IDENTITY Not NULL,
warehouseproduct_productInQuantity int Not NULL,
warehouseproduct_productOnWayQuantity int Not NULL,
warehouseproduct_productReturnQuantity int Not NULL,
warehouseproduct_warehouse_id int Not NULL,
warehouseproduct_product_id int Not NULL,
constraint pk_warehouseproducts_warehouseproduct_id PRIMARY KEY (warehouseproduct_id)
);

alter table warehouseproducts
    add constraint fk_warehouseproducts_warehouseproduct_warehouse_id FOREIGN KEY (warehouseproduct_warehouse_id)
        REFERENCES warehouses(warehouse_id)

alter table warehouseproducts
    add constraint fk_warehouseproducts_warehouseproduct_product_id FOREIGN KEY (warehouseproduct_product_id)
        REFERENCES products(product_id)

-- Table ShippingWarehouse for mapping the shipping order to a particular warehouse
-- Same orders may have different shipping
-- But, same shipping must have same warehouses
Create Table ShippingWarehouses
(
shippingwarehouse_id int IDENTITY Not NULL,
shippingwarehouse_warehouse_id int Not NULL,
shippingwarehouse_shipping_id int Not NULL,
CONSTRAINT pk_shippingwarehouses_shippingwarehouse_id PRIMARY KEY (shippingwarehouse_id)
);

alter table ShippingWarehouses
    add constraint fk_shippingwarehouses_shippingwarehouse_warehouse_id FOREIGN KEY (shippingwarehouse_warehouse_id)
        REFERENCES warehouses(warehouse_id)

alter table ShippingWarehouses
    add constraint fk_shippingwarehouses_shippingwarehouse_shipping_id FOREIGN KEY (shippingwarehouse_shipping_id)
        REFERENCES shippings(shipping_id)

GO

-- UP DATA

-- Inserting values into the Customers table
INSERT INTO Customers 
    (customer_firstname, customer_lastname, customer_username, customer_password, customer_email, customer_contactnumber)
VALUES
('Maria', 'Garcia', 'mariag', 's3cur3p@ss', 'maria.garcia@gmail.com', '5551234567'),
('David', 'Brown', 'davidb', 'brownd0g', 'david.brown@gmail.com', '5552345678'),
('Sara', 'Martinez', 'saram', 'martinez21', 'sara.martinez@gmail.com', '5553456789'),
('James', 'Smith', 'jimmys', 'password123', 'james.smith@gmail.com', '5554567890'),
('Emily', 'Johnson', 'emilyj', 'qwerty', 'emily.johnson@gmail.com', '5555678901'),
('Daniel', 'Lee', 'danlee', 'danpass', 'daniel.lee@gmail.com', '5556789012'),
('John', 'Doe', 'johndoe', 'password123', 'john@gmail.com', '1234567890'),
('Jane', 'Smith', 'janesmith', 'p@ssw0rd', 'jane@gmail.com', '9876543210'),
('Michael', 'Johnson', 'michaelj', 'securepass', 'michael@egmail.com', '4567890123');

-- Inserting 50 rows into the Products table
INSERT INTO Products (product_name, product_description, product_category, product_price)
VALUES
('Apples', 'Fresh, juicy apples', 'Fruits', 2.99),
('Bananas', 'Ripe bananas', 'Fruits', 1.99),
('Milk', 'Fresh whole milk', 'Dairy', 3.49),
('Bread', 'Whole wheat bread', 'Bakery', 2.49),
('Eggs', 'Large, Grade A eggs', 'Dairy', 2.99),
('Chicken Breast', 'Skinless, boneless chicken breast', 'Meat', 5.99),
('Rice', 'Long grain white rice', 'Grains', 4.99),
('Tomatoes', 'Fresh, ripe tomatoes', 'Vegetables', 3.49),
('Potatoes', 'Russet potatoes', 'Vegetables', 2.99),
('Spinach', 'Fresh spinach leaves', 'Vegetables', 2.49),
('Salmon', 'Wild-caught salmon fillet', 'Seafood', 9.99),
('Pasta', 'Whole wheat spaghetti', 'Pasta', 2.99),
('Oranges', 'Juicy oranges', 'Fruits', 3.49),
('Carrots', 'Fresh carrots', 'Vegetables', 1.99),
('Cheese', 'Sharp cheddar cheese', 'Dairy', 4.99),
('Yogurt', 'Greek yogurt', 'Dairy', 2.79),
('Beef', 'Lean ground beef', 'Meat', 7.99),
('Lettuce', 'Crisp lettuce', 'Vegetables', 2.29),
('Onions', 'Yellow onions', 'Vegetables', 1.49),
('Shrimp', 'Large shrimp', 'Seafood', 12.99),
('Strawberries', 'Fresh strawberries', 'Fruits', 4.99),
('Cucumbers', 'English cucumbers', 'Vegetables', 2.49),
('Butter', 'Salted butter', 'Dairy', 3.99),
('Ham', 'Sliced ham', 'Meat', 4.49),
('Peppers', 'Bell peppers', 'Vegetables', 2.79),
('Pineapple', 'Whole pineapple', 'Fruits', 3.99),
('Cauliflower', 'Fresh cauliflower', 'Vegetables', 2.99),
('Bagels', 'Plain bagels', 'Bakery', 2.99),
('Cod', 'Fresh cod fillet', 'Seafood', 10.99),
('Blueberries', 'Fresh blueberries', 'Fruits', 5.99),
('Avocado', 'Ripe avocado', 'Fruits', 1.99),
('Olive Oil', 'Extra virgin olive oil', 'Condiments', 6.99),
('Bacon', 'Sliced bacon', 'Meat', 6.49),
('Broccoli', 'Fresh broccoli', 'Vegetables', 2.39),
('Honey', 'Pure honey', 'Condiments', 5.49),
('Cereal', 'Whole grain cereal', 'Breakfast', 3.79),
('Tuna', 'Canned tuna', 'Canned Goods', 2.29),
('Sausages', 'Pork sausages', 'Meat', 5.99),
('Lemons', 'Fresh lemons', 'Fruits', 3.29),
('Corn', 'Fresh corn on the cob', 'Vegetables', 1.69),
('Cherries', 'Sweet cherries', 'Fruits', 6.99),
('Garlic', 'Fresh garlic bulbs', 'Vegetables', 1.99),
('Soy Milk', 'Unsweetened soy milk', 'Dairy', 3.49),
('Peanut Butter', 'Creamy peanut butter', 'Condiments', 4.99),
('Turkey', 'Sliced turkey breast', 'Meat', 8.99),
('Cottage Cheese', 'Low-fat cottage cheese', 'Dairy', 2.99),
('Grapes', 'Seedless grapes', 'Fruits', 4.49),
('Limes', 'Fresh limes', 'Fruits', 2.49),
('Celery', 'Fresh celery', 'Vegetables', 1.99),
('Cheddar', 'Aged cheddar cheese', 'Dairy', 6.99);

-- Inserting values into the Addresses table
INSERT INTO Addresses (address_streetaddress1, address_streetaddress2, address_city, address_state, address_country, address_zipcode, address_customer_id)
VALUES
('123 Main St', 'Apt 101', 'New York', 'NY', 'USA', 10001, 1),
('456 Elm St', NULL, 'Los Angeles', 'CA', 'USA', 90001, 2),
('789 Oak St', 'Suite 200', 'Chicago', 'IL', 'USA', 60601, 3),
('321 Pine St', NULL, 'Houston', 'TX', 'USA', 77001, 4),
('555 Maple St', NULL, 'Miami', 'FL', 'USA', 33101, 5);

-- Inserting values into the CardDetails table
INSERT INTO CardDetails (carddetail_cardnumber, carddetail_cardname, carddetail_cardcompany, carddetail_cardtype, carddetail_customer_id)
VALUES
('1234567890123456', 'John Doe', 'Visa', 'Credit', 1),
('9876543210987654', 'Jane Smith', 'Mastercard', 'Debit', 2),
('4567890123456789', 'Michael Johnson', 'American Express', 'Credit', 3);

-- Inserting values into the Invoices table
INSERT INTO Invoices (invoice_amount, invoice_generationdate)
VALUES
(50.00, '2024-04-12'),
(75.50, '2024-04-11'),
(120.25, '2024-04-10'),
(90.75, '2024-04-09'),
(65.20, '2024-04-08');

-- Inserting values into the Orders table
INSERT INTO Orders (order_status, order_price, order_placedate, order_estdeliverydate, order_invoice_id, order_customer_id)
VALUES
('Processing', 75.99, '2024-04-10', '2024-04-13', 2, 2),
('Shipped', 120.50, '2024-04-09', '2024-04-12', 3, 3),
('Delivered', 200.25, '2024-04-08', '2024-04-11', 4, 4);

-- Inserting values into the WishLists table
INSERT INTO WishLists (wishlist_customer_id)
VALUES
(5),
(2),
(4),
(3),
(1);

-- Inserting values into the WishListMappings table
INSERT INTO WishListMappings (wishlistmapping_wishlist_id, wishlistmapping_product_id)
VALUES
(1, 27),  
(1, 18),
(2, 36),
(2, 45),
(3, 9);

-- Inserting values into the ProductSuggestions table
INSERT INTO ProductSuggestions (productsuggestion_customer_id, productsuggestion_product_id)
VALUES
(3, 5),  
(6, 50), 
(9, 30);  

-- Inserting values into the Shippings table
INSERT INTO Shippings (shipping_shippingcompany, shipping_fare, shipping_order_id)
VALUES
('FedEx', 10.99, 1),
('UPS', 8.49, 2),
('DHL', 12.75, 3);

-- Inserting values into the ProductOrders table
INSERT INTO ProductOrders (productorder_productquantity, productorder_order_id, productorder_product_id)
VALUES
(2, 1, 11),
(1, 1, 42),
(3, 2, 35),
(2, 2, 43),
(1, 3, 25);

-- Inserting values into the OrderShippings table
INSERT INTO OrderShippings (ordershipping_order_id, ordershipping_product_id)
VALUES
(1, 12),
(1, 22),
(2, 32),
(3, 35),
(3, 48);

-- Inserting values into the Reviews table
INSERT INTO Reviews (review_rating, review_customernotes, review_productownernotes, review_customer_id, review_product_id)
VALUES
(5, 'Great product!', 'Thank you', 1, 11),
(4, 'Good quality', 'We appreciate your review!', 2, 34),
(3, 'Average', 'We will work on improving!', 3, 25),
(5, 'Excellent service!', 'Glad you had positive exp', 4, 18),
(2, 'Not satisfied', 'We apologize inconvenience', 5, 29);

-- Inserting values into the Suppliers table
INSERT INTO Suppliers (supplier_name, supplier_contact, supplier_email, supplier_address)
VALUES
('Fresh Produce Inc.', '1234567890', 'info@freshproduce.com', '123 Main Street, City, Country'),
('Dairy Farms Ltd.', '9876543210', 'contact@dairyfarms.com', '456 Park Avenue, City, Country'),
('Meat Masters', '1231231234', 'sales@meatmasters.com', '789 Elm Street, City, Country'),
('Seafood Delights', '4567890123', 'orders@seafooddelights.com', '321 Oak Street, City, Country'),
('Bakery Express', '7890123456', 'support@bakeryexpress.com', '567 Maple Street, City, Country');

-- Inserting values into the ProductSuppliers table
INSERT INTO ProductSuppliers (productsupplier_product_id, productsupplier_supplier_id)
VALUES
(11, 1),  
(22, 2), 
(33, 3),  
(44, 4),  
(5, 5);  

-- Inserting values into the Warehouses table
INSERT INTO Warehouses (warehouse_streetaddress, warehouse_city, warehouse_state, warehouse_zipcode)
VALUES
('123 Main St', 'Anytown', 'AnyState', 12345),
('456 Oak St', 'Othertown', 'OtherState', 67890),
('789 Elm St', 'AnotherTown', 'AnotherState', 23456);

-- Inserting values into the WarehouseProducts table
INSERT INTO WarehouseProducts 
    (warehouseproduct_productInQuantity, warehouseproduct_productOnWayQuantity, warehouseproduct_productReturnQuantity, warehouseproduct_warehouse_id, warehouseproduct_product_id)
VALUES
(100, 20, 5, 1, 11),
(200, 30, 10, 2, 22),
(150, 15, 8, 3, 33),
(180, 25, 12, 1, 44),
(120, 10, 3, 2, 5);

-- Inserting values into the ShippingWarehouses table
INSERT INTO ShippingWarehouses (shippingwarehouse_warehouse_id, shippingwarehouse_shipping_id)
VALUES
(1, 3),
(2, 2),
(3, 1);

GO

-- VERIFY

select * from Customers
select * from Products
select * from Addresses
select * from CardDetails
select * from Invoices
select * from Orders
select * from WishLists
select * from WishListMappings
select * from ProductSuggestions
select * from Shippings
select * from ProductOrders
select * from OrderShippings
select * from Reviews
select * from Suppliers
select * from ProductSuppliers
select * from Warehouses
select * from WarehouseProducts
select * from ShippingWarehouses