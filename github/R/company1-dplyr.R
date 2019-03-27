library(dplyr)
load("company1.rda")

# http://stavrakoudis.econ.uoi.gr/stavrakoudis/?iid=111
# Να βρεθεί το όνομα, ο μισθός και το τμήμα του
# υπαλλήλου με κωδικό 243
employees %>% 
    filter(empid == 243) %>% 
    select(firstname, lastname, salary, depid)

# http://stavrakoudis.econ.uoi.gr/stavrakoudis/?iid=116
# Να βρεθούν όλες οι λεπτομέρειες των υπαλλήλων
# που εργάζονται στο τμήμα 4 και ο μισθός τους είναι
# μεγαλύτερος από 1100 €
employees %>% 
    filter(depid == 4 & salary > 1100)

# http://stavrakoudis.econ.uoi.gr/stavrakoudis/?iid=117
# Να βρεθούν τα τμήματα με περισσότερους από 3
# υπαλλήλους με μισθό μεγαλύτερο από 1200 €
employees %>% 
    filter(salary > 1200) %>% 
    group_by(depid) %>% 
    summarise(cnt = n()) %>% 
    filter(cnt > 3) %>% 
    select(depid)

# http://stavrakoudis.econ.uoi.gr/stavrakoudis/?iid=119
# Να βρεθούν τα ονόματα των υπαλλήλων και ο κωδικός και ο
# προϋπολογισμός των έργων στα οποία συμμετέχουν υπάλληλοι με
# μισθό μεγαλύτερο από 1700 €
employees %>% 
    filter(salary > 1700) %>% 
    inner_join(workson, by = "empid") %>% 
    inner_join(projects, by = "proid") %>% 
    select(firstname, lastname, proid, budget)

# http://stavrakoudis.econ.uoi.gr/stavrakoudis/?iid=120
# Να βρεθεί το πλήθος των εργαζομένων με μισθό μεγαλύτερο των
# 1300 € ανά όνομα τμήματος
employees %>% 
    filter(salary > 1300) %>% 
    inner_join(departments, by = "depid") %>% 
    group_by(depname) %>% 
    summarise(cnt = n())
