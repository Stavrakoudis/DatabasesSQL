# Λήψη των δεδομένων της βάσης δεδομένων company
# που χρησιμοποιείται ως παράδειγμα στο βιβλίο
# Βάσεις Δεδομένων και SQL: Μια πρακτική προσέγγιση
# http://stavrakoudis.econ.uoi.gr/stavrakoudis/?menu=bookSQL

library(RCurl)
library(foreign)

csv <- "https://raw.githubusercontent.com/Stavrakoudis/DatabasesSQL/master/data/departments.csv"         
departments <- read.csv(textConnection(getURL(csv)))

csv <- "https://raw.githubusercontent.com/Stavrakoudis/DatabasesSQL/master/data/employees.csv"
employees <- read.csv(textConnection( getURL(csv)), na.strings="NULL")

csv <- "https://raw.githubusercontent.com/Stavrakoudis/DatabasesSQL/master/data/projects.csv"             
projects <- read.csv(textConnection(getURL(csv)))

csv <- "https://raw.githubusercontent.com/Stavrakoudis/DatabasesSQL/master/data/workson.csv"             
workson <- read.csv(textConnection(getURL(csv)))

rm(csv)
