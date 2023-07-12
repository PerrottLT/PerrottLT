# What is a factor?
# Data type used to store categorical variables.
# The difference between a categorical variable and a continuous variable is that a categorical variable can belong to a limited number of categories. A continuous variable, on the other hand, can correspond to an infinite number of values.
# It is important that R knows whether it is dealing with a continuous or a categorical variable, as the statistical models you will develop in the future treat both types differently.

# An example of a categorical variable is sex, there are a finite number of options.

# Sex vector
sex_vector <- c("Male", "Female", "Female", "Male", "Male")

# Convert sex_vector to a factor
factor_sex_vector <- factor(sex_vector)

# Print out factor_sex_vector
factor_sex_vector
#In the above, there are two categories, or in R-terms 'factor levels', at work here: "Male" and "Female".

# There are two types of categorical variables: a nominal categorical variable and an ordinal categorical variable.
# A nominal variable is a categorical variable without an implied order.
# impossible to say that 'one is worth more than the other'. e.g. factor_sex_vector.

# Ordinal variables do have a natural ordering. e.g. temperature_vector
# Temperature
temperature_vector <- c("High", "Low", "High","Low", "Medium")

factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low", "Medium", "High"))
factor_temperature_vector

# We can rename the levels of a factor.
factor_temperature_vector
factor_temperature_vector_changed <- levels(factor_temperature_vector) <- c("L","M","H")
factor_temperature_vector_changed

#Summary() will give a summary of the contents.

summary(sex_vector)
summary(factor_temperature_vector)

#Example:
# Create speed_vector
speed_vector <- c("medium", "slow", "slow", "medium", "fast")

# Convert speed_vector to ordered factor vector
factor_speed_vector <- factor(speed_vector, ordered = TRUE, levels = c("slow", "medium", "fast"))

# Print factor_speed_vector
factor_speed_vector
summary(factor_speed_vector)

# Factor value for second data analyst
da2 <- factor_speed_vector[2]

# Factor value for fifth data analyst
da5 <- factor_speed_vector[5]

# Is data analyst 2 faster than data analyst 5?
da2 > da5

#Note, we can do this as it's an ordered factor. This couldn't be done for sex.
