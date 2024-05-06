round_n_suppress <- function(data) {
  # Round data to the nearest multiple of 5
  rounded_value <- round(data / 5, 0) * 5
  output <- sprintf("%.1f has rounded to %.1f", data, rounded_value)
}

test_seq <- seq(0, 100, by= 0.5)

for (n in test_seq) {
  rounded_data <- round_n_suppress(n)
  result <- round_n_suppress(n)
  cat(result, "\n")
} 
