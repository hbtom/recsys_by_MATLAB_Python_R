clear
clc

rec = 1;
featAggr = 'AVG';
featComb = 'All';
for fold = 1:5
    try
        function_evaluation_script_final_map_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps_1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
    catch
        function_evaluation_script_final_map_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
        
    end
end

featAggr = 'AVGVAR';
for fold = 1:5
    try
        function_evaluation_script_final_map_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps_1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
    catch
        function_evaluation_script_final_map_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
        
    end
end

featAggr = 'MED';
for fold = 1:5
    try
        function_evaluation_script_final_map_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps_1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
    catch
        function_evaluation_script_final_map_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
        
    end
end

featAggr = 'MEDMAD';
for fold = 1:5
    try
        function_evaluation_script_final_map_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps_1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
    catch
        function_evaluation_script_final_map_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
        
    end
end

rec = 1;
featAggr = 'AVG';
for fold = 1:5
    try
        function_evaluation_script_final_mrr_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps_1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
    catch
        function_evaluation_script_final_mrr_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
        
    end
end

featAggr = 'AVGVAR';
for fold = 1:5
    try
        function_evaluation_script_final_mrr_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps_1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
    catch
        function_evaluation_script_final_mrr_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
        
    end
end

featAggr = 'MED';
for fold = 1:5
    try
        function_evaluation_script_final_mrr_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps_1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
    catch
        function_evaluation_script_final_mrr_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
        
    end
end

featAggr = 'MEDMAD';
for fold = 1:5
    try
        function_evaluation_script_final_mrr_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps_1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
    catch
        function_evaluation_script_final_mrr_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
        
    end
end
