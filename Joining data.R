library(data.table)


setwd("C:\\Users\\lukep\\Coding\\PerrottLT\\")

# Print the working directory
getwd()

# Read in a file using a relative filepath
netflix <- read.csv(".\\data\\netflix_2017.csv")
imdb  <- read.csv(".\\data\\imdb_ratings.csv")


# setkey()
# To set all columns in DT as keys
# setkey(DT)
# Othewise
# setkey(DT, key1, key2)

# setkeyv()

# Key columns are provided as a character vector 
# keys <-c("key1","key2","key3")
# setkeyv(dt, keys)

# haskey()
# checks whether you have set keys

# key()
# returns the key columns you have set

# e.g. Datacamp example

netflix <- data.table(netflix)
imdb <- data.table(imdb)


# Set the keys
setkey(netflix, title)
setkey(imdb, title)


# Inner join
netflix[imdb, nomatch = 0]

# Check for keys
haskey(netflix)
haskey(imdb)

# Find the key
the_key <- key(netflix)

# Set the key for the other data.table
setkeyv(imdb, the_key)


# Chaining data.table expressions

# Join and sum
population[capitals, on = .(city), nomatch = 0,
           sum(percentage)]

# What countries are listed in multiple continents?
# Using by = .EACHI is a useful way of checking your join has the number of matches you expect, and finding rows that may cause problems in downstream analysis
continents[life_exp, on = .(country), .N, 
           by = .EACHI][N > 1]

# Calculate average life expectancy per continent:
avg_life_expectancy <- continents[life_exp, on = .(country), 
                                  nomatch = 0][, j =mean(years), 
                                               by = continent]
avg_life_expectancy



# Modify the code
rbind(ebola_W50, ebola_W51, ebola_W52, fill = TRUE)

# Run this code to inspect gdp_all_2
gdp_all_2 <- rbindlist(gdp, idcol = "continent")
str(gdp_all_2)
gdp_all_2[95:105]

# Fix the problem
gdp_all_3 <- rbindlist(gdp, idcol = "continent", use.names=TRUE)
gdp_all_3

# Obtain countries in both Asia and Europe
fintersect(gdp$asia, gdp$europe)

# Concatenate all data tables
gdp_all <- rbindlist(gdp)

# Find all countries that span multiple continents
gdp_all[duplicated(gdp_all)]
# Get all countries in either Asia or Europe
funion(gdp$asia, gdp$europe)

# Concatenate all data tables
gdp_all <- rbindlist(gdp)

# Print all unique countries
unique(gdp_all)

# Which countries are in Africa but not considered part of the middle east?
fsetdiff(gdp$africa, middle_east)

# Which countries are in Asia but not considered part of the middle east?
fsetdiff(gdp$asia, middle_east)

# Which countries are in Europe but not considered part of the middle east?
fsetdiff(gdp$europe, middle_east)

# You can do this in one line of code:
lapply(gdp, fsetdiff, middle_east)


# Print gdp_per_capita
gdp_per_capita

gdp_per_capita_colnames <- colnames(gdp_per_capita)[2:ncol(gdp_per_capita)]

# Reshape gdp_per_capita to the long format
melt(gdp_per_capita, id.vars = "year")

# Reshape gdp_per_capita to the long format
melt(gdp_per_capita, measure.vars = gdp_per_capita_colnames)

# Rename the new columns
melt(gdp_per_capita, id.vars = "year", 
     variable.name = 'country', value.name = 'gdp_pc')

# Modify the code
melt(ebola_wide, id.vars = "Location", measure.vars = c("Week_50", "Week_51"), 
     variable.name = "period", value.name = "cases", 
     rowid = "Location")

# Split the gdp column by country
dcast(gdp_oceania, formula = year ~ country, value.var = "gdp")

# Split gdp by industry and year
dcast(gdp_by_industry_oceania, formula = country ~ year + industry ,value.var = "gdp")