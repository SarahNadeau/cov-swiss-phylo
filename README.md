This repository contains the code used to generate figures and values for the manuscript "Swiss public health measures associated with reduced SARS-CoV-2 transmission using genome data".

The raw results files upon which these scripts operate were produced by the phylogenetic analysis code at https://github.com/cevo-public/Grapevine-SARS-CoV-2-Introduction-Analysis and the phylodynamic analysis code at https://github.com/tgvaughan/TransmissionChainAnalyses. Several scripts expect the phylogenetic analysis code repository to be installed in a directory `grapevine`, e.g. [this plotting script](./scripts/plot_sampling_representativeness.Rmd). 

The actual SARS-CoV-2 genome sequence data upon which this work is based was retrieved from GISAID (accessed 31 May 2021). A full acknowledgements table of the originating and submitting laboratories, including the identifiers for all GISAID data used in this study, is available at `tables/gisaid_acknowledgments.csv`.
