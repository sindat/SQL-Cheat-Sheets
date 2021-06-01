-- FIND NAMES OF ALL EMPLOYEES WHO HAVE SOLD OVER 30 000 DOLLARS TO A SINGLE CLIENT
SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
    SELECT works_with.emp_id FROM
    works_with
    WHERE works_with.total_sales > 30000
);


-- FIND ALL CLIENTS WHO ARE HANDLED BY THE BRANCH THAT MICHAL SCOTT MANAGES
SELECT client.client_name
FROM client
WHERE client.branch_id IN (
    SELECT branch.branch_id
    FROM branch
    WHERE mgr_id = 102
);


