# I divided my notes into two parts, this (part two), is where I utilized the bellabeat Capstone template provided by the course in
# addition to the data analysis project by Adeola Shogbaike via her Medium post (https://tinyurl.com/nw55ejtx).
# PARTT II: ACTIONS AFTER READING R SCRIPT TEMPLATE & ADEOLA'S PROJECT
# Install any packages that may be needed
install.packages("janitor") # For cleaning data
install.packages("skimr") # For summaries
install.packages("here")  # For path management

# Load in the necessary libraries
library(tidyverse)
library(lubridate)
library(janitor)
library(skimr)
library(here)
library(knitr)
library(scales)

# set the working directory to the right folder for csv files (using here for better portability)
setwd(here::here("Fitbit_041216_to_051216/Fitbit_041216_to_051216"))

# Set variables for each CSV file I want to evaluate
daily_activity_may <- read_csv("dailyActivity_merged.csv")
sleep_day_may <- read_csv("sleepDay_merged.csv")

# View the data to confirm the data type, column names, etc. - skimr is also very useful here
str(sleep_day_may)
str(daily_activity_may)

# Verify number of distinct user IDs in both tables
n_distinct(sleep_day_may$Id) # 24 unique Ids - under 30 participants (Central Limit Theorem)
n_distinct(daily_activity_may$Id) # 33 unique user Ids

# Determine any duplicated rows 
sum(duplicated(daily_activity_may))
sum(duplicated(sleep_day_may))

# Clear duplicates and any empty rows. Verify the code below worked by re-running the sum function above
sleep_day_may <- sleep_day_may %>% 
  distinct() %>% 
  drop_na()
daily_activity_may <- daily_activity_may %>% 
  distinct() %>% 
  drop_na()

# Clean and rename columns for when we merge later
daily_activity_may <- daily_activity_may %>% 
  clean_names()
sleep_day_may <- sleep_day_may %>% 
  clean_names()

# For me, it helps to see what the tables look like when throughout the cleaning process, merging tables, etc.
View(sleep_day_may)
View(daily_activity_may)

# Based on the str() function from earlier, we saw that the dates were stored as characters and had different names, so we need to change that 
daily_activity_may <- daily_activity_may %>% 
  rename(date = activity_date) %>% 
  mutate(date = as_date(date, format = "%m/%d/%Y"))
sleep_day_may <- sleep_day_may %>% 
  rename(date = sleep_day) %>% 
  mutate(date = as_date(date, format ="%m/%d/%Y %I:%M:%S %p"))

# Originally used this syntax, but I like Adeola's approach better
# daily_activity_may$ActivityDay <- as.Date(daily_activity_may$ActivityDay, format="%m/%d/%Y") 
# sleep_day_may$SleepDay <- as.Date(sleep_day_may$SleepDay, format="%m/%d/%Y %I:%M:%S %p")

# Just an additional cleaning step to remove extra spaces in Id column 
daily_activity_may$id <- trimws(daily_activity_may$id)
sleep_day_may$id <- trimws(sleep_day_may$id)

# Option One (No Merge): The section I moved to comments below is prior to utilizing the skim() function 
# daily_activity_may %>% 
#   select(totalsteps, # Average = 7638 steps
#          totaldistance, # Average = 5.49 (unsure if KM or Miles)
#          sedentaryminutes, # Average = 991.2 (16.52 hours)
#          calories) %>%  # Average = 2304 calories
#   summary()
# 
# sleep_day_may %>% 
#   select(totalminutesasleep, # Average = 419.2 minutes (~7 hours)
#          totaltimeinbed) %>% # Average = 458.5 minutes (~7.5 hours)
#   summary()
skim(daily_activity_may)
skim(sleep_day_may)

# Plot the data we want to visualize
ggplot(data=daily_activity_may,aes(x=total_steps, y=sedentary_minutes)) + 
  geom_point()

# Find correlation (if any)
cor(daily_activity_may$total_steps, daily_activity_may$sedentary_minutes) # -.327 - weak negative correlation


ggplot(data=daily_activity_may, aes(x=total_steps, y=calories)) + 
  geom_point() + 
  ggtitle("Total Steps vs. Calories") +
  xlab("Total Steps") +
  ylab("Calories")

cor(daily_activity_may$total_steps, daily_activity_may$calories) #.59 - moderate positive correlation




# Option Two (Merge): Merge/join tables
combined_activity_sleep_may <- left_join(sleep_day_may, daily_activity_may, by=c("id", "date"))

# Confirm the merge is how we want it prior to conducting analysis
View(combined_activity_sleep_may)

# Plot the data we want to visualize - in this case, total steps correlate with amount of time sleeping
ggplot(data=combined_activity_sleep_may,aes(x=total_steps,y=total_minutes_asleep)) +
  geom_point()

# Find correlation (if any)
cor(combined_activity_sleep_may$total_steps, combined_activity_sleep_may$total_minutes_asleep) # -.19 - very weak negative correlation

ggplot(daily_activity_may, aes(x=total_steps)) + 
  geom_histogram(binwidth=500, fill="steelblue", color="black", alpha=0.7) +  # Adjusted binwidth
  geom_vline(aes(xintercept=mean(total_steps)), color="red", linetype="dashed", linewidth=1) +  # Vertical line for mean (using linewidth)
  geom_density(aes(y = ..density..), fill="orange", alpha=0.2) +  # Density curve
  scale_x_continuous(labels = scales::comma) +  # Fix: specify scales::comma for formatting x-axis labels
  ggtitle("Distribution of Total Steps") +
  xlab("Total Steps") +
  ylab("# of Times Counted") +
  theme_minimal()  # Clean theme






# PART I: ACTIONS PRIOR TO R SCRIPT TEMPLATE: The following was my code when trying to load/clean/filter all of the data in the FitBit dataset i.e. 29 CSV files. 
# I didn't need to deal with all 29 files. This came to my attention when I discovered the bellabeat R script template via the Google
# course. I feel dumb now...
#
#
# # I am using the basic Posit account so I am limited to one GB of RAM and one CPU
# # Install necessary packages
# install.packages("readxl")
# install.packages("tidyverse")
# 
# # Load necessary packages
# library(readxl)
# library(tidyverse)
# 
# # Set file paths for April and May data
# fitbit_april_folder_path <- "/cloud/project/Fitbit_031216_to_041116/Fitabase_031216_to_041116"
# fitbit_may_folder_path <- "/cloud/project/Fitbit_041216_to_051216/Fitbit_041216_to_051216"
# 
# # List all CSV files in each folder
# fitbit_april_files <- list.files(path = fitbit_april_folder_path, pattern = "*.csv", full.names = TRUE)
# fitbit_may_files <- list.files(path = fitbit_may_folder_path, pattern = "*.csv", full.names = TRUE)
# 
# # Load a small batch of files at a time (e.g., batches of six files) - loading everything may crash your console
# fitbit_may_data_batch_one <- map(fitbit_may_files[1:6], read_csv)
# fitbit_may_data_batch_two <- map(fitbit_may_files[7:12], read_csv)
# fitbit_may_data_batch_three <- map(fitbit_may_files[13:18], read_csv)
# fitbit_april_data_batch_one <- map(fitbit_april_files[1:6], read_csv)
# fitbit_april_data_batch_two <- map(fitbit_april_files[7:11], read_csv)
# 
# # Use str() to view each batch of CSV files to determine common column names, ensure the data is the right type, etc.
# str(fitbit_may_data_batch_one) #for each file
# 
# # Function to clean data
# clean_data <- function(data) {
#   # Remove rows with missing data
#   data_clean <- data %>%
#     drop_na()
#   
#   return(data_clean)
# }
# 
# # Apply cleaning function to all batches of files. My program is crashing every time I try this so unsure if it's a computing power thing
# # or if something is wrong with my function/data.
# fitbit_may_data_batch_one_clean <- map(fitbit_may_data_batch_one, clean_data)
# fitbit_may_data_batch_two_clean <- map(fitbit_may_data_batch_two, clean_data)
# fitbit_may_data_batch_three_clean <- map(fitbit_may_data_batch_three, clean_data)
# fitbit_april_data_batch_one_clean <- map(fitbit_april_data_batch_one, clean_data)
# fitbit_april_data_batch_two_clean <- map(fitbit_april_data_batch_two, clean_data)