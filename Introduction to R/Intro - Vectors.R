#Create a vector

#Vectors are one-dimension arrays that can hold numeric data, character data, or logical data. In other words, a vector is a simple tool to store data. For example, you can store your daily gains and losses in the casinos.
#You create a vector with the combine function c(). You place the vector elements separated by a comma between the parentheses.

numeric_vector <- c(1, 10, 49)
character_vector <- c("a", "b", "c")
boolean_vector <- c(TRUE, FALSE, TRUE)

# Poker winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)

# Roulette winnings from Monday to Friday
roulette_vector <-  c(-24, -50, 100, -350, 10)

# The variable days_vector
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# Assign days as names of poker_vector
# Manual way
#names(poker_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
#Dynamic way
names(poker_vector) <- days_vector

# Assign days as names of roulette_vector
# Manual way
#names(roulette_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
#Dynamic way
names(roulette_vector) <- days_vector

# Assign to total_daily how much you won/lost on each day
total_daily <- poker_vector + roulette_vector

# Print total_daily
total_daily

# Total winnings with poker
total_poker <- sum(poker_vector)

# Total winnings with roulette
total_roulette <-  sum(roulette_vector)

# Total winnings overall
total_week <- total_poker + total_roulette

# Print total_week
total_week

# Check if you realized higher total gains in poker than in roulette
total_poker > total_roulette

# Define a new variable based on a selection
roulette_selection_vector <- roulette_vector[2:5]

# Select poker results for Monday, Tuesday and Wednesday
poker_start <- poker_vector[1:3]

# Calculate the average of the elements in poker_start
mean(poker_start)

# Which days did you make money on poker?
selection_vector <- poker_vector > 0

# Print selection_vector
selection_vector

# Select from poker_vector these days
# When you pass a logical vector in square brackets it will only select the elements that correspond to TRUE
poker_winning_days <- poker_vector[selection_vector]

# Print
poker_winning_days

# Which days did you make money on roulette?
selection_vector <- roulette_vector > 0

# Select from roulette_vector these days
roulette_winning_days <- roulette_vector[selection_vector]

# Print
roulette_winning_days