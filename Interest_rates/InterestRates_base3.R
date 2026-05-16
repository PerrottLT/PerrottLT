# Function to calculate monthly payment
calculate_monthly_payment <- function(principal, annual_interest_rate, duration_in_months) {
  r <- annual_interest_rate / 12  # Monthly interest rate
  M <- (principal * r * (1 + r)^duration_in_months) / ((1 + r)^duration_in_months - 1)
  return(M)
}

monthly_payment <- calculate_monthly_payment(loan_amount, annual_interest_rate, loan_duration_months)

# Function to calculate total interest paid with decreasing principal
calculate_total_interest_paid_decreasing <- function(loan_amount, annual_interest_rate, loan_duration_months) {
  r <- annual_interest_rate / 12  # Monthly interest rate
  remaining_principal <- loan_amount
  total_interest_paid <- 0
  
  for (i in 1:loan_duration_months) {
    interest_payment <- remaining_principal * r
    total_interest_paid <- total_interest_paid + interest_payment
    remaining_principal <- remaining_principal - (monthly_payment - interest_payment)
  }
  
  return(total_interest_paid)
}

# Given data
loan_amount <- 13000
annual_interest_rate <- 0.064
loan_duration_months <- 60

# Calculate total interest paid with decreasing principal
total_interest_paid_decreasing <- calculate_total_interest_paid_decreasing(loan_amount, annual_interest_rate, loan_duration_months)

print(total_interest_paid_decreasing)
