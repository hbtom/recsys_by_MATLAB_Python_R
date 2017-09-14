function output = recall_at_k(ranked_list,pos_items_ids,k)

% The function computes Recall metric at particular cut_off value k.
%  Inputs: 
%            ranked_list: ranked recommendation list
%         pos_items_ids : Ids of positive items
%                    k  : cut_off value 
% Outputs:
%               output  : recall score at k
% Example: 
%     ranked_list_1 = [2 5 1 4 3]  -> Re@3 = 2/4 ,  Re@5 = 4/4 
%     ranked_list_2 = [10 8 3 5 1] -> Re@3 = 1/4 ,  Re@5 = 3/4
%     pos_items_ids = [1 5 4 3]
%
% Yashar Deldjoo
% Sep 14, 2017 
% Politecnico di Milano, Italy

   ranked_list = ranked_list(1:k);
          olap = length(intersect(ranked_list,pos_items_ids));
   recall_at_k = olap/length(pos_items_ids) ;



output = recall_at_k ;

end

