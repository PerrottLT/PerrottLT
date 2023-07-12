#What is a matrix?
#A collection of elements of the same data type (numeric, character, or logical) arranged into a fixed number of rows and columns.
# Since it is only working with rows and columns, a matrix is called two-dimensional.

# Construct a matrix with 3 rows that contain the numbers 1 up to 9
matrix(1:9, byrow =  TRUE, nrow = 3)

#Note 1:9 is a shortcut for c(1, 2, 3, 4, 5, 6, 7, 8, 9)
#byrow indicates that the matrix is filled by the rows.
#If we want the matrix to be filled by the columns, we just place byrow = FALSE.
matrix(1:9, byrow =  FALSE, nrow = 3)

#nrow indicates that the matrix should have three rows.

#Example: 

# Box office Star Wars (in millions!) [US | non-US]
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Create box_office (vector)
box_office <- c(new_hope, empire_strikes, return_jedi)

# Print
box_office

# Construct star_wars_matrix
#As above, but rather than 1:9, we're specifying the box_office vector
star_wars_matrix <- matrix(box_office, byrow = TRUE, nrow = 3)
star_wars_matrix

# Grid coordinated aren't always useful. Instead, we can name the cols and rows.
#rownames(my_matrix) <- row_names_vector
#colnames(my_matrix) <- col_names_vector

# Vectors region and titles, used for naming
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# Name the columns with region
colnames(star_wars_matrix) <-region

star_wars_matrix

# Name the rows with titles
rownames(star_wars_matrix) <-titles

star_wars_matrix

# Calculate worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)
# rowSums calculates the totals for each row of a matrix.
# colSums functions the same, but for each column of a matrix.

worldwide_vector

# This created a new vector. Use cbind() to merge matricies and/or vectors.

# Bind the new variable worldwide_vector as a column to star_wars_matrix
all_wars_matrix <- cbind(star_wars_matrix, worldwide_vector)

all_wars_matrix

# rbind() functions the same, but by adding rows.#

# Can use [] to subset to specific elements, Note: matricies are 2D.
# Gets the non-US value of A New Hope.
all_wars_matrix[1,2]

# Gets the non-US value of all films.
all_wars_matrix[,2]

# Gets all values of A New Hope.
all_wars_matrix[1,]

# Select the non-US revenue for 2 to 3
all_wars_matrix[2:3,2]

#If a ticket was $5, estimate the number of visitors of each film.

# Estimate the visitors
visitors <- all_wars_matrix / 5

# Print the estimate to the console
visitors
