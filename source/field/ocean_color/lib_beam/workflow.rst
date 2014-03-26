Workflow design
===============

The workflow contains three main processing steps: expression, binning and clustering plus an auxiliary processing step called arrange that arranges the outputs of the expression steps as the inputs for the binning processing step.

* Step 1: use the ESA BEAM Toolbox BandMaths operator to apply the arithmetic expression to all MERIS Level 1 products. This step is run with several tasks in parallel, each task dealing with one input product.
* Step 2: use an R executable script to arrange by temporal steps (in this case daily) the outputs of the previous step. This step runs as a single task.
* Step 3: use the ESA BEAM Toolbox Level 3 Binning processor to generated the daily binned products. This step is run with several tasks in parallel, each task dealing with one day of data.
* Step 4: use an R executable script to identity the algal bloom geographical areas using the DBSCAN algorithm
