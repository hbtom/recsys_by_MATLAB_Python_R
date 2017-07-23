function [validationAccuracy,best_validationAccuracy] = tree_classifier_gridSearch(inputTable,printFlag)

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

treeParam.maxSplit = {4,10,20,50,100,200,400,...
                      4,10,20,50,100,200,400,...
                      4,10,20,50,100,200,400};
treeParam.splitCri = {'gdi','gdi','gdi','gdi','gdi','gdi','gdi',...
                      'twoing','twoing','twoing','twoing','twoing','twoing','twoing',...
                      'deviance','deviance','deviance','deviance','deviance','deviance','deviance'};

             

fprintf('***********************************************************  \n');
fprintf('  Grid Search Over TREE - CLF hyper-parameters (%d cases): \n',length(treeParam.maxSplit));
fprintf('***********************************************************  \n');

                   
for param = 1 : length(treeParam.maxSplit)
    % 'Cosine','Minkowski',
    % Train a classifier
    % This code specifies all the classifier options and trains the classifier.
    classificationTree = fitctree(...
        trainingPredictors, ...
        trainingResponse, ...
        'SplitCriterion', treeParam.splitCri{param}, ...
        'MaxNumSplits', treeParam.maxSplit{param}, ...
        'Surrogate', 'off', ...
        'ClassNames', [0; 1]);
    
    % Create the result struct with predict function
    treePredictFcn = @(x) predict(classificationTree, x);
    validationPredictFcn = @(x) treePredictFcn(x);

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
       fprintf('Split Criterion: %s \n',treeParam.splitCri{param});
       fprintf('Max number of Split: %d \n',treeParam.maxSplit{param});
       fprintf('Accuracy : %g \n',validationAccuracy(end));
       fprintf('------------------------ \n')
   end

end


[value,ind] = max(validationAccuracy);
best_validationAccuracy.value = value;
best_validationAccuracy.splitCrit =  treeParam.splitCri{ind}  ;
 best_validationAccuracy.maxSplit =  treeParam.maxSplit{ind}   ;


