classdef CBF_ItemItem_Knn
    
    properties
        
        recMethod = '_cbf_itemitem_knn';
        orgData                  % Originl URm [n_u*n_i]
        trainData                % Train URm   [n_u*n_i]
        testData                 % Test URm    [n_u*n_i]
        features                 % ICm         [n_f*n_i]        
    end
    
    methods
        function userProfile = createModel(obj)
            % This function builds a user profile for each vector based on
            % item-item knn similarity model.
            
            urmTrain = obj.trainData     ;
                 n_u = size(urmTrain,1)  ;
                 n_i = size(urmTrain,2)  ;
                   F = obj.features      ;
                   
            fprintf('******** Train Phase ********* \n')
            fprintf('Building User Profiles ... \n')
            
            
            
            
            
        end
    end
end

