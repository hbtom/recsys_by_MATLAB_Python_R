clear
clc

rec =2;
tv = 40;

for fold = 1 : 5
    function_evaluation_script_final_map(256,tv,fold,10,rec)
    function_evaluation_script_final_mrr(256,tv,fold,10,rec)
    function_evaluation_script_final_precision(256,tv,fold,10,rec)
    function_evaluation_script_final_recall(256,tv,fold,10,rec)
end
