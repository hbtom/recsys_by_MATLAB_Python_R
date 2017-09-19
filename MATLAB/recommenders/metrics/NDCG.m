function output = NDCG(ranked_list,pos_items_ids,pos_rel_scores,k,gain_factor)

% The function computes Recall metric at particular cut_off value k.
%  Inputs: 
%            ranked_list: ranked recommendation list
%         pos_items_ids : Ids of positive items
%        pos_rel_scores : relevance score for positive items(e.g., ratings)
%                    k  : cut_off value 
% Outputs:
%               output  : recall score at k
% Example: 
%     ranked_list_1 = [2 1 5 4 3]    -> DCG1 = 5/log2(3)+5/log2(4)+4/log2(5)+4/log2(6)
%     ranked_list_2 = [2 4 3 1 5]    -> DCG2 = 4/log2(3)+4/log2(4)+5/log2(5)+5/log2(6)
%     ranked_list_3 = [10 8 3 5 1]   -> DCG3 = 4/log2(4)+5/log2(5)+5/log2(6)
%     pos_items_ids = [1 5 4 3]      -> IDCG = 5/log2(2)+5/log2(3)+4/log2(4)+4/log2(5)
%     pos_relevance_scores = [5 5 4 4] 
%    
%     ratings = [5 2 4 4 5 3 2 na 3 na]  
%     pos_items_ids = [1 5 4 3] 
%
% Yashar Deldjoo
% Sep 14, 2017 
% Politecnico di Milano, Italy

ranked_list = ranked_list(1:k);

IDCG = 0 ;

for i = 1 : length(pos_items_ids)
    if strcmp(gain_factor,'exp')
        gain = 2^pos_rel_scores(i)-1 ;
    elseif strcmp(gain_factor,'rating')
        gain = pos_rel_scores(i) ;        
    end
    IDCG = IDCG +  gain/log2(i+1);
end

DCG = 0 ;

for j = 1 : length(ranked_list)
    ind = find(pos_items_ids==ranked_list(j));
    if ~isempty(ind) 
        if strcmp(gain_factor,'exp')
            gain = 2^pos_rel_scores(ind)-1 ;
        elseif strcmp(gain_factor,'rating')
            gain = pos_rel_scores(ind) ;
        end
        DCG = DCG +  gain/log2(j+1);
        
    end
end

NDCG = DCG/IDCG;

assert((0<=NDCG) && (NDCG<=1),'The condition 0<=NDCG<=1 did NOT hold!');

output = NDCG ;

end

