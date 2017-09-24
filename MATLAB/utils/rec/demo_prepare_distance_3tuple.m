% This is the script for running the function 'prepare_distance_3tuple.m' 
% which prepares a distance array [item_i,item_j,sim_score] for an input
% item-content table.
% Inputs:
%        feature_table : the input feature table  [n_i*nf+1]
%             sim_type : similarity type
%            col1_name : the title of column 1 (containing ids)
% Outputs:
%             simArray : the output similarity array [n_i*3]  

%
% Yashar Deldjoo
% Sep 23, 2017 
% Politecnico di Milano, Italy
% Johannes Kepler University Linz, Austria


clear
clc
close all

load ICM.mat

ICM
[simArray,dist_score] = prepare_distance_3tuple(ICM,'cosine','movieId')