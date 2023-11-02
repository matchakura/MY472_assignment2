# Load tidyverse package
library("tidyverse")

# Define a function which performs input transformation on a dataset
transform_function <- function(data) {
  # Ensure that dataset contains the columns "age" and "circumference"
  if ("age" %in% colnames(data) & "circumference" %in% colnames(data)){
    # Use "mutate" and "ifelse" function to classify trees into two groups
    # Trees elder than or equal to 1000 yrs are in "old" group
    # Trees younger than 1000 yrs are in "young" group
    data <- data %>%
      mutate(group = ifelse(age >= 1000, "old", "young"))
    return(data)
  } else {
    stop("There is not enough data in this dataset to classify group of trees")
  }
}

# This transformation data will work on built-in dataset "Orange" 
data(Orange)

# Call function on dataset "Orange"
Orange_transformed <- transform_function(Orange)

# Print the first few rows of transformed dataset
head(Orange_transformed)


