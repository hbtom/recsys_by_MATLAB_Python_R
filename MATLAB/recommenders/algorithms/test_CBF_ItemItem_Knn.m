classdef CBF_ItemItem_Knn
    
    properties
        
        optMethod = '_cbf_itemitem_knn';
        orgData                  % Originl URm [n_u*n_i]   
        trainData                % Train URm   [n_u*n_i]
        testData                 % Test URm    [n_u*n_i]
        features                 % ICm         [n_f*n_i]
        minTrainUserRating       % min # of rating for each user in Train URm
        minTrainUserPosRating    % min # of positive rating for each user in Train URm
        posRatingThr = 3;        % Threshold for positive rating (r_ui>thr positive)

    end
    
    methods
        function userProfile = createModel(obj)
            % This function builds a user profile for each vector based on
            % item-item knn similarity model.
            urmTrain = obj.trainData        ;
                 n_u = size(urmTrain,1)     ;
                 n_i = size(urmTrain,2)     ;
                   F = obj.features         ;
                 n_f = size(F,2)-1          ;
            fprintf('******** Train Phase ********* \n')
            fprintf('Building User Profiles ... \n')
            
            cnt = 0;
            userProf = sparse(n_f,n_u);
            parfor u = 1 : n_u
                allratedItems = find(urmTrain(u,:) ~=0)                ; % OBS: ItemInd = ItemIds
                posRatedItems = find(urmTrain(u,:) > obj.posRatingThr) ;
                
               if length(allratedItems) >= obj.minTrainUserRating && length(posRatedItems) >= obj.minTrainUserPosRating
                        A = F(ismember(F.movieId,allratedItems),:) ;
                        X = table2array(A(:,2:end))                ;

                    r_ui = full(urmTrain(u,allratedItems))         ;
                    if strcmp(obj.optMethod,'RR')
                        userProf(:,u) = ridge(r_ui(:),X,obj.lambda)    ;
                    elseif strcmp(obj.optMethod,'Lasso')
                        userProf(:,u) = lasso(X,r_ui(:),'Alpha',obj.alpha,'Lambda',obj.lambda)    ;
                    elseif strcmp(obj.optMethod,'EN')
                        userProf(:,u) = lasso(X,r_ui(:),'Alpha',obj.alpha,'Lambda',obj.lambda);
                    elseif strcmp(obj.optMethod,'SVM')
                        mdl =  fitrsvm(X,r_ui(:));
                        if (length(mdl.Beta)) < 164
                            continue
                        end
                        userProf(:,u) = mdl.Beta;
                    end
                    cnt = cnt + 1;
                end
            end
            userProfile = userProf';
            fprintf('Total # of users for which a user profile was built: %d \n',cnt)
            fprintf('User profiles are built! \n')
        end
        
        
        function [urmPredict,builtProfUserIds] = predictRating(obj,userProf)
            % This function performs a rating prediction based on estimated
            % URm in the rpevious step and Test URm.
            fprintf('******** Test Phase ********* \n')
            fprintf('Making recommendations ... \n')

            n_u = size(obj.testData,1);
            n_i = size(obj.testData,2);
            urmTest = obj.testData     ;
                  F = obj.features     ;
                n_f = size(F,2)-1      ;  
                 
            urmPredict = sparse(n_u,n_i);
            [userIds,itemIds] = find(abs(urmTest)>0);
            builtProfUserIds = [] ;
            for w = 1 : length(userIds)
                trgUserProf = full(userProf(userIds(w),:));
                if sum(trgUserProf) == 0
                    builtProfUserIds = [builtProfUserIds;[userIds(w) 0]];
                    continue
                end
                if table2array(F(ismember(F.movieId,itemIds(w)),n_f+1))-itemIds(w) ~=0
                    disp('A misMatch Found')
                end
                builtProfUserIds = [builtProfUserIds;[userIds(w) 1]];
                trgItemF = table2array(F(ismember(F.movieId,itemIds(w)),1:n_f));
                urmPredict(userIds(w),itemIds(w)) = dot(trgUserProf(:),trgItemF(:));
            end
        end
    end
end

                       recModelObj = CBF_LinearRegressionModel ;
                 recModelObj.trainData = urmTrain                  ;
                  recModelObj.features = ICm_Table         ;
     recModelObj.minTrainUserPosRating = minTrainUserPosRating     ;
        recModelObj.minTrainUserRating = minTrainUserRating        ;
                 recModelObj.optMethod = optMethod                 ;
                 recModelObj.alpha     = alpha                     ;
     
              userProfile = recModelObj.createModel() ;
                   
     recModelObj.testData = urmTest                   ;
  [urmPredict,builtProfUserIds] = recModelObj.predictRating(userProfile);  