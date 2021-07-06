#!/bin/bash

MAX_DATE=2020-12-31
WORKDIR=/Users/nadeaus/Repos/cov-swiss-phylogenetics/results_main
CURRENT_DIR=`pwd`
cd /Users/nadeaus/Repos/grapevine

Rscript generate_figures/generate_figures.R \
--maxdate $MAX_DATE \
--workdir $WORKDIR \
--maxsamplingfrac 0.05 \
--datestohighlight "2020-04-23 2020-06-25 2020-09-14 2020-09-28 2020-10-19 2020-11-02"

# Rscript analyze_clusters/get_bdsky_alignments.R \
# --maxdate 2020-11-30 \
# --workdir $WORKDIR

# Rscript analyze_clusters/get_date_to_week_for_bdsky.R \
# --outdir $WORKDIR/output/transmission_chain_alignments \
# --maxdate 2020-11-30

cd $CURRENT_DIR

