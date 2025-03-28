# SETUP ########################################################################
# > Packages ===================================================================
library(here)
library(tidyverse)

# GLOBAL VARIABLES #############################################################
api_vers <- "2.1"
base_url <- "https://npiregistry.cms.hhs.gov/api/"

# US STATES ####################################################################
# Source: https://npiregistry.cms.hhs.gov/help-api/state
states_path <- here("data/src/states.csv")
states <- 
  read.csv(states_path) %>% 
  rename(
    state_abb = State.Abbreviation,
    state_nm = State.Name
  )

# GET INPUT DATA ###############################################################
get_input_data <- function(path) {
  input <- read.csv(path) %>%
  return(input)
}