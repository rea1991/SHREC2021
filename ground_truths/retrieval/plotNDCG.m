clc; clear; close all;

% Participant (integer from 1 to 5)
P = 1;

% Task type (set to "geom" or "geomchem")
task = "geom"; 

% Ground truth (either "GT2" or "GT3").
ground_truth = "GT2";


NDCG_run1 = load("./output/NDCG/NDCG_P" + num2str(P) + "_" + task + "_run1_" + ground_truth + ".txt");

if task=="geom" || P<5  %One participant has only a geomchem run
    NDCG_run2 = load("./output/NDCG/NDCG_P" + num2str(P) + "_" + task + "_run2_" + ground_truth + ".txt");
    NDCG_run3 = load("./output/NDCG/NDCG_P" + num2str(P) + "_" + task + "_run3_" + ground_truth + ".txt");
end

h = figure;
hold on;
plot(1:1543, NDCG_run1, 'LineWidth', 2);
if task=="geom" || P<5 %One participant has only a geomchem run
    plot(1:1543, NDCG_run2, 'LineWidth', 2);
    plot(1:1543, NDCG_run3, 'LineWidth', 2);
end

switch P
    
    %First participant:
    case 1
        if task=="geom"
            legend(["run 1: JHC", "run 2: JHC\_HAPT", "run 3: JHC\_HAPT\_LDA"], 'Location', "south");
        elseif task=="geomchem"
            legend(["run 1: JHCA", "run 2: JHCA\_HAPT", "run 3: JHCA\_HAPT\_LDA"], 'Location', "south");
        end
        
    %Second participant:
    case 2
        if task=="geom"
            legend(["run 1: extractor", "run 2: extractor\_e2e", "run 3: extractor\_eucl"], 'Location', "south");
        elseif task=="geomchem"
            legend(["run 1: extractor", "run 2: extractor\_e2e", "run 3: extractor\_e2e\_eucl"], 'Location', "south");
        end
        
    %Third participant:
    case 3
        if task=="geom"
            legend(["run 1: HAPPS", "run 2: HAPPS", "run 3: HAPPS"], 'Location', "south");
        elseif task=="geomchem"
            legend(["run 1: HP4\_EDA", "run 2: HP4\_EDA", "run 3: HP4\_EDA"], 'Location', "south");;
        end
    
    %Fourth participant:
    case 4
        if task=="geom"
            legend(["run 1: GLoFe", "run 2: GLoFe", "run 3: GLoFe"], 'Location', "south");
        elseif task=="geomchem"
            legend(["run 1: GLoFe", "run 2: GLoFe", "run 3: GLoFe"], 'Location', "south");
        end
    
    %Fifth participant:
    case 5
        if task=="geom"
            legend(["run 1: EdgeConv", "run 2: PointNet", "run 3: Ensemble"], 'Location', "south");
        elseif task=="geomchem"
            legend(["run 1: EdgeConv"], 'Location', "south");
        end
        
    otherwise
        disp("Participant out of range...");     
        
end


xlabel("rank p");
ylabel("NDCG");
title ("P" + num2str(P), 'FontSize', 14);
grid on
axis equal
axis square
axis([0,1543,0.5,1]);
set(gcf,'Position',[100 100 250 250])
lgd.FontSize = 10;
set(gca,'fontsize',11)
saveas(h, "./output/NDCG plots/NDCG_P" + num2str(P) + "_" + task  + "_" + ground_truth, "epsc");