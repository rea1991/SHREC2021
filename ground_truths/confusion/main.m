clc; clear; close all;

% Coarser classification?
coarse = 0;

if coarse==1
    macro_classes_path = "macro_classes_0.95.txt";
    %macro_classes_path = "macro_classes.txt";
    macro_classes = load(macro_classes_path);
end


for P=1:5
close all;

run = "run1A";
charized_run = char(run);
task= "geom"; %geom or geomchem

dissMat_Participant = "../../results/P" + ...
num2str(P) +"/"+ task + "/" + run + ".matrixPerm.txt";

actual = load("ground2.txt");
actual = actual(:,2);
[successi,classlabel]=valuta_classificazioneNN('ground2.txt', dissMat_Participant);
predicted = classlabel(:,2);

if coarse==1
    for i=1:size(actual,1)
        actual(i) = macro_classes(actual(i),2);
        predicted(i) = macro_classes(predicted(i),2);
    end
end



confusion = my_confusion_matrix(predicted, actual);
%set(gcf,'Position',[100 100 250 250])
% imagesc(confusion)
% %colormap("colorcube")
% winter2 = jet(128);
% winter2(end,:) = [1 1 1];
% colormap(flipud(winter2))
% colorbar


%% NON-LINEAR  HSVCOLORMAP
cMap = jet(128);
dataMax = 1543;
dataMin = 0;
centerPoint = 1;
scalingIntensity = 10;

x = 1:length(cMap);
x = x - (centerPoint-dataMin)*length(x)/(dataMax-dataMin);
x = scalingIntensity * x/max(abs(x));
x = sign(x).* exp(abs(x));
x = x - min(x); x = x*511/max(x)+1;
newMap = interp1(x, cMap, 1:512);
%newMap(1,:) = [1 1 1];


h = figure; 
imagesc(confusion); colormap(newMap);
%colorbar
set(gcf,'Position',[100 100 250 250])
axis square
caxis([0 160]) 
title ("P" + num2str(P) + ", run " + charized_run(4))

if coarse
    if contains(macro_classes_path, '95')
        saveas(h, "./output/GT2_conf_mat_P" + num2str(P) + "_"+ task + "_" + run, "epsc");
    else
        saveas(h, "./output/GT3_conf_mat_P" + num2str(P) + "_"+ task + "_" + run, "epsc");
    end
else
    saveas(h, "./output/GT1_conf_mat_P" + num2str(P) + "_"+ task + "_" + run, "epsc");
end
end
