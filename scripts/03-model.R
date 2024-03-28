#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(arrow)
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- read_parquet("data/analysis_data/Auto_Theft_Ottawa_Data.csv")

### Model data ####
first_model <-
  stan_glm(
    formula = flying_time ~ length + width, #sub with my own variables
    data = analysis_data,
    family = gaussian(),# spec for building a model
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )


#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)


