% Choose a Training Function
    % For a list of all training functions type: help nntrain
    % 'trainlm' is usually fastest.
    % 'trainbr' takes longer but may be better for challenging problems.
    % 'trainscg' uses less memory. Suitable in low memory situations.
    trainFcn = 'trainbr';  % Scaled conjugate gradient backpropagation.
    
    % Create a Pattern Recognition Network
    hiddenLayerSize = 10;
    net = patternnet(hiddenLayerSize, trainFcn);
    net.performParam.regularization = 0.1;

    % Choose Input and Output Pre/Post-Processing Functions
%     % For a list of all processing functions type: help nnprocess
%       net.input.processFcns = {'rem'};
%      net.output.processFcns = {'processpca'};
    
    % Setup Division of Data for Training, Validation, Testing
    % For a list of all data division functions type: help nndivide
    net.divideFcn = 'dividerand';  % Divide data randomly
    net.divideMode = 'sample';  % Divide up every sample
    net.divideParam.trainRatio = 70/100;
    net.divideParam.valRatio = 15/100;
    net.divideParam.testRatio = 15/100;

    
    % Choose a Performance Function
    % For a list of all performance functions type: help nnperformance
    net.performFcn = 'crossentropy';  % Cross-Entropy
%     net.trainParam.min_grad = 1e-9;
%     net.trainParam.goal	= 0;

    
    % Choose Plot Functions
    % For a list of all plot functions type: help nnplot
    net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
        'plotconfusion', 'plotroc'};
    
    
    % Train the Network
    x = table2array(ICM1(ismember(ICM1.movieId,item_Id2idx_tr.movieId),2:end));
    t = table2array(ICM2(ismember(ICM2.movieId,item_Id2idx_tr.movieId),2:end));
    x = x';
    t = t';
    % Train the Network
    [net,tr] = train(net,x,t);
    %load test_net.mat
    
    indTest = ismember(ICM1.movieId,item_Id2idx_te.movieId);
    xtest = table2array(ICM1(indTest,2:end));
    ytest = round(net(xtest'));
    ytest = array2table([ICM1.movieId(indTest) ytest']);
    ytest.Properties.VariableNames = ICM2.Properties.VariableNames;
%     ytrgtest = table2array(ICM2(ismember(ICM2.movieId,item_Id2idx_te.movieId),2:end));
%     ytrgtest = ytrgtest';
    
    ICM = [ICM2(ismember(ICM2.movieId,item_Id2idx_tr.movieId),1:end);ytest];