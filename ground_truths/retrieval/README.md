
STEP 1
First, use the MATLAB code as follows:
permuteMatrix("../../results/P1/geom/run1A.matrix","./permutation.txt")
where: 
*) P1,...,P5 are the five participants to the track.
*) "geom" and "geomchem" identify, respectively, the folders containing the dissimilarity matrices when only geometry or geometry+physicochemistry is considered.
The function permuteMatrix permutes the input dissimilarity matrix according to the file "permutation.txt", which is based on the ground truth.

STEP 2
Then, use the MATLAB code as follows:
[successi,classlabel]=valuta_classificazioneNN('ground2.txt','../../results/P1/geom/run1A.matrixPerm.txt')
The function saves the TXT file "classlabel.txt", which will be used in the next and final step.

STEP 3a (Table 3: NN, 1T, 2T, eM and DCG)
To compute the retrieval measures NN, 1T, 2T, eM and DCG, you need to use the routine psbTable.exe. A precompiled version, available for Ubuntu 18.04, is provided. As an alternative, one could compile the source code (see the folder "source_code"). To run the precompiled, use the command:
./psbTable.exe ../classTest.cla ../../results/P1/geom/run1A.matrixPerm.txt

STEP 3b (Figures 11, 12 and 19: PRECISION RECALLS)
To compute the precision recall, you need to use the routine prerec.exe. A precompiled version, available is provided. To run the precompiled on Ubuntu 18.04, use the command:
wine prerec.exe lista-protein.txt lista-protein.txt ../../results/P1/geom/run1A.matrixPerm.txt ./output/prerec/output.txt 20
One can use the MATLAB routines "plotPrerec_geom.m", "plotPrerec_geomchem.m", "plotBestPrerec_geom.m" and plotBestPrerec_geomchem.m to plot the precision recalls. The mAP coefficients of Table 3 are obtained via the MATLAB routine "mainMAP.m".

STEP 3c (Tables 4 and 8: ADRs)
Run the MATLAB routine "main_mean_ADR_DCG.m", after setting the variables "task" (to either "geom" or "geomchem"), "run" (1, 2, or 3) and "ground_truth" ("GT2" or "GT3). Note that P5 has only one run when "geomchem" is selected. By selecting "GT2", one gets the numbers in Table 4; by selecting "GT3", one gets the numbers in Table 8.

STEP 3d (Figures 12 and 19: NDCGs)
Run the MATLAB routine "plotNDCG.m", after setting the variables "task" (to either "geom" or "geomchem"), "P" (1, 2, 3, 4 or 5) and "ground_truth" ("GT2" or "GT3). Note that P5 has only one run when "geomchem" is selected. By selecting "GT2", one gets the images in Figure 12; by selecting "GT3", one gets the images in Figure 19. The best run per participants are obtained by setting, in a similar fashion, the parameters of the MATLAB routine plotBestNDCG.m".