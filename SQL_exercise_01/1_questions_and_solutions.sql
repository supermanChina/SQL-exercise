-- LINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store


-- 1.1 Select the names of all the products in the store.
SELECT NAME FROM Products;

-- 1.2 Select the names and the prices of all the products in the store.
SELECT NAME, price FROM products;

-- 1.3 Select the name of the products with a price less than or equal to $200.
SELECT NAME FROM products WHERE price <= 200;


-- 1.4 Select all the products with a price between $60 and $120.
SELECT * FROM products WHERE price BETWEEN 60 AND 120;
SELECT * FROM products WHERE price >= 60 AND price <= 120;

-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT NAME, price*100 FROM products;

SELECT NAME, CONCAT(price*100, ' cents') FROM products;

-- 1.6 Compute the average price of all the products.
SELECT AVG(price) FROM products;
SELECT SUM(price)/COUNT(price) avg_price FROM products;
 
-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(price) FROM products WHERE  Manufacturer = 2;

-- 1.8 Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(*) FROM products WHERE price>=180;

-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT NAME, price FROM products WHERE price>=180 ORDER BY price DESC, NAME ASC;

-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
-- join
SELECT a.*, b.name FROM products a JOIN Manufacturers b ON(a.manufacturer = b.code) ORDER BY a.code;
-- where condition
SELECT a.*, b.name FROM products a, Manufacturers b WHERE a.manufacturer = b.code ORDER BY a.`Code`;

-- 1.11 Select the product name, price, and manufacturer name of all the products.
SELECT a.name, a.price, b.name FROM products a JOIN Manufacturers b ON(a.manufacturer = b.code AND a.price > 100) ORDER BY a.name;

SELECT Products.Name, Price, Manufacturers.Name
   FROM Products INNER JOIN Manufacturers
   ON Products.Manufacturer = Manufacturers.Code;

-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT AVG(Price), Manufacturer
    FROM Products
GROUP BY Manufacturer;


-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT AVG(a.price), b.name 
FROM Products a JOIN Manufacturers b 
ON a.manufacturer = b.code
GROUP BY b.name;


-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT AVG(a.price), b.name 
FROM Manufacturers b JOIN Products a 
ON b.code = a.Manufacturer
GROUP BY b.name
HAVING AVG(a.price)>=150;

SELECT AVG(Price), Manufacturers.Name
   FROM Products, Manufacturers
   WHERE Products.Manufacturer = Manufacturers.Code
   GROUP BY Manufacturers.Name
   HAVING AVG(Price) >= 150;
   
   
-- 1.15 Select the name and price of the cheapest product.
-- sub select the min price then use where condtion to select
SELECT NAME, price FROM Products 
WHERE price = (
SELECT MIN(price)
FROM products);

-- sort then limit the first result
SELECT NAME,price
  FROM Products
  ORDER BY price ASC
  LIMIT 1;

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
SELECT a.Name, MAX(a.price), b.Name
FROM Manufacturers b JOIN Products a 
ON a.Manufacturer = b.code
group by b.name;


SELECT Products.Name, MAX(Price), Manufacturers.Name
 FROM Products, Manufacturers
 WHERE Manufacturer = Manufacturers.Code
 GROUP BY Manufacturers.Name;


-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
insert into Products values (11, 'Loudspeakers', 70, 2);


-- 1.18 Update the name of product 8 to "Laser Printer".
update products
set name = 'Laser Printer'
where code=8;

-- 1.19 Apply a 10% discount to all products.
update products
set price=price*0.9;


-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
update products
set price = price * 0.9
where price >= 120; 


