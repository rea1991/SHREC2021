# SHREC 2021 track: Retrieval and classification of protein surfaces equipped with physical and chemical properties


### On the dataset
A dataset of approximately 5,000 protein surfaces and corresponding physicochemical properties is provided. The dataset is already split into a training set (`dataset/training_set`) and a test set (`dataset/test_set`),  in the proportion 70%-30%. Each model is represented by an OFF file (i.e., a triangle mesh) and a TXT file: 
- Each row of the TXT file corresponds to a vertex of the triangulation in the corresponding OFF file (in the same order).
- Each column in the TXT file corresponds to a physicochemical property evaluated at the verteces in the OFF file. 
For a description of the dataset, the reader is referred to [1] (Section 3.1).

### Ground truths
The benchmark comes with three ground truths:
- The *PDB-based classification*, whose classification files are `ground_truths/classTraining.cla` for the training set and `ground_truths/classTest.cla` for the test set.
- The *BLAST-based decomposition of level 3*, whose classification vector for the test set is found in `ground_truths/macro_classes_0.95.txt`.
- The *BLAST-based community decomposition of level 2*, whose classification vector for the test set is found in `ground_truths/macro_classes.txt`.
For a description of the ground truths, the reader is referred to [1] (Section 3.2).


### Video presentation
The presentation of the benchmark at the 3DOR 2021 workshop is available at:
https://www.youtube.com/watch?v=PrqMuoewyYk


### References
[1]   A. Raffo, U. Fugacci, S. Biasotti, W. Rocchia, Y. Liu, E. Otu, R. Zwiggelaar, D. Hunter, E. I. Zacharaki, E. Psatha, D. Laskos, G. Arvanitis, K. Moustakas, T. Aderinwale, C. Christoffer, W.-H. Shin, D. Kihara, A. Giachetti, H.-N. Nguyen, T.-D. Nguyen, V.-T. Nguyen-Truong, D. Le-Thanh, H.-D. Nguyen, M.-T. Tran. ``SHREC 2021: Retrieval and classification of protein surfaces equipped with physical and chemical properties´´, *Computers & Graphics*, vol. 99, pp. 1-21, 2021.
