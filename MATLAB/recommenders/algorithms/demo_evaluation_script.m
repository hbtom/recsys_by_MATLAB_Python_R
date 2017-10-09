           urmPred_Avg = sparse(urmPred_Avg);
               
       urmPred_weightedAvg = sparse(urmPred_weightedAvg);
  urmPred_weightedAvg_skg1 = sparse(urmPred_weightedAvg_skg1);
 urmPred_weightedAvg_skg01 = sparse(urmPred_weightedAvg_skg01);
urmPred_weightedAvg_skg001 = sparse(urmPred_weightedAvg_skg001);

       urmPred_SIMpow_weightedAvg = sparse(urmPred_SIMpow_weightedAvg);
  urmPred_SIMpow_weightedAvg_skg1 = sparse(urmPred_SIMpow_weightedAvg_skg1);
 urmPred_SIMpow_weightedAvg_skg01 = sparse(urmPred_SIMpow_weightedAvg_skg01);
urmPred_SIMpow_weightedAvg_skg001 = sparse(urmPred_SIMpow_weightedAvg_skg001);


                      output_urmPred_Avg = evaluate_urms(urmTest_New, urmPred_Avg);
              output_urmPred_weightedAvg = evaluate_urms(urmTest_New, urmPred_weightedAvg);
         output_urmPred_weightedAvg_skg1 = evaluate_urms(urmTest_New, urmPred_weightedAvg_skg1);
        output_urmPred_weightedAvg_skg01 = evaluate_urms(urmTest_New, urmPred_weightedAvg_skg01);
       output_urmPred_weightedAvg_skg001 = evaluate_urms(urmTest_New, urmPred_weightedAvg_skg001);
       output_SIMpow_urmPred_weightedAvg = evaluate_urms(urmTest_New, urmPred_SIMpow_weightedAvg);
  output_SIMpow_urmPred_weightedAvg_skg1 = evaluate_urms(urmTest_New, urmPred_SIMpow_weightedAvg_skg1);
 output_SIMpow_urmPred_weightedAvg_skg01 = evaluate_urms(urmTest_New, urmPred_SIMpow_weightedAvg_skg01);
output_SIMpow_urmPred_weightedAvg_skg001 = evaluate_urms(urmTest_New, urmPred_SIMpow_weightedAvg_skg001);

if strcmp(rand_rec_ON,'YES')
    outputRandom_rec = evaluate_urms_random(urmTest_New, urmPred_Avg);
else
    outputRandom_rec = [];
end

if strcmp(feature_name,'audio_ivec')
    % for i-vec
    save(fullfile(outAddr,['Eval_res_nn_' num2str(nn) '_feat_' feature_name '_gmm_' num2str(gmm_size) '_tvDim_' num2str(tvDim) '_fld_' num2str(fold_no) 'of5' '_rand_rec_ON_' rand_rec_ON '.mat']),...
        'output_urmPred_Avg','output_urmPred_weightedAvg','output_urmPred_weightedAvg_skg1',...
        'output_urmPred_weightedAvg_skg01','output_urmPred_weightedAvg_skg001','output_SIMpow_urmPred_weightedAvg_skg1',...
        'output_SIMpow_urmPred_weightedAvg','output_SIMpow_urmPred_weightedAvg_skg01','output_SIMpow_urmPred_weightedAvg_skg001','outputRandom_rec'); 
elseif strcmp(feature_name,'genre')
      save(fullfile(outAddr,['Eval_res_nn_' num2str(nn) '_feat_' feature_name '_fld_' num2str(fold_no) 'of5' '_rand_rec_ON_' rand_rec_ON '.mat']),...
        'output_urmPred_Avg','output_urmPred_weightedAvg','output_urmPred_weightedAvg_skg1',...
        'output_urmPred_weightedAvg_skg01','output_urmPred_weightedAvg_skg001','output_SIMpow_urmPred_weightedAvg_skg1',...
        'output_SIMpow_urmPred_weightedAvg','output_SIMpow_urmPred_weightedAvg_skg01','output_SIMpow_urmPred_weightedAvg_skg001','outputRandom_rec'); 
else
    save(fullfile(outAddr,['Eval_res_nn_' num2str(nn) '_feat_' feature_name '_fld_' num2str(fold_no) 'of5' '_rand_rec_ON_' rand_rec_ON '.mat']),...
        'output_urmPred_Avg','output_urmPred_weightedAvg','output_urmPred_weightedAvg_skg1',...
        'output_urmPred_weightedAvg_skg01','output_urmPred_weightedAvg_skg001','output_SIMpow_urmPred_weightedAvg_skg1',...
        'output_SIMpow_urmPred_weightedAvg','output_SIMpow_urmPred_weightedAvg_skg01','output_SIMpow_urmPred_weightedAvg_skg001','outputRandom_rec'); 
    
end
