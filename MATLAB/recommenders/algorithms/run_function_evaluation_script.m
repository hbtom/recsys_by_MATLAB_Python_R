clear
clc
close all



cut_off = 10;

for sr = [1]
    
    for min_ur = [50]
        for max_ur = [100]
            for rec = 1 : 1
                
                for fold_no = 1:1
                    sr
                    min_ur
                    max_ur
                    % i-vecs
                    fileName = ['RecSys_res_nn_10_feat_audio_ivec_gmm_256_tvDim_40_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                    function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP','MRR1','Precision1','Recall1',[])
                    
                    fileName = ['RecSys_res_nn_10_feat_genre_fld_' num2str(fold_no) 'of5_NEW_sr_' num2str(sr) '_min_ur_' num2str(min_ur) '_max_ur_' num2str(max_ur) '_nusmall_3000.mat'];
                    function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP','MRR1','Precision1','Recall1',[])
                    
                    function_evaluation_script(fileName,fold_no,cut_off,rec,'MAP','MRR1','Precision1','Recall1','Random')
                    disp('CHECK')
                end
                
            end
        end
    end
end