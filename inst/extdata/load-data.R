#' Load data function skeleton
#'
#' @description
#'
#' Use this function to load all the raw data sources that will be processed
#' and then analyzed for the project.
#'
#' Generally, we will want to leave the raw data more-or-less unchanged from
#' it's source state. However, there are some light-touch pieces of manipulation
#' that are appropriate.
#'
#' These should be strictly limited to:
#'
#' - renaming columns such that they are in standard snake_case, and such that they
#' meaningfully describe their contents
#' - dropping columns that are certainly unnecessary for analysis
#' - dropping participants who revoked their consent to participate in the evaluation
#'
#' @param use_cache
#'
#' @return
#' @export
#'
#' @examples
load_data <- function(use_cache = TRUE) {

  # Load cached data if use_cache is TRUE and the cached data exists

  cache_path <- "data/cache/load_data.rds"

  if(file.exists(cache_path) & use_cache) {
    res <- readRDS(cache_path)
    return(res)
  }

  # Write the code that loads your data here
  # Typical raw data sets will include:
  # - contact, enrollment, and program component records from Salesforce
  # - administrative data from program partners
  # - qualtrics surveys with identifiers that link to salesforce

  # Return a list of all raw(ish) datasets
  res <- list(
    # create list items with the syntax <name> = <dataset>, ...
  )

  # Save raw data list to the cache_path

  saveRDS(res, cache_path)

  return(res)


}
