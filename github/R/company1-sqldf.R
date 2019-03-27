library(sqldf)
load("company1.rda")

# http://stavrakoudis.econ.uoi.gr/stavrakoudis/?iid=111
# Να βρεθεί το όνομα, ο μισθός και το τμήμα του
# υπαλλήλου με κωδικό 243
sqldf("SELECT firstname, lastname, salary, depid
         FROM employees
        WHERE empid = 243")


# http://stavrakoudis.econ.uoi.gr/stavrakoudis/?iid=116
# Να βρεθούν όλες οι λεπτομέρειες των υπαλλήλων
# που εργάζονται στο τμήμα 4 και ο μισθός τους είναι
# μεγαλύτερος από 1100 €
sqldf("SELECT *
         FROM employees
        WHERE depid = 4 AND salary > 1100")

# http://stavrakoudis.econ.uoi.gr/stavrakoudis/?iid=117
# Να βρεθούν τα τμήματα με περισσότερους από 3
# υπαλλήλους με μισθό μεγαλύτερο από 1200 €
sqldf("SELECT depid
         FROM employees
        WHERE salary > 1200
     GROUP BY depid
       HAVING COUNT(depid) > 3")

# http://stavrakoudis.econ.uoi.gr/stavrakoudis/?iid=119
# Να βρεθούν τα ονόματα των υπαλλήλων και ο κωδικός και ο
# προϋπολογισμός των έργων στα οποία συμμετέχουν υπάλληλοι με
# μισθό μεγαλύτερο από 1700 €
sqldf("SELECT e.firstname, e.lastname, p.proid, p.budget
         FROM (employees e INNER JOIN workson w ON e.empid = w.empid)
                           INNER JOIN projects p ON p.proid = w.proid
        WHERE e.salary > 1700")


# http://stavrakoudis.econ.uoi.gr/stavrakoudis/?iid=120
# Να βρεθεί το πλήθος των εργαζομένων με μισθό μεγαλύτερο των
# 1300 € ανά όνομα τμήματος
sqldf("SELECT d.depname, COUNT(e.depid)
         FROM employees e INNER JOIN departments d ON e.depid = d.depid
        WHERE e.salary > 1300
     GROUP BY d.depname")
