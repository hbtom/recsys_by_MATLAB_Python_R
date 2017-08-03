function validationMetrics = knn_classifier_gridSearch(inputTable,train_index,test_index, printFlag)


% This function fits a classification decision tree for binary classification. 
% The function applies a Hold-Out (75%-25%) as for the evaluation which
% is suited for large datasets.
%
% It is worthwhile to note that the function performs a grid-based
% hyperparameter search and automatically reports the results in each case as well
% as the best paramter setup:
%        o Distance metric = {'Euclidean','Cosine','Minkowski'}
%        o Number of Neighbors: {1,2,3,4,5,6,7,8,9,10,15,20,25,50,100}
%        o Distance Weight: {'Equal','SquaredInverse'}  N = 36 cases

%  Inputs:
%         inputTable: A table whose columns are the 'predictors' and the last column is the 'response'. 
%                     Samples are in rows. 
%          printFlag: a flag to keep the hyper-paramter search report ON (1) or OFF (0)
%  Outputs:
%         validationAccuracy : an array containing all accuracy values for N search cases
%         best_validationAccuracy: an struct containing the BEST accuracy & the corresponding parameter
% 
%  e.g.   
%  header: f_1,f2,f_3,f4,f5,f6,f7,f8,f9,f10,res 
%         -0.0302,0.0081,0.0004,-0.0228,0.0364,-0.0241,-0.0276,0.0053,-0.0186,0.0065,1
%         -0.0101,-0.0035,0.0350,-0.0196,0.0136,-0.0091,-0.0186,-0.0111,-0.0112,0.0077,0
%
%  
%      validationAccuracy =    0.7006    0.45011    0.8989    0.6986    0.5091 
% best_validationAccuracy = 
%
%  struct with fields:
%                       value: 0.9028
%                       knnParam_dist: 'Cosine'
%                       knnParam_Exp: []
%                       knnParam_distWeight: 'Equal'
%
% Yashar Deldjoo
% June 24th, 2017

predictorNames = inputTable.Properties.VariableNames(1:end-1) ; 
    predictors = inputTable(:, predictorNames)                ;
      response = table2array(inputTable(:,end))               ;

     validationAccuracy = [] ;
    validationPrecision = [] ;
       validationRecall = [] ;
      validationFallout = [] ;
      validationSpec    = [] ;
           validationF1 = [] ;
           validationF2 = [] ;
          validationMCC = [] ;
          validationG   = [] ;
        validationKappa = [] ;
isCategoricalPredictor = false(size(predictorNames));     

% Set up holdout validation
if isempty(train_index) && isempty(test_index) 
    rng(1234)
    cvp = cvpartition(response, 'Holdout', 0.25);
    train_index = cvp.training ;
     test_index = cvp.test     ;
end

trainingPredictors = predictors(train_index, :);
trainingResponse = response(train_index, :);
trainingIsCategoricalPredictor = isCategoricalPredictor;


knnParam.dist = {'Euclidean','Cosine','Minkowski'}; 
knnParam.nn   = {1,3,5,10,20,50,100};
knnParam.distWeight = {'Equal','Inverse','SquaredInverse'};
knnParam.standarize = {0,1};

       n_dist = length(knnParam.dist);
        n_nn  = length(knnParam.nn);
 n_distWeight = length(knnParam.distWeight);
     n_stand  = length(knnParam.standarize);
     
 n_search = n_dist*n_nn*n_distWeight*n_stand;



for n1 = 1 : n_dist
    for n3 = 1:n_distWeight
        for n4 = 1:n_stand
            parfor n2 = 1 : n_nn
                    
            % This code specifies all the classifier options and trains the classifier.
            
            classificationKNN = fitcknn(...
                trainingPredictors, ...
                trainingResponse, ...
                'Distance', knnParam.dist{n1}, ...
                'NumNeighbors', knnParam.nn{n2}, ...
                'DistanceWeight', knnParam.distWeight{n3}, ...
                'Standardize', knnParam.standarize{n4}, ...
                'ClassNames', [0; 1]);

            
            knnPredictFcn = @(x) predict(classificationKNN, x);
            validationPredictFcn = @(x) knnPredictFcn(x);
            
            % Compute validation predictions
            validationPredictors = predictors(test_index, :);
            validationResponse = response(test_index, :);
            [validationPredictions, validationScores] = validationPredictFcn(validationPredictors);

            indP = find(validationResponse == 1) ;
            indN = find(validationResponse == 0) ;
            
            pred_at_indP = validationPredictions(indP)   ;
            TP = length(find(pred_at_indP==1));
            FN = length(find(pred_at_indP==0));
            
            pred_at_indN = validationPredictions(indN)   ;
            TN = length(find(pred_at_indN==0));
            FP = length(find(pred_at_indN==1));
            
            %
            %  TP | FN
            %  FP | TN
            %
            accr = (TP+TN)/(TP+TN+FP+FN);
            recall = TP/(TP+FN);
            precision = TP/(TP+FP);
            fallout = FP/(FP+TN);
            spec = TN/(TN+FP);
            f1 = 2*(precision*recall)/(precision+recall);
            f2 = 5*(precision*recall)/(4*precision+recall);
            MCC = (TP*TN-FP*FN)/sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN));
            G = sqrt(recall*spec);
            Total = TP+TN+FP+FN;
            OA = (TP+TN)/Total;
            EA = ((TP+FP)/Total)*((TP+FN)/Total)+((FN+TN)/Total)*((FP+TN)/Total);
            Kappa = (OA-EA)/(1-EA);
            

            
                   validationAccuracy(n1,n2,n3,n4) = accr     ;
                     validationRecall(n1,n2,n3,n4) = recall   ;
                  validationPrecision(n1,n2,n3,n4) = precision;
                    validationFallout(n1,n2,n3,n4) = fallout  ;
                       validationSpec(n1,n2,n3,n4) = spec     ;
                         validationF1(n1,n2,n3,n4) = f1       ;
                         validationF2(n1,n2,n3,n4) = f2       ;
                        validationMCC(n1,n2,n3,n4) = MCC      ;  
                          validationG(n1,n2,n3,n4) = G        ;
                      validationKappa(n1,n2,n3,n4) = Kappa    ;

            end      
        end
    end
end
validationMetrics.validationAccuracy = validationAccuracy;
validationMetrics.validationRecall   = validationRecall;
validationMetrics.validationPrecision = validationPrecision ;
validationMetrics.validationFallout = validationFallout ;
validationMetrics.validationSpec    = validationSpec ;
 validationMetrics.validationF1 = validationF1  ;
 validationMetrics.validationF2 = validationF2  ;
 validationMetrics.validationMCC = validationMCC ;
 validationMetrics.validationG = validationG ;
 validationMetrics.validationKappa = validationKappa ;

 
 validationMetrics.max_validationAccuracy = max(validationAccuracy(:));
 validationMetrics.max_validationRecall   = max(validationRecall(:));
validationMetrics.max_validationPrecision = max(validationPrecision(:)) ;
  validationMetrics.min_validationFallout = min(validationFallout(:)) ;
     validationMetrics.max_validationSpec = max(validationSpec(:));
       validationMetrics.max_validationF1 = max(validationF1(:))  ;
       validationMetrics.max_validationF2 = max(validationF2(:))  ;
      validationMetrics.max_validationMCC = max(validationMCC(:)) ;
        validationMetrics.max_validationG = max(validationG(:)) ;
    validationMetrics.max_validationKappa = max(validationKappa(:));

    if printFlag == 1

fprintf('*************************************************************************************************************  \n');
fprintf('  Grid Search Over KNN - CLF hyper-parameters  (n_dist x n_nn X n_distWeight x n_stand=%dx%dx%dX%d=%d cases): \n',n_dist,n_nn,n_distWeight,n_stand,n_search);
fprintf('*************************************************************************************************************  \n');        
        fprintf('MAX Accuracy : %g \n',validationMetrics.max_validationAccuracy);
        fprintf('MAX Recall : %g \n',validationMetrics.max_validationRecall);
        fprintf('MAX Precision  : %g \n',validationMetrics.max_validationPrecision);
        fprintf('MIN Fall-out  : %g \n',validationMetrics.min_validationFallout );
        fprintf('MAX Specificity : %g \n',validationMetrics.max_validationSpec );
        fprintf('MAX F1 : %g \n',validationMetrics.max_validationF1);
        fprintf('MAX F2 : %g \n',validationMetrics.max_validationF2);
        fprintf('MAX MCC  : %g \n',validationMetrics.max_validationMCC);
        fprintf('MAX G  : %g \n',validationMetrics.max_validationG);
        fprintf('MAX Kappa  : %g \n',validationMetrics.max_validationKappa );
        fprintf('------------------------ \n');
        fprintf('***********************************************************  \n');
    end

% 
% 
% 
% fprintf('***********************************************************  \n');
% fprintf('  Grid Search Over KNN - CLF hyper-parameters (%d cases): \n',length(knnParam.dist));
% fprintf('***********************************************************  \n');
% 
%                    
% for param = 1 : length(knnParam.dist)
%    % 'Cosine','Minkowski',
%    % Train a classifier
%    % This code specifies all the classifier options and trains the classifier.
%    classificationKNN = fitcknn(...
%        trainingPredictors, ...
%        trainingResponse, ...
%        'Distance', knnParam.dist{param}, ...
%        'Exponent', knnParam.Exp{param}, ...
%        'NumNeighbors', knnParam.nn{param}, ...
%        'DistanceWeight', knnParam.distWeight{param}, ...
%        'Standardize', true, ...
%        'ClassNames', [0; 1]);
% 
% 
% %                        classificationKNN = fitcknn(...
% %                            trainingPredictors, ...
% %                            trainingResponse, ...
% %                            'Distance', 'Euclidean', ...
% %                            'Exponent', [], ...
% %                            'NumNeighbors', 1, ...
% %                            'DistanceWeight', 'Equal', ...
% %                            'Standardize', true, ...
% %                            'ClassNames', [0; 1]);
% 
%    % Create the result struct with predict function
%    knnPredictFcn = @(x) predict(classificationKNN, x);
%    validationPredictFcn = @(x) knnPredictFcn(x);
% 
% 
%    % Compute validation predictions
%    validationPredictors = predictors(test_index, :);
%    validationResponse = response(test_index, :);
%    [validationPredictions, validationScores] = validationPredictFcn(validationPredictors);
% 
%    % Compute validation accuracy
% %    correctPredictions = (validationPredictions == validationResponse);
% %    isMissing = isnan(validationResponse);
% %    correctPredictions = correctPredictions(~isMissing);
% %    validationAccuracy = [validationAccuracy sum(correctPredictions)/length(correctPredictions)];
% %    
% %    Res_true_ind = find(validationResponse == 1);
% %    Pred_at_Res_true_ind = validationPredictions(Res_true_ind);
% %    Pred_true_at_Res_true_ind = find(Pred_at_Res_true_ind == 1);
% %    validationRecall = [validationRecall length(Pred_true_at_Res_true_ind)/length(Res_true_ind)];
% %    
% %    Pred_true  = find(validationPredictions==1);
% %    validationPrecision = [validationPrecision length(Pred_true_at_Res_true_ind)/length(Pred_true)];
% %    
% %    Res_false_ind = find(validationResponse == 0);
% %    Pred_at_Res_false_ind = validationPredictions(Res_false_ind);
% %    Pred_true_at_Res_false_ind = find(Pred_at_Res_false_ind == 1);
% %    validationFallout = [validationFallout length(Pred_true_at_Res_false_ind)/length(Res_false_ind)];
%    
%    
%    indP = find(validationResponse == 1) ;
%    indN = find(validationResponse == 0) ;
%    
%        pred_at_indP = validationPredictions(indP)   ;
%                  TP = length(find(pred_at_indP==1)) ;
%                  FN = length(find(pred_at_indP==0)) ;
%                  
%         pred_at_indN = validationPredictions(indN)   ;
%                   TN = length(find(pred_at_indN==0)) ;
%                   FP = length(find(pred_at_indN==1)) ;
%                  
% 
%                   accr = (TP+TN)/(TP+TN+FP+FN);
%                   recall = TP/(TP+FN);
%                   precision = TP/(TP+FP);
%                   fallout = FP/(FP+TN);
%                   f1 = 2*(precision*recall)/(precision+recall);
%                   f2 = 5*(precision*recall)/(4*precision+recall);
%                   MCC = (TP*TN-FP*FN)/sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN));
%                   
%                   validationAccuracy = [validationAccuracy accr];
%                   validationRecall = [validationRecall recall];
%                   validationPrecision = [validationPrecision precision];
%                   validationFallout = [validationFallout fallout];
%                   validationF1 = [validationF1 f1];
%                   validationF2 = [validationF2 f2];
%                   validationMCC = [validationMCC MCC];
%                   
%                   
%    
%    if (printFlag == 1)
%        fprintf('Case %d: \n',param)
%        fprintf('Distance: %s \n',knnParam.dist{param});
%        fprintf('Exponent: %d \n',knnParam.Exp{param});
%        fprintf('NumNeighbors: %d \n',knnParam.nn{param});
%        fprintf('DistanceWeight: %s \n', knnParam.distWeight{param});
%        fprintf('Standardize: %s \n','true');
%        fprintf('Accuracy : %g \n',validationAccuracy(end));
%        fprintf('Recall : %g \n',validationRecall(end));
%        fprintf('Precision  : %g \n',validationPrecision(end));
%        fprintf('Fall-out  : %g \n',validationFallout(end));
%        fprintf('F1 : %g \n',validationF1(end));
%        fprintf('F2 : %g \n',validationF2(end));
%        fprintf('MCC  : %g \n',validationMCC(end));
%        fprintf('------------------------ \n')
%    end
% 
% end
% 
% validationMetrics.validationAccuracy = validationAccuracy;
% validationMetrics.validationRecall   = validationRecall;
% validationMetrics.validationPrecision = validationPrecision ;
% validationMetrics.validationFallout = validationFallout ;
%  validationMetrics.validationF1 = validationF1  ;
%  validationMetrics.validationF2 = validationF2  ;
%  validationMetrics.validationMCC = validationMCC ;
% 
% 
% validationMetrics.max_validationAccuracy = max(validationAccuracy);
% validationMetrics.max_validationRecall   = max(validationRecall);
% validationMetrics.max_validationPrecision = max(validationPrecision) ;
% validationMetrics.max_validationFallout = min(validationFallout) ;
%  validationMetrics.max_validationF1 = max(validationF1)  ;
%  validationMetrics.max_validationF2 = max(validationF2)  ;
%  validationMetrics.max_validationMCC = max(validationMCC) ;
% 
%  fprintf('***********************************************************  \n');
% 
%   fprintf('MAX Accuracy : %g \n',max(validationAccuracy));
%  fprintf('MAX Recall : %g \n',max(validationRecall));
%  fprintf('MAX Precision  : %g \n',max(validationPrecision));
%  fprintf('MIN Fall-out  : %g \n',min(validationFallout) );
%  fprintf('MAX F1 : %g \n',max(validationF1));
%  fprintf('MAX F2 : %g \n',max(validationF2));
%  fprintf('MAX MCC  : %g \n',max(validationMCC));
%  fprintf('------------------------ \n')