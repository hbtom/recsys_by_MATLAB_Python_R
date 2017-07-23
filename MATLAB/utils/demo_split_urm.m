clear
clc
close all

input_rating_file = '/Users/yashar/Documents/GitHub/data/inputs/ml-20m/ratings.csv';
      output_fold = '/Users/yashar/Documents/GitHub/data/outputs/urms/item';

urm = readtable(input_rating_file);

%load urm_ML20m.mat

         k = 10  ;
split_type = 'rating';

pop_thrList =  [0 0.001 0.005 0.01 0.05 0.1 0.2];


for i = 1 :length(pop_thrList)    
    pop_thr = pop_thrList(i);    
    split_urm(urm, split_type, k, pop_thr,output_fold)
end