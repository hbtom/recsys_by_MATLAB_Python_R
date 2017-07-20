clear
clc
close all

urm = readtable('/Users/yashar/Documents/RecSys_YD/MATLAB/data/ml-20m/ratings.csv');
output_fold = '/Users/yashar/Documents/RecSys_YD/MATLAB/utils/test/';

%load urm_ML20m.mat

         k = 5  ;
split_type = 'rating';
   pop_thr =  0 ; 
    split_urm(urm, split_type, k, pop_thr,output_fold)


