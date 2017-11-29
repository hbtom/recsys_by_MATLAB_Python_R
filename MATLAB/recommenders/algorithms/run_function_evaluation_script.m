clear
clc
close all

for rec = 1 : 1
    
    for fold_no = 1:1
        fileName = ['RecSys_res_nn_10_feat_tag_cold_per_100_fld_' num2str(fold_no) 'of5_NEW.mat'];
        function_evaluation_script(fileName,fold_no,10,rec,'MAP','MRR','Precision','Recall',[])

        function_evaluation_script(fileName,fold_no,10,rec,'MAP','MRR','Precision','Recall','Random')
    end

end
