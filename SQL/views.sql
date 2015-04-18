USE company;

DROP VIEW IF EXISTS depcount;
  CREATE VIEW depcount AS
  SELECT depid, COUNT(depid) as nemp
    FROM employees
GROUP BY depid;


DROP VIEW IF EXISTS dep2;
CREATE VIEW dep2 AS
  SELECT *
    FROM employees
   WHERE depid=2;

   
DROP VIEW IF EXISTS dep2a;
CREATE VIEW dep2a AS
  SELECT *
    FROM dep2;

DROP VIEW IF EXISTS lotwork;
CREATE VIEW lotwork(empid, name, cnt, salary) AS
  SELECT e.empid, CONCAT(left(e.firstname, 1), '. ', e.lastname), COUNT(*), e.salary
    FROM employees e INNER JOIN workson w ON e.empid = w.empid
GROUP BY e.empid, lastname, firstname, salary
  HAVING COUNT(*)>2;
  
DROP VIEW IF EXISTS worksM1;
  CREATE VIEW worksM1(empid, name, cnt, salary) AS
  SELECT e.empid, e.lastname, COUNT(*), e.salary
    FROM employees e INNER JOIN workson w ON e.empid=w.empid
GROUP BY e.empid, e.lastname, e.salary
  HAVING COUNT(*) > 1;
  
REVOKE ALL PRIVILEGES ON company.* FROM mary;
GRANT SELECT, INSERT, DELETE, UPDATE ON company.dep2 TO mary IDENTIFIED BY 'somepass';

/*
INSERT INTO dep2 (id, lastname, firstname, depid, hiredate)
     VALUES (1001, 'Ευθυμίου', 'Ευαγγελία', 6, '2006-09-15');

DROP VIEW IF EXISTS dep2a;
CREATE VIEW dep2a AS
  SELECT *
    FROM dep2;

INSERT INTO dep2a (id, lastname, firstname, depid, hiredate)
     VALUES (1002, 'Ευθυμίου', 'Ευαγγελία', 2, '2006-09-15');
*/
DROP VIEW IF EXISTS newsal;
CREATE VIEW newsal (empid, salary, newsal) AS
  SELECT empid, salary, salary*1.1
    FROM employees;
    
    
DROP VIEW IF EXISTS globalview;
CREATE VIEW globalview 
            (
              depid, depname, empid, elastname, efirstname,
              edepid, esalary, ehiredate, wempid, wproid,
              proid, ptitle, pbudget, pstartdate, penddate, pprogress
            )
      AS
  SELECT d.depid, d.depname, e.empid, e.lastname, e.firstname, 
         e.depid, e.salary, e.hiredate, w.empid, w.proid,
         p.proid, p.title, p.budget, p.startdate, p.enddate, p.progress
    FROM departments d, employees e, workson w, projects p;

    
DROP VIEW IF EXISTS globalview2;
CREATE VIEW globalview2 
      AS
  SELECT d.depid, d.depname, d.manager,
         e.empid, e.lastname, e.firstname, e.salary, e.hiredate,
         p.proid, p.title, p.startdate, p.enddate, p.budget
    FROM departments d INNER JOIN employees e ON d.depid = e.depid
                       INNER JOIN workson w   ON e.empid = w.empid
                       INNER JOIN projects p  ON w.proid = p.proid;

  SELECT title, count(*)
    FROM globalview
GROUP BY ptitle;

  SELECT ptitle, avg(salary)
    FROM globalview2
GROUP BY ptitle;

DROP VIEW IF EXISTS depemps;
CREATE VIEW depemps(a,b,c) AS
  SELECT d.depname, e.lastname, e.firstname
    FROM departments d INNER JOIN employees e ON d.depid = e.depid
ORDER BY d.depid ASC;

DROP VIEW IF EXISTS empsperdep;
CREATE VIEW empsperdep AS
  SELECT d.depname, COUNT(*) AS  cnt
   FROM departments d INNER JOIN employees e ON d.depid = e.depid
GROUP BY d.depname
ORDER BY d.depid;

DROP VIEW IF EXISTS empsperdep;
CREATE VIEW empsperdep (depname, cnt) AS
  SELECT d.depname, COUNT(*)
   FROM departments d INNER JOIN employees e ON d.depid = e.depid
GROUP BY d.depname
ORDER BY d.depid;

DROP VIEW IF EXISTS newsal10;
CREATE VIEW newsal10(id, sal, nsal) AS
  SELECT empid, salary, salary*1.1
    FROM employees;

DROP VIEW IF EXISTS maxsal;
CREATE VIEW maxsal AS
  SELECT d.depname, MAX(salary) AS  MaxSal
   FROM departments d INNER JOIN employees e ON d.depid = e.depid
GROUP BY d.depname
ORDER BY d.depid;

DROP VIEW IF EXISTS depprocnt;
CREATE VIEW depprocnt AS
SELECT d.depname, p.title, COUNT(*) AS cnt
  FROM departments d INNER JOIN employees e ON d.depid = e.depid
                     INNER JOIN workson w   ON e.empid = w.empid
                     INNER JOIN projects p  ON w.proid = p.proid
GROUP BY d.depname, p.title;
