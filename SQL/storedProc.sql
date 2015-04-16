use company;

DROP PROCEDURE IF EXISTS show_e;
DELIMITER //
CREATE PROCEDURE show_e()
BEGIN
  SELECT *
    FROM employees;
END 
//
DELIMITER ;


DROP PROCEDURE IF EXISTS empNwork;
DELIMITER //
CREATE PROCEDURE empNwork()
BEGIN
  SELECT e.empid, e.firstname, e.lastname
    FROM employees e LEFT JOIN workson w ON e.empid = w.empid
   WHERE w.empid IS NULL;
END
//
DELIMITER ;


DROP PROCEDURE IF EXISTS countEmps;
DELIMITER //
CREATE PROCEDURE countEmps()
BEGIN
    SELECT depid, COUNT(*)
      FROM employees 
  GROUP BY depid;
    SELECT proid, COUNT(*)
      FROM workson 
  GROUP BY proid;  
END
//
DELIMITER ;


DROP PROCEDURE IF EXISTS empsal;
DELIMITER //
CREATE PROCEDURE empsal (IN p_salary FLOAT)
BEGIN
    SELECT *
      FROM employees
     WHERE salary > p_salary;
END
//
DELIMITER ;


DROP PROCEDURE IF EXISTS newemppro;
DELIMITER //
CREATE PROCEDURE newemppro
(
  IN p_empid INT,
  IN p_firstname VARCHAR(30),
  IN p_lastname VARCHAR(30),  
  IN p_depid INT,
  IN p_proid INT
)
BEGIN
  INSERT INTO employees (empid, firstname, lastname, depid, hiredate)
       VALUES (p_empid, p_firstname, p_lastname, p_depid, current_date);
  INSERT INTO workson (empid, proid)
       VALUES (p_empid, p_proid);
END
//
DELIMITER ;


DROP PROCEDURE IF EXISTS newempdep;
DELIMITER //
CREATE PROCEDURE newempdep
(
  IN p_empid INT,
  IN p_firstname VARCHAR(50),
  IN p_lastname VARCHAR(50),
  IN p_depid INT,
  IN p_depname VARCHAR(50)
)
BEGIN
  INSERT INTO departments (depid, depname, manager)
       VALUES (p_depid, p_depname, p_empid);
  INSERT INTO employees (empid, firstname, lastname, depid, hiredate)
       VALUES (p_empid, p_firstname, p_lastname, p_depid, current_date);
END
//
DELIMITER ;


DROP PROCEDURE IF EXISTS newempdep2;
DELIMITER //
CREATE PROCEDURE newdepemp2
(
  IN p_empid INT,
  IN p_depid INT,
  IN p_depname VARCHAR(50)
)
BEGIN
  INSERT INTO departments (depid, depname, manager)
       VALUES (p_depid, p_depname, p_empid);
  UPDATE employees
     SET depid = p_depid
   WHERE empid = p_empid;
END
//
DELIMITER ;
