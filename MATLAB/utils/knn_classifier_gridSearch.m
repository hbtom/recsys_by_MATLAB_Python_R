function [validationAccuracy,best_validationAccuracy] = knn_classifier_gridSearch(inputTable,printFlag)

rng(1234);
%% Inputs:
%   trainingData: A table whose columns are the 'predictors' and the last column is the 'response'. 
% 

predictorNames = inputTable.Properties.VariableNames(1:end-1) ; 
    predictors = inputTable(:, predictorNames)                ;
      response = table2array(inputTable(:,end))               ;

    validationAccuracy = [];
isCategoricalPredictor = false(size(predictorNames));     

% Set up holdout validation
cvp = cvpartition(response, 'Holdout', 0.25);
trainingPredictors = predictors(cvp.training, :);
trainingResponse = response(cvp.training, :);
trainingIsCategoricalPredictor = isCategoricalPredictor;

knnParam.dist = {'Euclidean','Euclidean','Euclidean','Euclidean','Euclidean','Euclidean','Euclidean','Euclidean','Euclidean','Euclidean','Euclidean','Euclidean','Euclidean','Euclidean','Euclidean',...
                 'Cosine','Cosine','Cosine','Cosine','Cosine','Cosine','Cosine','Cosine','Cosine','Cosine','Cosine','Cosine','Cosine','Cosine','Cosine',...
                 'Minkowski','Minkowski','Minkowski',...
                 'Euclidean','Euclidean','Euclidean'};
             
knnParam.nn   = {1,2,3,4,5,6,7,8,9,10,15,20,25,50,100,...
                 1,2,3,4,5,6,7,8,9,10,15,20,25,50,100,...
                 1,10,100,...
                 1,10,100};

knnParam.Exp = {[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],...
                [],[],[],[],[],[],[],[],[],[],[],[],[],[],[],...
                3,3,3,...
                [],[],[]};
            
knnParam.distWeight = {'Equal','Equal','Equal','Equal','Equal','Equal','Equal','Equal','Equal','Equal','Equal','Equal','Equal','Equal','Equal',...
                       'Equal','Equal','Equal','Equal','Equal','Equal','Equal','Equal','Equal','Equal','Equal','Equal','Equal','Equal','Equal',...
                       'Equal','Equal','Equal',...
                       'SquaredInverse','SquaredInverse','SquaredInverse'}; 

fprintf('***********************************************************  \n');
fprintf('  Grid Search Over KNN - CLF hyper-parameters (%d cases): \n',length(knnParam.dist));
fprintf('***********************************************************  \n');

                   
for param = 1 : length(knnParam.dist)
   % 'Cosine','Minkowski',
   % Train a classifier
   % This code specifies all the classifier options and trains the classifier.
   classificationKNN = fitcknn(...
       trainingPredictors, ...
       trainingResponse, ...
       'Distance', knnParam.dist{param}, ...
       'Exponent', knnParam.Exp{param}, ...
       'NumNeighbors', knnParam.nn{param}, ...
       'DistanceWeight', knnParam.distWeight{param}, ...
       'Standardize', true, ...
       'ClassNames', [0; 1]);


%                        classificationKNN = fitcknn(...
%                            trainingPredictors, ...
%                            trainingResponse, ...
%                            'Distance', 'Euclidean', ...
%                            'Exponent', [], ...
%                            'NumNeighbors', 1, ...
%                            'DistanceWeight', 'Equal', ...
%                            'Standardize', true, ...
%                            'ClassNames', [0; 1]);

   % Create the result struct with predict function
   knnPredictFcn = @(x) predict(classificationKNN, x);
   validationPredictFcn = @(x) knnPredictFcn(x);


   % Compute validation predictions
   validationPredictors = predictors(cvp.test, :);
   validationResponse = response(cvp.test, :);
   [validationPredictions, validationScores] = validationPredictFcn(validationPredictors);

   % Compute validation accuracy
   correctPredictions = (validationPredictions == validationResponse);
   isMissing = isnan(validationResponse);
   correctPredictions = correctPredictions(~isMissing);
   validationAccuracy = [validationAccuracy sum(correctPredictions)/length(correctPredictions)];
   
   if (printFlag == 1)
       fprintf('Case %d: \n',param)
       fprintf('Distance: %s \n',knnParam.dist{param});
       fprintf('Exponent: %d \n',knnParam.Exp{param});
       fprintf('NumNeighbors: %d \n',knnParam.nn{param});
       fprintf('DistanceWeight: %s \n', knnParam.distWeight{param});
       fprintf('Standardize: %s \n','true');
       fprintf('Accuracy : %g \n',validationAccuracy(end));
       fprintf('------------------------ \n')
   end

end


[value,ind] = max(validationAccuracy);
best_validationAccuracy.value = value;
best_validationAccuracy.knnParam_dist =  knnParam.dist{ind}  ;
 best_validationAccuracy.knnParam_Exp =  knnParam.Exp{ind}   ;
  best_validationAccuracy.knnParam_nn =  knnParam.nn{ind}    ;
best_validationAccuracy.knnParam_distWeight =  knnParam.distWeight{ind};


