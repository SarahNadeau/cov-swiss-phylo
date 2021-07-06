#' This script is to clean run info copy-pasted from Euler emails.

OUTFILE <- "results_all/run_info.csv"
run_info <- read.csv(file = "results_all/run_info_euler_raw.csv")

run_info_clean <- run_info %>% 
  mutate(value = gsub(x = value, pattern = "\ *:\ *", replacement = ":")) %>%
  tidyr::separate(col = value, into = c("metric", "value"), sep = ":")
  
run_info_clean <- as.data.frame(apply(
  X = run_info_clean,
  MARGIN = 2, 
  FUN = trimws,
  whitespace = "[\\h\\v]")) %>%
  tidyr::separate(col = value, into = c("value", "unit"), sep = " ", fill = "right")

write.csv(x = run_info_clean, file = OUTFILE, row.names = F)
  
