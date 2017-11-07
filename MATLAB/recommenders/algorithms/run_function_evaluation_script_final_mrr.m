clear
clc

pause(10500)

tv = 20;

for fold = 1 : 5
    rec =1;

    function_evaluation_script_final_map(256,tv,fold,10,rec)
    function_evaluation_script_final_mrr(256,tv,fold,10,rec)
    function_evaluation_script_final_precision(256,tv,fold,10,rec)
    function_evaluation_script_final_recall(256,tv,fold,10,rec)
    
    rec =2;

    function_evaluation_script_final_map(256,tv,fold,10,rec)
    function_evaluation_script_final_mrr(256,tv,fold,10,rec)
    function_evaluation_script_final_precision(256,tv,fold,10,rec)
    function_evaluation_script_final_recall(256,tv,fold,10,rec)
    
        rec =1;

    function_evaluation_script_final_map(512,tv,fold,10,rec)
    function_evaluation_script_final_mrr(512,tv,fold,10,rec)
    function_evaluation_script_final_precision(512,tv,fold,10,rec)
    function_evaluation_script_final_recall(512,tv,fold,10,rec)
    
    rec =2;

    function_evaluation_script_final_map(512,tv,fold,10,rec)
    function_evaluation_script_final_mrr(512,tv,fold,10,rec)
    function_evaluation_script_final_precision(512,tv,fold,10,rec)
    function_evaluation_script_final_recall(512,tv,fold,10,rec)
    
end
