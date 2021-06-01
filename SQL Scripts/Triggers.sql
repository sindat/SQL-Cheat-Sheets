-- CREATE TABLE trigger_test (
--     message VARCHAR(100)
-- );

-- WE CAN DROP TRIGGERS USING DROP TRIGGER <trigger name>

-- NEED TO SPECIFY THE DELIMITER FOR THE TRIGGER
-- THEN WE CAN CHANGE IT BACK TO THE DEFAU;T ; DELIMITED FOR SQL QUERIES
-- NOTE THAT DELIMITERS CAN ONLY BE CHANGED VIA THE SQL COMMAND LINE
DELIMITER $$
CREATE
    TRIGGER first_trigger_test BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES('added a new employee!');
    END$$
DELIMITER ;

-- TESTING THE EMPLOYEE CREATE TRIGGER
INSERT INTO employee
VALUES(109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);


-- ANOTHER TRIGGER - LOG THE INSERTED FIRST NAME OF AN EMPLOYEE UPON INSERT
DELIMITER $$
CREATE
    TRIGGER another_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES (NEW.first_name);
    END$$
DELIMITER ;

-- TESTING THE SECOND TRIGGER
INSERT INTO employee
VALUES (110, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3);


-- CONDITIONAL TRIGGER
DELIMITER $$
CREATE
    TRIGGER if_statement_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        IF NEW.sex = 'M' THEN
            INSERT INTO trigger_test VALUES ('Added a male employee!');
        ELSEIF NEW.sex = 'F' THEN
            INSERT INTO trigger_test VALUES ('Added a female employee!');
        ELSE
            INSERT INTO trigger_test VALUES ('Employee did not specify their gender.');
        END IF;
    END$$
DELIMITED ;

-- IF TRIGGER TEST
INSERT INTO employee
VALUES (111, 'Pam', 'Beesly', '1988-02-19', 'F', 69000, 106, 3);


-- CONDITIONAL TRIGGER AFTER DELETING
DELIMITER $$
CREATE
    TRIGGER if_statement_trigger AFTER DELETE
    ON employee
    FOR EACH ROW BEGIN
        IF NEW.sex = 'M' THEN
            INSERT INTO trigger_test VALUES ('Added a male employee!');
        ELSEIF NEW.sex = 'F' THEN
            INSERT INTO trigger_test VALUES ('Added a female employee!');
        ELSE
            INSERT INTO trigger_test VALUES ('Employee did not specify their gender.');
        END IF;
    END$$
DELIMITED ;


-- CONDITIONAL TRIGGER AFTER UPDATING
DELIMITER $$
CREATE
    TRIGGER if_statement_trigger AFTER DELETE
    ON employee
    FOR EACH ROW BEGIN
        IF NEW.sex = 'M' THEN
            INSERT INTO trigger_test VALUES ('Added a male employee!');
        ELSEIF NEW.sex = 'F' THEN
            INSERT INTO trigger_test VALUES ('Added a female employee!');
        ELSE
            INSERT INTO trigger_test VALUES ('Employee did not specify their gender.');
        END IF;
    END$$
DELIMITED ;