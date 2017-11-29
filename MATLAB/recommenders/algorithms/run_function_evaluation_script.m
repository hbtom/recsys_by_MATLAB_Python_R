clear
clc
close all

gmm_no = 512;
tvDim = 100;

for rec = 1 : 1
    
    for fold_no = 1:1
        % Tag 100
        fileName = ['RecSys_res_nn_10_feat_tag_cold_per_100_fld_' num2str(fold_no) 'of5_NEW.mat'];
        % i-vec
        fileName = ['RecSys_res_nn_10_feat_audio_ivec_gmm_' num2str(gmm_no) '_tvDim_' num2str(tvDim) '_fld_' num2str(fold_no) 'of5_NEW.mat'];
        
        %genre
        fileName = ['RecSys_res_nn_10_feat_genre_fld_' num2str(fold_no) 'of5_NEW_sr_5_min_ur_50_max_ur_100.mat'];
        function_evaluation_script(fileName,fold_no,10,rec,'MAP','MRR','Precision','Recall',[])

        function_evaluation_script(fileName,fold_no,10,rec,'MAP','MRR','Precision','Recall','Random')
    end

end
