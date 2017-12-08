clear
clc
close all

at = 0;
for cut_off = [1 2 3 4 5 10 20 50]
    at = at + 1;
    for sr = [1]
        
        for min_ur = [50]
            for max_ur = [100]
                for rec = 2 : 2
                    
                    for fold_no = 1:5
                        rec
                        sr
                        min_ur
                        max_ur
                        % i-vecs
                        
                        %                         fprintf('***** IVEC 256 40 ****** \n');
                        %                         fileName = ['RecSys_res_nn_10_feat_audio_ivec_gmm_256_tvDim_40_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec1(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 256 100****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_256_tvDim_100_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec2(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %
                        %                         fprintf('***** IVEC 256 200 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_256_tvDim_200_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec3(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 256 400 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_256_tvDim_400_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec4(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 512 40****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_512_tvDim_40_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec5(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %
                        %                         fprintf('***** IVEC 512 100 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_512_tvDim_100_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec6(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 512 200 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_512_tvDim_200_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec7(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 512 400 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_512_tvDim_400_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec8(fold_no,at) =  output.mrr_ranked_list;
                        
                        %                         fprintf('***** IVEC 256 40 LDA Genre****** \n');
                        %
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_lda_genre_gmm_256_tvDim_40_fld_'  num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec_lda1(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 256 100 LDA Genre ****** \n');
                        %
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_lda_genre_gmm_256_tvDim_100_fld_'  num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec_lda2(fold_no,at) =  output.mrr_ranked_list;
                        
                        
                        %                         disp('Hi');
                        %
                        %                         fprintf('***** DEEP ****** \n');
                        %
                        %                         fileName = ['RecSys_res_nn_10_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_AVG_featComb_All_featNorm_2_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_deep(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** GENRE ****** \n');
                        %                         fileName = ['RecSys_res_nn_10_feat_genre_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_genre(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** GENRE Jaccard ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_jaccard_feat_genre_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_genre_jaccard(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** TAG ****** \n');
                        %                         fileName = ['RecSys_res_nn_10_feat_tag_cold_per_0_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_tag0(fold_no,at) =  output.mrr_ranked_list;
                        %                         disp('Hi')
                        %
                        %                         fprintf('***** TAG 100****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_tag_cold_per_100_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_tag100(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** TAG 99.5****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_tag_cold_per_99.5_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_tag995(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %
                        %                         fprintf('***** TAG 99****** \n');
                        %                         fileName = ['Rec_res_nn_10_feat_tag_cold_per_99_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_tag99(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** TAG 98****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_tag_cold_per_98_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_tag98(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** TAG 97 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_tag_cold_per_97_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_tag97(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %
                        %                         fprintf('***** TAG 95****** \n');
                        %                         fileName = ['RecSys_res_nn_10_feat_tag_cold_per_95_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_tag95(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** TAG 10 ****** \n');
                        %                         fileName = ['RecSys_res_nn_10_feat_tag_cold_per_10_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_tag10(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** DEEP SSR2****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_AVG_featComb_All_featNorm_SSR2_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_deepssr(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** AVF - ALL MEANVAR ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_AVF_trailers_fps1_featAggr_AVGVAR_featComb_All_Norm_2_fld_'  num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_AVF_all_meanvar(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** AVF - ALL MEAN  ****** \n');
                        %                         fileName = ['RecSys_res_nn_10_feat_AVF_trailers_fps1_featAggr_AVG_featComb_All_Norm_2_fld_'  num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_AVF_all_mean(fold_no,at) =  output.mrr_ranked_list;
                        
                        %
                        %
                        %                         fprintf('***** DEEP VLAD 32  ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_VLAD PCA32_featNorm_2_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP','MRR1','Precision1','Recall1',[]);
                        %                         output_DEEPVLAD_32(fold_no,at) =  output.map_ranked_list;
                        %
                        %                         fprintf('***** DEEP VLAD 32SSR  ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_VLAD PCA32_featNorm_SSR2_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP','MRR1','Precision1','Recall1',[]);
                        %                         output_DEEPVLAD_32SSR(fold_no,at) =  output.map_ranked_list;
                        %
                        %                         fprintf('***** DEEP VLAD 64  ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_VLAD PCA64_featNorm_2_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP','MRR1','Precision1','Recall1',[]);
                        %                         output_DEEPVLAD_64(fold_no,at) =  output.map_ranked_list;
                        %
                        %                         fprintf('***** DEEP VLAD 64 SSR ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_VLAD PCA64_featNorm_SSR2_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP','MRR1','Precision1','Recall1',[]);
                        %                         output_DEEPVLAD_64SSR(fold_no,at) =  output.map_ranked_list;
                        
                        %                         fprintf('***** DEEP VLAD 128 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_VLAD PCA128_featNorm_2_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP','MRR1','Precision1','Recall1',[]);
                        %                         output_DEEPVLAD_128(fold_no,at) =  output.map_ranked_list;
                        %
                        %                         fprintf('***** DEEP VLAD 128 SSR ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_VLAD PCA128_featNorm_SSR2_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP','MRR1','Precision1','Recall1',[]);
                        %                         output_DEEPVLAD_128SSR(fold_no,at) =  output.map_ranked_list;
                        
                        
                        
                        %                         fprintf('***** Random ****** \n');
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1','Random');
                        %                         output_rnd(fold_no,at) =  output.mrr_ranked_list;
                        %                         disp('CHECK')
                        
                        %                         fprintf('***** IVEC 256 40 ****** \n');
                        %                         fileName = ['RecSys_res_nn_10_feat_audio_ivec_gmm_256_tvDim_40_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec1(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 256 100****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_256_tvDim_100_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec2(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %
                        %                         fprintf('***** IVEC 256 200 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_256_tvDim_200_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec3(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 256 400 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_256_tvDim_400_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec4(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 512 40****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_512_tvDim_40_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec5(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %
                        %                         fprintf('***** IVEC 512 100 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_512_tvDim_100_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec6(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 512 200 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_512_tvDim_200_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec7(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 512 400 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_512_tvDim_400_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec8(fold_no,at) =  output.mrr_ranked_list;
                        
                        %                         fprintf('***** IVEC 256 40 LDA Genre****** \n');
                        %
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_lda_genre_gmm_256_tvDim_40_fld_'  num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec_lda1(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 256 100 LDA Genre ****** \n');
                        %
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_lda_genre_gmm_256_tvDim_100_fld_'  num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec_lda2(fold_no,at) =  output.mrr_ranked_list;
                        
                        %                         fprintf('***** IVEC 256 40 ****** \n');
                        %                         fileName = ['RecSys_res_nn_10_feat_audio_ivec_gmm_256_tvDim_40_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec1(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 256 100****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_256_tvDim_100_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec2(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %
                        %                         fprintf('***** IVEC 256 200 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_256_tvDim_200_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec3(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 256 400 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_256_tvDim_400_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec4(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 512 40****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_512_tvDim_40_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec5(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %
                        %                         fprintf('***** IVEC 512 100 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_512_tvDim_100_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec6(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 512 200 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_512_tvDim_200_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec7(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 512 400 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_512_tvDim_400_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec8(fold_no,at) =  output.mrr_ranked_list;
                        
                        %                         fprintf('***** IVEC 256 40 LDA Genre****** \n');
                        %
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_lda_genre_gmm_256_tvDim_40_fld_'  num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec_lda1(fold_no,at) =  output.mrr_ranked_list;
                        %
                        %                         fprintf('***** IVEC 256 100 LDA Genre ****** \n');
                        %
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_lda_genre_gmm_256_tvDim_100_fld_'  num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1',[]);
                        %                         output_ivec_lda2(fold_no,at) =  output.mrr_ranked_list;
                        
                        %                         fileName2 = ['RecSys_res_nn_10_feat_tag_cold_per_0_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %
                        %
                        %                         fprintf('***** DeepLayerfp7 Tag 100 ****** \n');
                        %                         fileName = ['Rec_res_nn_10_sim_type_cosine_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_AVG_featComb_All_featNorm_SSR2_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %                         output = function_evaluation_script_Borda(fileName,fileName2,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1','');
                        %
                        %
                        %                         for i = 1 : 100
                        %                             tmp = eval(['output.mrr_ranked_list' num2str(i) ';']);
                        %                             output_DeepLayerfp7_tag100(fold_no,at,i) = tmp;
                        %                         end
                        %
                        %
                        %
                        %                         fprintf('***** AVF_trailers_featAggr_AVG_Norm_2 Tag 100 ****** \n');
                        %                         fileName = ['RecSys_res_nn_10_feat_AVF_trailers_fps1_featAggr_AVG_featComb_All_Norm_2_fld_'  num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        %
                        %                         output = function_evaluation_script_Borda(fileName,fileName2,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1','');
                        %
                        %
                        %                         for i = 1 : 100
                        %                             tmp = eval(['output.mrr_ranked_list' num2str(i) ';']);
                        %                             output_AVF_featAggrAVG_Norm_2_tag100(fold_no,at,i) = tmp;
                        %                         end
                        
                        fileName = ['Rec_res_nn_10_sim_type_cosine_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_AVG_featComb_All_featNorm_SSR2_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        fileName2 = ['RecSys_res_nn_10_feat_audio_ivec_gmm_256_tvDim_40_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        
                        output = function_evaluation_script_Borda(fileName,fileName2,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1','');
                        
                        for i = 1 : 100
                            tmp = eval(['output.mrr_ranked_list' num2str(i) ';']);
                            output_ivec1_DeepLayerfp7_featAggrAVG_SSR2(fold_no,at,i) = tmp;
                        end
                        
                        
                        fileName = ['Rec_res_nn_10_sim_type_cosine_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_AVG_featComb_All_featNorm_SSR2_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        fileName2 = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_256_tvDim_100_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        
                        output = function_evaluation_script_Borda(fileName,fileName2,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1','');
                        
                        for i = 1 : 100
                            tmp = eval(['output.mrr_ranked_list' num2str(i) ';']);
                            output_ivec2_DeepLayerfp7_featAggrAVG_SSR2(fold_no,at,i) = tmp;
                        end
                        
                        
                        fileName = ['Rec_res_nn_10_sim_type_cosine_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_AVG_featComb_All_featNorm_SSR2_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        fileName2 = ['Rec_res_nn_10_sim_type_cosine_feat_audio_ivec_gmm_256_tvDim_200_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                        
                        output = function_evaluation_script_Borda(fileName,fileName2,fold_no,cut_off,rec,'MAP1','MRR','Precision1','Recall1','');
                        
                        for i = 1 : 100
                            tmp = eval(['output.mrr_ranked_list' num2str(i) ';']);
                            output_ivec3_DeepLayerfp7_featAggrAVG_SSR2(fold_no,at,i) = tmp;
                        end
                        
                    end
                    
                end
            end
        end
    end
end
save('output_ivec123_DeepLayerfp7_featAggrAVG_Norm_SSR2.mat');


%{
output_ivec1_mean = mean(output_ivec1);
output_ivec2_mean = mean(output_ivec2);
output_ivec3_mean = mean(output_ivec3);
output_ivec4_mean = mean(output_ivec4);
output_ivec5_mean = mean(output_ivec5);
output_ivec6_mean = mean(output_ivec6);
output_ivec7_mean = mean(output_ivec7);
output_ivec8_mean = mean(output_ivec8);
% output_ivec_lda1_mean = mean(output_ivec_lda1);
% output_ivec_lda2_mean = mean(output_ivec_lda2);
output_deep_mean = mean(output_deep);
output_genre_mean = mean(output_genre);
output_genre_jaccard_mean = mean(output_genre_jaccard);
output_tag0_mean = mean(output_tag0);
output_tag10_mean = mean(output_tag10);
output_tag95_mean = mean(output_tag95);
output_tag995_mean = mean(output_tag995);
output_tag100_mean = mean(output_tag100);
output_AVF_all_mean2 = mean(output_AVF_all_mean);
% output_AVF_part1_mean = mean(output_AVF_part1);
% output_AVF_part2_mean = mean(output_AVF_part2);
output_rnd_mean = mean(output_rnd);
output_deepssr_mean = mean(output_deepssr);
output_AVF_all_meanvar2 = mean(output_AVF_all_meanvar);
output_tag99_mean   = mean(output_tag99);
output_tag98_mean   = mean(output_tag98);
output_tag97_mean   = mean(output_tag97);



fprintf('Random &  &- &-  &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\ \\hline \n',output_rnd_mean(1),output_rnd_mean(2),output_rnd_mean(3),output_rnd_mean(4),output_rnd_mean(5),output_rnd_mean(6),output_rnd_mean(7),output_rnd_mean(8));
fprintf('\\multirow{8}{*}{\\textbf{\\begin{tabular}[c]{@{}c@{}}Avg \\\\ \\end{tabular}}}        &metadata       &genre &cosine &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\  \n',output_genre_mean(1),output_genre_mean(2),output_genre_mean(3),output_genre_mean(4),output_genre_mean(5),output_genre_mean(6),output_genre_mean(7),output_genre_mean(8));
fprintf('       &metadata  &genre  &jaccard &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\ \n',output_genre_jaccard_mean(1),output_genre_jaccard_mean(2),output_genre_jaccard_mean(3),output_genre_jaccard_mean(4),output_genre_jaccard_mean(5),output_genre_jaccard_mean(6),output_genre_jaccard_mean(7),output_genre_jaccard_mean(8));
fprintf('       &metadata  &tag    &- &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\ \n',output_tag0_mean(1),output_tag0_mean(2),output_tag0_mean(3),output_tag0_mean(4),output_tag0_mean(5),output_tag0_mean(6),output_tag0_mean(7),output_tag0_mean(8));
fprintf('       &metadata  &tag90  &- &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\  \n',output_tag10_mean(1),output_tag10_mean(2),output_tag10_mean(3),output_tag10_mean(4),output_tag10_mean(5),output_tag10_mean(6),output_tag10_mean(7),output_tag10_mean(8));
fprintf('       &metadata  &tag5   &- &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\  \n',output_tag95_mean(1),output_tag95_mean(2),output_tag95_mean(3),output_tag95_mean(4),output_tag95_mean(5),output_tag95_mean(6),output_tag95_mean(7),output_tag95_mean(8));
fprintf('       &metadata  &tag3   &- &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\  \n',output_tag97_mean(1),output_tag97_mean(2),output_tag97_mean(3),output_tag97_mean(4),output_tag97_mean(5),output_tag97_mean(6),output_tag97_mean(7),output_tag97_mean(8));
fprintf('       &metadata  &tag2   &- &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\  \n',output_tag98_mean(1),output_tag98_mean(2),output_tag98_mean(3),output_tag98_mean(4),output_tag98_mean(5),output_tag98_mean(6),output_tag98_mean(7),output_tag98_mean(8));
fprintf('       &metadata  &tag1   &- &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\  \n',output_tag99_mean(1),output_tag99_mean(2),output_tag99_mean(3),output_tag99_mean(4),output_tag99_mean(5),output_tag99_mean(6),output_tag99_mean(7),output_tag99_mean(8));
fprintf('       &metadata  &tag0.5 &- &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\  \n',output_tag995_mean(1),output_tag995_mean(2),output_tag995_mean(3),output_tag995_mean(4),output_tag995_mean(5),output_tag995_mean(6),output_tag995_mean(7),output_tag995_mean(8));
fprintf('       &metadata  &tag0   &- &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\ \\cline{2-12} \n',output_tag100_mean(1),output_tag100_mean(2),output_tag100_mean(3),output_tag100_mean(4),output_tag100_mean(5),output_tag100_mean(6),output_tag100_mean(7),output_tag100_mean(8));
fprintf('       &audio signal   &i-vec &(256,40) &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\  \n',output_ivec1_mean(1),output_ivec1_mean(2),output_ivec1_mean(3),output_ivec1_mean(4),output_ivec1_mean(5),output_ivec1_mean(6),output_ivec1_mean(7),output_ivec1_mean(8));
fprintf('       &audio signal   &i-vec &(256,100) &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\  \n',output_ivec2_mean(1),output_ivec2_mean(2),output_ivec2_mean(3),output_ivec2_mean(4),output_ivec2_mean(5),output_ivec2_mean(6),output_ivec2_mean(7),output_ivec2_mean(8));
fprintf('       &audio signal   &i-vec &(256,200)  &- &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\  \n',output_ivec3_mean(1),output_ivec3_mean(2),output_ivec3_mean(3),output_ivec3_mean(4),output_ivec3_mean(5),output_ivec3_mean(6),output_ivec3_mean(7),output_ivec3_mean(8));
fprintf('       &audio signal   &i-vec &(256,400)  &- &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\  \n',output_ivec4_mean(1),output_ivec4_mean(2),output_ivec4_mean(3),output_ivec4_mean(4),output_ivec4_mean(5),output_ivec4_mean(6),output_ivec4_mean(7),output_ivec4_mean(8));
fprintf('       &audio signal   &i-vec &(512,40) &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\  \n',output_ivec5_mean(1),output_ivec5_mean(2),output_ivec5_mean(3),output_ivec5_mean(4),output_ivec5_mean(5),output_ivec5_mean(6),output_ivec5_mean(7),output_ivec5_mean(8));
fprintf('       &audio signal   &i-vec &(512,100) &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\  \n',output_ivec6_mean(1),output_ivec6_mean(2),output_ivec6_mean(3),output_ivec6_mean(4),output_ivec6_mean(5),output_ivec6_mean(6),output_ivec6_mean(7),output_ivec6_mean(8));
fprintf('       &audio signal   &i-vec &(512,200)  &- &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\  \n',output_ivec7_mean(1),output_ivec7_mean(2),output_ivec7_mean(3),output_ivec7_mean(4),output_ivec7_mean(5),output_ivec7_mean(6),output_ivec7_mean(7),output_ivec7_mean(8));
fprintf('       &audio signal   &i-vec &(512,400)  &- &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\ \\cline{2-12} \n',output_ivec8_mean(1),output_ivec8_mean(2),output_ivec8_mean(3),output_ivec8_mean(4),output_ivec8_mean(5),output_ivec8_mean(6),output_ivec8_mean(7),output_ivec8_mean(8));
%fprintf('       &audio signal   &i-vec/lda-genre &(256,40)  &- &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\ \\cline{2-13} \n',output_ivec_lda1_mean(1),output_ivec_lda1_mean(2),output_ivec_lda1_mean(3),output_ivec_lda1_mean(4),output_ivec_lda1_mean(5));
%fprintf('       &audio signal   &i-vec/lda-genre &(256,100)  &- &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\ \\cline{2-13} \n',output_ivec_lda2_mean(1),output_ivec_lda2_mean(2),output_ivec_lda2_mean(3),output_ivec_lda2_mean(4),output_ivec_lda2_mean(5));
fprintf('       &visual signal  &deep-fc7 &- &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\  \n',output_deep_mean(1),output_deep_mean(2),output_deep_mean(3),output_deep_mean(4),output_deep_mean(5),output_deep_mean(6),output_deep_mean(7),output_deep_mean(8));
fprintf('       &visual signal  &deep-fc7 &SSR &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\  \n',output_deepssr_mean(1),output_deepssr_mean(2),output_deepssr_mean(3),output_deepssr_mean(4),output_deepssr_mean(5),output_deepssr_mean(6),output_deepssr_mean(7),output_deepssr_mean(8));
fprintf('       &visual signal  &deep-fc7  &VLAD &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\  \n',output_DEEPVLAD_mean(1),output_DEEPVLAD_mean(2),output_DEEPVLAD_mean(3),output_DEEPVLAD_mean(4),output_DEEPVLAD_mean(5),output_DEEPVLAD_mean(6),output_DEEPVLAD_mean(7),output_DEEPVLAD_mean(8));
fprintf('       &visual signal  &AVF &- &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\  \n',output_AVF_all_mean2(1),output_AVF_all_mean2(2),output_AVF_all_mean2(3),output_AVF_all_mean2(4),output_AVF_all_mean2(5),output_AVF_all_mean2(6),output_AVF_all_mean2(7),output_AVF_all_mean2(8));
fprintf('       &visual signal  &AVF &[mean,var] &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f   \\\\ \\hline \n',output_AVF_all_meanvar2(1),output_AVF_all_meanvar2(2),output_AVF_all_meanvar2(3),output_AVF_all_meanvar2(4),output_AVF_all_meanvar2(5),output_AVF_all_meanvar2(6),output_AVF_all_meanvar2(7),output_AVF_all_meanvar2(8));
%}

% output_DEEPVLAD32_mean = mean(output_DEEPVLAD_32);
% output_DEEPVLAD32SSR_mean = mean(output_DEEPVLAD_32SSR);
% % output_DEEPVLAD64_mean = mean(output_DEEPVLAD_64);
% % output_DEEPVLAD64SSR_mean = mean(output_DEEPVLAD_64SSR);
% output_DEEPVLAD128_mean = mean(output_DEEPVLAD_128);
% output_DEEPVLAD128SSR_mean = mean(output_DEEPVLAD_128SSR);
%
%
% fprintf('       &visual signal  &deep-fc7  &VLAD32 &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\  \n',output_DEEPVLAD32_mean(1),output_DEEPVLAD32_mean(2),output_DEEPVLAD32_mean(3),output_DEEPVLAD32_mean(4),output_DEEPVLAD32_mean(5),output_DEEPVLAD32_mean(6),output_DEEPVLAD32_mean(7),output_DEEPVLAD32_mean(8));
% fprintf('       &visual signal  &deep-fc7  &VLAD32SSR &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\  \n',output_DEEPVLAD32SSR_mean(1),output_DEEPVLAD32SSR_mean(2),output_DEEPVLAD32SSR_mean(3),output_DEEPVLAD32SSR_mean(4),output_DEEPVLAD32SSR_mean(5),output_DEEPVLAD32SSR_mean(6),output_DEEPVLAD32SSR_mean(7),output_DEEPVLAD32SSR_mean(8));
% %fprintf('       &visual signal  &deep-fc7  &VLAD64 &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\  \n',output_DEEPVLAD64_mean(1),output_DEEPVLAD64_mean(2),output_DEEPVLAD64_mean(3),output_DEEPVLAD64_mean(4),output_DEEPVLAD64_mean(5),output_DEEPVLAD64_mean(6),output_DEEPVLAD64_mean(7),output_DEEPVLAD64_mean(8));
% %fprintf('       &visual signal  &deep-fc7  &VLAD64SSR &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\  \n',output_DEEPVLAD64SSR_mean(1),output_DEEPVLAD64SSR_mean(2),output_DEEPVLAD64SSR_mean(3),output_DEEPVLAD64SSR_mean(4),output_DEEPVLAD64SSR_mean(5),output_DEEPVLAD64SSR_mean(6),output_DEEPVLAD64SSR_mean(7),output_DEEPVLAD64SSR_mean(8));
% fprintf('       &visual signal  &deep-fc7  &VLAD128 &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\  \n',output_DEEPVLAD128_mean(1),output_DEEPVLAD128_mean(2),output_DEEPVLAD128_mean(3),output_DEEPVLAD128_mean(4),output_DEEPVLAD128_mean(5),output_DEEPVLAD128_mean(6),output_DEEPVLAD128_mean(7),output_DEEPVLAD128_mean(8));
% fprintf('       &visual signal  &deep-fc7  &VLAD128SSR &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\  \n',output_DEEPVLAD128SSR_mean(1),output_DEEPVLAD128SSR_mean(2),output_DEEPVLAD128SSR_mean(3),output_DEEPVLAD128SSR_mean(4),output_DEEPVLAD128SSR_mean(5),output_DEEPVLAD128SSR_mean(6),output_DEEPVLAD128SSR_mean(7),output_DEEPVLAD128SSR_mean(8));


% load('bodra_aggr_eval_result_big_deep_avf_tags3.mat');
% load('bodra_aggr_eval_result_big_ivec_tags3.mat');
%
% output_ivec1_tag100_mean = mean(output_ivec1_tag100,1);
% output_ivec2_tag100_mean = mean(output_ivec2_tag100,1);
% output_ivec3_tag100_mean = mean(output_ivec3_tag100,1);
% output_ivec4_tag100_mean = mean(output_ivec4_tag100,1);
% output_ivec5_tag100_mean = mean(output_ivec5_tag100,1);
% output_ivec6_tag100_mean = mean(output_ivec6_tag100,1);
% output_ivec7_tag100_mean = mean(output_ivec7_tag100,1);
% output_ivec8_tag100_mean = mean(output_ivec8_tag100,1);
%
% fprintf('&audio+meta  &ivec-Tag3  &(256,40) &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\  \n',max(output_ivec1_tag100_mean(1,1,2:end-1)),max(output_ivec1_tag100_mean(1,2,2:end-1)),max(output_ivec1_tag100_mean(1,3,2:end-1)),max(output_ivec1_tag100_mean(1,4,2:end-1)),max(output_ivec1_tag100_mean(1,5,2:end-1)),max(output_ivec1_tag100_mean(1,6,2:end-1)),max(output_ivec1_tag100_mean(1,7,2:end-1)),max(output_ivec1_tag100_mean(1,8,2:end-1)));
% fprintf('&audio+meta  &ivec-Tag3  &(256,100) &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\  \n',max(output_ivec2_tag100_mean(1,1,2:end-1)),max(output_ivec2_tag100_mean(1,2,2:end-1)),max(output_ivec2_tag100_mean(1,3,2:end-1)),max(output_ivec2_tag100_mean(1,4,2:end-1)),max(output_ivec2_tag100_mean(1,5,2:end-1)),max(output_ivec2_tag100_mean(1,6,2:end-1)),max(output_ivec2_tag100_mean(1,7,2:end-1)),max(output_ivec2_tag100_mean(1,8,2:end-1)));
% fprintf('&audio+meta  &ivec-Tag3  &(256,200) &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\  \n',max(output_ivec3_tag100_mean(1,1,2:end-1)),max(output_ivec3_tag100_mean(1,2,2:end-1)),max(output_ivec3_tag100_mean(1,3,2:end-1)),max(output_ivec3_tag100_mean(1,4,2:end-1)),max(output_ivec3_tag100_mean(1,5,2:end-1)),max(output_ivec3_tag100_mean(1,6,2:end-1)),max(output_ivec3_tag100_mean(1,7,2:end-1)),max(output_ivec3_tag100_mean(1,8,2:end-1)));
% fprintf('&audio+meta  &ivec-Tag3  &(256,400) &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\  \n',max(output_ivec4_tag100_mean(1,1,2:end-1)),max(output_ivec4_tag100_mean(1,2,2:end-1)),max(output_ivec4_tag100_mean(1,3,2:end-1)),max(output_ivec4_tag100_mean(1,4,2:end-1)),max(output_ivec4_tag100_mean(1,5,2:end-1)),max(output_ivec4_tag100_mean(1,6,2:end-1)),max(output_ivec4_tag100_mean(1,7,2:end-1)),max(output_ivec4_tag100_mean(1,8,2:end-1)));
% fprintf('&audio+meta  &ivec-Tag3  &(512,40) &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\  \n',max(output_ivec5_tag100_mean(1,1,2:end-1)),max(output_ivec5_tag100_mean(1,2,2:end-1)),max(output_ivec5_tag100_mean(1,3,2:end-1)),max(output_ivec5_tag100_mean(1,4,2:end-1)),max(output_ivec5_tag100_mean(1,5,2:end-1)),max(output_ivec5_tag100_mean(1,6,2:end-1)),max(output_ivec5_tag100_mean(1,7,2:end-1)),max(output_ivec5_tag100_mean(1,8,2:end-1)));
% fprintf('&audio+meta  &ivec-Tag3  &(512,100) &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\  \n',max(output_ivec6_tag100_mean(1,1,2:end-1)),max(output_ivec6_tag100_mean(1,2,2:end-1)),max(output_ivec6_tag100_mean(1,3,2:end-1)),max(output_ivec6_tag100_mean(1,4,2:end-1)),max(output_ivec6_tag100_mean(1,5,2:end-1)),max(output_ivec6_tag100_mean(1,6,2:end-1)),max(output_ivec6_tag100_mean(1,7,2:end-1)),max(output_ivec6_tag100_mean(1,8,2:end-1)));
% fprintf('&audio+meta  &ivec-Tag3  &(512,200) &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\  \n',max(output_ivec7_tag100_mean(1,1,2:end-1)),max(output_ivec7_tag100_mean(1,2,2:end-1)),max(output_ivec7_tag100_mean(1,3,2:end-1)),max(output_ivec7_tag100_mean(1,4,2:end-1)),max(output_ivec7_tag100_mean(1,5,2:end-1)),max(output_ivec7_tag100_mean(1,6,2:end-1)),max(output_ivec7_tag100_mean(1,7,2:end-1)),max(output_ivec7_tag100_mean(1,8,2:end-1)));
% fprintf('&audio+meta  &ivec-Tag3  &(512,400) &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\  \n',max(output_ivec8_tag100_mean(1,1,2:end-1)),max(output_ivec8_tag100_mean(1,2,2:end-1)),max(output_ivec8_tag100_mean(1,3,2:end-1)),max(output_ivec8_tag100_mean(1,4,2:end-1)),max(output_ivec8_tag100_mean(1,5,2:end-1)),max(output_ivec8_tag100_mean(1,6,2:end-1)),max(output_ivec8_tag100_mean(1,7,2:end-1)),max(output_ivec8_tag100_mean(1,8,2:end-1)));


% output_DeepLayerfp7_tag100_mean = mean(output_DeepLayerfp7_tag100,1);
% output_AVF_featAggrAVG_Norm_2_tag100_mean = mean(output_AVF_featAggrAVG_Norm_2_tag100,1);
%
%
% fprintf('&visual+meta  &Deep-Tag100  & &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\  \n',max(output_DeepLayerfp7_tag100_mean(1,1,2:end-1)),max(output_DeepLayerfp7_tag100_mean(1,2,2:end-1)),max(output_DeepLayerfp7_tag100_mean(1,3,2:end-1)),max(output_DeepLayerfp7_tag100_mean(1,4,2:end-1)),max(output_DeepLayerfp7_tag100_mean(1,5,2:end-1)),max(output_DeepLayerfp7_tag100_mean(1,6,2:end-1)),max(output_DeepLayerfp7_tag100_mean(1,7,2:end-1)),max(output_DeepLayerfp7_tag100_mean(1,8,2:end-1)));
% fprintf('&visual+meta  &AVF-Tag100  & &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\  \n',max(output_AVF_featAggrAVG_Norm_2_tag100_mean(1,1,2:end-1)),max(output_AVF_featAggrAVG_Norm_2_tag100_mean(1,2,2:end-1)),max(output_AVF_featAggrAVG_Norm_2_tag100_mean(1,3,2:end-1)),max(output_AVF_featAggrAVG_Norm_2_tag100_mean(1,4,2:end-1)),max(output_AVF_featAggrAVG_Norm_2_tag100_mean(1,5,2:end-1)),max(output_AVF_featAggrAVG_Norm_2_tag100_mean(1,6,2:end-1)),max(output_AVF_featAggrAVG_Norm_2_tag100_mean(1,7,2:end-1)),max(output_AVF_featAggrAVG_Norm_2_tag100_mean(1,8,2:end-1)));
%
