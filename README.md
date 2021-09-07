# SHREC 2021: Retrieval and classification of protein surfaces equipped with physical and chemical properties

This repository is meant to make the benchmark introduced in [1] freely-accessible. For a complete description of both the benchmark and the methods that were tested on it, the reader is referred to [1].

### The dataset
A dataset of approximately 5,000 protein surfaces and corresponding physicochemical properties is provided. The dataset is already split into a training set (`dataset/training_set`) and a test set (`dataset/test_set`),  in the proportion 70%-30%. Each model is represented by an OFF file (i.e., a triangle mesh) and a TXT file: 
- Each row of the TXT file corresponds to a vertex of the triangulation in the corresponding OFF file (in the same order).
- Each column in the TXT file corresponds to a physicochemical property evaluated at the verteces in the OFF file. 

### The ground truths
The benchmark comes with three ground truths:
- The *PDB-based classification*, whose classification files are `ground_truths/classTraining.cla` for the training set and `ground_truths/classTest.cla` for the test set.
- The *BLAST-based decomposition of level 3*, whose classification vector for the test set is found in `ground_truths/macro_classes_0.95.txt`.
- The *BLAST-based community decomposition of level 2*, whose classification vector for the test set is found in `ground_truths/macro_classes.txt`.

### Dissimilarity matrices from the SHREC participants and evaluation measures
Five research groups registered to the track. The submitted dissimilarity matrices can be found inside the five folders in `results`. The codes that were used to compute the evaluation measures are found in the three folders inside  `ground_truths`. To compare the performance of the methods that make use of the physicochemical properties against the simple geometric models, we asked the participants to perform two tasks:
- Task A: only the OFF files of the models are considered (i.e. only the geometry is considered);
- Task B: in addition to the geometry, the participant is asked to also consider the TXT files (physic- ochemical matching).


### Video presentation
The presentation of the benchmark at the 3DOR 2021 workshop is available at:
https://www.youtube.com/watch?v=PrqMuoewyYk


### References
[1]   A. Raffo, U. Fugacci, S. Biasotti, W. Rocchia, Y. Liu, E. Otu, R. Zwiggelaar, D. Hunter, E. I. Zacharaki, E. Psatha, D. Laskos, G. Arvanitis, K. Moustakas, T. Aderinwale, C. Christoffer, W.-H. Shin, D. Kihara, A. Giachetti, H.-N. Nguyen, T.-D. Nguyen, V.-T. Nguyen-Truong, D. Le-Thanh, H.-D. Nguyen, M.-T. Tran. "SHREC 2021: Retrieval and classification of protein surfaces equipped with physical and chemical properties", *Computers & Graphics*, vol. 99, pp. 1-21, 2021. DOI: 10.1016/j.cag.2021.06.010.
