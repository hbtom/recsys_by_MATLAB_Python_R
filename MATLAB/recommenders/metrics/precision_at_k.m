function output = precision_at_k(ranked_list,pos_items_ids,k)

% The function computes Recall metric at particular cut_off value k.
%  Inputs: 
%            ranked_list: ranked recommendation list
%         pos_items_ids : Ids of positive items
%                    k  : cut_off value 
% Outputs:
%               output  : recall score at k
% Example: 
%      ranked_list_1 = [2 5 1 4 3]  -> P@3 = 2/3 ,  P@5 = 4/5 
%      ranked_list_2 = [10 8 3 5 1] -> P@3 = 1/3 ,  P@5 = 3/5 
%      pos_items_ids = [1 5 4 3]
%
% Yashar Deldjoo
% Sep 14, 2017 
% Politecnico di Milano, Italy


   ranked_list = ranked_list(1:k);
          olap = length(intersect(ranked_list,pos_items_ids));
precision_at_k = olap/k ;



output = precision_at_k ;

end

