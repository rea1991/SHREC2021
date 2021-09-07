# SHREC 2021 track: Retrieval and classification of protein surfaces equipped with physical and chemical properties


A dataset of approximately 5,000 protein surfaces and corresponding physicochemical properties is provided. The dataset is already split into a training set (`dataset/training_set`) and a test set (`dataset/test_set`),  in the proportion 70%-30%. Each model is represented by an OFF file (i.e., a triangle mesh) and a TXT file: 
- Each row of the TXT file corresponds to a vertex of the triangulation in the corresponding OFF file (in the same order).
- Each column in the TXT file corresponds to a physicochemical property evaluated at the verteces in the OFF file. 

The presentation of the benchmark at the 3DOR 2021 workshop is available at:
https://www.youtube.com/watch?v=PrqMuoewyYk
