# Enter data into vectors before constructing the data frame
date_col <- c("10/15/18","10/11/18","10/21/18","10/28/18","05/01/18")
country_col <- c("US","US","IRL","IRL","IRL")
gender_col <- c("M","F","F","M","F")
age_col <- c(32,45,25,39,99)
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2) # NA is inserted in place of missing data for this
q5_col <- c(5, 5, 2, NA, 1)

# construct a data frame using the data from all the vectors
managers_data <- data.frame(date_col, 
                            country_col,
                            gender_col,
                            age_col,
                            q1_col,
                            q2_col,
                            q3_col,
                            q4_col,
                            q5_col)

managers_data

columns_names <- c("Date",
                  "Country",
                  "Gender",
                  "Age",
                  "Q1",
                  "Q2",
                  "Q3",
                  "Q4",
                  "Q5")

# Add column names to the managers_data dataframes

colnames(managers_data) <- columns_names
managers_data

# Recode incorrect 'age' to NA
managers_data$Age[managers_data$Age == 99] <- NA
managers_data

# 2 options to create a new variable
# 1- create a new vectorand store the logical check in it
# 2 - create the new var when doing the logical check

managers_data$age_cat[managers_data$Age >= 45] <- "Elder"
managers_data$age_cat[managers_data$Age >= 26 & managers_data$Age <= 44 ] <- "Middle Aged"
managers_data$age_cat[managers_data$Age <= 25] <- "Young"
managers_data$age_cat[is.na(managers_data$Age)] <- "Elder"
managers_data

# Recode age_cat so that it is ordinal and factored
# with the order young , middle aged, elder
Age_cat <- factor(managers_data$age_cat, order = TRUE, levels = c("Young", "Middle Aged", "Elder" ))
Age_cat

#replace manager_data, age_cat variable with 
# the factored variable

managers_data$age_cat <- Age_cat
managers_data

# Look at the structure of  the dataframe
str(managers_data)
