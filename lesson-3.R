# Database connections from R

library(RSQLite)
con <- dbConnect(SQLite(), "data/portal.sqlite")
dbGetQuery(con, "pragma foreign_keys = on")
dbListTables(con)

# Two ways to access data

plots <- dbReadTable(con, "plots")
surveys <- dbReadTable(con, "surveys")
species <- dbReadTable(con, "species")

str(surveys)

dbGetQuery(con, "select species_id, weight
                 from surveys
                 where plot_id = 1 limit 5")
                

# Exercise 1

...

# Primary keys

dbGetQuery(con, ...)

# Foreign keys

dbGetQuery(con, "...
                 ...
                 values (35549, 1, ..., 'M')")


# One-to-Many Relationship

df <- dbGetQuery(con, "select weight, month, plot_type
                       ...
                       ...
                       where weight is not null")
str(df)

## Exercise 2

...
