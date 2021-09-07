## Postprocessing tree files

library(tidyverse)
library(lubridate)
library(ggtree)
library(treeio)

setwd("results_all/bdsky/summary_trees/NZTransmissionChains")
system(command = "mkdir -p figures/trees")

# Get node age uncertainty
numeric_date_range_to_date <- function(range, mrsd) {
    date_max <- mrsd - (range[1] * 365)
    date_min <- mrsd - (range[2] * 365)
    return(c(date_min, date_max))
}

trees <- list()
plots <- list()
for (chains in c("min","max")) {
    clusters <- read_tsv(paste0("sequences/",chains,"_chains.toLog.txt"), col_names=F)$X1
    for (sampUB in c("0.4", "1.0")) {
        for (ctEst in c(0, 1)) {

            trees <- list()
            rate_shifts <- list()
            plots <- list()
            for (cluster in clusters) {
                id=paste0("Introduction ", cluster)
                print(id)
                tree <- read.beast(paste0("results/Re_skyline.",
                                      chains,"_chains",
                                      ".sampUB", sampUB,
                                      ".", ctEst,
                                      ".c", cluster,
                                      ".summary.tree"))

                ## Get date of 2 days following the first sample, the last sample:
                sample_data <- tree %>% as_tibble() %>% filter(!is.na(label)) %>%
                    tidyr::separate(col = label, into = c("strain", "gisaid_epi_isl", "date", "cluster_idx"), remove = F, sep = "\\|")
                rate_shift <- min(as.Date(sample_data$date)) + 2
                rate_shifts[[id]] <- rate_shift
                latest_sample <- max(sample_data$date)
                
                ## Get 95% HPD ranges as dates
                node_data <- as.data.frame(treeio::get.data(tree)) %>% filter(!is.na(height_0.95_HPD))
                node_data$height_0.95_HPD_dates <- lapply(
                    X = node_data$height_0.95_HPD,
                    FUN = numeric_date_range_to_date,
                    mrsd = 0)
                
                tree_plot <- ggtree(tree, mrsd = latest_sample, as.Date = T) %<+% node_data +
                    scale_x_date(
                        date_labels = "%b.", 
                        limits = c(as.Date("2020-02-01"), as.Date("2020-12-15")),
                        date_breaks = "1 month") +
                    theme_tree2() + 
                    geom_range("height_0.95_HPD_dates", color='red', size=1, alpha=0.5) + 
                    geom_vline(xintercept=rate_shift, linetype = "dashed", alpha=0.5) + 
                    annotate(
                        "rect", xmin = as.Date("2020-02-01"), xmax = as.Date("2020-05-15"), 
                        ymin = 0, ymax = Inf, alpha = 0.1, fill = "yellow") +  # Early
                    annotate(
                        "rect", xmin = as.Date("2020-05-16"), xmax = as.Date("2020-12-15"), 
                        ymin = 0, ymax = Inf, alpha = 0.1, fill = "purple") +  # Late
                    ggtitle(id)
                
                plots[[id]] <- tree_plot
            }

            ## Order plots by date of rate shift
            ordering <- order(unlist(rate_shifts))
            plots_sorted <- plots[ordering]
            p <- gridExtra::grid.arrange(grobs = plots_sorted, ncol = 1, as.table = FALSE)

            ggsave(paste0("figures/trees/Re_skyline.",
                          chains,"_chains",
                          ".sampUB", sampUB,
                          ".ctEst", ctEst,
                          ".summary_trees.pdf"), p,
                   width=3.5, height=10, units="in")
        }
    }
}
