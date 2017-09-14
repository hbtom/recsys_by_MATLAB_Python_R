function output = MAP_at_k(ranked_list,pos_items_ids,k)

% The function computes Average Precision metric at particular cut_off 
% value k.
%  Inputs: 
%            ranked_list: ranked recommendation list
%         pos_items_ids : Ids of positive items
%                    k  : cut_off value 
% Outputs:
%               output  : recall score at k
% Example: 
%      ranked_list_1 = [2 5 1 4 3]  -> AP@3 = (1/2+2/3)/min(3,4)=7/18, AP@5=(1/2+2/3+3/4+4/5)/min(5,4)=163/240 
%      ranked_list_2 = [10 8 3 5 1] -> AP@3 = (1/3)/min(3,4)=1/9, AP@5 = (1/3+2/4+3/5)/min(5,4)=43/120
%      pos_items_ids = [1 5 4 3]
%
% Yashar Deldjoo
% Sep 14, 2017 
% Politecnico di Milano, Italy

is_relevant = ismember(ranked_list,pos_items_ids);
ap_score = 0 ;
for i = 1 : k
    tmp = precision_at_k(ranked_list(1:k),pos_items_ids,i);
    ap_score = ap_score + is_relevant(i).*tmp;
    
end

ap_score = ap_score/(min(k,length(pos_items_ids)));

assert((0<=ap_score) && (ap_score<=1),'The condition 0<=ap_score<=1 did NOT hold!');

output = ap_score ;

end

