clear
clc
close all

AlgList = {'Avg', 'wAvg', 'wAvg-1', 'wAvg-01', 'wAvg-001', ...
    's2-wAvg','s2-wAvg-1','s2-wAvg-01','s2-wAvg-001'};


   fprintf('----------- Decision-Support METRICS ------------- \n')         

if ismac
    
    outAddr = '/Volumes/SP PHD U3/OneDrive_Polimi/OneDrive - Politecnico di Milano/ECIR2018/Rec_Results';
    
elseif ispc

    outAddr = 'F:\OneDrive_Polimi\OneDrive - Politecnico di Milano\ECIR2018\Rec_Results';
    
    
end

metric = 'MAP';

for nn = [10]
    for tvDim = [100]
        for gmm_size = [128]
            for alg = 1
                for fld = 2 : 5
                file = ['Eval_res_nn_' num2str(nn) '_feat_audio_ivec_BLF_genre_tag_features_gmm_' num2str(gmm_size) '_tv_' num2str(tvDim) '_fld_' num2str(fld) 'of5_cutoff_10_' metric '_rec' num2str(alg) '.mat'];
                load(fullfile(outAddr,file));
                
                 metric_blf(fld) = output.map_ranked_list_blf_all;
                metric_ivec(fld) = output.map_ranked_list_ivec_all;
               metric_genre(fld) = output.map_ranked_list_genre_all;
                 metric_tag(fld) = output.map_ranked_list_tag_all;
                 
                 metric_ivec_blf(fld,1) = output.map_ranked_list_aggr_ivec_blf_thr19_all;
                 metric_ivec_blf(fld,2) = output.map_ranked_list_aggr_ivec_blf_thr28_all;
                 metric_ivec_blf(fld,3) = output.map_ranked_list_aggr_ivec_blf_thr37_all;
                 metric_ivec_blf(fld,4) = output.map_ranked_list_aggr_ivec_blf_thr46_all;
                 metric_ivec_blf(fld,5) = output.map_ranked_list_aggr_ivec_blf_thr55_all;
                 metric_ivec_blf(fld,6) = output.map_ranked_list_aggr_ivec_blf_thr64_all;
                 metric_ivec_blf(fld,7) = output.map_ranked_list_aggr_ivec_blf_thr73_all;
                 metric_ivec_blf(fld,8) = output.map_ranked_list_aggr_ivec_blf_thr82_all;
                 metric_ivec_blf(fld,9) = output.map_ranked_list_aggr_ivec_blf_thr91_all;
                 
            
                 metric_blf_genre(fld,1) = output.map_ranked_list_aggr_blf_genre_thr19_all;
                 metric_blf_genre(fld,2) = output.map_ranked_list_aggr_blf_genre_thr28_all;
                 metric_blf_genre(fld,3) = output.map_ranked_list_aggr_blf_genre_thr37_all;
                 metric_blf_genre(fld,4) = output.map_ranked_list_aggr_blf_genre_thr46_all;
                 metric_blf_genre(fld,5) = output.map_ranked_list_aggr_blf_genre_thr55_all;
                 metric_blf_genre(fld,6) = output.map_ranked_list_aggr_blf_genre_thr64_all;
                 metric_blf_genre(fld,7) = output.map_ranked_list_aggr_blf_genre_thr73_all;
                 metric_blf_genre(fld,8) = output.map_ranked_list_aggr_blf_genre_thr82_all;
                 metric_blf_genre(fld,9) = output.map_ranked_list_aggr_blf_genre_thr91_all;
                 
                 metric_blf_tag(fld,1) = output.map_ranked_list_aggr_blf_tag_thr19_all;
                 metric_blf_tag(fld,2) = output.map_ranked_list_aggr_blf_tag_thr28_all;
                 metric_blf_tag(fld,3) = output.map_ranked_list_aggr_blf_tag_thr37_all;
                 metric_blf_tag(fld,4) = output.map_ranked_list_aggr_blf_tag_thr46_all;
                 metric_blf_tag(fld,5) = output.map_ranked_list_aggr_blf_tag_thr55_all;
                 metric_blf_tag(fld,6) = output.map_ranked_list_aggr_blf_tag_thr64_all;
                 metric_blf_tag(fld,7) = output.map_ranked_list_aggr_blf_tag_thr73_all;
                 metric_blf_tag(fld,8) = output.map_ranked_list_aggr_blf_tag_thr82_all;
                 metric_blf_tag(fld,9) = output.map_ranked_list_aggr_blf_tag_thr91_all;
                 
                 
                 metric_ivec_genre(fld,1) = output.map_ranked_list_aggr_ivec_genre_thr19_all;
                 metric_ivec_genre(fld,2) = output.map_ranked_list_aggr_ivec_genre_thr28_all;
                 metric_ivec_genre(fld,3) = output.map_ranked_list_aggr_ivec_genre_thr37_all;
                 metric_ivec_genre(fld,4) = output.map_ranked_list_aggr_ivec_genre_thr46_all;
                 metric_ivec_genre(fld,5) = output.map_ranked_list_aggr_ivec_genre_thr55_all;
                 metric_ivec_genre(fld,6) = output.map_ranked_list_aggr_ivec_genre_thr64_all;
                 metric_ivec_genre(fld,7) = output.map_ranked_list_aggr_ivec_genre_thr73_all;
                 metric_ivec_genre(fld,8) = output.map_ranked_list_aggr_ivec_genre_thr82_all;
                 metric_ivec_genre(fld,9) = output.map_ranked_list_aggr_ivec_genre_thr91_all;
                 
                 metric_ivec_tag(fld,1) = output.map_ranked_list_aggr_ivec_tag_thr19_all;
                 metric_ivec_tag(fld,2) = output.map_ranked_list_aggr_ivec_tag_thr28_all;
                 metric_ivec_tag(fld,3) = output.map_ranked_list_aggr_ivec_tag_thr37_all;
                 metric_ivec_tag(fld,4) = output.map_ranked_list_aggr_ivec_tag_thr46_all;
                 metric_ivec_tag(fld,5) = output.map_ranked_list_aggr_ivec_tag_thr55_all;
                 metric_ivec_tag(fld,6) = output.map_ranked_list_aggr_ivec_tag_thr64_all;
                 metric_ivec_tag(fld,7) = output.map_ranked_list_aggr_ivec_tag_thr73_all;
                 metric_ivec_tag(fld,8) = output.map_ranked_list_aggr_ivec_tag_thr82_all;
                 metric_ivec_tag(fld,9) = output.map_ranked_list_aggr_ivec_tag_thr91_all;
                 
                 
                end
            end
        end
    end
end

pairs = [0.1 0.9;
         0.2 0.8;
         0.3 0.7;
         0.4 0.6;
         0.5 0.5;
         0.6 0.4;
         0.7 0.3;
         0.8 0.2;
         0.9 0.1];

  mean_metric_blf = mean(metric_blf)
 mean_metric_ivec = mean(metric_ivec)
mean_metric_genre = mean(metric_genre)
  mean_metric_tag = mean(metric_tag)
[mean_metric_ivec_blf,ind1] = max(mean(metric_ivec_blf))
[mean_metric_blf_genre,ind2] = max(mean(metric_blf_genre))
[mean_metric_blf_tag,ind3] = max(mean(metric_blf_tag))
[mean_metric_ivec_genre,ind4] = max(mean(metric_ivec_genre))
[mean_metric_ivec_tag,ind5] = max(mean(metric_ivec_tag))


          

% for nn = [10]
%     for tvDim = [100]
%         for gmm_size= [128]
%             for alg = 6 :9
%                 PR_aud = [];
%                 PR_gen = [];
%                 PR_hy1 = [];
%                 PR_hy2 = [];
%                 PR_hy3 = [];
%                 PR_hy4 = [];
%                 PR_hy5 = [];
%                 PR_hy6 = [];
%                 PR_hy7 = [];
%                 PR_hy8 = [];
%                 PR_hy9 = [];
%                 
%             for fold_no = 1:5
%                 cut_off = 10 ;
%             file_name =['Eval_res_nn_' num2str(nn) '_feat_genre_audio_ivec_gmm_' num2str(gmm_size) '_tvDim_' num2str(tvDim) '_fld_' num2str(fold_no) 'of5_cutoff_' num2str(cut_off) '.mat'];
%  
%             load(fullfile(outAddr,file_name));
%             
%             eval(['PR_aud(fold_no) = output.MRR_all_1' num2str(alg) ';'])
%             eval(['PR_gen(fold_no) = output.MRR_all_2' num2str(alg) ';'])
%             eval(['PR_hy1(fold_no)  = output.MRR_all_ag_thr1_' num2str(alg) ';'])
%             eval(['PR_hy2(fold_no)  = output.MRR_all_ag_thr2_' num2str(alg) ';'])
%             eval(['PR_hy3(fold_no)  = output.MRR_all_ag_thr3_' num2str(alg) ';'])
%             eval(['PR_hy4(fold_no)  = output.MRR_all_ag_thr4_' num2str(alg) ';'])
%             eval(['PR_hy5(fold_no)  = output.MRR_all_ag_thr5_' num2str(alg) ';'])
%             eval(['PR_hy6(fold_no)  = output.MRR_all_ag_thr6_' num2str(alg) ';'])
%             eval(['PR_hy7(fold_no)  = output.MRR_all_ag_thr7_' num2str(alg) ';'])
%             eval(['PR_hy8(fold_no)  = output.MRR_all_ag_thr8_' num2str(alg) ';'])
%             eval(['PR_hy9(fold_no)  = output.MRR_all_ag_thr9_' num2str(alg) ';'])
% 
% 
%             eval(['Re_aud(fold_no) = output.MAP_all_1' num2str(alg) ';'])
%             eval(['Re_gen(fold_no) = output.MAP_all_2' num2str(alg) ';'])
%             eval(['Re_hy1(fold_no)  = output.MAP_all_ag_thr1_' num2str(alg) ';'])
%             eval(['Re_hy2(fold_no)  = output.MAP_all_ag_thr2_' num2str(alg) ';'])
%             eval(['Re_hy3(fold_no)  = output.MAP_all_ag_thr3_' num2str(alg) ';'])
%             eval(['Re_hy4(fold_no)  = output.MAP_all_ag_thr4_' num2str(alg) ';'])
%             eval(['Re_hy5(fold_no)  = output.MAP_all_ag_thr5_' num2str(alg) ';'])
%             eval(['Re_hy6(fold_no)  = output.MAP_all_ag_thr6_' num2str(alg) ';'])
%             eval(['Re_hy7(fold_no)  = output.MAP_all_ag_thr7_' num2str(alg) ';'])
%             eval(['Re_hy8(fold_no)  = output.MAP_all_ag_thr8_' num2str(alg) ';'])
%             eval(['Re_hy9(fold_no)  = output.MAP_all_ag_thr9_' num2str(alg) ';'])
%             
%             end
%             fprintf('\\multirow{10}{*}{%s} &- &- &i-vec &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n ',AlgList{alg},nn,tvDim, gmm_size,...
%                 PR_aud(1),PR_aud(2),PR_aud(3),PR_aud(4),PR_aud(5),mean(PR_aud),Re_aud(1),Re_aud(2),Re_aud(3),Re_aud(4),Re_aud(5),mean(Re_aud));
%             fprintf(' &- &- &genre &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n ',nn,tvDim, gmm_size,...
%                 PR_gen(1),PR_gen(2),PR_gen(3),PR_gen(4),PR_gen(5),mean(PR_gen),Re_gen(1),Re_gen(2),Re_gen(3),Re_gen(4),Re_gen(5),mean(Re_gen));
%             fprintf(' &0.1 &0.9 &Hy(rank) &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n ',nn,tvDim, gmm_size,...
%                 PR_hy2(1),PR_hy2(2),PR_hy2(3),PR_hy2(4),PR_hy2(5),mean(PR_hy2),Re_hy2(1),Re_hy2(2),Re_hy2(3),Re_hy2(4),Re_hy2(5),mean(Re_hy2));
%             fprintf(' &0.2 &0.8 &Hy(rank) &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n ',nn,tvDim, gmm_size,...
%                 PR_hy3(1),PR_hy3(2),PR_hy3(3),PR_hy3(4),PR_hy3(5),mean(PR_hy3),Re_hy3(1),Re_hy3(2),Re_hy3(3),Re_hy3(4),Re_hy3(5),mean(Re_hy3));
%             fprintf(' &0.3 &0.7 &Hy(rank) &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n ',nn,tvDim, gmm_size,...
%                 PR_hy4(1),PR_hy4(2),PR_hy4(3),PR_hy4(4),PR_hy4(5),mean(PR_hy4),Re_hy4(1),Re_hy4(2),Re_hy4(3),Re_hy4(4),Re_hy4(5),mean(Re_hy4));
%             fprintf(' &0.4 &0.6 &Hy(rank) &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n ',nn,tvDim, gmm_size,...
%                 PR_hy5(1),PR_hy5(2),PR_hy5(3),PR_hy5(4),PR_hy5(5),mean(PR_hy5),Re_hy5(1),Re_hy5(2),Re_hy5(3),Re_hy5(4),Re_hy5(5),mean(Re_hy5));
% %             fprintf(' &0.5 &0.5 &Hy(rank) &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n ',nn,tvDim, gmm_size,...
% %                 PR_hy1(1),PR_hy1(2),PR_hy1(3),PR_hy1(4),PR_hy1(5),mean(PR_hy1),Re_hy1(1),Re_hy1(2),Re_hy1(3),Re_hy1(4),Re_hy1(5),mean(Re_hy1));
% %             fprintf(' &0.6 &0.4 &Hy(rank) &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n ',nn,tvDim, gmm_size,...
% %                 PR_hy6(1),PR_hy6(2),PR_hy6(3),PR_hy6(4),PR_hy6(5),mean(PR_hy6),Re_hy6(1),Re_hy6(2),Re_hy6(3),Re_hy6(4),Re_hy6(5),mean(Re_hy6));
% %             fprintf(' &0.7 &0.3 &Hy(rank) &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n ',nn,tvDim, gmm_size,...
% %                 PR_hy7(1),PR_hy7(2),PR_hy7(3),PR_hy7(4),PR_hy7(5),mean(PR_hy7),Re_hy7(1),Re_hy7(2),Re_hy7(3),Re_hy7(4),Re_hy7(5),mean(Re_hy7));
% %             fprintf(' &0.8 &0.2 &Hy(rank) &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n ',nn,tvDim, gmm_size,...
% %                 PR_hy8(1),PR_hy8(2),PR_hy8(3),PR_hy8(4),PR_hy8(5),mean(PR_hy8),Re_hy8(1),Re_hy8(2),Re_hy8(3),Re_hy8(4),Re_hy8(5),mean(Re_hy8));
% %              fprintf(' &0.9 &0.1 &Hy(rank) &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \\hline \n ',nn,tvDim, gmm_size,...
% %                 PR_hy9(1),PR_hy9(2),PR_hy9(3),PR_hy9(4),PR_hy9(5),mean(PR_hy9),Re_hy9(1),Re_hy9(2),Re_hy9(3),Re_hy9(4),Re_hy9(5),mean(Re_hy9));     
% %             end
% %         end
% %     end
% % end
% 
% 
% for nn = [10]
%     for tvDim = [200]
%         for gmm_size= [128]
%             for alg = 6 : 9
%                 PR_aud = [];
%                 PR_gen = [];
%                 PR_hy1 = [];
%                 PR_hy2 = [];
%                 PR_hy3 = [];
%                 PR_hy4 = [];
%                 PR_hy5 = [];
%                 PR_hy6 = [];
%                 PR_hy7 = [];
%                 PR_hy8 = [];
%                 PR_hy9 = [];
%                 
%             for fold_no = 1:5
%                 cut_off = 10 ;
%             file_name =['Eval_res_nn_' num2str(nn) '_feat_audio_ivec_gmm_' num2str(gmm_size) '_tvDim_' num2str(tvDim) '_fld_' num2str(fold_no) 'of5_cutoff_' num2str(cut_off) '.mat'];
%             load(fullfile(outAddr,file_name));
%             
%             
%             eval(['PR_aud(fold_no) = output.Precision_all_1' num2str(alg) ';'])
%             eval(['PR_gen(fold_no) = output.Precision_all_2' num2str(alg) ';'])
%             eval(['PR_hy1(fold_no)  = output.Precision_all_ag_thr1_' num2str(alg) ';'])
%             eval(['PR_hy2(fold_no)  = output.Precision_all_ag_thr2_' num2str(alg) ';'])
%             eval(['PR_hy3(fold_no)  = output.Precision_all_ag_thr3_' num2str(alg) ';'])
%             eval(['PR_hy4(fold_no)  = output.Precision_all_ag_thr4_' num2str(alg) ';'])
%             eval(['PR_hy5(fold_no)  = output.Precision_all_ag_thr5_' num2str(alg) ';'])
%             eval(['PR_hy6(fold_no)  = output.Precision_all_ag_thr6_' num2str(alg) ';'])
%             eval(['PR_hy7(fold_no)  = output.Precision_all_ag_thr7_' num2str(alg) ';'])
%             eval(['PR_hy8(fold_no)  = output.Precision_all_ag_thr8_' num2str(alg) ';'])
%             eval(['PR_hy9(fold_no)  = output.Precision_all_ag_thr9_' num2str(alg) ';'])
% 
% 
%             eval(['Re_aud(fold_no) = output.Recall_all_1' num2str(alg) ';'])
%             eval(['Re_gen(fold_no) = output.Recall_all_2' num2str(alg) ';'])
%             eval(['Re_hy1(fold_no)  = output.Recall_all_ag_thr1_' num2str(alg) ';'])
%             eval(['Re_hy2(fold_no)  = output.Recall_all_ag_thr2_' num2str(alg) ';'])
%             eval(['Re_hy3(fold_no)  = output.Recall_all_ag_thr3_' num2str(alg) ';'])
%             eval(['Re_hy4(fold_no)  = output.Recall_all_ag_thr4_' num2str(alg) ';'])
%             eval(['Re_hy5(fold_no)  = output.Recall_all_ag_thr5_' num2str(alg) ';'])
%             eval(['Re_hy6(fold_no)  = output.Recall_all_ag_thr6_' num2str(alg) ';'])
%             eval(['Re_hy7(fold_no)  = output.Recall_all_ag_thr7_' num2str(alg) ';'])
%             eval(['Re_hy8(fold_no)  = output.Recall_all_ag_thr8_' num2str(alg) ';'])
%             eval(['Re_hy9(fold_no)  = output.Recall_all_ag_thr9_' num2str(alg) ';'])
%             
%                 eval(['MRR_aud(fold_no) = output.MRR_all_1' num2str(alg) ';'])
%             eval(['MRR_gen(fold_no) = output.MRR_all_2' num2str(alg) ';'])
%             eval(['MRR_hy1(fold_no)  = output.MRR_all_ag_thr1_' num2str(alg) ';'])
%             eval(['MRR_hy2(fold_no)  = output.MRR_all_ag_thr2_' num2str(alg) ';'])
%             eval(['MRR_hy3(fold_no)  = output.MRR_all_ag_thr3_' num2str(alg) ';'])
%             eval(['MRR_hy4(fold_no)  = output.MRR_all_ag_thr4_' num2str(alg) ';'])
%             eval(['MRR_hy5(fold_no)  = output.MRR_all_ag_thr5_' num2str(alg) ';'])
%             eval(['MRR_hy6(fold_no)  = output.MRR_all_ag_thr6_' num2str(alg) ';'])
%             eval(['MRR_hy7(fold_no)  = output.MRR_all_ag_thr7_' num2str(alg) ';'])
%             eval(['MRR_hy8(fold_no)  = output.MRR_all_ag_thr8_' num2str(alg) ';'])
%             eval(['MRR_hy9(fold_no)  = output.MRR_all_ag_thr9_' num2str(alg) ';'])
% 
% 
%             eval(['MAP_aud(fold_no) = output.MAP_all_1' num2str(alg) ';'])
%             eval(['MAP_gen(fold_no) = output.MAP_all_2' num2str(alg) ';'])
%             eval(['MAP_hy1(fold_no)  = output.MAP_all_ag_thr1_' num2str(alg) ';'])
%             eval(['MAP_hy2(fold_no)  = output.MAP_all_ag_thr2_' num2str(alg) ';'])
%             eval(['MAP_hy3(fold_no)  = output.MAP_all_ag_thr3_' num2str(alg) ';'])
%             eval(['MAP_hy4(fold_no)  = output.MAP_all_ag_thr4_' num2str(alg) ';'])
%             eval(['MAP_hy5(fold_no)  = output.MAP_all_ag_thr5_' num2str(alg) ';'])
%             eval(['MAP_hy6(fold_no)  = output.MAP_all_ag_thr6_' num2str(alg) ';'])
%             eval(['MAP_hy7(fold_no)  = output.MAP_all_ag_thr7_' num2str(alg) ';'])
%             eval(['MAP_hy8(fold_no)  = output.MAP_all_ag_thr8_' num2str(alg) ';'])
%             eval(['MAP_hy9(fold_no)  = output.MAP_all_ag_thr9_' num2str(alg) ';'])
%             
%             end
%             fprintf('\\multirow{10}{*}{%s} &- &- &i-vec &%d &%d &%d &{\\color{cyan} \\textbf{%0.4f}} &{\\color{cyan} \\textbf{%0.4f}} &{\\color{cyan} \\textbf{%0.4f}} &{\\color{cyan} \\textbf{%0.4f}} \\\\ \n ',AlgList{alg},'','','',...
%                     mean(PR_aud),mean(Re_aud),mean(MRR_aud),mean(MAP_aud));
%             fprintf(' &- &- &genre &%d &%d &%d &{\\color{red} \\textbf{%0.4f}} &{\\color{red} \\textbf{%0.4f}} &{\\color{red} \\textbf{%0.4f}} &{\\color{red} \\textbf{%0.4f}} \\\\ \n ','','','',...
%                     mean(PR_gen),mean(Re_gen),mean(MRR_gen),mean(MAP_gen));
%             fprintf(' &0.1 &0.9 &Hy(rank) &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n ','','','',...
%                     mean(PR_hy2),mean(Re_hy2),mean(MRR_hy2),mean(MAP_hy2));
%             fprintf(' &0.2 &0.8 &Hy(rank) &%d &%d &%d &{\\color{blue} \\textbf{%0.4f}} &{\\color{blue} \\textbf{%0.4f}} &{\\color{blue} \\textbf{%0.4f}} &{\\color{blue} \\textbf{%0.4f}} \\\\ \n ','','','',...
%                     mean(PR_hy3),mean(Re_hy3),mean(MRR_hy3),mean(MAP_hy3));
%             fprintf(' &0.3 &0.7 &Hy(rank) &%d &%d &%d &{\\color{blue} \\textbf{%0.4f}} &{\\color{blue} \\textbf{%0.4f}} &{\\color{blue} \\textbf{%0.4f}} &{\\color{blue} \\textbf{%0.4f}} \\\\ \n ','','','',...
%                     mean(PR_hy4),mean(Re_hy4),mean(MRR_hy4),mean(MAP_hy4));
%             fprintf(' &0.4 &0.6 &Hy(rank) &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n ',nn,tvDim, gmm_size,...
%                     mean(PR_hy5),mean(Re_hy5),mean(MRR_hy5),mean(MAP_hy5));
%             fprintf(' &0.5 &0.5 &Hy(rank) &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f\\\\ \n ','','','',...
%                     mean(PR_hy1),mean(Re_hy1),mean(MRR_hy1),mean(MAP_hy1));
%             fprintf(' &0.6 &0.4 &Hy(rank) &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n ','','','',...
%                     mean(PR_hy6),mean(Re_hy6),mean(MRR_hy6),mean(MAP_hy6));
%             fprintf(' &0.7 &0.3 &Hy(rank) &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n ','','','',...
%                     mean(PR_hy7),mean(Re_hy7),mean(MRR_hy7),mean(MAP_hy7));
%             fprintf(' &0.8 &0.2 &Hy(rank) &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \n ','','','',...
%                     mean(PR_hy8),mean(Re_hy8),mean(MRR_hy8),mean(MAP_hy8));
%              fprintf(' &0.9 &0.1 &Hy(rank) &%d &%d &%d &%0.4f &%0.4f &%0.4f &%0.4f \\\\ \\hline \n ','','','',...
%                     mean(PR_hy9),mean(Re_hy9),mean(MRR_hy9),mean(MAP_hy9));     
%             end
%         end
%     end
% end