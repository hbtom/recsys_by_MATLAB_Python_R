% This is a class for building a content-based recommender based on KNN item-item similarity approach
% using various aggregation functions for rating prediction:
%   - simple average
%   - weighted average (the weights are the similarities)
%   - weighted average with shrinkage factor (lambda = 0.001, 0.01, 0.1)
%
% Yashar Deldjoo
% Septmeber 2017 
% Politecnico di Milano, Italy
% Johannes Kepler University Linz, Austria
            
classdef CBF_ItemItem_Knn
    
    properties
        
        recMethod = '_cbf_itemitem_knn';
        orgData          % Originl URm [n_u*n_i]
        urmTrain_New     % Train URm   [n_u1*n_i1]
        distArray        % Pair-wise distance array [n_i*(n_i-1)/2,3]  (sim = 1 -dist)
        user_Id2idx_tr   % contains pairwise correspondence btwn the original 'userIds' and 'new_userIds'
        item_Id2idx_tr   % contains pairwise correspondence btwn the original 'itemIds' and 'new_itemIds'
        nn               % number of nearest neighbors (e.g., 10, 20, 50)
        
    end
    
    methods
         function output = predictRating(obj,userIds_te,itemId_te)

            % Since this module heavily depends on finding similar items, we scan the ratings in the test,
            % item-wise. That is, for each item in test, we do rating prediction for all users who have
            % rating in test. This would speed up the item similaity searchprocess since it is done once
            % for each item. 
            
            user_Id2idx_tr_ob = table2array(obj.user_Id2idx_tr) ;
            item_Id2idx_tr_ob = table2array(obj.item_Id2idx_tr) ;
              urmTrain_New_ob = obj.urmTrain_New                ;
                 distArray_ob = table2array(obj.distArray)      ;
                    item_i_ob = distArray_ob(:,1)               ;
                    item_j_ob = distArray_ob(:,2)               ;
                        nn_ob = obj.nn                          ;

              % user_Id2idx_tr = [userId, new_userId], item_Id2idx_tr = [itemId, new_itemId]
              
              % For each user from test with true itemId (itemId_te), find the corresponding new_userId 
              % in train.
                    ind_int = ismember(user_Id2idx_tr_ob(:,1),userIds_te);
              new_userIds_tr = [user_Id2idx_tr_ob(ind_int,1) user_Id2idx_tr_ob(ind_int,2)];
        
              % OBS: Note, some users from train may not exist in test. Therefore, the correct user Ids are embedded
              % also in 'new_userIds_tr' to be able to find the non-existing ones!
           
              dist_allPair_items_with_itemId_te  = distArray_ob(item_i_ob==itemId_te | item_j_ob==itemId_te,:);
                   allPair_items_with_itemId_te  = [] ;
                   
              for i = 1: size(dist_allPair_items_with_itemId_te,1)
                  tmp = dist_allPair_items_with_itemId_te(i,1:2);
                  tmp(tmp==itemId_te)=[];
                  allPair_items_with_itemId_te = [allPair_items_with_itemId_te;tmp];
              end
          
              % In this section, we would like to predict rating of a target user to a target item ('itemId_te').
              for u = 1 : size(new_userIds_tr,1)
                  
                  % This is the target user for which we would like to make a prediction. Target item has the true Id of
                  % 'itemId_te'
                  new_userIds_tr_trg = new_userIds_tr(u,2);
                  corated_itemidx = find(urmTrain_New_ob(new_userIds_tr_trg,:));
                  corated_itemIds = item_Id2idx_tr_ob(ismember(item_Id2idx_tr_ob(:,2),corated_itemidx),1);
                  dist_corated_itemIds = dist_allPair_items_with_itemId_te(ismember(allPair_items_with_itemId_te,corated_itemIds),1:3);
                  if size(dist_corated_itemIds,1) > nn_ob
                      % The closest neighbors are here. Since we use a distance function, we find the NN based on those
                      % having the minimum similarity score.
                      [sim_score,sim_idx] = sort(dist_corated_itemIds(:,3),'ascend');
                      nn_idx  = sim_idx(1:nn_ob); % the NNs
                      nn_sim_score = sim_score(1:nn_ob);
                        nn_itemIds = corated_itemIds(nn_idx);
                        nn_itemIdx = item_Id2idx_tr_ob(ismember(item_Id2idx_tr_ob(:,1),nn_itemIds),2);
                        nn_ratings = full(urmTrain_New_ob(new_userIds_tr_trg,nn_itemIdx));
                        
                        output.rating_pred_avg(u,:) = [mean(nn_ratings) new_userIds_tr(u,1)];
                        output.rating_pred_weavg(u,:) = [(nn_sim_score(:)'*nn_ratings(:))/(sum(nn_sim_score)) new_userIds_tr(u,1)];
                        output.rating_pred_weavg_reg01(u,:) = [(nn_sim_score(:)'*nn_ratings(:))/(0.1+sum(nn_sim_score)) new_userIds_tr(u,1)];
                        output.rating_pred_weavg_reg001(u,:) = [(nn_sim_score(:)'*nn_ratings(:))/(0.01+sum(nn_sim_score)) new_userIds_tr(u,1)];
                        output.rating_pred_weavg_reg0001(u,:) = [(nn_sim_score(:)'*nn_ratings(:))/(0.001+sum(nn_sim_score)) new_userIds_tr(u,1)];
                        
                        
                  elseif size(dist_corated_itemIds,1) >0 && size(dist_corated_itemIds,1)<= nn_ob 
                      nn_sim_score = dist_corated_itemIds(:,3);
                      nn_dist = dist_corated_itemIds(:,1:3);
                      nn_itemIds = corated_itemIds;
                      nn_itemIdx = item_Id2idx_tr_ob(ismember(item_Id2idx_tr_ob(:,1),nn_itemIds),2);
                      nn_ratings = urmTrain_New_ob(new_userIds_tr_trg,nn_itemIdx);
                      output.rating_pred_avg(u,:) = [mean(nn_ratings) new_userIds_tr(u,1)];
                      output.rating_pred_weavg(u,:) = [(nn_sim_score(:)'*nn_ratings(:))/(sum(nn_sim_score)) new_userIds_tr(u,1)];
                      output.rating_pred_weavg_reg01(u,:) = [(nn_sim_score(:)'*nn_ratings(:))/(0.1+sum(nn_sim_score)) new_userIds_tr(u,1)];
                      output.rating_pred_weavg_reg001(u,:) = [(nn_sim_score(:)'*nn_ratings(:))/(0.01+sum(nn_sim_score)) new_userIds_tr(u,1)];
                      output.rating_pred_weavg_reg0001(u,:) = [(nn_sim_score(:)'*nn_ratings(:))/(0.0001+sum(nn_sim_score)) new_userIds_tr(u,1)];
                  end
                  
              end
              
         end
    end
end

