# 2 Loops
# 2.1 While loop
# Needs to become FALSE at some point, otherwise will go on indefinitely as there's no break

speed <- 64

# Code the while loop
while (speed > 30) {
  print("Slow down!")
  speed <- speed - 7
}

speed

# Extend/adapt the while loop
while (speed > 30) {
  print(paste("Your speed is",speed))
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed -6
  }
}

# break statement is a control statement. When R encounters it, the while loop is abandoned completely.

# Initialize the speed variable
speed <- 88

while (speed > 30) {
  print(paste("Your speed is", speed))
  
  # Break the while loop when speed exceeds 80
  if (speed > 80) {
    break
  }
  
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}

# Build a while loop from scratch

# Initialize i as 1 
i <- 1

# Code the while loop
while (i <= 10) {
    print(3 * i)
  # break if divisible by 8
  if (3 * i %% 8 == 0) {
    break
  }
  # increment the count by 1 each loop
  i <- i + 1
}

# 2.2 For loop

# Looping over a vector

linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Loop version 1
for (views in linkedin) {
  print(views)
}

# Loop version 2
for (i in 1:length(linkedin)) {
  print(linkedin[i])
}

# Looping over a list

# The nyc list is already specified
nyc <- list(pop = 8405837, 
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), 
            capital = FALSE)

# Loop version 1
for (n in nyc) {
  print(n)
}

# Loop version 2
for (i in 1:length(nyc)) {
  print (nyc[[i]])
}

# Code the for loop with conditionals
for (li in linkedin) {
  if (li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")    
  }
  print(li)
}

# Adapt/extend the for loop
for (li in linkedin) {
  if (li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  
  # Add if statement with break
  if (li > 16) {
    print("This is ridiculous, I'm outta here!")
    break
  }
  # Add if statement with next
  if (li < 5) {
    print("This is too embarrassing!")
    next
  }
  
  print(li)
}

# Pre-defined variables
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]
chars
# Initialize rcount
rcount <- 0

# Finish the for loop
for (char in chars) {
  print(char)
  if (char == 'r') {
    rcount <- rcount + 1
  }
  else if (char == 'u'){
    break
  }
}

# Print out rcount
rcount