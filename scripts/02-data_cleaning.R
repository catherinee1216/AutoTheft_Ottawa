#### Preamble ####
# Purpose: Cleans the raw auto theft data collected by Ottawa Police
# Author: Catherine Punnoose
# Date: 28 March 2024
# Contact: catherine.punnoose@gmail.com
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(dplyr)
library(tidyr)
library(janitor)
library(tidyverse)
library(arrow)

#### Clean data ####
raw_data <- read.csv("data/raw_data/Auto_Theft_Ottawa_Data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(vehicle_make, vehicle_model, vehicle_year, vehicle_colour, 
         vehicle_value, occurred_date, reported_date, weekday, 
         recovered, year) |>
  mutate(theft_year = year) # changing year to theft_year for clarity


#### Save data ####
write_parquet(cleaned_data, "data/analysis_data/analysis_data.parquet")

