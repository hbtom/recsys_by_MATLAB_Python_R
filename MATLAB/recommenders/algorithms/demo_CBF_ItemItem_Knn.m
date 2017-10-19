% This is the script for running the class 'CBF_ItemItem_Knn.m' which is a content-based recommender based on KNN 
% item-item similarity using different aggregation functions. Please refer to the class definition for more info.
% Inputs:
%         trainRatings : the input 3-tuple (userId, movieId, rating) 'train' rating table [n_i*3] 
%          testRatings : the input 3-tuple (userId, movieId, rating) 'test' rating table [n_i*3] 
%                  ICM : the input item-content table [n_i*n_f]
%             sim_type : similarity type (e.g., 'cosine')
%            coli_name : the title of column Ids
% Outputs:
%               output : the output strcuture containg predicted urms 

%
% Yashar Deldjoo
% Septmeber-October 2017 
% Politecnico di Milano, Italy
% Johannes Kepler University Linz, Austria

% clear
% clc
% close all

%% PATHs 

if ismac
    
    addpath('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/utils/rec');
    addpath('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/recommenders/metrics');
        rootAddr = '/Users/yashar/OneDrive - Politecnico di Milano/data/';
         outAddr = '/Volumes/SP PHD U3/OneDrivePolimi/OneDrive - Politecnico di Milano/ECIR2018/Rec_Results';
    metaDataAddr = '/Volumes/SP PHD U3/OneDrivePolimi/OneDrive - Politecnico di Milano/dataset/metadata';
    
elseif ispc
    addpath('C:\Users\Yas\Documents\GitHub\recsys_by_MATLAB_Python_R\MATLAB\utils\rec');
    addpath('C:\Users\Yas\Documents\GitHub\recsys_by_MATLAB_Python_R\MATLAB\recommenders\metrics');
    rootAddr = 'C:\Users\Yas\Documents\data';
    outAddr = 'C:\Users\Yas\Documents\GitHub\recsys_by_MATLAB_Python_R\MATLAB\recommenders\algorithms\rec_results';
    
    
end

%% LOAD URMs and ICMs

% Global Variables
%   fold_no = 1 ;
col1_name = 'userId' ; 
col2_name = 'movieId';
col3_name = 'rating' ;
 sim_type = 'cosine' ;
%       nn  = 10       ;

% feature specific params
% feature_name = 'audio_ivec' ;
% feature_name = 'genre'      ;
%  rand_rec_ON = 'YES';
%     gmm_size = 128;       % small = [128,256]  big = [16,32,64,128,256,512]
%        tvDim = 40 ;       % small = [40,100, 200];

trainRatings = readtable(fullfile(rootAddr,'urms',['urm_train_split_type_item_fold' num2str(fold_no) 'of5_pop_removed_0.csv']));

          output_tr = prepare_ratingMat_Id2ind(trainRatings,col1_name,col2_name,col3_name);
trainRatings_New_tr = output_tr.inputRating_New ;
     user_Id2idx_tr = output_tr.user_Id2idx     ;
     item_Id2idx_tr = output_tr.item_Id2Idx     ;
      urmTrain_New  = sparse(trainRatings_New_tr.new_userId,trainRatings_New_tr.new_movieId,trainRatings_New_tr.rating);  % urmTrain = [n_u1,n_i1]
                      stats_about_URm(trainRatings_New_tr,'trainRatings',['new_' col1_name],['new_' col2_name],col3_name);

        testRatings = readtable(fullfile(rootAddr,'urms',['urm_test_split_type_item_fold' num2str(fold_no) 'of5_pop_removed_0.csv']));
          output_te = prepare_ratingMat_Id2ind(testRatings,col1_name,col2_name,col3_name);

 inputRating_New_te = output_te.inputRating_New ;
     user_Id2idx_te = output_te.user_Id2idx     ;
     item_Id2idx_te = output_te.item_Id2Idx     ;
       urmTest_New  = sparse(inputRating_New_te.new_userId,inputRating_New_te.new_movieId,inputRating_New_te.rating);  % urmTest = [n_u2,n_i2]
                      stats_about_URm(inputRating_New_te,'testRatings',['new_' col1_name],['new_' col2_name],col3_name);

         load movieIds_unique.mat
         
    
    if strcmp(feature_name,'audio_ivec')
        load(fullfile(rootAddr,'ivec','train_test_seperated','final_ivec_data_with_genre',['IVecTableFinal_with_genre_label_sitem_fold_' num2str(fold_no) '_gmm_' num2str(gmm_size) '_tvDim_' num2str(tvDim) '.mat']))
        ICM = IVecTable_with_genre_label(:,1:tvDim+1);
        
    elseif strcmp(feature_name,'genre')
        ICM = IVecTable_with_genre_label(:,[1,tvDim+4:end-1]);
    elseif strcmp(feature_name,'tag')
        load(fullfile(metaDataAddr,'tag_ML20M_tfidf.mat'));
        ICM = tag_ML20M_tfidf_table;
        ICM = ICM(ismember(ICM.movieId,movieId_unique),:);
        
        movie_diff = setdiff(movieId_unique,ICM.movieId);
        zeros_diff = eps*ones(length(movie_diff),size(ICM,2)-1); 
        zeros_diff = [movie_diff(:) zeros_diff];
        
        ICM = table2array(ICM);
        ICM = [ICM;zeros_diff];
        ICM = array2table(ICM);
        ICM.Properties.VariableNames = ['movieId',sprintfc('tfid%d',1:size(ICM,2)-1)];
        
    elseif strcmp(feature_name,'genre_semantic_learning')
        ICM1 = IVecTable_with_genre_label(:,1:tvDim+1);
        ICM2 = IVecTable_with_genre_label(:,[1,tvDim+4:end-1]);
        ICM = IVecTable_with_genre_label(:,[1,tvDim+4:end-1]);
        
    end
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          
% user_Id2idx_tr = [userId, new_userId], item_Id2idx_tr = [itemId, new_itemId]

% Note 1:
% The "userIds" in both 'user_Id2idx_tr' and 'user_Id2idx_te' are the same. The same applies for "itemIds" in both 
% 'item_Id2idx_tr' and 'item_Id2idx_tr'. These Ids can be used for finding similar items and users in both dataset.
% 
% Note 2:
% The row and column indices in 'urmTrain_New' after applying the function "prepare_ratingMat_Id2ind" are similar to 
% 'new_userIds' and 'new_itemIds' in 'user_Id2idx_tr' and 'item_Id2idx_tr'. In a similar manner, the row and column 
% indices in "urmTest_New" match with 'new_userIds' and 'new_itemIds' in 'user_Id2idx_te' and 'item_Id2idx_te.'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          

%

                   [test_useridx,test_itemidx] = find(urmTest_New ~=0);
                   
                   if ismac
   % As sparse indexing is slow, we use normal matrices. However, we do
   % this only in MAC since in memory these matrices produce low-memory
   % problem, therefor we use a switch option.
                       
                   
                                   urmPred_Avg = (zeros(size(urmTest_New)));
                                   
                           urmPred_weightedAvg = (zeros(size(urmTest_New)));
                      urmPred_weightedAvg_skg1 = (zeros(size(urmTest_New)));
                     urmPred_weightedAvg_skg01 = (zeros(size(urmTest_New)));
                    urmPred_weightedAvg_skg001 = (zeros(size(urmTest_New)));
                    
                    urmPred_SIMpow_weightedAvg = (zeros(size(urmTest_New)));
               urmPred_SIMpow_weightedAvg_skg1 = (zeros(size(urmTest_New)));
              urmPred_SIMpow_weightedAvg_skg01 = (zeros(size(urmTest_New)));
             urmPred_SIMpow_weightedAvg_skg001 = (zeros(size(urmTest_New)));
                   elseif ispc
                                   urmPred_Avg = sparse(zeros(size(urmTest_New)));
                                   
                           urmPred_weightedAvg = sparse(zeros(size(urmTest_New)));
                      urmPred_weightedAvg_skg1 = sparse(zeros(size(urmTest_New)));
                     urmPred_weightedAvg_skg01 = sparse(zeros(size(urmTest_New)));
                    urmPred_weightedAvg_skg001 = sparse(zeros(size(urmTest_New)));
                    
                    urmPred_SIMpow_weightedAvg = sparse(zeros(size(urmTest_New)));
               urmPred_SIMpow_weightedAvg_skg1 = sparse(zeros(size(urmTest_New)));
              urmPred_SIMpow_weightedAvg_skg01 = sparse(zeros(size(urmTest_New)));
             urmPred_SIMpow_weightedAvg_skg001 = sparse(zeros(size(urmTest_New)));
                       
                   end

             
% This part is written for genre_semantic_learning based on a shallow ANN
if strcmp(feature_name,'genre_semantic_learning')
    
    genre_semantic_learning_ANN
    
end

% The function 'prepare_distance_3tuple' prepares a similarity array of form [item_i,item_j,sim_score] which contains the
% pairwise similarities between each pair of items for item in ICM. The first column of the matrix is assumed to contain
% item ids.
%   distArray = prepare_distance_3tuple(feature_table,sim_type,col1_name)
if strcmp(feature_name,'BLF')
    load(fullfile('/Users/yashar/Documents/GitHub/recsys_by_MATLAB_Python_R/MATLAB/utils/BLF_sim_parse','simArray_BLF.mat'));
    

        

else
    distArray = prepare_distance_3tuple(ICM,sim_type,col2_name);
    
end
    
    
    % Set NaN similarity score to a predefined value (e.g. 0 or random)
    sim_sc = distArray.cosine_dist_score;
    sim_sc(isnan(sim_sc)) = 0;
    distArray.cosine_dist_score = sim_sc;

    %  Inititate the class properties and object
       recommender_Object                = CBF_ItemItem_Knn  ;
       recommender_Object.urmTrain_New   = urmTrain_New      ;
       recommender_Object.distArray      = distArray         ;
       recommender_Object.user_Id2idx_tr = user_Id2idx_tr    ;
       recommender_Object.item_Id2idx_tr = item_Id2idx_tr    ;
       recommender_Object.nn             = nn                ;
             
% Since the module is an item-wise operation (i.e., item-item KNN), for "computaional efficieny" we do the processing of
% rating prediction "item-wise".
tic
for item_no = 1 : size(urmTest_New,2)
    
       int_ind = (test_itemidx == item_no) ;
    
%     Note 3:
%     'test_useridx' and 'test_itemidx' contain internal indices of 'urmTest_New' which is equivalent to 'new_userIds' and 
%     'new_itemIds' which can be found in 'user_Id2idx_te' and 'item_Id2idx_te.'
%     
%     For us, we need to use the true 'userIds' and 'itemIds' which are the same in both train and test datasets. Whenver 'new'
%     is not mentioned, it mean they refer to "true" user and item Ids. In addition, 'userId_te' and 'itemId_te' contains both 
%     true user and item Ids.
%     
%     user_Id2idx_te = [userId, new_userId], item_Id2idx_te = [itemId, new_itemId]
    
       
%         Find the true userIds and itemIds to path it to the recommender
         itemId_te = item_Id2idx_te(table2array(item_Id2idx_te(:,2)) == item_no,1);
        userIds_te = user_Id2idx_te(ismember(table2array(user_Id2idx_te(:,2)),test_useridx(int_ind)),1);
   
         output = recommender_Object.predictRating(table2array(userIds_te),table2array(itemId_te));
         
         int_ind_u = ismember(table2array(user_Id2idx_te(:,1)),output.rating_pred_avg(:,2));
         urmPred_Avg(table2array(user_Id2idx_te(int_ind_u,2)),item_no) = output.rating_pred_avg(:,1);
         
         int_ind_u = ismember(table2array(user_Id2idx_te(:,1)),output.rating_pred_weavg(:,2));
         urmPred_weightedAvg(table2array(user_Id2idx_te(int_ind_u,2)),item_no) = output.rating_pred_weavg(:,1);
         
                  int_ind_u = ismember(table2array(user_Id2idx_te(:,1)),output.rating_pred_weavg_reg1(:,2));
         urmPred_weightedAvg_skg1(table2array(user_Id2idx_te(int_ind_u,2)),item_no) = output.rating_pred_weavg_reg1(:,1);
         
         int_ind_u = ismember(table2array(user_Id2idx_te(:,1)),output.rating_pred_weavg_reg01(:,2));
         urmPred_weightedAvg_skg01(table2array(user_Id2idx_te(int_ind_u,2)),item_no) = output.rating_pred_weavg_reg01(:,1);
         
         int_ind_u = ismember(table2array(user_Id2idx_te(:,1)),output.rating_pred_weavg_reg001(:,2));
         urmPred_weightedAvg_skg001(table2array(user_Id2idx_te(int_ind_u,2)),item_no) = output.rating_pred_weavg_reg001(:,1);
     
          int_ind_u = ismember(table2array(user_Id2idx_te(:,1)),output.SIMpow_rating_pred_weavg(:,2));
         urmPred_SIMpow_weightedAvg(table2array(user_Id2idx_te(int_ind_u,2)),item_no) = output.SIMpow_rating_pred_weavg(:,1);
         
                  int_ind_u = ismember(table2array(user_Id2idx_te(:,1)),output.SIMpow_rating_pred_weavg_reg1(:,2));
         urmPred_SIMpow_weightedAvg_skg1(table2array(user_Id2idx_te(int_ind_u,2)),item_no) = output.SIMpow_rating_pred_weavg_reg1(:,1);
         
         int_ind_u = ismember(table2array(user_Id2idx_te(:,1)),output.SIMpow_rating_pred_weavg_reg01(:,2));
         urmPred_SIMpow_weightedAvg_skg01(table2array(user_Id2idx_te(int_ind_u,2)),item_no) = output.SIMpow_rating_pred_weavg_reg01(:,1);
         
         int_ind_u = ismember(table2array(user_Id2idx_te(:,1)),output.SIMpow_rating_pred_weavg_reg001(:,2));
         urmPred_SIMpow_weightedAvg_skg001(table2array(user_Id2idx_te(int_ind_u,2)),item_no) = output.SIMpow_rating_pred_weavg_reg001(:,1);
         
         
         if mod(item_no,500) == 1
             fprintf('Movie %d \n',item_no)
         end

end

toc      
if ismac
    
    urmPred_Avg = sparse(urmPred_Avg);
    
    urmPred_weightedAvg  = sparse(urmPred_weightedAvg);
    urmPred_weightedAvg_skg1  = sparse(urmPred_weightedAvg_skg1);
    urmPred_weightedAvg_skg01 = sparse(urmPred_weightedAvg_skg01);
    urmPred_weightedAvg_skg001 = sparse(urmPred_weightedAvg_skg001);
    
    urmPred_SIMpow_weightedAvg = sparse(urmPred_SIMpow_weightedAvg);
    urmPred_SIMpow_weightedAvg_skg1 = sparse(urmPred_SIMpow_weightedAvg_skg1);
    urmPred_SIMpow_weightedAvg_skg01 = sparse(urmPred_SIMpow_weightedAvg_skg01);
    urmPred_SIMpow_weightedAvg_skg001 = sparse(urmPred_SIMpow_weightedAvg_skg001);
    
end
if strcmp(feature_name,'audio_ivec')
    save(fullfile(outAddr,['RecSys_res_nn_' num2str(nn) '_feat_' feature_name '_gmm_' num2str(gmm_size) '_tvDim_' num2str(tvDim) '_fld_' num2str(fold_no) 'of5.mat']),'urmTest_New','urmPred_Avg', ...
        'urmPred_weightedAvg','urmPred_weightedAvg_skg1','urmPred_weightedAvg_skg01','urmPred_weightedAvg_skg001',...
        'urmPred_SIMpow_weightedAvg','urmPred_SIMpow_weightedAvg_skg1','urmPred_SIMpow_weightedAvg_skg01','urmPred_SIMpow_weightedAvg_skg001','-v7.3');
    
elseif strcmp(feature_name,'genre')
    save(fullfile(outAddr,['RecSys_res_nn_' num2str(nn) '_feat_' feature_name '_fld_' num2str(fold_no) 'of5.mat']),'urmTest_New','urmPred_Avg', ...
        'urmPred_weightedAvg','urmPred_weightedAvg_skg1','urmPred_weightedAvg_skg01','urmPred_weightedAvg_skg001',...
        'urmPred_SIMpow_weightedAvg','urmPred_SIMpow_weightedAvg_skg1','urmPred_SIMpow_weightedAvg_skg01','urmPred_SIMpow_weightedAvg_skg001','-v7.3');
else
     save(fullfile(outAddr,['RecSys_res_nn_' num2str(nn) '_feat_' feature_name '_fld_' num2str(fold_no) 'of5.mat']),'urmTest_New','urmPred_Avg', ...
        'urmPred_weightedAvg','urmPred_weightedAvg_skg1','urmPred_weightedAvg_skg01','urmPred_weightedAvg_skg001',...
        'urmPred_SIMpow_weightedAvg','urmPred_SIMpow_weightedAvg_skg1','urmPred_SIMpow_weightedAvg_skg01','urmPred_SIMpow_weightedAvg_skg001','-v7.3');
end

   



