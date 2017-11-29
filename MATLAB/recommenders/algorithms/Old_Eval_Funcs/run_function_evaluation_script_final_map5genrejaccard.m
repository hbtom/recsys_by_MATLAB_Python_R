clear
clc




for rec = 1:3
    rec
    
    for fold = 1:5
        function_evaluation_script_final_map_deep(['RecSys_res_nn_10_feat_genre_jaccard'],fold,10,rec)
        
    end
    
    for fold = 1:5
        function_evaluation_script_final_mrr_deep(['RecSys_res_nn_10_feat_genre_jaccard'],fold,10,rec)
        
    end
    
end
