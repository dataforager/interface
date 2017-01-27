To fit the JAGS models, you’ll first need to install the custom version of JAGS (JAGS-3.4.0-DiagMatrix.tgz) included here.

For installation instructions, please refer to the JAGS-3.4.0 user manual.

The full hierarchical model specification is given in the file named “singlecell-full5-lognorm-corrorigins-cellbetas.bug” in the “JAGS files” folder.

To fit the hierarchical model to each dataset (without adjusting for cell age), you’ll need to modify the file “script.txt” in the “JAGS files” folder.

You’ll need to make sure that the following lines are modified according to the dataset (XXX) you want to fit:
1) line 2 - e.g. data in “XXX-data-042815-noNAs.txt"
2) line 4 - e.g. parameters in “XXX-initial-042815-noNAs.txt"
3) line 20 - e.g. coda *, stem("CODA-XXX-042815-CorrOrigins—CellBetas-MainParams-")

The last line (line 20) specifies the name of the output file that will contain the MCMC samples.

Once script.txt is modified to your liking, run the following from the command line: “jags script.txt”

To fit the hierarchical model with adjustment for the two types of cell age, you’ll follow the same procedure using analogous files from the “Cell Age Analysis” subdirectory.


