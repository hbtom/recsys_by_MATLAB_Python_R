function output = function_evaluation_script_final_mrr_hybrid(hybrid_feats,fold_no,cut_off,flag_rec)

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

 load(fullfile(outAddr,['RecSys_res_nn_10_feat_genre_fld_' num2str(fold_no) 'of5.mat']));

 urmPred_base1_str.urm1 = urmPred_Avg;
 urmPred_base1_str.urm2 = urmPred_weightedAvg;
 urmPred_base1_str.urm3 = urmPred_SIMpow_weightedAvg;
 

 load(fullfile(outAddr,['RecSys_res_nn_10_feat_tag_cold_per_95_fld_' num2str(fold_no) 'of5.mat']));

 urmPred_base2_str.urm1 = urmPred_Avg;
 urmPred_base2_str.urm2 = urmPred_weightedAvg;
 urmPred_base2_str.urm3 = urmPred_SIMpow_weightedAvg;
 
 
 % A : BLF - IVEC
 % V : AVF - DEEP
 % M : G   - TAG

if strcmp(hybrid_feats,'GenreIvec') 
    
    %Genre
    urmPred1_str.urm1 = urmPred_base1_str.urm1 ;
    urmPred1_str.urm2 = urmPred_base1_str.urm2 ;
    urmPred1_str.urm3 = urmPred_base1_str.urm3 ;

    %Ivec
    fature_name = 'RecSys_res_nn_10_feat_audio_ivec_gmm_512_tvDim_40';
    load(fullfile(outAddr,[fature_name '_fld_' num2str(fold_no) 'of5.mat']));
    
    urmPred2_str.urm1 = urmPred_Avg;
    urmPred2_str.urm2 = urmPred_weightedAvg;
    urmPred2_str.urm3 = urmPred_SIMpow_weightedAvg;
    
elseif strcmp(hybrid_feats,'Tag95Ivec') 
    
    %Tag
    urmPred1_str.urm1 = urmPred_base2_str.urm1 ;
    urmPred1_str.urm2 = urmPred_base2_str.urm2 ;
    urmPred1_str.urm3 = urmPred_base2_str.urm3 ;
      
    %Ivec
    fature_name = 'RecSys_res_nn_10_feat_audio_ivec_gmm_512_tvDim_40';
    load(fullfile(outAddr,[fature_name '_fld_' num2str(fold_no) 'of5.mat']));
    
    urmPred2_str.urm1 = urmPred_Avg;
    urmPred2_str.urm2 = urmPred_weightedAvg;
    urmPred2_str.urm3 = urmPred_SIMpow_weightedAvg;
    
elseif strcmp(hybrid_feats,'GenreDeepfc7') 
    %Genre
    urmPred1_str.urm1 = urmPred_base1_str.urm1 ;
    urmPred1_str.urm2 = urmPred_base1_str.urm2 ;
    urmPred1_str.urm3 = urmPred_base1_str.urm3 ;
    
    %Deep
    fature_name = 'RecSys_res_nn_10_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_AVGVAR_featComb_All_featNorm_2';
    load(fullfile(outAddr,[fature_name '_fld_' num2str(fold_no) 'of5.mat']));
    
    urmPred2_str.urm1 = urmPred_Avg;
    urmPred2_str.urm2 = urmPred_weightedAvg;
    urmPred2_str.urm3 = urmPred_SIMpow_weightedAvg;

elseif strcmp(hybrid_feats,'Tag95Deepfc7')
    
    %Tag
    urmPred1_str.urm1 = urmPred_base2_str.urm1 ;
    urmPred1_str.urm2 = urmPred_base2_str.urm2 ;
    urmPred1_str.urm3 = urmPred_base2_str.urm3 ;
    
    %Deep
    fature_name = 'RecSys_res_nn_10_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_AVGVAR_featComb_All_featNorm_2';
    load(fullfile(outAddr,[fature_name '_fld_' num2str(fold_no) 'of5.mat']));
    
    urmPred2_str.urm1 = urmPred_Avg;
    urmPred2_str.urm2 = urmPred_weightedAvg;
    urmPred2_str.urm3 = urmPred_SIMpow_weightedAvg;
 
elseif strcmp(hybrid_feats,'GenreAVFall') 
    %Genre
    urmPred1_str.urm1 = urmPred_base1_str.urm1 ;
    urmPred1_str.urm2 = urmPred_base1_str.urm2 ;
    urmPred1_str.urm3 = urmPred_base1_str.urm3 ;
    
    %AVF_all
    fature_name = 'RecSys_res_nn_10_feat_AVF_trailers_fps_1_featAggr_MEDMAD_featComb_All_Norm_2';
    load(fullfile(outAddr,[fature_name '_fld_' num2str(fold_no) 'of5.mat']));
    
    urmPred2_str.urm1 = urmPred_Avg;
    urmPred2_str.urm2 = urmPred_weightedAvg;
    urmPred2_str.urm3 = urmPred_SIMpow_weightedAvg;
 
elseif strcmp(hybrid_feats,'Tag95AVFall') 
    %Tag
    urmPred1_str.urm1 = urmPred_base2_str.urm1 ;
    urmPred1_str.urm2 = urmPred_base2_str.urm2 ;
    urmPred1_str.urm3 = urmPred_base2_str.urm3 ;
    
    %AVF_all
    fature_name = 'RecSys_res_nn_10_feat_AVF_trailers_fps_1_featAggr_MEDMAD_featComb_All_Norm_2';
    load(fullfile(outAddr,[fature_name '_fld_' num2str(fold_no) 'of5.mat']));
    
    urmPred2_str.urm1 = urmPred_Avg;
    urmPred2_str.urm2 = urmPred_weightedAvg;
    urmPred2_str.urm3 = urmPred_SIMpow_weightedAvg;    
    

elseif strcmp(hybrid_feats,'IvecDeep') 

    %Ivec
    fature_name = 'RecSys_res_nn_10_feat_audio_ivec_gmm_512_tvDim_40';
    load(fullfile(outAddr,[fature_name '_fld_' num2str(fold_no) 'of5.mat']));
    
    urmPred1_str.urm1 = urmPred_Avg;
    urmPred1_str.urm2 = urmPred_weightedAvg;
    urmPred1_str.urm3 = urmPred_SIMpow_weightedAvg; 
    
    %Deep
    fature_name = 'RecSys_res_nn_10_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_AVGVAR_featComb_All_featNorm_2';
    load(fullfile(outAddr,[fature_name '_fld_' num2str(fold_no) 'of5.mat']));
    
    urmPred2_str.urm1 = urmPred_Avg;
    urmPred2_str.urm2 = urmPred_weightedAvg;
    urmPred2_str.urm3 = urmPred_SIMpow_weightedAvg; 
    
elseif strcmp(hybrid_feats,'IvecAVFall') 

    %Ivec
    fature_name = 'RecSys_res_nn_10_feat_audio_ivec_gmm_512_tvDim_40';
    load(fullfile(outAddr,[fature_name '_fld_' num2str(fold_no) 'of5.mat']));
    
    urmPred1_str.urm1 = urmPred_Avg;
    urmPred1_str.urm2 = urmPred_weightedAvg;
    urmPred1_str.urm3 = urmPred_SIMpow_weightedAvg; 
    
    %AVF
    fature_name = 'RecSys_res_nn_10_feat_AVF_trailers_fps_1_featAggr_MEDMAD_featComb_All_Norm_2';
    load(fullfile(outAddr,[fature_name '_fld_' num2str(fold_no) 'of5.mat']));
    
    urmPred2_str.urm1 = urmPred_Avg;
    urmPred2_str.urm2 = urmPred_weightedAvg;
    urmPred2_str.urm3 = urmPred_SIMpow_weightedAvg; 

elseif strcmp(hybrid_feats,'DeepAVFall') 

    %Ivec
    fature_name = 'RecSys_res_nn_10_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_AVGVAR_featComb_All_featNorm_2';
    load(fullfile(outAddr,[fature_name '_fld_' num2str(fold_no) 'of5.mat']));
    
    urmPred1_str.urm1 = urmPred_Avg;
    urmPred1_str.urm2 = urmPred_weightedAvg;
    urmPred1_str.urm3 = urmPred_SIMpow_weightedAvg; 
    
    %AVF
    fature_name = 'RecSys_res_nn_10_feat_AVF_trailers_fps_1_featAggr_MEDMAD_featComb_All_Norm_2';
    load(fullfile(outAddr,[fature_name '_fld_' num2str(fold_no) 'of5.mat']));
    
    urmPred2_str.urm1 = urmPred_Avg;
    urmPred2_str.urm2 = urmPred_weightedAvg;
    urmPred2_str.urm3 = urmPred_SIMpow_weightedAvg;     
elseif strcmp(hybrid_feats,'GenreTag95') 

    
    urmPred1_str.urm1 =  urmPred_base1_str.urm1;
    urmPred1_str.urm2 =  urmPred_base1_str.urm2;
    urmPred1_str.urm3 =  urmPred_base1_str.urm3; 
    
        
    urmPred2_str.urm1 =  urmPred_base2_str.urm1;
    urmPred2_str.urm2 =  urmPred_base2_str.urm2;
    urmPred2_str.urm3 =  urmPred_base2_str.urm3;     
    
    
end

clear  urmPred_Avg urmPred_weightedAvg urmPred_SIMpow_weightedAvg

fold_no
output = evaluate_urms_custom_mrr_hybrids(urmTest_New,urmPred1_str,urmPred2_str,urmPred_base1_str,urmPred_base2_str,cut_off,flag_rec) ;
save(fullfile(outAddr,'Eval',['Eval_res_HybridBorda_' hybrid_feats '_fld_' ...
         num2str(fold_no) 'of5_cutoff_' num2str(cut_off) '_MRR_rec' num2str(flag_rec) '.mat']),'output','fold_no','cut_off','-v7.3');
 
