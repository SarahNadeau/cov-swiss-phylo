# This script stores variables shared across all figures

chain_assumption_labs <- c("Smallest plausible chains", "Largest pluasible chains")
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
