clc; clear; close all;

%% MAIN FUNCTION TO COMPUTE NCG, NDCG, AND ADR

% Participant (integer from 1 to 5)
for P=1:5
    
    % Task type (set to "geom" or "geomchem")
    task = "geom";
    
    % Run number (set to 1, 2, or 3; note that P5 has only one run for
    % geomchem)
    run = 1;
    
    % Ground truth (either "GT2" or "GT3").
    ground_truth = "GT2";
    
    if task =="geom"
        [NCG,NDCG,ADR]=mean_ADR_DCG("../../results/P" + ...
            num2str(P) + "/" + task + "/run" + num2str(run) + "A.matrixPerm.txt", ...
            './multiclass_matrix_solution_' + ground_truth + '.txt');
    else
        [NCG,NDCG,ADR]=mean_ADR_DCG("../../results/P" + ...
            num2str(P) + "/" + task + "/run" + num2str(run) + "B.matrixPerm.txt", ...
            './multiclass_matrix_solution_' + ground_truth + '.txt');
    end
    
    writematrix(NDCG,"./output/NDCG/NDCG_P" + num2str(P) +"_" + task + "_run" + num2str(run) + "_" + ground_truth + ".txt",'Delimiter', ' ');
    writematrix(NCG, "./output/NCG/NCG__P" + num2str(P) +"_" + task + "_run" + num2str(run) + "_" + ground_truth + ".txt",'Delimiter', ' ');
    
end