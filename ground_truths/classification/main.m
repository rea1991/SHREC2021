clc; clear; close all;

% This function takes as input the ground truth classification
% "ground2.txt", and a dissimilarity matrix. It computes several statistics
% from the corresponding confusion matrix: TPR, TNR, PPV, NPV, ACC, F1.
%
% When "coarse" is set to 0, it computes the statistics provided in Table
% 5(PDB-based community decomposition).
%
% Optionally aggregates some classes if "coarse" is set to 1:
% *) Table 6 (BLAST-based community decomposition of level 3) is obtained
% by using "macro_classes_0.95.txt".
% *) Table 7 (3-level BLAST classification) is obtained by using
% "macro_classes.txt".


% Coarser classification?
coarse = 0;

if coarse==1
    macro_classes = load("macro_classes_0.95.txt");
    %macro_classes = load("macro_classes.txt");
end



%% PREDICTED
[successi,classlabel]= valuta_classificazioneNN("ground2.txt","../../results/P1/geom/run1A.matrixPerm.txt");
%[successi,classlabel]= valuta_classificazioneNN("ground2.txt","../../results/P1/geomchem/run1B.matrixPerm.txt");
predicted = classlabel(:,2);

%% ACTUAL
actual = load("ground2.txt");
actual = actual(:,2);


if coarse==1
    for i=1:size(actual,1)
        actual(i) = macro_classes(actual(i),2);
        predicted(i) = macro_classes(predicted(i),2);
    end
end


card_classes = zeros(max(actual),1);
for i=1:length(card_classes)
   card_classes(i) = sum(actual==i); 
end


%% CONFUSION MATRIX AND ITS STATISTICS
confusion = my_confusion_matrix(predicted, actual);
TP = diag(confusion);
FN = zeros(size(TP));
FP = zeros(size(TP));
TN = zeros(size(TP));
for i=1:length(FN)
    FN(i) = sum(confusion(i,:))-TP(i);
    FP(i) = sum(confusion(:,i))-TP(i);
    TN(i) = sum(sum(confusion([1:i-1,i+1:end],[1:i-1,i+1:end])));
end

TPR = TP./(TP+FN); TPR(isnan(TPR))=0;
TNR = TN./(TN+FP); TNR(isnan(TNR))=0;
PPV = TP./(TP+FP); PPV(isnan(PPV))=0;
NPV = TN./(TN+FN); NPV(isnan(NPV))=0;
ACC = (TP+TN)./(TP+TN+FP+FN);
F1 = (2*TP)./(2*TP+FP+FN);


disp("Average TPR is: " + num2str(sum(card_classes.*TPR)/sum(card_classes)))
disp("Average TNR is: " + num2str(sum(card_classes.*TNR)/sum(card_classes)))
disp("Average PPV is: " + num2str(sum(card_classes.*PPV)/sum(card_classes)))
disp("Average NPV is: " + num2str(sum(card_classes.*NPV)/sum(card_classes)))
disp("Average ACC is: " + num2str(sum(card_classes.*ACC)/sum(card_classes)))
disp("Average F1  is: " + num2str(sum(card_classes.*F1)/sum(card_classes)))

disp("Latexitazion....");
disp(num2str(sum(card_classes.*TPR)/sum(card_classes)) + " & " + ...
    num2str(sum(card_classes.*TNR)/sum(card_classes)) + " & "  +...
    num2str(sum(card_classes.*PPV)/sum(card_classes)) + " & " + ...
    num2str(sum(card_classes.*NPV)/sum(card_classes)) + " & " + ...
    num2str(sum(card_classes.*ACC)/sum(card_classes)) + " & " + ...
    num2str(sum(card_classes.*F1)/sum(card_classes)) + " \\");
