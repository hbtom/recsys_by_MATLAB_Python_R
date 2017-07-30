% This is a script to run the tree_classifier_gridSearch and
% knn_classifier_gridSearch functions in MATLAB with automatic built-in hyper-parameter
% search option.
%
% Yashar Deldjoo
% July 24, 2017

clear
clc
close all
rng(1234);


load('clf_data_test.mat');

% Generate Inputs 
         y = randi([0 1],14073,1);
inputTable = array2table([testIVs' y]);

printFlag = 0 ;
validationMetrics1 = tree_classifier_gridSearch(inputTable,[],[],printFlag)      ;
validationMetrics2 = knn_classifier_gridSearch(inputTable,[],[],printFlag)       ;

