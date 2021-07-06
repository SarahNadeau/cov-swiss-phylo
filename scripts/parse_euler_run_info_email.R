#' This script is to clean run info copy-pasted from Euler emails.

OUTFILE <- "results_all/run_info.csv"
run_info <- read.csv(file = "~/Downloads/run_info.csv")

run_info_clean <- as.data.frame(apply(
  X = run_info,
  MARGIN = 2, 
  FUN = trimws,
  whitespace = "[\\h\\v]")) %>%
  tidyr::separate(col = value, into = c("value", "unit"), sep = " ", fill = "right")

write.csv(x = run_info_clean, file = OUTFILE, row.names = F)
  
