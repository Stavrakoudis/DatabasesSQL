
DROP DATABASE IF EXISTS company;
CREATE DATABASE company;
USE company;
SET NAMES UTF8;

CREATE TABLE departments
(
    depid      INTEGER     NOT NULL,
    depname    VARCHAR(60) NOT NULL,
    manager    INTEGER     NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (depid),
    UNIQUE u_manager (manager)
)ENGINE=InnoDB  CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE employees
(
    empid      INTEGER     NOT NULL,
    firstname  VARCHAR(40) NOT NULL,
    lastname   VARCHAR(40) NOT NULL,
    depid      INTEGER     NOT NULL,
    salary     NUMERIC(6,2),
    hiredate   DATE,
    CONSTRAINT pk_employees PRIMARY KEY (empid),
    INDEX i_dep (depid),
    CONSTRAINT fk_dep FOREIGN KEY (depid) REFERENCES departments(depid)
            ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE projects
(
    proid      INTEGER       NOT NULL,
    title      VARCHAR(120)  NOT NULL,
    budget     NUMERIC(7,2)  NOT NULL DEFAULT 0,
    startdate  DATE,
    enddate    DATE,
    progress   NUMERIC(3,1)  NOT NULL DEFAULT 0,
    CONSTRAINT pk_projects PRIMARY KEY (proid)
)ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE workson
(
    empid      INTEGER      NOT NULL,
    proid      INTEGER      NOT NULL,
    CONSTRAINT pk_workson PRIMARY KEY (empid,proid),
    INDEX i_pro (proid),
    CONSTRAINT fk_emp FOREIGN KEY (empid) REFERENCES employees(empid)
            ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_pro FOREIGN KEY (proid) REFERENCES projects(proid)
            ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci;


INSERT INTO departments VALUES (1,'Διοίκησης/Επίβλεψης',109);
INSERT INTO departments VALUES (2,'Οικονομoλόγων/Λογιστών',153);
INSERT INTO departments VALUES (3,'Επιστημόνων/Μηχανικών',431);
INSERT INTO departments VALUES (4,'Εξωτερικών συνεργατών',230);
INSERT INTO departments VALUES (5,'Γραμματείας',234);
INSERT INTO departments VALUES (6,'Μάνατζμεντ/Πωλήσεων',189);

insert into employees values (243,'Δέσποινα','Παπαδοπούλου',2,1609.52,'1999-3-5');
insert into employees values (801,'Χριστόφορος','Αλεξίου',3,2312.56,'1999-7-16');
insert into employees values (234,'Αδαμαντία','Θεοτοκάτου',5,1534.65,'1999-10-1');
insert into employees values (412,'Αριστείδης','Περρής',3,1320.83,'1999-11-12');
insert into employees values (109,'Μαρία','Αθανασίου',1,2787.69,'2000-1-26');
insert into employees values (686,'Παναγιώτα','Νικοπολίτη',6,1634.96,'2000-4-6');
insert into employees values (543,'Μανώλης','Βίσκας',3,1321.77,'2000-5-25');
insert into employees values (189,'θεόδωρος','Αγγελίνας',6,1908.28,'2000-6-19');
insert into employees values (172,'Χρήστος','Βλάσσης',3,1101.7,'2000-7-4');
insert into employees values (419,'Πέτρος','Αρβανιτάκης',2,1323.8,'2000-7-17');
insert into employees values (435,'Αντώνης','Παύλου',3,1231.62,'2001-2-5');
insert into employees values (835,'Αθανάσιος','Πετράκης',6,1322.01,'2001-2-23');
insert into employees values (205,'Ηλίας','Μακρής',3,1050.96,'2001-2-23');
insert into employees values (502,'Κρινιώ','Μαροπούλου',1,1754.67,'2001-3-7');
insert into employees values (503,'Μαριλένα','Κρέσπα',2,1105.04,'2001-3-7');
insert into employees values (342,'Κώστας','Φραγκούλης',6,1351.96,'2001-4-17');
insert into employees values (153,'Μαρία','Αλεβιζάτου',2,1321.92,'2001-5-15');
insert into employees values (901,'Κυριάκος','Ρούσσης',1,1852.99,'2001-11-1');
insert into employees values (311,'Νίκος','Στεργιόπουλος',4,1386.05,'2002-2-1');
insert into employees values (811,'Αρετή','Βασιλακάκη',6,1323.98,'2002-7-1');
insert into employees values (431,'Κώστας','Παπαδόπουλος',3,1100.23,'2002-9-16');
insert into employees values (206,'Νίκος','Βλάχος',4,1102.04,'2002-12-3');
insert into employees values (780,'Ευθαλεία','Μικράκη',4,1054.71,'2002-12-3');
insert into employees values (230,'Βαγγέλης','Χριστόπουλος',4,NULL,'2002-12-3');
insert into employees values (381,'Περικλής','Κιτσάκης',6,1100.13,'2003-2-14');
insert into employees values (102,'Νικηφόρος','Διαμαντίδης',6,1212.5,'2003-6-2');
insert into employees values (483,'Ηρακλής','Μανωλάκης',3,NULL,'2003-9-18');
insert into employees values (490,'Νίκη','Βαρώτσου',5,1051.92,'2004-4-28');
insert into employees values (593,'Παύλος','Περίδης',4,NULL,'2004-10-5');
insert into employees values (721,'Βασιλική','Περδίκη',3,1053.54,'2004-10-5');

INSERT INTO projects (proid, title, budget, startdate, enddate, progress) VALUES (5, 'Επίβλεψη έρευνας για την αξιοποίηση ακίνητης περουσίας κληροδοτήματος', '45000.00', '2005-06-01', '2006-12-31', '25.0');
INSERT INTO projects (proid, title, budget, startdate, enddate, progress) VALUES (12, 'Επίβλεψη κατασκευής σταθμού βιολογικής επεξεργασίας λυμάτων', '124000.00', '2006-06-01', '2007-05-31', '60.0');
INSERT INTO projects (proid, title, budget, startdate, enddate, progress) VALUES (14, 'Μελέτη και επίβλεψη κατασκευής νέας προβλήτας λιμανιού', '383500.00', '2006-04-01', '2010-05-31', '20.0');
INSERT INTO projects (proid, title, budget, startdate, enddate, progress) VALUES (21, 'Παροχή συμβουλευτικών υπηρεσιών σε παραγωγική μονάδα', '50000.00', '2003-06-01', '2005-05-31', '85.0');
INSERT INTO projects (proid, title, budget, startdate, enddate, progress) VALUES (38, 'Μελέτη ενναλακτικών λύσεων για τη κατασκευή πολυκαστήματος', '65000.00', '2007-08-01', '2007-07-31', '0.0');
INSERT INTO projects (proid, title, budget, startdate, enddate, progress) VALUES (43, 'Μελέτη οικονομικής βιοσιμότητας νέου οδικού άξονα', '175000.00', '2003-04-15', '2005-04-15', '75.0');


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
