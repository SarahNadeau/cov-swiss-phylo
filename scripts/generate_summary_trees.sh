# This script is to generarte summary trees from  BEAST2 tree log files (*.trees) using TreeAnnotator (https://beast.community/treeannotator)

TREE_DIR=results_all/bdsky/summary_trees/SwissTransmissionChains/swiss_results_trees
for TREEFILE in $TREE_DIR/*.trees; do
    treeannotator $TREEFILE $TREEFILE.mcc_summary.tree
done

SUMMARY_DIR=results_all/bdsky/summary_trees/SwissTransmissionChains/results
mv $TREE_DIR/*.tree $SUMMARY_DIR