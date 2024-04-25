#### Preamble ####
# Purpose: Cleans the raw auto theft data collected by Ottawa Police
# Author: Catherine Punnoose
# Date: 24 April 2024
# Contact: catherine.punnoose@mail.utoronto.ca
# License: MIT

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
  select(vehicle_make, vehicle_model, vehicle_year, recovered, year, neighbourhood) |>
  mutate(theft_year = year) # changing year to theft_year for clarity


#### Save data ####
write_parquet(cleaned_data, "data/analysis_data/analysis_data.parquet")

