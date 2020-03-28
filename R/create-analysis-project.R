create_analysis_project <- function(path, ...) {


  # Create directory skeleton
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  dir.create(file.path(path,"R"))
  dir.create(file.path(path, "data"))
  dir.create(file.path(path, "data/cache"))
  dir.create(file.path(path, "data/clean"))
  dir.create(file.path(path, "data/raw"))
  dir.create(file.path(path, "report"))
  dir.create(file.path(path, "reference"))
  dir.create(file.path(path, "output"))
  dir.create(file.path(path, "output/fig"))
  dir.create(file.path(path, "output/tab"))

  # Create basic files
  cat("\ndata", file = file.path(path, ".gitignore"), append = TRUE)
  file.create(file.path(path, "README.md"))

  # Generate templated reports
  generate_report <- function(slug) {
    rmarkdown::draft(
      file.path(path, "report", paste0(slug, ".Rmd")),
      template = slug,
      package = "fsctemplates"
    )
  }

  generate_report("01-data-cleaning")
  generate_report("02-characteristics")
  generate_report("03-outputs")
  generate_report("03-outcomes")
  generate_report("04-impacts")



}

