function output = evaluate_RMSE(y_pred,y_grnd,param)

% The function calculates the RMSE metric on two equally-sized user-rating
% matrices (urms), 'y_pred' and 'y_grnd': 
%
%   RMSE = sqrt(1/N sum_{i=1:N}((y_pred-y_grnd).^2)   N: # of nz elements in y_grnd
%                                                    
% Inputs: 
%        y_pred: the predicted urm (n_u*n_i)
%        y_grnd: the ground truth urm (n_u*n_i)
%        param : structure containing some control paramters 
% Outputs:
%        output: the RMSE between the two urms (1*1)

% Yashar Deldjoo
% Politecnico di Milano 
% September 6, 2017

if size(y_pred,1) ~= size(y_grnd,1) || size(y_pred,2) ~= size(y_grnd,2)
    error('RMSE metric - the size of two matrices are NOT equal!')
end

             E = y_pred-y_grnd           ;        
   RMSE_metric = E(y_grnd>0).^2          ;
   RMSE_metric = sqrt(mean(RMSE_metric)) ;
   
   
   
        output =  RMSE_metric            ; 