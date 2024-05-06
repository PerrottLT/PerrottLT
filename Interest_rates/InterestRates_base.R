library(readr)

# Change the default working directory
setwd("C:\\Users\\lukep\\Documents\\Games\\20240407_RW")


# Define parameters of the loan
APR <- 0.061
starting_balance <- 14000
current_balance <- 13000

payment_history <- read_csv("payment_history.csv")



# Function to calculate daily interest. Interest rate as a decimal.
calculate_daily_interest <- function(loan_balance, annual_interest_rate = APR) {
  daily_interest_rate <- annual_interest_rate / 365
  daily_interest <- loan_balance * daily_interest_rate
  return(daily_interest)
}