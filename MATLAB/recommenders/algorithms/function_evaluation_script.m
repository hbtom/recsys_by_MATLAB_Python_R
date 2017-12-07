function output = function_evaluation_script(fature_name,fold_no,cut_off,flag_rec,metric1,metric2,metric3,metric4,baselineFeature)

if ismac
    
    addpath('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/utils/rec');
    addpath('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/metrics');
        rootAddr = '/Volumes/SP PHD U3/OneDrive_Polimi/OneDrive - Politecnico di Milano/dataset/';
         outAddr = '/Volumes/SP PHD U3/OneDrive_Polimi/OneDrive - Politecnico di Milano/ECIR2018/Rec_Results';
    metaDataAddr = '/Volumes/SP PHD U3/OneDrive_Polimi/OneDrive - Politecnico di Milano/dataset/metadata';
    
elseif ispc
    addpath('C:\Users\Yas\Documents\GitHub\MATLAB\utils\rec');
    addpath('C:\Users\Yas\Documents\GitHub\MATLAB\recommenders\metrics');
    rootAddr = 'F:\OneDrive_Polimi\OneDrive - Politecnico di Milano\dataset';
    outAddr = 'F:\OneDrive_Polimi\OneDrive - Politecnico di Milano\ECIR2018\Rec_Results';
    metaDataAddr = 'F:\OneDrive_Polimi\OneDrive - Politecnico di Milano\dataset\metadata';
    
    
end


load(fullfile(outAddr,[fature_name]));

urmPred1_str.urm1 = urmPred_Avg;
urmPred1_str.urm2 = urmPred_weightedAvg;
urmPred1_str.urm3 = urmPred_SIMpow_weightedAvg;
    



fold_no
if strcmp(metric1,'MAP')
    output = evaluate_urms_custom_map(urmTest_New,urmPred1_str,cut_off,flag_rec,baselineFeature)
    if strcmp(baselineFeature,'Random')
        fature_name = [baselineFeature '_fld_' num2str(fold_no) 'of5_NEW'];
    end
    save(fullfile(outAddr,'Eval',['Eval_res_' fature_name '_cutoff_' num2str(cut_off) '_MAP_rec' num2str(flag_rec) '.mat']),'output','fold_no','cut_off','-v7.3');
end
if strcmp(metric2,'MRR')
    
    output = evaluate_urms_custom_mrr(urmTest_New,urmPred1_str,cut_off,flag_rec,baselineFeature)
    if strcmp(baselineFeature,'Random')
        fature_name = [baselineFeature '_fld_' num2str(fold_no) 'of5_NEW'];
    end
    
    save(fullfile(outAddr,'Eval',['Eval_res_' fature_name '_cutoff_' num2str(cut_off) '_MRR_rec' num2str(flag_rec) '.mat']),'output','fold_no','cut_off','-v7.3');
end
if strcmp(metric3,'Precision')
    
    output = evaluate_urms_custom_precision(urmTest_New,urmPred1_str,cut_off,flag_rec,baselineFeature)
    
    if strcmp(baselineFeature,'Random')
        fature_name = [baselineFeature '_fld_' num2str(fold_no) 'of5_NEW'];
    end
    save(fullfile(outAddr,'Eval',['Eval_res_' fature_name '_cutoff_' num2str(cut_off) '_Precision_rec' num2str(flag_rec) '.mat']),'output','fold_no','cut_off','-v7.3');
end
if strcmp(metric4,'Recall')
    
    output = evaluate_urms_custom_recall(urmTest_New,urmPred1_str,cut_off,flag_rec,baselineFeature)
    
    if strcmp(baselineFeature,'Random')
        fature_name = [baselineFeature '_fld_' num2str(fold_no) 'of5_NEW'];
    end
    save(fullfile(outAddr,'Eval',['Eval_res_' fature_name '_cutoff_' num2str(cut_off) '_Recall_rec' num2str(flag_rec) '.mat']),'output','fold_no','cut_off','-v7.3');
end

 
 
 
 