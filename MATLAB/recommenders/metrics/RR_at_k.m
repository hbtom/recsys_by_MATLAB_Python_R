function output = RR_at_k(ranked_list,pos_items_ids,k)

% Reciprocal rank (RR) measures how far down the recommendation list we 
% have to go to find the FIRST relevant item. The metric is calculated  
% by finding the reciprocal rank of the FIRST relevant item.
% Inputs: 
%           ranked_list : ranked recommendation list
%         pos_items_ids : Ids of positive items
%                    k  : cut_off value 

% Outputs:
%               output  : RR score at k
% Example: 
%      ranked_list_1 = [2 5 1 4 3]  -> RR@3 = 1/2, RR@5 = 1/2
%      ranked_list_2 = [10 8 3 5 1] -> RR@3 = 1/3, RR@5 = 1/3
%      ranked_list_3 = [10 7 8 3 2] -> RR@3 = 0  , RR@5 = 1/4
%      pos_items_ids = [1 5 4 3]
%
% Yashar Deldjoo
% Sep 14, 2017 
% Politecnico di Milano, Italy

      ranked_list = ranked_list(1:k);
      is_relevant = ismember(ranked_list,pos_items_ids);
      first_relevant_id = find(is_relevant,1);
      if isempty(first_relevant_id)
          RR_score = 0 ;
      else
          RR_score = 1/first_relevant_id;
      end
      
      output = RR_score;
end

