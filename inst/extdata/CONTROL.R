
# WHAT IS THIS FILE? ------------------------------------------------------

# This file sources and runs the scripts that load raw data, clean it for
# analysis, and then produce key analysis outputs


# LOAD PACKAGES -----------------------------------------------------------

pacman::p_load(
  "tidyverse"
)


# SOURCE SCRIPTS ----------------------------------------------------------

source("R/utils.R")
source("R/pipeline/load-data.R")
source("R/pipeline/clean-data.R")


# RUN PIPELINE ------------------------------------------------------------

dat_raw <- load_data(use_cache = FALSE)
dat_clean <- clean_data(dat_raw, use_cache = FALSE)


