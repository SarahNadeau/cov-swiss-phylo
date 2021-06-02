# Title     : Export config variables for manuscript
# Objective : Export .tex file defining variables used for main analysis
# Created by: nadeaus
# Created on: 02.06.21

# Write out run configuration parameters
CONFIG <- "results_main/input/grapevine_config.yaml"
config <- yaml::read_yaml(file = CONFIG)

#' Get character string for latex variable assignement.
#' @param varname Like max_date. Underscores will be removed.
#' @param value Like '2020-12-31'. Underscores will be escaped.
#' @return Caracter string, e.g. '\newcommand\maxdate{31. Dec. 2020}'.
get_latex_command <- function(varname, value, date_format = "%d. %b. %Y") {
  value <- tryCatch(
    {
    date <- format(as.Date(value, format = "%Y-%m-%d", optional = F), date_format)
    if (!is.na(date)) {
      as.character(date)
    } else {
      stop(e)
    }},
    error = function(e) {
      tryCatch(
        as.character(value),
        error = function(e) {
          stop(paste("Couldn't coerce value", value, "into a character."))
        }
      )
    }
  )
  if (is.character(value)) {
    value <- gsub(value, pattern = "\\_", replacement = "\\\\_")
  }
  varname <- gsub(varname, pattern = "_", replacement = "")
  command <- paste0("\\newcommand\\", varname, "{", value, "}")
  return(command)
}



con <- file("manuscript/config_variables.tex", open = "w")
variable_names <- names(config)
for (i in 1:length(config)) {
  writeLines(
    text = get_latex_command(varname = variable_names[i], value = config[[i]]),
    con = con
  )
}
close(con)


