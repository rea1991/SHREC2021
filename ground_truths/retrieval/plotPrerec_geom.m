clc; clear; close all;

% Participant (integer from 1 to 5)
p = 5;

run1 = load("./output/prerec/P" + num2str(p) +"_geom_run1.txt");
run2 = load("./output/prerec/P" + num2str(p) +"_geom_run2.txt");
run3 = load("./output/prerec/P" + num2str(p) +"_geom_run3.txt");

run1 = [0, 1; run1];
run2 = [0, 1; run2];
run3 = [0, 1; run3];

figure;
hold on;
plot(run1(:,1),run1(:,2), 'LineWidth', 2);
plot(run2(:,1),run2(:,2), 'LineWidth', 2);
plot(run3(:,1),run3(:,2), 'LineWidth', 2);

switch p
    case 1
        lgd = legend(["run 1: JHC", "run 2: JHC\_HAPT", "run 3: JHC\_HAPT\_LDA"], 'Location', "southwest");
        title ("P" + num2str(p) + ": Joint histograms ", 'FontSize', 14);
    case 2
        lgd = legend(["run 1: extractor", "run 2: extractor\_e2e", "run 3: extractor\_eucl"], 'Location', "southwest");
        title ("P" + num2str(p) + ": 3DZD ", 'FontSize', 14);
    case 3
        lgd = legend(["run 1: HAPPS", "run 2: HAPPS", "run 3: HAPPS"], 'Location', "southwest");
        title ("P" + num2str(p) + ": HAPPS ", 'FontSize', 14);
    case 4
        lgd = legend(["run 1: GLoFe", "run 2: GLoFe", "run 3: GLoFe"], 'Location', "southwest");
        title ("P" + num2str(p) + ": GLoFe ", 'FontSize', 14);
    case 5
        lgd = legend(["run 1: EdgeConv", "run 2: PointNet", "run 3: Ensemble"], 'Location', "southwest");
        title ("P" + num2str(p-1) + ": GraphLearning", 'FontSize', 14);
end


xlabel("Precision");
ylabel("Recall");
grid on
axis equal
axis square
axis([0, 1, 0, 1]);
set(gcf,'Position',[100 100 250 250])
lgd.FontSize = 10;
set(gca,'fontsize',11)