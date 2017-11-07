clear
clc

clear
clc


for fold = 2 : 5
     function_evaluation_script_final_precision(256,40,fold,10,1)
    function_evaluation_script_final_map(256,40,fold,10,1)
    function_evaluation_script_final_mrr(256,40,fold,10,1)
    function_evaluation_script_final_recall(256,40,fold,10,1)
    
end