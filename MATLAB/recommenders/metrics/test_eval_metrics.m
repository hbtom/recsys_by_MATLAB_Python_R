clear
clc
close all

import matlab.unittest.TestCase
import matlab.unittest.constraints.IsEqualTo
import matlab.unittest.constraints.AbsoluteTolerance

testCase = TestCase.forInteractiveUse;

% This is the script for testing recommender systems evluation metrics. 
% Yashar Deldjoo
% Sep 2017 
% Politecnico di Milano, Italy

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

 fprintf('Testing MAP ... \n')
 testCase.verifyThat(MAP_at_k(ranked_list_1,pos_items_ids,3),IsEqualTo(7/18,'Within', AbsoluteTolerance(1e-10)))
 testCase.verifyThat(MAP_at_k(ranked_list_1,pos_items_ids,5),IsEqualTo(163/240,'Within', AbsoluteTolerance(1e-10)))
 testCase.verifyThat(MAP_at_k(ranked_list_2,pos_items_ids,3),IsEqualTo(1/9,'Within', AbsoluteTolerance(1e-10)))
 testCase.verifyThat(MAP_at_k(ranked_list_2,pos_items_ids,5),IsEqualTo(43/120,'Within', AbsoluteTolerance(1e-10)))

 
 
 
