The codes in this folder allows to reproduce the retrieval measures provided in the paper.

### STEP 1 (PREPROCESSING)
Open MATLAB. In the command window, type:

``permuteMatrix("../../results/P1/geom/run1A.matrix","./permutation.txt")``

where: 
-  P1,...,P5 are the five participants to the track.
-  "geom" and "geomchem" identify, respectively, the folders containing the dissimilarity matrices for Tasks A (only geometry) and B (geometry and physicochemical properties).
The function ``permuteMatrix`` permutes the input dissimilarity matrix according to the file ``permutation.txt``, which is precomputed by the ground truth files.

### STEP 2
In the command window, type:

``[successi,classlabel]=valuta_classificazioneNN('ground2.txt','../../results/P1/geom/run1A.matrixPerm.txt')``

The function ``valuta_classificazioneNN`` saves the TXT file ``classlabel.txt``.

### STEP 3 (Table 3: NN, 1T, 2T, eM and DCG)
To compute the retrieval measures NN, 1T, 2T, eM and DCG, one needs to use the routine ``psbTable.exe``. A precompiled version, available for Ubuntu 18.04, is provided. As an alternative, one could compile the source code (see the folder ``source_code``). To run the precompiled, type in the terminal the command:

``./psbTable.exe ../classTest.cla ../../results/P1/geom/run1A.matrixPerm.txt``

### STEP 4 (Figures 11, 12 and 19: precision recalls; Table 3: mAP)
To compute the precision recalls, one needs to use the routine ``prerec.exe``. A precompiled version is provided. To run it on Ubuntu 18.04, use the command:

``wine prerec.exe lista-protein.txt lista-protein.txt ../../results/P1/geom/run1A.matrixPerm.txt ./output/prerec/output.txt 20``

One can use the MATLAB routines ``plotPrerec_geom.m``, ``plotPrerec_geomchem.m``, ``plotBestPrerec_geom.`` and ``plotBestPrerec_geomchem.m`` to plot the precision recalls. The mAP coefficients of Table 3 are obtained via the MATLAB routine ``mainMAP.m``.

### STEP 5 (Tables 4 and 8: ADRs; Figures 12 and 19: NDCGs)
- First, run the MATLAB routine ``main_mean_ADR_DCG.m``: it allows to get the numbers contained in Tables 4 and 8, as well as some quantities that are used to plot the NDCGs..
- Then, run the MATLAB routine ``plotNDCG.m``: it allows to reproduce all but one images in Figures 12 and 19 (the best run per participants are obtained by the MATLAB routine ``plotBestNDCG.m``).
