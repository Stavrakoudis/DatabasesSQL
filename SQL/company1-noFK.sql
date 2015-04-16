SET NAMES UTF8;
DROP DATABASE IF EXISTS company;
CREATE DATABASE company;
USE company;

CREATE TABLE departments
(
    depid      INTEGER     NOT NULL,
    depname    VARCHAR(50) NOT NULL,
    manager    INTEGER     NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (depid)
)ENGINE=InnoDB  CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE employees
(
    empid      INTEGER     NOT NULL,
    firstname  VARCHAR(50) NOT NULL,
    lastname   VARCHAR(50) NOT NULL,
    depid      INTEGER     NOT NULL,
    salary     NUMERIC(6,2),
    hiredate   DATE,
    CONSTRAINT pk_employees PRIMARY KEY (empid)
)ENGINE=InnoDB  CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE projects
(
    proid      INTEGER      NOT NULL,
    title      VARCHAR(120) NOT NULL,
    budget     NUMERIC(7,2) NOT NULL DEFAULT 0,
    startdate  DATE,
    enddate    DATE,
    progress   NUMERIC(3,1) NOT NULL DEFAULT 0,
    CONSTRAINT pk_projects PRIMARY KEY (proid)
)ENGINE=InnoDB  CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE workson
(
    empid      INTEGER      NOT NULL,
    proid      INTEGER      NOT NULL,
    CONSTRAINT pk_workson PRIMARY KEY (empid,proid)
)ENGINE=InnoDB  CHARACTER SET utf8 COLLATE utf8_general_ci;


INSERT INTO departments VALUES (1,'Διοίκησης/Επίβλεψης',109);
INSERT INTO departments VALUES (2,'Οικονομoλόγων/Λογιστών',153);
INSERT INTO departments VALUES (3,'Επιστημόνων/Μηχανικών',431);
INSERT INTO departments VALUES (4,'Εξωτερικών συνεργατών',230);
INSERT INTO departments VALUES (5,'Γραμματείας',234);
INSERT INTO departments VALUES (6,'Μάνατζμεντ/Πωλήσεων',189);
INSERT INTO employees values (243,'Δέσποινα','Παπαδοπούλου',2,1609.52,'1999-3-5');
INSERT INTO employees values (801,'Χριστόφορος','Αλεξίου',3,2312.56,'1999-7-16');
INSERT INTO employees values (234,'Αδαμαντία','Θεοτοκάτου',5,1534.65,'1999-10-1');
INSERT INTO employees values (412,'Αριστείδης','Περρής',3,1320.83,'1999-11-12');
INSERT INTO employees values (109,'Μαρία','Αθανασίου',1,2787.69,'2000-1-26');
INSERT INTO employees values (686,'Παναγιώτα','Νικοπολίτη',6,1634.96,'2000-4-6');
INSERT INTO employees values (543,'Μανώλης','Βίσκας',3,1321.77,'2000-5-25');
INSERT INTO employees values (189,'θεόδωρος','Αγγελίνας',6,1908.28,'2000-6-19');
INSERT INTO employees values (172,'Χρήστος','Βλάσσης',3,1101.7,'2000-7-4');
INSERT INTO employees values (419,'Πέτρος','Αρβανιτάκης',2,1323.8,'2000-7-17');
INSERT INTO employees values (435,'Αντώνης','Παύλου',3,1231.62,'2001-2-5');
INSERT INTO employees values (835,'Αθανάσιος','Πετράκης',6,1322.01,'2001-2-23');
INSERT INTO employees values (205,'Ηλίας','Μακρής',3,1050.96,'2001-2-23');
INSERT INTO employees values (502,'Κρινιώ','Μαροπούλου',1,1754.67,'2001-3-7');
INSERT INTO employees values (503,'Μαριλένα','Κρέσπα',2,1105.04,'2001-3-7');
INSERT INTO employees values (342,'Κώστας','Φραγκούλης',6,1351.96,'2001-4-17');
INSERT INTO employees values (153,'Μαρία','Αλεβιζάτου',2,1321.92,'2001-5-15');
INSERT INTO employees values (901,'Κυριάκος','Ρούσσης',1,1852.99,'2001-11-1');
INSERT INTO employees values (311,'Νίκος','Στεργιόπουλος',4,1386.05,'2002-2-1');
INSERT INTO employees values (811,'Αρετή','Βασιλακάκη',6,1323.98,'2002-7-1');
INSERT INTO employees values (431,'Κώστας','Παπαδόπουλος',3,1100.23,'2002-9-16');
INSERT INTO employees values (206,'Νίκος','Βλάχος',4,1102.04,'2002-12-3');
INSERT INTO employees values (780,'Ευθαλεία','Μικράκη',4,1054.71,'2002-12-3');
INSERT INTO employees values (230,'Βαγγέλης','Χριστόπουλος',4,NULL,'2002-12-3');
INSERT INTO employees values (381,'Περικλής','Κιτσάκης',6,1100.13,'2003-2-14');
INSERT INTO employees values (102,'Νικηφόρος','Διαμαντίδης',6,1212.5,'2003-6-2');
INSERT INTO employees values (483,'Ηρακλής','Μανωλάκης',3,NULL,'2003-9-18');
INSERT INTO employees values (490,'Νίκη','Βαρώτσου',6,1051.92,'2004-4-28');
INSERT INTO employees values (593,'Παύλος','Περίδης',4,NULL,'2004-10-5');
INSERT INTO employees values (721,'Βασιλική','Περδίκη',3,1053.54,'2004-10-5');

INSERT INTO projects VALUES (5, 'Επίβλεψη έρευνας για την αξιοποίηση ακίνητης περουσίας κληροδοτήματος', 16400, '2004-06-01', '2004-12-31', 25);
INSERT INTO projects VALUES (12, 'Επίβλεψη κατασκευής σταθμού βιολογικής επεξεργασίας λυμάτων', 84000, '2003-06-01', '2005-05-31', 60);
INSERT INTO projects VALUES (14, 'Μελέτη και επίβλεψη κατασκευής νέας προβλήτας λιμανιού', '383500.00', '2006-04-01', '2010-05-31', '20.0');
INSERT INTO projects VALUES (21, 'Παροχή συβουλευτικών υπηρεσιών σε παραγωγική μονάδα', 40800, '2003-06-01', '2005-05-31', 5);
INSERT INTO projects VALUES (38, 'Μελέτη ενναλακτικών λύσεων για τη κατασκευή πολυκαστήματος', 35000, '2005-08-01', '2006-07-31', 0);
INSERT INTO projects VALUES (43, 'Μελέτη οικονομικής βιοσιμότητας νέου οδικού άξονα', 75000, '2003-04-15', '2004-04-15', 75);

INSERT INTO workson (empid, proid) VALUES (102, 38);
INSERT INTO workson (empid, proid) VALUES (109, 14);
INSERT INTO workson (empid, proid) VALUES (153, 14);
INSERT INTO workson (empid, proid) VALUES (153, 38);
INSERT INTO workson (empid, proid) VALUES (172, 5);
INSERT INTO workson (empid, proid) VALUES (189, 14);
INSERT INTO workson (empid, proid) VALUES (189, 21);
INSERT INTO workson (empid, proid) VALUES (189, 43);
INSERT INTO workson (empid, proid) VALUES (206, 12);
INSERT INTO workson (empid, proid) VALUES (230, 12);
INSERT INTO workson (empid, proid) VALUES (230, 14);
INSERT INTO workson (empid, proid) VALUES (230, 38);
INSERT INTO workson (empid, proid) VALUES (234, 14);
INSERT INTO workson (empid, proid) VALUES (234, 38);
INSERT INTO workson (empid, proid) VALUES (243, 21);
INSERT INTO workson (empid, proid) VALUES (243, 38);
INSERT INTO workson (empid, proid) VALUES (381, 12);
INSERT INTO workson (empid, proid) VALUES (412, 5);
INSERT INTO workson (empid, proid) VALUES (419, 12);
INSERT INTO workson (empid, proid) VALUES (419, 21);
INSERT INTO workson (empid, proid) VALUES (419, 43);
INSERT INTO workson (empid, proid) VALUES (431, 14);
INSERT INTO workson (empid, proid) VALUES (431, 21);
INSERT INTO workson (empid, proid) VALUES (435, 12);
INSERT INTO workson (empid, proid) VALUES (435, 21);
INSERT INTO workson (empid, proid) VALUES (483, 14);
INSERT INTO workson (empid, proid) VALUES (483, 21);
INSERT INTO workson (empid, proid) VALUES (502, 12);
INSERT INTO workson (empid, proid) VALUES (502, 21);
INSERT INTO workson (empid, proid) VALUES (502, 38);
INSERT INTO workson (empid, proid) VALUES (503, 21);
INSERT INTO workson (empid, proid) VALUES (503, 38);
INSERT INTO workson (empid, proid) VALUES (543, 5);
INSERT INTO workson (empid, proid) VALUES (593, 43);
INSERT INTO workson (empid, proid) VALUES (835, 14);
INSERT INTO workson (empid, proid) VALUES (835, 38);
INSERT INTO workson (empid, proid) VALUES (901, 5);
INSERT INTO workson (empid, proid) VALUES (901, 12);
INSERT INTO workson (empid, proid) VALUES (901, 14);
INSERT INTO workson (empid, proid) VALUES (901, 21);
INSERT INTO workson (empid, proid) VALUES (901, 38);
INSERT INTO workson (empid, proid) VALUES (901, 43);
