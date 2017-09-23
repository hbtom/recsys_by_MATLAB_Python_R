function simArray = prepare_distance_3tuple(feature_table,sim_type,col1_name)

% The function prepares a similarity array [item_i,item_j,sim_score] which
% contains the pairwise similarity between each pair of items. The first
% column of the matrix is assumed to contain item ids.
%
% Inputs:
%        feature_table : the input feature table  [n_i*nf+1]
%             sim_type : similarity type
%            col1_name : the title of column 1
% Outputs:
%             simArray : the output similarity array [n_i*3]  

%
% Yashar Deldjoo
% Sep 23, 2017 
% Politecnico di Milano, Italy
% Johannes Kepler University Linz, Austria

eval(['itemIds = feature_table.' col1_name ';']);

ICM = table2array(feature_table(:,2:end));

n_i = size(ICM,1);

dist_score = squareform(pdist(ICM,sim_type));

simArray= [];
for i = 1 : n_i
    for j = i+1: n_i
        simArray = [simArray;[itemIds(i) itemIds(j) dist_score(i,j)]];
    end
end

simArray = array2table(simArray);
simArray.Properties.VariableNames = {'item_i','item_j',[sim_type '_dist_score']};

end

