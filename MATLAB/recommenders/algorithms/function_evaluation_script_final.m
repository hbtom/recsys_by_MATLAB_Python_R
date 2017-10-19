function output = function_evaluation_script_final(feature_name,gmm,tvDim,fold_no,cut_off)

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

if strcmp(feature_name,'audio_ivec')
    load(fullfile(outAddr,['RecSys_res_nn_10_feat_audio_ivec_gmm_' num2str(gmm) '_tvDim_' num2str(tvDim) '_fld_' num2str(fold_no) 'of5.mat']));
elseif strcmp(feature_name,'BLF')
    load(fullfile(outAddr,['RecSys_res_nn_10_feat_BLF_fld_' num2str(fold_no) 'of5.mat']));
    
end
 urmPred1_str.urm1 = urmPred_Avg;
 urmPred1_str.urm2 = urmPred_weightedAvg;
 urmPred1_str.urm3 = urmPred_weightedAvg_skg1;
 urmPred1_str.urm4 = urmPred_weightedAvg_skg01;
 urmPred1_str.urm5 = urmPred_weightedAvg_skg001;
 urmPred1_str.urm6 = urmPred_SIMpow_weightedAvg;
 urmPred1_str.urm7 = urmPred_SIMpow_weightedAvg_skg1;
 urmPred1_str.urm8 = urmPred_SIMpow_weightedAvg_skg01;
 urmPred1_str.urm9 = urmPred_SIMpow_weightedAvg_skg001;
 

 load(fullfile(outAddr,['RecSys_res_nn_10_feat_genre_fld_' num2str(fold_no) 'of5.mat']));

 urmPred2_str.urm1 = urmPred_Avg;
 urmPred2_str.urm2 = urmPred_weightedAvg;
 urmPred2_str.urm3 = urmPred_weightedAvg_skg1;
 urmPred2_str.urm4 = urmPred_weightedAvg_skg01;
 urmPred2_str.urm5 = urmPred_weightedAvg_skg001;
 urmPred2_str.urm6 = urmPred_SIMpow_weightedAvg;
 urmPred2_str.urm7 = urmPred_SIMpow_weightedAvg_skg1;
 urmPred2_str.urm8 = urmPred_SIMpow_weightedAvg_skg01;
 urmPred2_str.urm9 = urmPred_SIMpow_weightedAvg_skg001;
 
fold_no
 output = evaluate_urms_custom(urmTest_New,urmPred1_str,urmPred2_str,cut_off) ;
 
 save(fullfile(outAddr,['Eval_res_nn_10_feat_audio_ivec_gmm_' num2str(gmm) '_tvDim_' num2str(tvDim) '_fld_' ...
     num2str(fold_no) 'of5_cutoff_' num2str(cut_off) '.mat']),'output','gmm','tvDim','fold_no','cut_off','-v7.3')
 
%                       output_urmPred_Avg = evaluate_urms(urmTest_New, urmPred_Avg);
%               output_urmPred_weightedAvg = evaluate_urms(urmTest_New, urmPred_weightedAvg);
%          output_urmPred_weightedAvg_skg1 = evaluate_urms(urmTest_New, urmPred_weightedAvg_skg1);
%         output_urmPred_weightedAvg_skg01 = evaluate_urms(urmTest_New, urmPred_weightedAvg_skg01);
%        output_urmPred_weightedAvg_skg001 = evaluate_urms(urmTest_New, urmPred_weightedAvg_skg001);
%        output_SIMpow_urmPred_weightedAvg = evaluate_urms(urmTest_New, urmPred_SIMpow_weightedAvg);
%   output_SIMpow_urmPred_weightedAvg_skg1 = evaluate_urms(urmTest_New, urmPred_SIMpow_weightedAvg_skg1);
%  output_SIMpow_urmPred_weightedAvg_skg01 = evaluate_urms(urmTest_New, urmPred_SIMpow_weightedAvg_skg01);
% output_SIMpow_urmPred_weightedAvg_skg001 = evaluate_urms(urmTest_New, urmPred_SIMpow_weightedAvg_skg001);
% 
% if strcmp(rand_rec_ON,'YES')
%     outputRandom_rec = evaluate_urms_random(urmTest_New, urmPred_Avg);
% else
%     outputRandom_rec = [];
% end
% 
% if strcmp(feature_name,'audio_ivec')
%     % for i-vec
%     save(fullfile(outAddr,['Eval_res_nn_' num2str(nn) '_feat_' feature_name '_gmm_' num2str(gmm_size) '_tvDim_' num2str(tvDim) '_fld_' num2str(fold_no) 'of5' '_rand_rec_ON_' rand_rec_ON '.mat']),...
%         'output_urmPred_Avg','output_urmPred_weightedAvg','output_urmPred_weightedAvg_skg1',...
%         'output_urmPred_weightedAvg_skg01','output_urmPred_weightedAvg_skg001','output_SIMpow_urmPred_weightedAvg_skg1',...
%         'output_SIMpow_urmPred_weightedAvg','output_SIMpow_urmPred_weightedAvg_skg01','output_SIMpow_urmPred_weightedAvg_skg001','outputRandom_rec'); 
% elseif strcmp(feature_name,'genre')
%       save(fullfile(outAddr,['Eval_res_nn_' num2str(nn) '_feat_' feature_name '_fld_' num2str(fold_no) 'of5' '_rand_rec_ON_' rand_rec_ON '.mat']),...
%         'output_urmPred_Avg','output_urmPred_weightedAvg','output_urmPred_weightedAvg_skg1',...
%         'output_urmPred_weightedAvg_skg01','output_urmPred_weightedAvg_skg001','output_SIMpow_urmPred_weightedAvg_skg1',...
%         'output_SIMpow_urmPred_weightedAvg','output_SIMpow_urmPred_weightedAvg_skg01','output_SIMpow_urmPred_weightedAvg_skg001','outputRandom_rec'); 
% else
%     save(fullfile(outAddr,['Eval_res_nn_' num2str(nn) '_feat_' feature_name '_fld_' num2str(fold_no) 'of5' '_rand_rec_ON_' rand_rec_ON '.mat']),...
%         'output_urmPred_Avg','output_urmPred_weightedAvg','output_urmPred_weightedAvg_skg1',...
%         'output_urmPred_weightedAvg_skg01','output_urmPred_weightedAvg_skg001','output_SIMpow_urmPred_weightedAvg_skg1',...
%         'output_SIMpow_urmPred_weightedAvg','output_SIMpow_urmPred_weightedAvg_skg01','output_SIMpow_urmPred_weightedAvg_skg001','outputRandom_rec'); 
%     
% end
