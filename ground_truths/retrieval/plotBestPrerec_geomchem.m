clc; clear; close all;

p1 = load("./output/prerec/P1_geomchem_run2.txt");
p2 = load("./output/prerec/P2_geomchem_run2.txt");
p3 = load("./output/prerec/P3_geomchem_run1.txt");
p4 = load("./output/prerec/P4_geomchem_run1.txt");
p5 = load("./output/prerec/P5_geomchem_run1.txt");

p1 = [0, 1; p1];
p2 = [0, 1; p2];
p3 = [0, 1; p3];
p4 = [0, 1; p4];
p5 = [0, 1; p5];

figure;
hold on;
plot(p1(:,1),p1(:,2), 'LineWidth', 2);
plot(p2(:,1),p2(:,2), 'LineWidth', 2);
plot(p3(:,1),p3(:,2), 'LineWidth', 2);
plot(p4(:,1),p4(:,2), 'LineWidth', 2);
plot(p5(:,1),p5(:,2), 'LineWidth', 2);

lgd = legend(["P1, run 2: JHCA\_HAPT", "P2, run 2: extractor\_e2e", "P3, run 1: HP4\_EDA", "P4, run 1: GLoFe", "P5, run 1: EdgeConv"], 'Location', "southwest");
title ("Best method per participant", 'FontSize', 14);



xlabel("Precision");
ylabel("Recall");
grid on
axis equal
axis square
axis([0, 1, 0, 1]);
set(gcf,'Position',[100 100 250 250])
lgd.FontSize = 10;
set(gca,'fontsize',11)