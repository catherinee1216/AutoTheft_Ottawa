#### Preamble ####
# Purpose: Downloads and saves the data 
# Author: Catherine Punnoose
# Date: 03 April 2024
# Contact: catherine.punnoose@mail.utoronto.ca
# License: MIT
# Pre-requisites: Auto_Theft_ottawa_Data.csv 


#### Workspace setup ####
library(tidyverse)

#### Download data ####

# code from CHAT GPT
# Set the file path to your CSV file

# Read the CSV file
auto_theft_data <- read.csv("data/analysis_data/Auto_Theft_Ottawa_Data.csv")

#### Save data ####
# saving original dataset in raw_data
write.csv(auto_theft_data, "data/raw_data/Auto_Theft_Ottawa_Data.csv") 

         
