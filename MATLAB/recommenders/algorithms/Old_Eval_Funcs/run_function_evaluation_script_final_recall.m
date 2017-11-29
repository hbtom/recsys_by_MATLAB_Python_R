clear
clc
close all

% rec = 1;
% featAggr = 'MEDMAD';
% featComb = 'All';
% for fold = 1:5
%     function_evaluation_script_final_map_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps_1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
% end


rec = 2;
featAggr = 'MEDMAD';
featComb = 'All';
for fold = 1:5
    function_evaluation_script_final_map_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps_1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
end

rec = 3;
featAggr = 'MEDMAD';
featComb = 'All';
for fold = 1:5
    function_evaluation_script_final_map_avf(['RecSys_res_nn_10_feat_AVF_trailers_fps_1_featAggr_' featAggr '_featComb_' featComb '_Norm_2'],fold,10,rec)
end

