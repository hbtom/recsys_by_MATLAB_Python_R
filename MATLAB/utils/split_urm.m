function [] = split_urm(urm, split_type, k, pop_thr,output_fold)

% This function splits a user-item-rating matrix (URM) into a train and test matrices using k-fold CV. 
% The splitting can be done on the coice of user: (1) rating-wise (2) item-wise (3) user-wise. 

% Inputs:
%          urm : user-item-rating matrix [userId, itemId, rating, timestamp]  (timestamp: optional) 
%    split_type: type of splitting (options: 'rating','item','user')
%            k : k in k-fold CV (e.g. 5, 10)
%      pop_thr : % of popular items to be removed prior to splitting (e.g. 0.01, 0.05, 0.1) 
%  output_fold : output folder  
%      
%       

userIds = table2array(urm(:,1));
itemIds = table2array(urm(:,2));
ratings = table2array(urm(:,3));


n_u = length(unique(userIds));
n_i = length(unique(itemIds));
n_r = length(ratings);
den = n_r/(n_u*n_i);

fprintf('*** Original URM statistics *** \n');
fprintf('Number of unique users: %g \n',n_u)
fprintf('Number of unique items: %g \n',n_i)
fprintf('Number of ratings: %d \n',n_r)
fprintf('Density of URM: %g \n',den)

if pop_thr>0
    n_pop = floor(pop_thr * n_i);
    unique_itemIds = unique(itemIds)     ;
    nCount = histc(itemIds,unique_itemIds);
    
    [v,ind] = sort(nCount,'descend');
    itemIds_pop = unique_itemIds(ind(1:n_pop));
    
    remove_rows_ind = ismember(itemIds,itemIds_pop);
    urm(remove_rows_ind,:) = [];
    
    userIds = table2array(urm(:,1));
    itemIds = table2array(urm(:,2));
    ratings = table2array(urm(:,3));
    
    
    n_u = length(unique(userIds));
    n_i = length(unique(itemIds));
    n_r = length(ratings);
    den = n_r/(n_u*n_i);
    
    fprintf('\n');
    fprintf('*** URM statistics after %g%% popular-item removal *** \n',100*pop_thr)
    fprintf('Number of unqiue users: %g \n',n_u)
    fprintf('Number of unique items: %g \n',n_i)
    fprintf('Number of ratings: %d \n',n_r)
    fprintf('Density of URM: %g \n',den)
end

fprintf('\n');
fprintf('Split type: %s \n', split_type)
fprintf('k-fold CV k=%g \n', k)

     fold_size = floor(n_r/k);
rating_indices = randperm(n_r); 

for i = 1 : k
    train_indices = rating_indices((i-1)*fold_size+1:i*fold_size);
     test_indices = setdiff(rating_indices, train_indices)       ;
        urm_train = urm(train_indices,:) ;
         urm_test = urm(test_indices,:)  ;
         
         ind = ismember(table2array(urm_train),table2array(urm_test),'rows');
         dup_ind = find(ind) ;
         if isempty(dup_ind)
             disp(['Fold ' num2str(i) ': No duplicate entries found between train and test URMs.']);           
         else
             disp(['Fold ' num2str(i) ': A duplicate entries found between train and test URMs!'])
             fprintf('\n')
             disp('Check the following rows in urm_train:')
             dup_ind
         end
         
         writetable(urm_train,fullfile(output_fold,['urm_train_split_type_' split_type '_fold' num2str(i) 'of' num2str(k) '_pop_removed_' num2str(pop_thr) '.csv']))
         writetable(urm_test,fullfile(output_fold,['urm_test_split_type_' split_type '_fold' num2str(i) 'of' num2str(k) '_pop_removed_' num2str(pop_thr) '.csv']))
         disp(['Fold ' num2str(i) ' printed ...'])

end

