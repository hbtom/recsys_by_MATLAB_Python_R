clear
clc
close all

g = 0;
t = 0;
for resp_ind = 1 : 18 
    for GMM_size = [16 32 64 128 256 512]
        g = g + 1;
        for tvDim = [10 20 50 100 200 400]
            t = t + 1;
            load(['/Users/yashar/Documents/MSR Identity Toolkit v1.0/code/clf/ivec_clf_data_GMM' num2str(GMM_size) '_tvDim' num2str(tvDim) '.mat']);
            GMM_size
            tvDim
            ivec_clf_dataF_table(:,[1,2,end-18]) = []                      ;
            inputTable = ivec_clf_dataF_table    ;
            printFlag = 0                        ;
            
            inputTable = ivec_clf_dataF_table(:,[1:end-18 end-18+resp_ind])     ;
            [a,best_validationAccuracy_1] = knn_classifier_gridSearch(inputTable,printFlag)       ;
            [b,best_validationAccuracy_2] = tree_classifier_gridSearch(inputTable,printFlag)       ;
            
             KNN_results(g,t,resp_ind) = best_validationAccuracy_1.value;
            TREE_results(g,t,resp_ind) = best_validationAccuracy_2.value;
            
             KNN_results_params{g,t,resp_ind} = best_validationAccuracy_1;
            TREE_results_params{g,t,resp_ind} = best_validationAccuracy_2;
        end
        
        
    end
    ivec_clf_dataF_table.Properties.VariableNames(end-18+resp_ind)

end