clc; clear; close all;


% Task type (set to "geom" or "geomchem")
task = "geom"; 

% Ground truth (either "GT2" or "GT3").
ground_truth = "GT2";

if task=="geom"
    NDCG_P1 = load("./output/NDCG/NDCG_P1_geom_run3_" + ground_truth +".txt");
    NDCG_P2 = load("./output/NDCG/NDCG_P2_geom_run2_" + ground_truth +".txt");
    NDCG_P3 = load("./output/NDCG/NDCG_P3_geom_run2_" + ground_truth +".txt");
    NDCG_P4 = load("./output/NDCG/NDCG_P4_geom_run1_" + ground_truth +".txt");
    NDCG_P5 = load("./output/NDCG/NDCG_P5_geom_run3_" + ground_truth +".txt");    
elseif task=="geomchem"
    NDCG_P1 = load("./output/NDCG/NDCG_P1_geomchem_run1_" + ground_truth +".txt");
    NDCG_P2 = load("./output/NDCG/NDCG_P2_geomchem_run3_" + ground_truth +".txt");
    NDCG_P3 = load("./output/NDCG/NDCG_P3_geomchem_run2_" + ground_truth +".txt");
    NDCG_P4 = load("./output/NDCG/NDCG_P4_geomchem_run1_" + ground_truth +".txt");
    NDCG_P5 = load("./output/NDCG/NDCG_P5_geomchem_run1_" + ground_truth +".txt");
end

h = figure;
hold on;
plot(1:1543, NDCG_P1, 'LineWidth', 2);
plot(1:1543, NDCG_P2, 'LineWidth', 2);
plot(1:1543, NDCG_P3, 'LineWidth', 2);
plot(1:1543, NDCG_P4, 'LineWidth', 2);
plot(1:1543, NDCG_P5, 'LineWidth', 2);

if task=="geom"
    legend(["P1, run 3: JHC\_HAPT\_LDA", "P2, run 2: extractor\_e2e", "P3, run 2: HAPPS", "P4, run 1: GLoFe", "P5, run 3: Ensemble"], 'Location', "south");    
elseif task=="geomchem"
    legend(["P1, run 1: JHCA", "P2, run 3: extractor\_e2e\_eucl", "P3, run 2: HP4\_EDA", "P4, run 1: GLoFe", "P5, run 1: EdgeConv"], 'Location', "south");
end

xlabel("rank p");
ylabel("NDCG");
title ("Best run per participant", 'FontSize', 14);
grid on
axis equal
axis square
axis([0,1543,0.25,1]);
set(gcf,'Position',[100 100 250 250])
lgd.FontSize = 10;
set(gca,'fontsize',11)

saveas(h, "./output/NDCG plots/best_NDCG_" + task + "_" + ground_truth, "epsc");