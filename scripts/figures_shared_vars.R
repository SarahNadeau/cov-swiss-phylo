# This script stores variables shared across all figures

chain_assumption_labs <- c("Many introductions", "Few introductions")  # use like: labeller = labeller(chains_assumption = chain_assumption_labs)
names(chain_assumption_labs) <- c("max", "min")
shared_theme <- theme_bw()
last_sample_to_extinction_delay <- 14  # days
single_col_width <- 11.4  # cm
double_col_width <- 17.8  # cm
n_chains_to_plot <- 10  # fig 1
wave_break <- as.Date("2020-05-01")  # fig 1
wave_breaks <- wave_break  # table 1
facet_nospace_theme_elements <- theme(
  axis.text.y = element_blank(),
  axis.ticks.y = element_blank(),
  panel.border = element_blank(), 
  panel.background = element_blank(), 
  panel.grid.major.y = element_blank(),
  panel.grid.minor.y = element_blank(),
  # panel.grid = element_blank(), 
  panel.spacing.x = unit(0,"line"),
  strip.text.y = element_blank(),
  legend.position = c(0.07, 0.45),
  legend.background = element_rect(fill = "transparent"),
  panel.spacing = unit(0, "lines"))
border_closure_end <- as.Date("2020-06-15")
border_closure_start <- as.Date("2020-03-25")
ct_factor_x_lab <- "Tranmission rate decrease (%)"
ct_factor_y_lab <- "Posterior support"
chains_assumption_legend_name <- "Polytomy assumption"
chains_assumption_colors <- RColorBrewer::brewer.pal(n = 3, name = "Dark2")[1:2]
model_type_colors <- RColorBrewer::brewer.pal(n = 8, name = "Dark2")[4:5]
spring_col <- RColorBrewer::brewer.pal(n = 8, name = "GnBu")[[3]]
summer_col <- RColorBrewer::brewer.pal(n = 8, name = "OrRd")[[3]]
fall_col <- RColorBrewer::brewer.pal(n = 8, name = "PuBu")[[3]]