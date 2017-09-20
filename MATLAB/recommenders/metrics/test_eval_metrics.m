% This script is for testing recommender systems evaluation metrics. The 
% following metrics are implemented:
%
%   + Decision-support Metrics: Precision, Recall
%   + Rank-aware Metrics: MAP, MRR, NDCG
%
% Yashar Deldjoo
% September 14-21, 2017 
% Politecnico di Milano, Italy
% Johannes Kepler University, Linz, Austria

clear
clc
close all

import matlab.unittest.TestCase
import matlab.unittest.constraints.IsEqualTo
import matlab.unittest.constraints.AbsoluteTolerance

testCase = TestCase.forInteractiveUse;

 ranked_list_1 = [2 5 1 4 3] ;
 ranked_list_2 = [10 8 3 5 1]; 
 pos_items_ids = [1 5 4 3]   ;
 
 %% 
 fprintf('Testing Precision ... \n')
 testCase.verifyThat(precision_at_k(ranked_list_1,pos_items_ids,3),IsEqualTo(2/3))
 testCase.verifyThat(precision_at_k(ranked_list_1,pos_items_ids,5),IsEqualTo(4/5))
 testCase.verifyThat(precision_at_k(ranked_list_2,pos_items_ids,3),IsEqualTo(1/3))
 testCase.verifyThat(precision_at_k(ranked_list_2,pos_items_ids,5),IsEqualTo(3/5))
 
 expVals = [0 1/2 2/3 3/4 4/5];
 for k = 1 : 5
     testCase.verifyThat(precision_at_k(ranked_list_1,pos_items_ids,k),IsEqualTo(expVals(k)));   
 end

 %%
 fprintf('\n')
 fprintf('............................................. \n')
 fprintf('\n')

 fprintf('Testing Recall ... \n')
 testCase.verifyThat(recall_at_k(ranked_list_1,pos_items_ids,3),IsEqualTo(2/4))
 testCase.verifyThat(recall_at_k(ranked_list_1,pos_items_ids,5),IsEqualTo(4/4))
 testCase.verifyThat(recall_at_k(ranked_list_2,pos_items_ids,3),IsEqualTo(1/4))
 testCase.verifyThat(recall_at_k(ranked_list_2,pos_items_ids,5),IsEqualTo(3/4))
 
 expVals = [0 1/4 2/4 3/4 4/4];
 for k = 1 : 5
     testCase.verifyThat(recall_at_k(ranked_list_1,pos_items_ids,k),IsEqualTo(expVals(k)));   
 end


 %%
 fprintf('\n')
 fprintf('............................................. \n')
 fprintf('\n')

 fprintf('Testing AP ... \n')
 testCase.verifyThat(AP_at_k(ranked_list_1,pos_items_ids,3),IsEqualTo(7/18,'Within', AbsoluteTolerance(1e-10)))
 testCase.verifyThat(AP_at_k(ranked_list_1,pos_items_ids,5),IsEqualTo(163/240,'Within', AbsoluteTolerance(1e-10)))
 testCase.verifyThat(AP_at_k(ranked_list_2,pos_items_ids,3),IsEqualTo(1/9,'Within', AbsoluteTolerance(1e-10)))
 testCase.verifyThat(AP_at_k(ranked_list_2,pos_items_ids,5),IsEqualTo(43/120,'Within', AbsoluteTolerance(1e-10)))

 pos_items_ids = [1, 3, 5, 10];
 ranked_list_1 = [1, 3, 5, 4, 9];
 ranked_list_2 = [1, 3, 4, 9, 5];
 ranked_list_3 = [4, 9, 1, 3, 5];
 ranked_list_4 = [12, 11, 13, 17, 15, 16, 1, 3, 5, 10];
 ranked_list_5 = [1, 11, 12, 13, 14, 15, 4, 5, 10, 16];
 ranked_list_6 = [1, 3, 12, 13, 14, 15, 11,  10,8, 16];
       

 testCase.verifyThat(AP_at_k(ranked_list_1,pos_items_ids,5),IsEqualTo((1/1 + 2/2 + 3/3) / 4,'Within', AbsoluteTolerance(1e-10)))
 testCase.verifyThat(AP_at_k(ranked_list_2,pos_items_ids,5),IsEqualTo((1/1 + 2/2 + 3/5) / 4,'Within', AbsoluteTolerance(1e-10)))
 testCase.verifyThat(AP_at_k(ranked_list_3,pos_items_ids,5),IsEqualTo((1/3 + 2/4 + 3/5) / 4,'Within', AbsoluteTolerance(1e-10)))
 testCase.verifyThat(AP_at_k(ranked_list_4,pos_items_ids,10),IsEqualTo((1/7 + 2/8 + 3/9 + 4/10)/ 4,'Within', AbsoluteTolerance(1e-10)))
 testCase.verifyThat(AP_at_k(ranked_list_5,pos_items_ids,10),IsEqualTo((1/1 + 2/8 + 3/9)/ 4,'Within', AbsoluteTolerance(1e-10)))
 testCase.verifyThat(AP_at_k(ranked_list_6,pos_items_ids,10),IsEqualTo((1/1 + 2/2 + 3/8)/ 4,'Within', AbsoluteTolerance(1e-10)))

  %%
 fprintf('\n')
 fprintf('............................................. \n')
 fprintf('\n')

 fprintf('Testing RR ... \n')
 
 pos_items_ids = [1 5 4 3];
 ranked_list_1 = [2 5 1 4 3];
 ranked_list_2 = [10 8 3 5 1];
 ranked_list_3 = [10 7 8 3 2]; 


 testCase.verifyThat(RR_at_k(ranked_list_1,pos_items_ids,3),IsEqualTo((1/2),'Within', AbsoluteTolerance(1e-10)))
 testCase.verifyThat(RR_at_k(ranked_list_1,pos_items_ids,5),IsEqualTo((1/2),'Within', AbsoluteTolerance(1e-10)))
 testCase.verifyThat(RR_at_k(ranked_list_2,pos_items_ids,3),IsEqualTo((1/3),'Within', AbsoluteTolerance(1e-10)))
 testCase.verifyThat(RR_at_k(ranked_list_2,pos_items_ids,5),IsEqualTo((1/3),'Within', AbsoluteTolerance(1e-10)))
 testCase.verifyThat(RR_at_k(ranked_list_3,pos_items_ids,3),IsEqualTo((0),'Within', AbsoluteTolerance(1e-10)))
 testCase.verifyThat(RR_at_k(ranked_list_3,pos_items_ids,5),IsEqualTo((1/4),'Within', AbsoluteTolerance(1e-10)))
 %%
 fprintf('\n')
 fprintf('............................................. \n')
 fprintf('\n')

 fprintf('Testing NDCG ... \n')
 
ranked_list_1 = [2 1 5 4 3];   
ranked_list_2 = [2 4 3 1 5];  
ranked_list_3 = [10 8 3 5 1];
pos_items_ids = [1 5 4 3];
pos_relevance_scores = [5 5 4 4];

IDCG = 5/log2(2)+5/log2(3)+4/log2(4)+4/log2(5);  % rating gain
DCG1 = 5/log2(3)+5/log2(4)+4/log2(5)+4/log2(6);  % rating gain
DCG2 = 4/log2(3)+4/log2(4)+5/log2(5)+5/log2(6);  % rating gain
DCG3 = 4/log2(4)+5/log2(5)+5/log2(6);            % rating gain

testCase.verifyThat(NDCG(ranked_list_1,pos_items_ids,pos_relevance_scores,5,'rating'),IsEqualTo((DCG1/IDCG),'Within', AbsoluteTolerance(1e-10)))
testCase.verifyThat(NDCG(ranked_list_2,pos_items_ids,pos_relevance_scores,5,'rating'),IsEqualTo((DCG2/IDCG),'Within', AbsoluteTolerance(1e-10)))
testCase.verifyThat(NDCG(ranked_list_3,pos_items_ids,pos_relevance_scores,5,'rating'),IsEqualTo((DCG3/IDCG),'Within', AbsoluteTolerance(1e-10)))

IDCG = (2^5-1)/log2(2)+(2^5-1)/log2(3)+(2^4-1)/log2(4)+(2^4-1)/log2(5);  % exp gain
DCG1 = (2^5-1)/log2(3)+(2^5-1)/log2(4)+(2^4-1)/log2(5)+(2^4-1)/log2(6);  % exp gain
DCG2 = (2^4-1)/log2(3)+(2^4-1)/log2(4)+(2^5-1)/log2(5)+(2^5-1)/log2(6);  % exp gain
DCG3 = (2^4-1)/log2(4)+(2^5-1)/log2(5)+(2^5-1)/log2(6);                  % exp gain

testCase.verifyThat(NDCG(ranked_list_1,pos_items_ids,pos_relevance_scores,5,'exp'),IsEqualTo((DCG1/IDCG),'Within', AbsoluteTolerance(1e-10)))
testCase.verifyThat(NDCG(ranked_list_2,pos_items_ids,pos_relevance_scores,5,'exp'),IsEqualTo((DCG2/IDCG),'Within', AbsoluteTolerance(1e-10)))
testCase.verifyThat(NDCG(ranked_list_3,pos_items_ids,pos_relevance_scores,5,'exp'),IsEqualTo((DCG3/IDCG),'Within', AbsoluteTolerance(1e-10)))

IDCG = 5/log2(2)+5/log2(3)+4/log2(4)+4/log2(5);  % rating gain

expVals = [0 4/log2(3) 4/log2(3)+4/log2(4) 4/log2(3)+4/log2(4)+5/log2(5) 4/log2(3)+4/log2(4)+5/log2(5)+5/log2(6)]./IDCG;
for k = 1 : 5
    testCase.verifyThat(NDCG(ranked_list_2,pos_items_ids,pos_relevance_scores,k,'rating'),IsEqualTo((expVals(k)),'Within', AbsoluteTolerance(1e-10)))
end
 

 
 
