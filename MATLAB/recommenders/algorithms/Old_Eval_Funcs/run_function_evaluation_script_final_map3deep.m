clear
clc

pause(200)
featAggr = 'MED'


for rec = 1:3
    rec
    featComb = 'All'
    
    for fold = 1:5
        function_evaluation_script_final_map_deep(['RecSys_res_nn_10_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_' featAggr '_featComb_' featComb '_featNorm_SSR2'],fold,10,rec)
        
    end
    
    for fold = 1:5
        function_evaluation_script_final_mrr_deep(['RecSys_res_nn_10_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_' featAggr '_featComb_' featComb '_featNorm_SSR2'],fold,10,rec)
        
    end
    
end
