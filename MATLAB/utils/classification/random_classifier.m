function validationMetrics = random_classifier(inputTable,train_index,test_index, printFlag)

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
        
    
predictorNames = inputTable.Properties.VariableNames(1:end-1) ; 
    predictors = inputTable(:, predictorNames)                ;
      response = table2array(inputTable(:,end))               ;

     validationAccuracy = [] ;
    validationPrecision = [] ;
       validationRecall = [] ;
      validationFallout = [] ;
         validationSpec = [] ;
           validationF1 = [] ;
           validationF2 = [] ;
          validationMCC = [] ;
          validationG   = [] ;
        validationKappa = [] ;

isCategoricalPredictor = false(size(predictorNames));     

% Set up holdout validation
if isempty(train_index) && isempty(test_index) 
    cvp = cvpartition(response, 'Holdout', 0.25);
    train_index = cvp.training ;
     test_index = cvp.test     ;
end


trainingPredictors = predictors(train_index, :);
trainingResponse = response(train_index, :);
trainingIsCategoricalPredictor = isCategoricalPredictor;



%    Compute validation predictions
validationPredictions = logical(randi([0 1],length(find(test_index)),1));
validationResponse = response(test_index, :);

   indP = find(validationResponse == 1) ;
   indN = find(validationResponse == 0) ;
   
       pred_at_indP = validationPredictions(indP)   ;
                 TP = length(find(pred_at_indP==1)) ;
                 FN = length(find(pred_at_indP==0)) ;
                 
        pred_at_indN = validationPredictions(indN)   ;
                  TN = length(find(pred_at_indN==0)) ;
                  FP = length(find(pred_at_indN==1)) ;
                 

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
            
                      validationAccuracy = accr     ;
                     validationRecall = recall   ;
                  validationPrecision = precision;
                    validationFallout = fallout  ;
                       validationSpec = spec     ;
                         validationF1 = f1       ;
                         validationF2 = f2       ;
                        validationMCC = MCC      ;  
                          validationG = G        ;      
                      validationKappa = Kappa    ;


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

fprintf('***********************************************************  \n');
fprintf('                      RANDOM Classifier                      \n');
fprintf('***********************************************************  \n');
        
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
