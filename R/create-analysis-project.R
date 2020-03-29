create_analysis_project <- function(path, ...) {


  # Create directory skeleton
  dir.create(path, recursive = TRUE, showWarnings = FALSE)
  dir.create(file.path(path, "R"))
  dir.create(file.path(path, "R/pipeline"))
  dir.create(file.path(path, "R/analysis"))
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
  cat("data/", file = file.path(path, ".gitignore"), append = TRUE)


  # Generate templated reports
  generate_report <- function(slug) {
    rmarkdown::draft(
      file.path(path, "report", paste0(slug, ".Rmd")),
      template = slug,
      package = "fsctemplates",
      edit = FALSE
    )
  }

  generate_report("01-data-cleaning")
  generate_report("02-characteristics")
  generate_report("03-outputs")
  generate_report("04-outcomes")
  generate_report("05-impacts")

  # Generate script files
  copy_script <- function(source_name, destination_path) {
    script_path <- system.file("extdata", source_name, package = "fsctemplates")
    file.copy(script_path, destination_path)
  }


  copy_script("README.Rmd", file.path(path, "README.Rmd"))
  copy_script("CONTROL.R", file.path(path, "R", "CONTROL.R"))
  copy_script("load-data.R", file.path(path, "R", "pipeline", "load-data.R"))
  copy_script("clean-data.R", file.path(path, "R", "pipeline",  "clean-data.R"))



}

