function output = function_evaluation_script_final_mrr_avf(fature_name,fold_no,cut_off,flag_rec)

if ismac
    
    addpath('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/utils/rec');
    addpath('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/metrics');
    rootAddr = '/Users/yashar/OneDrive - Politecnico di Milano/data/';
    outAddr = '/Volumes/SP PHD U3/OneDrive_Polimi/OneDrive - Politecnico di Milano/ECIR2018/Rec_Results';
    
elseif ispc
    addpath('C:\Users\Yas\Documents\GitHub\recsys_by_MATLAB_Python_R\MATLAB\utils\rec');
    addpath('C:\Users\Yas\Documents\GitHub\recsys_by_MATLAB_Python_R\MATLAB\recommenders\metrics');
    rootAddr = 'C:\Users\Yas\Documents\data';
    outAddr = 'F:\OneDrive_Polimi\OneDrive - Politecnico di Milano\ECIR2018\Rec_Results';
    
    
end


 load(fullfile(outAddr,[fature_name '_fld_' num2str(fold_no) 'of5.mat']));

 urmPred1_str.urm1 = urmPred_Avg;
 urmPred1_str.urm2 = urmPred_weightedAvg;
 urmPred1_str.urm3 = urmPred_SIMpow_weightedAvg;

 load(fullfile(outAddr,['RecSys_res_nn_10_feat_genre_fld_' num2str(fold_no) 'of5.mat']));

 urmPred_base1_str.urm1 = urmPred_Avg;
 urmPred_base1_str.urm2 = urmPred_weightedAvg;
 urmPred_base1_str.urm3 = urmPred_SIMpow_weightedAvg;

 load(fullfile(outAddr,['RecSys_res_nn_10_feat_tag_fld_' num2str(fold_no) 'of5.mat']));

 urmPred_base2_str.urm1 = urmPred_Avg;
 urmPred_base2_str.urm2 = urmPred_weightedAvg;
 urmPred_base2_str.urm3 = urmPred_SIMpow_weightedAvg;


 
fold_no
 output = evaluate_urms_custom_mrr_avf(urmTest_New,urmPred1_str,urmPred_base1_str,urmPred_base2_str,cut_off,flag_rec) ;
 save(fullfile(outAddr,'Eval',['Eval_res_' fature_name '_fld_' ...
         num2str(fold_no) 'of5_cutoff_' num2str(cut_off) '_MRR_rec' num2str(flag_rec) '.mat']),'output','fold_no','cut_off','-v7.3');
 
