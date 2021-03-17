#!/bin/bash

MAX_DATE=2020-12-31
WORKDIR=/Users/nadeaus/NonRepoProjects/cov-swiss-phylogenetics/grapevine/jan-dec_-01_max_sampling_-5_context-sf
CURRENT_DIR=`pwd`
cd /Users/nadeaus/Repos/grapevine

Rscript generate_figures/generate_figures.R \
--maxdate $MAX_DATE \
--workdir $WORKDIR

# Rscript analyze_clusters/get_bdsky_alignments.R \
# --maxdate 2020-11-30 \
# --workdir $WORKDIR

cd $CURRENT_DIR

