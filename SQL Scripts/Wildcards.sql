-- % = any number of characters
-- _ = one character only

-- FIND ANY CLIENT COMPANIES THAT ARE AN LLC
SELECT *
FROM client
WHERE client_name LIKE '%LLC';

-- FIND ANY BRANCH SUPPLIERS THAT ARE IN THE LABEL BUSINESS
SELECT *
FROM branch_supplier
WHERE supplier_name LIKE '%Label%';

-- FIND ANY EMPLOYEE BORN IN OCTOBER
-- USING THE SPECIFIED 4 CHARACTERS USING 4 _'s
SELECT *
FROM employee
WHERE birth_day LIKE '____-10%';

-- FIND ANY CLIENTS WHO ARE SCHOOLS
SELECT *
FROM client
WHERE client_name LIKE '%school%';
