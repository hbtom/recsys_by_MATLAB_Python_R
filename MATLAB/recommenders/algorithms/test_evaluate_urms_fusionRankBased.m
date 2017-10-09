clear
clc
close all

if ismac
    
    addpath('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/utils/rec');
    addpath('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/metrics');
    rootAddr = '/Users/yashar/OneDrive - Politecnico di Milano/data/';
    outAddr = '/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/algorithms/rec_results';
    
elseif ispc
    addpath('C:\Users\Yas\Documents\GitHub\recsys_by_MATLAB_Python_R\MATLAB\utils\rec');
    addpath('C:\Users\Yas\Documents\GitHub\recsys_by_MATLAB_Python_R\MATLAB\recommenders\metrics');
    rootAddr = 'C:\Users\Yas\Documents\data';
    outAddr = 'C:\Users\Yas\Documents\GitHub\recsys_by_MATLAB_Python_R\MATLAB\recommenders\algorithms\rec_results';
    
    
end
load('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/algorithms/rec_results/RecSys_res_nn_10_feat_audio_ivec_gmm_128_tvDim_40_fld_1of5.mat')
urmPred1 = urmPred_Avg;
load('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/algorithms/rec_results/RecSys_res_nn_10_feat_genre_fld_1of5.mat')

urmPred2 = urmPred_Avg;

clear urmPred_Avg urmPred_SIMpow_weightedAvg urmPred_SIMpow_weightedAvg_skg001 urmPred_SIMpow_weightedAvg_skg01 urmPred_SIMpow_weightedAvg_skg1
clear urmPred_weightedAvg urmPred_weightedAvg_skg001 urmPred_weightedAvg_skg01 urmPred_weightedAvg_skg1
tic
output1 = evaluate_urms2(urmTest_New,urmPred1,urmPred2);
toc

tic
output2 = evaluate_urms2(urmTest_New,urmPred2,urmPred2);
toc

tic
outputag1 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.5,0.5);
toc
tic
outputag2 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.7,0.3);
toc
tic
outputag3 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.3,0.7);
toc
tic
outputag4 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.9,0.1);
toc
tic
outputag5 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.1,0.9);
toc
save('outputALL_Avg_correct.mat','output1','output2','outputag1','outputag2','outputag3','outputag4','outputag5');

clear

load('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/algorithms/rec_results/RecSys_res_nn_10_feat_audio_ivec_gmm_128_tvDim_40_fld_1of5.mat')
urmPred1 = urmPred_weightedAvg;
load('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/algorithms/rec_results/RecSys_res_nn_10_feat_genre_fld_1of5.mat')

urmPred2 = urmPred_weightedAvg;

clear urmPred_Avg urmPred_SIMpow_weightedAvg urmPred_SIMpow_weightedAvg_skg001 urmPred_SIMpow_weightedAvg_skg01 urmPred_SIMpow_weightedAvg_skg1
clear urmPred_weightedAvg urmPred_weightedAvg_skg001 urmPred_weightedAvg_skg01 urmPred_weightedAvg_skg1
tic
output1 = evaluate_urms2(urmTest_New,urmPred1,urmPred2);
toc

tic
output2 = evaluate_urms2(urmTest_New,urmPred2,urmPred2);
toc

tic
outputag1 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.5,0.5);
toc
tic
outputag2 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.7,0.3);
toc
tic
outputag3 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.3,0.7);
toc
tic
outputag4 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.9,0.1);
toc
tic
outputag5 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.1,0.9);
toc
save('outputALL_weightedAvg_correct.mat','output1','output2','outputag1','outputag2','outputag3','outputag4','outputag5');

clear

load('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/algorithms/rec_results/RecSys_res_nn_10_feat_audio_ivec_gmm_128_tvDim_40_fld_1of5.mat')
urmPred1 = urmPred_weightedAvg_skg001;

load('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/algorithms/rec_results/RecSys_res_nn_10_feat_genre_fld_1of5.mat')
urmPred2 = urmPred_weightedAvg_skg001;

clear urmPred_Avg urmPred_SIMpow_weightedAvg urmPred_SIMpow_weightedAvg_skg001 urmPred_SIMpow_weightedAvg_skg01 urmPred_SIMpow_weightedAvg_skg1
clear urmPred_weightedAvg urmPred_weightedAvg_skg001 urmPred_weightedAvg_skg01 urmPred_weightedAvg_skg1
tic
output1 = evaluate_urms2(urmTest_New,urmPred1,urmPred2);
toc

tic
output2 = evaluate_urms2(urmTest_New,urmPred2,urmPred2);
toc

tic
outputag1 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.5,0.5);
toc
tic
outputag2 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.7,0.3);
toc
tic
outputag3 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.3,0.7);
toc
tic
outputag4 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.9,0.1);
toc
tic
outputag5 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.1,0.9);
toc
save('outputALL_weightedAvg_skg001_correct.mat','output1','output2','outputag1','outputag2','outputag3','outputag4','outputag5');


clear

load('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/algorithms/rec_results/RecSys_res_nn_10_feat_audio_ivec_gmm_128_tvDim_40_fld_1of5.mat')
urmPred1 = urmPred_weightedAvg_skg01;

load('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/algorithms/rec_results/RecSys_res_nn_10_feat_genre_fld_1of5.mat')
urmPred2 = urmPred_weightedAvg_skg01;

clear urmPred_Avg urmPred_SIMpow_weightedAvg urmPred_SIMpow_weightedAvg_skg001 urmPred_SIMpow_weightedAvg_skg01 urmPred_SIMpow_weightedAvg_skg1
clear urmPred_weightedAvg urmPred_weightedAvg_skg001 urmPred_weightedAvg_skg01 urmPred_weightedAvg_skg1
tic
output1 = evaluate_urms2(urmTest_New,urmPred1,urmPred2);
toc

tic
output2 = evaluate_urms2(urmTest_New,urmPred2,urmPred2);
toc

tic
outputag1 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.5,0.5);
toc
tic
outputag2 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.7,0.3);
toc
tic
outputag3 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.3,0.7);
toc
tic
outputag4 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.9,0.1);
toc
tic
outputag5 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.1,0.9);
toc
save('outputALL_weightedAvg_skg01_correct.mat','output1','output2','outputag1','outputag2','outputag3','outputag4','outputag5');


clear

load('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/algorithms/rec_results/RecSys_res_nn_10_feat_audio_ivec_gmm_128_tvDim_40_fld_1of5.mat')
urmPred1 = urmPred_weightedAvg_skg1;

load('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/algorithms/rec_results/RecSys_res_nn_10_feat_genre_fld_1of5.mat')
urmPred2 = urmPred_weightedAvg_skg1;

clear urmPred_Avg urmPred_SIMpow_weightedAvg urmPred_SIMpow_weightedAvg_skg001 urmPred_SIMpow_weightedAvg_skg01 urmPred_SIMpow_weightedAvg_skg1
clear urmPred_weightedAvg urmPred_weightedAvg_skg001 urmPred_weightedAvg_skg01 urmPred_weightedAvg_skg1
tic
output1 = evaluate_urms2(urmTest_New,urmPred1,urmPred2);
toc

tic
output2 = evaluate_urms2(urmTest_New,urmPred2,urmPred2);
toc

tic
outputag1 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.5,0.5);
toc
tic
outputag2 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.7,0.3);
toc
tic
outputag3 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.3,0.7);
toc
tic
outputag4 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.9,0.1);
toc
tic
outputag5 = evaluate_urms_fusionRankBased(urmTest_New,urmPred1,urmPred2,0.1,0.9);
toc
save('outputALL_weightedAvg_skg1_correct.mat','output1','output2','outputag1','outputag2','outputag3','outputag4','outputag5');


