clc; clear; close all;

% Participant (integer from 1 to 5)
P = 1;

% Task type (set to "geom" or "geomchem")
task = "geom";

% Run number (set to 1, 2, or 3; note that P5 has only one run for
% geomchem)
run = 1;

data = load("./output/prerec/P" + num2str(P) + "_"+ task + "_run" + ...
    num2str(run) + ".txt");
data = [0, 1; data];

Q = trapz(data(:,1), data(:,2));
disp(Q)