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
   
   featAggrList = {'AVG','AVGVAR','MED','MEDMAD'};
   featCombList = {'All'};
   hybridFeat = 'Tag95Ivec';  %
   metric = 'Recall';
   rec    = 1;
   combCnt = 0 ;
   aggrCnt = 0 ;
   
   gmm_no = 512;
   tvDim = 100;
   
   for combCnt = 1 : 1 %length(featCombList)
       for aggrCnt = 1 : 1 %length(featAggrList)
           featComb = featCombList{combCnt};
           featAggr = featAggrList{aggrCnt};
           
           s = [];
           for fld = 1 : 1
               % Tag 100%
               file   = ['Eval_res_RecSys_res_nn_10_feat_tag_cold_per_100_fld_' num2str(fld) 'of5_NEW.mat_cutoff_10_MAP_rec' num2str(rec) '.mat'];
               % Random
               file   = ['Eval_res_Random_fld_' num2str(fld) 'of5_NEW_cutoff_10_' metric '_rec' num2str(rec) '.mat'];
               
               % I-vec
              file = ['Eval_res_RecSys_res_nn_10_feat_audio_ivec_gmm_' num2str(gmm_no) '_tvDim_' num2str(tvDim) '_fld_1of5_NEW.mat_cutoff_10_' metric '_rec' num2str(rec) '.mat'];
               
               
%                file   = ['Eval_res_RecSys_res_nn_10_feat_tag_cold_per_98_fld_' num2str(fld) 'of5_cutoff_10_' metric '_rec' num2str(rec) '.mat'];
               %file   = ['Eval_res_HybridBodra_' hybridFeat '_fld_' num2str(fld) 'of5_cutoff_10_' metric '_rec' num2str(rec) '.mat'];
               %file   = ['Eval_res_nn_10_feat_audio_ivec_BLF_genre_tag_features_gmm_512_tv_40_fld_'  num2str(fld) 'of5_cutoff_10_' metric '_rec' num2str(rec) '.mat'];
               % file = ['Eval_res_RecSys_res_nn_10_feat_genre_jaccard_fld_' num2str(fld) 'of5_cutoff_10_' metric '_rec' num2str(rec) '.mat'];
               % file = ['Eval_res_RecSys_res_nn_10_feat_DeepLayerfp7_trailers_fps_1.0_featAggr_' featAggr '_featComb_' featComb '_featNorm_SSR2_fld_' num2str(fld) 'of5_cutoff_10_' metric '_rec' num2str(rec) '.mat'];
               load(fullfile(outAddr,'Eval',file));
               
                s(fld) = output4.recall_ranked_list;
%                sthr19(fld) = output.map_ranked_list_hybrid_thr19;
%                sthr28(fld) = output.map_ranked_list_hybrid_thr28;
%                sthr37(fld) = output.map_ranked_list_hybrid_thr37;
%                sthr46(fld) = output.map_ranked_list_hybrid_thr46;
%                sthr55(fld) = output.map_ranked_list_hybrid_thr55;
%                sthr64(fld) = output.map_ranked_list_hybrid_thr64;
%                sthr73(fld) = output.map_ranked_list_hybrid_thr73;
%                sthr82(fld) = output.map_ranked_list_hybrid_thr82;
%                sthr91(fld) = output.map_ranked_list_hybrid_thr91;
% %                
               
           end
           VAL1(combCnt,aggrCnt) = mean(s);
           
%            VAL11(combCnt,aggrCnt) = mean(sthr19);
%            VAL12(combCnt,aggrCnt) = mean(sthr28);
%            VAL13(combCnt,aggrCnt) = mean(sthr37);
%            VAL14(combCnt,aggrCnt) = mean(sthr46);
%            VAL15(combCnt,aggrCnt) = mean(sthr55);
%            VAL16(combCnt,aggrCnt) = mean(sthr64);
%            VAL17(combCnt,aggrCnt) = mean(sthr73);
%            VAL18(combCnt,aggrCnt) = mean(sthr82);
%            VAL19(combCnt,aggrCnt) = mean(sthr91);
           
       end
   end
  VAL1