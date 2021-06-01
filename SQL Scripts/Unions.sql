-- UNIONS ARE USED FOR COMBINING QUERIES
-- UNIONS NEED TO HAVE THE SAME NUMBER OF COLUMNS AND SIMILAR DATA TYPES
-- COLUMN NAME WILL BE THE NAME OF THE FIRST SELECT STATEMENT

-- fIND A LIST OF EMPLOYEE AND BRANCH NAMES
SELECT first_name AS 'All Data'
FROM employee
UNION
SELECT branch_name
FROM branch
UNION
SELECT client_name
FROM client;

-- FIND A LIST OF ALL CLIENTS & BRANCH SUPPLIER'S NAMES
SELECT client.client_name, client.branch_id
FROM client
UNION
SELECT branch_supplier.supplier_name, branch_supplier.branch_id
FROM branch_supplier;

-- FIND A LIST OF ALL MONEY SPENT OR EARNED BY THE COMPANY
SELECT salary as 'Total money spent and earned'
FROM employee
UNION
SELECT total_sales
FROM works_with;