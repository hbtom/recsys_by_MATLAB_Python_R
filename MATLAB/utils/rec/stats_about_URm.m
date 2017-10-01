function stats = stats_about_URm(ratingDataset,name,col1_name,col2_name,col3_name)

eval(['userIds = ratingDataset.' col1_name ';']);
eval(['itemIds = ratingDataset.' col2_name ';']);
eval(['ratings = ratingDataset.' col3_name ';']);

n_u = length(unique(userIds));
n_i = length(unique(itemIds));
n_r = length(ratings);

fprintf('----------------------------------- \n');
fprintf('    Statistics about %s \n',name)       ;
fprintf('----------------------------------- \n');

fprintf('Number of users: %d \n',n_u)   ;
fprintf('Number of items: %d \n',n_i)   ;
fprintf('Number of ratings: %d \n',n_r) ;
fprintf('Density: %f \n',n_r/(n_u*n_i))  ;
fprintf('Avg number of ratings/user: %f \n',n_r/n_u)  ;
fprintf('Avg number of ratings/item: %f \n',n_r/n_i)  ;


stats.n_u = n_u;
stats.n_i = n_i;
stats.n_r = n_r;
