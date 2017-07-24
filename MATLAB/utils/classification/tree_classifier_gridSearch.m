function [validationAccuracy,best_validationAccuracy] = tree_classifier_gridSearch(inputTable,printFlag)

% This function fits a classification decision tree for binary classification. 
% The function applies a Hold-Out (75%-25%) as for the evaluation which
% is suited for large datasets.
%
% It is worthwhile to note that the function performs a grid-based
% hyperparameter search and automatically reports the results in each case as well
% as the best paramter setup:
%        o max # of Split = {4,10,20,50,100,200,400}
%        o Split Criterion: {'gdi','twoing','deviance'}   N = 7*3 cases

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
%                        value: 0.9553
%                    splitCrit: 'twoing'
%                     maxSplit: 200
%
% Yashar Deldjoo
% June 24th, 2017
     
rng(1234);

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


