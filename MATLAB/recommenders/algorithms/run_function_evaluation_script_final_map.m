clear
clc

pause(7000)
rec =2;
tv = 40;

for fold = 1 : 5
    function_evaluation_script_final_map(128,tv,fold,10,rec)
    function_evaluation_script_final_mrr(128,tv,fold,10,rec)
    function_evaluation_script_final_precision(128,tv,fold,10,rec)
    function_evaluation_script_final_recall(128,tv,fold,10,rec)
end
