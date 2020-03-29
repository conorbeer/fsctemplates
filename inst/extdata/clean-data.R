#' Clean raw data to prepare it for analysis
#'
#' @description
#'
#' This function takes the output of load_data and
#' transforms it into the data that actually gets used in the
#' analysis.
#'
#' The contents of the function should reflect the decisions
#' described in the report 01-data-cleaning.Rmd
#'
#' General tasks should include:
#'
#' - final sample construction
#' - variable transformation
#' - variable selection
#'
#' @param dat_raw
#'
#' The list of raw datasets
#'
#' @param use_cache
#'
#' set this to TRUE to load cached output instead of
#' running the function.
#'
#' @return
#' @export
#'
#' @examples
clean_data <- function(dat_raw, use_cache = TRUE) {

  # If use_cache is TRUE and a cached file exists, load an return the cached data

  cache_path <- "data/cache/clean_data.rds"

  if(file.exists(cache_path) & use_cache) {
    res <- readRDS(cache_path)
    return(res)
  }

  # Write your code that uses the elements of dat_raw
  # to generate final clean analysis datasets here:

  res <- list(

  )

  # save output to cache_path
  saveRDS(res, cache_path)

  return(res)

}
