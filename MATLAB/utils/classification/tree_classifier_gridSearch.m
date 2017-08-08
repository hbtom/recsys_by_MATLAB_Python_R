function validationMetrics = tree_classifier_gridSearch(inputTable,train_index,test_index,printFlag)

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
        validationKappa = [];
isCategoricalPredictor = false(size(predictorNames));     

% Set up holdout validation
if isempty(train_index) && isempty(test_index)
    rng(1234);
    cvp = cvpartition(response, 'Holdout', 0.25);
    train_index = cvp.training ;
     test_index = cvp.test     ;
end


trainingPredictors = predictors(train_index, :);
trainingResponse = response(train_index, :);
trainingIsCategoricalPredictor = isCategoricalPredictor;

treeParam.maxSplit = {4,32,128,512,1024,2048};
 treeParam.minLeaf = {3,10,50,100};
treeParam.splitCri = {'gdi','deviance'};


 n_maxSplit = length(treeParam.maxSplit);
 n_minLeaf  = length(treeParam.minLeaf);
 n_splitCri = length(treeParam.splitCri);
 n_search = n_maxSplit*n_minLeaf*n_splitCri;

 
 parfor n1 = 1 : n_maxSplit
     for n2 = 1 : n_minLeaf
         for n3 = 1:n_splitCri
             
             % This code specifies all the classifier options and trains the classifier.
             
             classificationTree = fitctree(...
                 trainingPredictors, ...
                 trainingResponse, ...
                 'MaxNumSplits', treeParam.maxSplit{n1}, ...
                 'MinLeafSize',treeParam.minLeaf{n2},...
                 'SplitCriterion',treeParam.splitCri{n3},...
                 'NumVariablesToSample','all',...
                 'ClassNames', [0; 1]);
             
             treePredictFcn = @(x) predict(classificationTree, x);
             validationPredictFcn = @(x) treePredictFcn(x);
             
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
             
             
             validationAccuracy(n1,n2,n3) = accr     ;
             validationRecall(n1,n2,n3) = recall   ;
             validationPrecision(n1,n2,n3) = precision;
             validationFallout(n1,n2,n3) = fallout  ;
             validationSpec(n1,n2,n3) = spec     ;
             validationF1(n1,n2,n3) = f1       ;
             validationF2(n1,n2,n3) = f2       ;
             validationMCC(n1,n2,n3) = MCC      ;
             validationG(n1,n2,n3) = G        ;
             validationKappa(n1,n2,n3) = Kappa    ;
             
             
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
 validationMetrics.validationKappa = validationKappa    ;
 
  [m1,ind1] = max(validationAccuracy(:));
  [m2,ind2] = max(validationRecall(:));
  [m3,ind3] = max(validationPrecision(:)) ;
  [m4,ind4] = min(validationFallout(:)) ;
  [m5,ind5] = max(validationSpec(:));
  [m6,ind6] = max(validationF1(:))  ;
  [m7,ind7] = max(validationF2(:))  ;
  [m8,ind8] = max(validationMCC(:)) ;
  [m9,ind9] = max(validationG(:)) ;
  [m10,ind10] = max(validationKappa(:));

 
 validationMetrics.max_validationAccuracy = m1;
 validationMetrics.max_validationRecall   = m2;
validationMetrics.max_validationPrecision = m3;
  validationMetrics.min_validationFallout = m4;
     validationMetrics.max_validationSpec = m5;
       validationMetrics.max_validationF1 = m6;
       validationMetrics.max_validationF2 = m7;
      validationMetrics.max_validationMCC = m8;
        validationMetrics.max_validationG = m9;
    validationMetrics.max_validationKappa = m10;
    

 	             siz = [n_maxSplit,n_minLeaf,n_splitCri];
    [dim1,dim2,dim3] = ind2sub(siz,ind1);
 validationMetrics.max_validationAccuracy_param = {treeParam.maxSplit{dim1} treeParam.minLeaf{dim2} treeParam.splitCri{dim3}};

 [dim1,dim2,dim3] = ind2sub(siz,ind2);
 validationMetrics.max_validationRecall_param   = {treeParam.maxSplit{dim1} treeParam.minLeaf{dim2} treeParam.splitCri{dim3}};
 
     [dim1,dim2,dim3] = ind2sub(siz,ind3);
validationMetrics.max_validationPrecision_param = {treeParam.maxSplit{dim1} treeParam.minLeaf{dim2} treeParam.splitCri{dim3}};

    [dim1,dim2,dim3] = ind2sub(siz,ind4);
validationMetrics.min_validationFallout_param = {treeParam.maxSplit{dim1} treeParam.minLeaf{dim2} treeParam.splitCri{dim3}};

    [dim1,dim2,dim3] = ind2sub(siz,ind5);
validationMetrics.max_validationSpec_param = {treeParam.maxSplit{dim1} treeParam.minLeaf{dim2} treeParam.splitCri{dim3}};

    [dim1,dim2,dim3] = ind2sub(siz,ind6);
       validationMetrics.max_validationF1_param = {treeParam.maxSplit{dim1} treeParam.minLeaf{dim2} treeParam.splitCri{dim3}};
       
           [dim1,dim2,dim3] = ind2sub(siz,ind7);
       validationMetrics.max_validationF2_param = {treeParam.maxSplit{dim1} treeParam.minLeaf{dim2} treeParam.splitCri{dim3}};
       
           [dim1,dim2,dim3] = ind2sub(siz,ind8);
      validationMetrics.max_validationMCC_param = {treeParam.maxSplit{dim1} treeParam.minLeaf{dim2} treeParam.splitCri{dim3}};
      
          [dim1,dim2,dim3] = ind2sub(siz,ind9);
        validationMetrics.max_validationG_param = {treeParam.maxSplit{dim1} treeParam.minLeaf{dim2} treeParam.splitCri{dim3}};
        
            [dim1,dim2,dim3] = ind2sub(siz,ind10);
    validationMetrics.max_validationKappa_param = {treeParam.maxSplit{dim1} treeParam.minLeaf{dim2} treeParam.splitCri{dim3}};
    

    if printFlag == 1
fprintf('**************************************************************************************************  \n');
fprintf('  Grid Search Over TREE - CLF hyper-parameters  (n_maxSplit x n_minLeaf x n_splitCri=%dx%dx%d=%d cases): \n',n_maxSplit,n_minLeaf,n_splitCri,n_search);
fprintf('**************************************************************************************************  \n');

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


