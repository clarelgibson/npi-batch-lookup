# SETUP ########################################################################
# > Packages ===================================================================
library(here)

# > Scripts ====================================================================
source(here("R/01-utils.R"))

# READ INPUT DATA ##############################################################
input_path <- here("data/src/sample01.csv")
input_src <- get_input_data(input_path)

# PREP INPUT DATA ##############################################################
input_cln <- 
  input_src %>% 
  # state names to upper case for easy joining
  mutate(
    state = toupper(state)
  ) %>% 
  # join state to state lookup table to get abbreviation
  left_join(
    states,
    by = join_by(state == state_nm)
  ) %>% 
  mutate(
    state = case_when(
      state %in% states$state_abb ~ state,
      state_abb %in% states$state_abb ~ state_abb,
      TRUE ~ "ERR"
    )
  ) %>% 
  select(-state_abb) %>% 
  # prep first and last name columns for API query
  mutate(
    first = str_replace_all(first, "[[:punct:]]", ""),
    first = str_replace_all(first, " ", "%20"),
    last = str_replace_all(last, "[[:punct:]]", ""),
    last = str_replace_all(last, " ", "%20")
  )