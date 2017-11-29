clear
clc


for rec = 1:3
    rec
    hybrid_feats = 'Tag95AVFall' %TagIvec GenreDeepfc7 TagDeepfc7 GenreAVFall TagAVFall IvecDeep IvecAVFall DeepAVFall
    
    for fold = 1:5
        fold
        function_evaluation_script_final_map_hybrid(hybrid_feats,fold,10,rec)
    end

   for fold = 1:5
        fold
        function_evaluation_script_final_mrr_hybrid(hybrid_feats,fold,10,rec)        
    end
    
end

