clear
clc
close all

load('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/algorithms/rec_results/tRecSys_res_nn_10_feat_audio_ivec_gmm_128_tvDim_40_fld_2of5.mat')

urmPred1 = urmPred_weightedAvg;
load('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/algorithms/rec_results/tRecSys_res_nn_10_feat_genre_fld_2of5.mat')

urmPred2 = urmPred_weightedAvg;
evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2)