loan_calculator <- function(loan_amount, loan_duration_months, interest_rate_annual) {
  # Convert annual interest rate to monthly rate
  monthly_interest_rate <- interest_rate_annual / 100 / 12
  
  # Calculate monthly payment using the formula for an installment loan
  monthly_payment <- (loan_amount * monthly_interest_rate) / 
    (1 - (1 + monthly_interest_rate)^-loan_duration_months)
  
 
  # Calculate total cost of the loan
  total_cost <- monthly_payment * loan_duration_months
  
  # Create a data frame to store the payment schedule
  payment_schedule <- data.frame(
    Month = 1:loan_duration_months,
    Payment = rep(monthly_payment, loan_duration_months),
    Interest = numeric(loan_duration_months),
    Principal = numeric(loan_duration_months),
    Balance = numeric(loan_duration_months)
  )
  
  # Calculate interest and principal payments for each month
  balance <- loan_amount
  for (i in 1:loan_duration_months) {
    interest_payment <- balance * monthly_interest_rate
    principal_payment <- monthly_payment - interest_payment
    balance <- balance - principal_payment
    
    payment_schedule[i, "Interest"] <- interest_payment
    payment_schedule[i, "Principal"] <- principal_payment
    payment_schedule[i, "Balance"] <- balance
  }
  
  return(list(
    MonthlyPayment = monthly_payment,
    TotalCost = total_cost,
    PaymentSchedule = payment_schedule
  ))
}

# Example usage

loan_amount <- 13000
loan_duration_months <- 6.4
interest_rate_annual <- 60


result <- loan_calculator(loan_amount, loan_duration_months, interest_rate_annual)
print(result$MonthlyPayment)
print(result$TotalCost)
print((result$PaymentSchedule))
