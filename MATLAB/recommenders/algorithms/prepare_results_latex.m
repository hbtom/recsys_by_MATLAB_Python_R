clear
clc
close all

cut_off = [1 3 4 5 10 20 30 50 100];

   fprintf('----------- Decision-Support METRICS ------------- \n')         

if ismac
    outAddr = '/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/algorithms/rec_results';
else
    outAddr = '/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/algorithms/rec_results';
end

fold_no = 1;
for nn = [5]
    for tvDim = 100
        for gmm_size= [128]
            file_name = ['Eval_results_nn_' num2str(nn) '_feature_audio_ivec_gmm_' num2str(gmm_size) '_tvDim_' num2str(tvDim) '_fold_' num2str(fold_no) 'of5.mat'];
            load(fullfile(outAddr,file_name));
            fprintf('KNN-Avg &i-vec &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n',nn,gmm_size,tvDim,...
                output_urmPred_Avg.Precision_all(1),output_urmPred_Avg.Precision_all(3),output_urmPred_Avg.Precision_all(5),output_urmPred_Avg.Precision_all(6),...
                output_urmPred_Avg.Recall_all(1),output_urmPred_Avg.Recall_all(3),output_urmPred_Avg.Recall_all(5),output_urmPred_Avg.Recall_all(6),...
                output_urmPred_Avg.F1_all(1),output_urmPred_Avg.F1_all(3),output_urmPred_Avg.F1_all(5),output_urmPred_Avg.F1_all(6));
            fprintf('KNN-wAvg &i-vec &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n',nn,gmm_size,tvDim,...
                output_urmPred_weightedAvg.Precision_all(1),output_urmPred_weightedAvg.Precision_all(3),output_urmPred_weightedAvg.Precision_all(5),output_urmPred_weightedAvg.Precision_all(6),...
                output_urmPred_weightedAvg.Recall_all(1),output_urmPred_weightedAvg.Recall_all(3),output_urmPred_weightedAvg.Recall_all(5),output_urmPred_weightedAvg.Recall_all(6),...
                output_urmPred_weightedAvg.F1_all(1),output_urmPred_weightedAvg.F1_all(3),output_urmPred_weightedAvg.F1_all(5),output_urmPred_weightedAvg.F1_all(6));
            fprintf('KNN-wAshr0.1 &i-vec &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n',nn,gmm_size,tvDim,...
                output_urmPred_weightedAvg_skg01.Precision_all(1),output_urmPred_weightedAvg_skg01.Precision_all(3),output_urmPred_weightedAvg_skg01.Precision_all(5),output_urmPred_weightedAvg_skg01.Precision_all(6),...
                output_urmPred_weightedAvg_skg01.Recall_all(1),output_urmPred_weightedAvg_skg01.Recall_all(3),output_urmPred_weightedAvg_skg01.Recall_all(5),output_urmPred_weightedAvg_skg01.Recall_all(6),...
                output_urmPred_weightedAvg_skg01.F1_all(1),output_urmPred_weightedAvg_skg01.F1_all(3),output_urmPred_weightedAvg_skg01.F1_all(5),output_urmPred_weightedAvg_skg01.F1_all(6));
            fprintf('KNN-wAshr0.01 &i-vec &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n',nn,gmm_size,tvDim,...
                output_urmPred_weightedAvg_skg001.Precision_all(1),output_urmPred_weightedAvg_skg001.Precision_all(3),output_urmPred_weightedAvg_skg001.Precision_all(5),output_urmPred_weightedAvg_skg001.Precision_all(6),...
                output_urmPred_weightedAvg_skg001.Recall_all(1),output_urmPred_weightedAvg_skg001.Recall_all(3),output_urmPred_weightedAvg_skg001.Recall_all(5),output_urmPred_weightedAvg_skg001.Recall_all(6),...
                output_urmPred_weightedAvg_skg001.F1_all(1),output_urmPred_weightedAvg_skg001.F1_all(3),output_urmPred_weightedAvg_skg001.F1_all(5),output_urmPred_weightedAvg_skg001.F1_all(6));
            fprintf('KNN-wAshr0.001 &i-vec &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n',nn,gmm_size,tvDim,...
                output_urmPred_weightedAvg_skg0001.Precision_all(1),output_urmPred_weightedAvg_skg0001.Precision_all(3),output_urmPred_weightedAvg_skg0001.Precision_all(5),output_urmPred_weightedAvg_skg0001.Precision_all(6),...
                output_urmPred_weightedAvg_skg0001.Recall_all(1),output_urmPred_weightedAvg_skg0001.Recall_all(3),output_urmPred_weightedAvg_skg0001.Recall_all(5),output_urmPred_weightedAvg_skg0001.Recall_all(6),...
                output_urmPred_weightedAvg_skg0001.F1_all(1),output_urmPred_weightedAvg_skg0001.F1_all(3),output_urmPred_weightedAvg_skg0001.F1_all(5),output_urmPred_weightedAvg_skg0001.F1_all(6));
            
            fprintf('\\hline \n')
        end
    end
end

fprintf('Random &i-vec &%s &%s &%s &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \\hline \n',' ',' ',' ',...
                outputRandom_rec.Precision_all(1),outputRandom_rec.Precision_all(3),outputRandom_rec.Precision_all(5),outputRandom_rec.Precision_all(6),...
                outputRandom_rec.Recall_all(1),outputRandom_rec.Recall_all(3),outputRandom_rec.Recall_all(5),outputRandom_rec.Recall_all(6),...
                outputRandom_rec.F1_all(1),outputRandom_rec.F1_all(3),outputRandom_rec.F1_all(5),outputRandom_rec.F1_all(6));
            
   fprintf('----------- RANK-AWARE METRICS ------------- \n')         
 fold_no = 1;
for nn = [5]
    for tvDim = 100
        for gmm_size= [128]
            file_name = ['Eval_results_nn_' num2str(nn) '_feature_audio_ivec_gmm_' num2str(gmm_size) '_tvDim_' num2str(tvDim) '_fold_' num2str(fold_no) 'of5.mat'];
            load(fullfile(outAddr,file_name));
            fprintf('KNN-Avg &i-vec &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n',nn,gmm_size,tvDim,...
                output_urmPred_Avg.MRR_all(1),output_urmPred_Avg.MRR_all(3),output_urmPred_Avg.MRR_all(5),output_urmPred_Avg.MRR_all(6),...
                output_urmPred_Avg.MAP_all(1),output_urmPred_Avg.MAP_all(3),output_urmPred_Avg.MAP_all(5),output_urmPred_Avg.MAP_all(6),...
                output_urmPred_Avg.NDCG_all(1),output_urmPred_Avg.NDCG_all(3),output_urmPred_Avg.NDCG_all(5),output_urmPred_Avg.NDCG_all(6));
            fprintf('KNN-wAvg &i-vec &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n',nn,gmm_size,tvDim,...
                output_urmPred_weightedAvg.MRR_all(1),output_urmPred_weightedAvg.MRR_all(3),output_urmPred_weightedAvg.MRR_all(5),output_urmPred_weightedAvg.MRR_all(6),...
                output_urmPred_weightedAvg.MAP_all(1),output_urmPred_weightedAvg.MAP_all(3),output_urmPred_weightedAvg.MAP_all(5),output_urmPred_weightedAvg.MAP_all(6),...
                output_urmPred_weightedAvg.NDCG_all(1),output_urmPred_weightedAvg.NDCG_all(3),output_urmPred_weightedAvg.NDCG_all(5),output_urmPred_weightedAvg.NDCG_all(6));
            fprintf('KNN-wAshr0.1 &i-vec &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n',nn,gmm_size,tvDim,...
                output_urmPred_weightedAvg_skg01.MRR_all(1),output_urmPred_weightedAvg_skg01.MRR_all(3),output_urmPred_weightedAvg_skg01.MRR_all(5),output_urmPred_weightedAvg_skg01.MRR_all(6),...
                output_urmPred_weightedAvg_skg01.MAP_all(1),output_urmPred_weightedAvg_skg01.MAP_all(3),output_urmPred_weightedAvg_skg01.MAP_all(5),output_urmPred_weightedAvg_skg01.MAP_all(6),...
                output_urmPred_weightedAvg_skg01.NDCG_all(1),output_urmPred_weightedAvg_skg01.NDCG_all(3),output_urmPred_weightedAvg_skg01.NDCG_all(5),output_urmPred_weightedAvg_skg01.NDCG_all(6));
            fprintf('KNN-wAshr0.01 &i-vec &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n',nn,gmm_size,tvDim,...
                output_urmPred_weightedAvg_skg001.MRR_all(1),output_urmPred_weightedAvg_skg001.MRR_all(3),output_urmPred_weightedAvg_skg001.MRR_all(5),output_urmPred_weightedAvg_skg001.MRR_all(6),...
                output_urmPred_weightedAvg_skg001.MAP_all(1),output_urmPred_weightedAvg_skg001.MAP_all(3),output_urmPred_weightedAvg_skg001.MAP_all(5),output_urmPred_weightedAvg_skg001.MAP_all(6),...
                output_urmPred_weightedAvg_skg001.NDCG_all(1),output_urmPred_weightedAvg_skg001.NDCG_all(3),output_urmPred_weightedAvg_skg001.NDCG_all(5),output_urmPred_weightedAvg_skg001.NDCG_all(6));
            fprintf('KNN-wAshr0.001 &i-vec &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n',nn,gmm_size,tvDim,...
                output_urmPred_weightedAvg_skg0001.MRR_all(1),output_urmPred_weightedAvg_skg0001.MRR_all(3),output_urmPred_weightedAvg_skg0001.MRR_all(5),output_urmPred_weightedAvg_skg0001.MRR_all(6),...
                output_urmPred_weightedAvg_skg0001.MAP_all(1),output_urmPred_weightedAvg_skg0001.MAP_all(3),output_urmPred_weightedAvg_skg0001.MAP_all(5),output_urmPred_weightedAvg_skg0001.MAP_all(6),...
                output_urmPred_weightedAvg_skg0001.NDCG_all(1),output_urmPred_weightedAvg_skg0001.NDCG_all(3),output_urmPred_weightedAvg_skg0001.NDCG_all(5),output_urmPred_weightedAvg_skg0001.NDCG_all(6));
            
            fprintf('\\hline \n')
        end
    end
end

fprintf('Random &i-vec &%s &%s &%s &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \\hline \n',' ',' ',' ',...
                outputRandom_rec.MRR_all(1),outputRandom_rec.MRR_all(3),outputRandom_rec.MRR_all(5),outputRandom_rec.MRR_all(6),...
                outputRandom_rec.MAP_all(1),outputRandom_rec.MAP_all(3),outputRandom_rec.MAP_all(5),outputRandom_rec.MAP_all(6),...
                outputRandom_rec.NDCG_all(1),outputRandom_rec.NDCG_all(3),outputRandom_rec.NDCG_all(5),outputRandom_rec.NDCG_all(6));           