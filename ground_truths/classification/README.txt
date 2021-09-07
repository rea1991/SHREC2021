
The function "main.m" computes the classification measures TPR, TNR, PPV, NPV, ACC and F1 for both tasks A (geometry) and B (geometry and physicochemical properties) and for both groundtruths. These measures are reported in Tables 5, 6 and 7.

*)To produce the results in Table 5, set the variable coarse to 0 AND uncomment
line 28 or 29;
*)To produce the results in Table 6, set the variable coarse to 1 and uncomment:
macro_classes = load("macro_classes_0.95.txt");
*)To produce the results in Table 7, set the variable coarse to 1 and uncomment:
macro_classes = load("macro_classes.txt");