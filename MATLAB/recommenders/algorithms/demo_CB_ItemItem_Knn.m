% This is the script for running the class 'CBF_ItemItem_Knn.m' which 
% is a content-based recommender based on KNN item-item similarity using
% different aggregation functions. Please refer to the class definition for
% more information.
% Inputs:
%         trainRatings : the input 3-tuple (userId, movieId, rating) 'train' rating table [n_i*3] 
%          testRatings : the input 3-tuple (userId, movieId, rating) 'test' rating table [n_i*3] 
%             sim_type : similarity type (e.g., cosine)
%            col1_name : the title of column 1 (containing ids)
% Outputs:
%             simArray : the output similarity array [n_i*3]  

%
% Yashar Deldjoo
% Sep 27, 2017 
% Politecnico di Milano, Italy
% Johannes Kepler University Linz, Austria

clearskype
clc
close all

addpath('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/utils/rec');
rootAddr = '/Users/yashar/OneDrive - Politecnico di Milano/data/';

fold_no = 1;
%% LOAD URMs and ICMs

trainRatings = readtable(fullfile(rootAddr,'urms',['urm_train_split_type_item_fold' num2str(fold_no) 'of5_pop_removed_0.csv']));

          output_tr = prepare_ratingMat_Id2ind(trainRatings,'userId','movieId','rating');
trainRatings_New_tr = output_tr.inputRating_New ;
     user_Id2idx_tr = output_tr.user_Id2idx     ;
     item_Id2idx_tr = output_tr.item_Id2Idx     ;
      urmTrain_New  = sparse(trainRatings_New_tr.new_userId,trainRatings_New_tr.new_movieId,trainRatings_New_tr.rating);  % urmTrain = [n_u1,n_i1]
                      stats_about_URm(trainRatings_New_tr,'trainRatings','new_userId','new_movieId','rating');

        testRatings = readtable(fullfile(rootAddr,'urms',['urm_test_split_type_item_fold' num2str(fold_no) 'of5_pop_removed_0.csv']));
          output_te = prepare_ratingMat_Id2ind(testRatings,'userId','movieId','rating');

 inputRating_New_te = output_te.inputRating_New ;
     user_Id2idx_te = output_te.user_Id2idx     ;
     item_Id2idx_te = output_te.item_Id2Idx     ;
       urmTest_New  = sparse(inputRating_New_te.new_userId,inputRating_New_te.new_movieId,inputRating_New_te.rating);  % urmTest = [n_u2,n_i2]
                      stats_about_URm(inputRating_New_te,'testRatings','new_userId','new_movieId','rating');

    load(fullfile(rootAddr,'ivec','train_test_seperated','final_ivec_data_with_genre',['IVecTableFinal_with_genre_label_sitem_fold_' num2str(fold_no) '_gmm_16_tvDim_10.mat']))
                ICM = IVecTable_with_genre_label(:,1:11);

% The function prepares a similarity array [item_i,item_j,sim_score] which
% contains the pairwise similarity between each pair of items. The first
% column of the matrix is assumed to contain item ids.

     % distArray = prepare_distance_3tuple(feature_table,sim_type,col1_name)
       distArray = prepare_distance_3tuple(ICM,'cosine','movieId');
       
       

% Note 1:
% The "userIds" in both 'user_Id2idx_tr' and 'user_Id2idx_te' are the same.
% The same applies for "itemIds" in both 'item_Id2idx_tr' and 'item_Id2idx_tr'.
% These Ids can be used for finding similar items and users in both dataset.

% Note 2:
% The row and column indices in "urmTrain_New" after applying the function
% "prepare_ratingMat_Id2ind" are similar to 'new_userIds' and 'new_itemIds'
% in 'user_Id2idx_tr' and 'item_Id2idx_tr'.
%
% In a similar manner, the row and column indices in "urmTrain_New"
% match with 'new_userIds' and 'new_itemIds' in 'user_Id2idx_te' and
% 'item_Id2idx_te.'

%%

[test_useridx,test_itemidx] = find(urmTest_New ~=0);

urmPredict = sparse(size(urmTest_New));

recommender_Object = CBF_ItemItem_Knn ;
recommender_Object.urmTrain_New = urmTrain_New     ;
recommender_Object.distArray = distArray        ;
recommender_Object.user_Id2idx_tr = user_Id2idx_tr   ;
recommender_Object.item_Id2idx_tr = item_Id2idx_tr   ;
recommender_Object.nn             = 10               ;
for item_no = 3: 3 %size(urmTest_New,1)
    int_ind = (test_itemidx == item_no) ;
    
    % "test_useridx" and "test_itemidx" contain internal indices of
    % 'urmTest_New' which is equivalent to 'new_userIds' and 'new_itemIds'
    % which can be found in 'user_Id2idx_te' and 'item_Id2idx_te.'
    
    % We need to use the true 'userIds' and 'itemIds' which are the same
    % in both train and test datasets.
    
    % Whenver 'new' is not mentioned, it mean true user and item Ids.
    % "userId_te" and "itemId_te" are both true user and item Ids.
    
    % user_Id2idx_te = [userId, new_userId], item_Id2idx_te = [itemId,new_itemId]
    
    itemId_te = item_Id2idx_te(item_Id2idx_te.new_movieId == item_no,1);
    userIds_te = user_Id2idx_te(ismember(user_Id2idx_te.new_userId,test_useridx(int_ind)),1);
    % For efficiency, for each item we are providing a list of items.
    tic
    output = recommender_Object.predictRating(table2array(userIds_te),table2array(itemId_te));
    toc
    if length(table2array(userIds_te)) ~= length(output.rating_pred_avg)
        disp('Opps!')
    end
end




    