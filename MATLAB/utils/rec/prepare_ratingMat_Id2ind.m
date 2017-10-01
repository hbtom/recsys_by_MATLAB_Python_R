function output = prepare_ratingMat_Id2ind(inputRating,col1_name,col2_name,col3_name)

% This functions accepts as input, a rating matrix in the form 3-tuple
% [user, item, rating] and reports as output a new rating matrix in the 
% form 3-tuple [user, item, rating] in the following form. The advantage 
% of the NEW matrix is that the column and row indices corresponds to Ids
% starting from 1 to ... which makes it suitable to create a URM directly
% on the new Rating matrix.
%
% Yashar Deldjoo
% Sep 21, 2017 
% Politecnico di Milano, Italy
% 
% Example:
%          Inputs:
%
%                           userId  movieId   rating
%            inputRating = [  1        4         3
%                             5        8        2.5
%                             9       12         4
%                            13       12         5
%                             5       14         1 ]
%
%         Outputs:    
%                           userId  movieId   rating
%  output.inputRating_New = [ 1        1          3
%                             2        2         2.5  
%                             3        3          4
%                             4        3          5
%                             2        4          1 ]
%                        
%  output.user_Id2idx     = [1  1
%                            5  2
%                            9  3
%                           13  4];
%  
%  output.item_Id2idx     = [4   1
%                            8   2
%                            12  3
%                            14  4];
%

eval(['userId = inputRating.' col1_name ';']);
eval(['itemId = inputRating.' col2_name ';']);
eval(['rating = inputRating.' col3_name ';']);

userId_unq = unique(userId);
itemId_unq = unique(itemId);

userId_unq = userId_unq(:);
itemId_unq = itemId_unq(:);

user_Id2idx = [userId_unq';1:length(userId_unq)]';
item_Id2idx = [itemId_unq';1:length(itemId_unq)]';

[~, ind1] = ismember(userId,user_Id2idx(:,1));
[~, ind2] = ismember(itemId,item_Id2idx(:,1));
  ratings = inputRating.rating               ;

inputRating_New = [user_Id2idx(ind1,2) item_Id2idx(ind2,2) ratings(:)];

inputRating_New = array2table(inputRating_New);
inputRating_New.Properties.VariableNames = {['new_' col1_name],['new_' col2_name],col3_name};

output.inputRating_New = inputRating_New;
    
    user_Id2idx = array2table(user_Id2idx);
  user_Id2idx.Properties.VariableNames = {col1_name,['new_' col1_name]};
    output.user_Id2idx = user_Id2idx ;
       
       item_Id2idx = array2table(item_Id2idx);
       item_Id2idx.Properties.VariableNames = {col2_name,['new_' col2_name]};
       output.item_Id2Idx = item_Id2idx ;


