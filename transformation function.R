# Load tidyverse package
library("tidyverse")

# Define a function which performs input transformation on a dataset
transform_function <- function(data, type) {
  if ("age" %in% colnames(data) & "circumference" %in% colnames(data)){
    if (type == "group"){
      # Use mutate() function to classify trees into two groups
      # Trees elder than or equal to 1000 yrs are in "old" group
      # Trees younger than 1000 yrs are in "young" group
      data <- data %>%
        mutate(group = ifelse(age >= 1000, "old", "young"))
      # Return the "group" transformation data for next functionality
      return(data)
    } else if (type == "growth"){
      # Use filter() function to select circumference that is greater than 100
      data <- data %>%
        filter(circumference > 100) %>%
        # Calculate growth using mutate() function for big trees
        mutate(growth = round(circumference / age, 2))
    } else {
      stop("Transformation type is not available.")
    }
    return(data)
  } else {
    stop("There is no suitable data in this dataset to perform transformations.")
  }
}

data (Orange)

# Call function on dataset "Orange" to classify into groups
Orange_transformed_group <- transform_function(Orange, "group")

# Print the first few rows of transformed dataset with group
head(Orange_transformed_group)

# Call function on dataset "Orange" to calculate growth rate for big trees
Orange_transformed_growth <- transform_function(Orange, "growth")

# Print the first few rows of transformed dataset with growth
head(Orange_transformed_growth)


