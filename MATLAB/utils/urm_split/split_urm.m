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

fprintf('******************************* \n');
fprintf('*** Original URM statistics *** \n');
fprintf('******************************* \n');
fprintf('Number of unique users: %g \n',n_u)
fprintf('Number of unique items: %g \n',n_i)
fprintf('Number of ratings: %d \n',n_r)
fprintf('Density of URM: %g \n',den)

fileID = fopen('info.txt','a');
fprintf(fileID,'******************************* \n');
fprintf(fileID,'*** Original URM statistics *** \n');
fprintf(fileID,'******************************* \n');
fprintf(fileID,'Number of unique users: %g \n',n_u);
fprintf(fileID,'Number of unique items: %g \n',n_i);
fprintf(fileID,'Number of ratings: %d \n',n_r);
fprintf(fileID,'Density of URM: %g \n',den);

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
    fprintf('****************************************************** \n');
    fprintf('*** URM statistics after %g%% popular-item removal *** \n',100*pop_thr);
    fprintf('****************************************************** \n');
    fprintf('Number of unique users: %g \n',n_u);
    fprintf('Number of unique items: %g \n',n_i);
    fprintf('Number of ratings: %d \n',n_r);
    fprintf('Density of URM: %g \n',den);
    
    
    fprintf(fileID,'\n');
    fprintf(fileID,'****************************************************** \n');
    fprintf(fileID,'*** URM statistics after %g%% popular-item removal *** \n',100*pop_thr);
    fprintf(fileID,'****************************************************** \n');
    fprintf(fileID,'Number of unique users: %g \n',n_u);
    fprintf(fileID,'Number of unique items: %g \n',n_i);
    fprintf(fileID,'Number of ratings: %d \n',n_r);
    fprintf(fileID,'Density of URM: %g \n',den);
end

fprintf('\n');
fprintf('Split type: %s \n', split_type);
fprintf('k-fold CV k=%g \n', k)

fprintf(fileID,'\n');
fprintf(fileID,'Split type: %s \n', split_type);
fprintf(fileID,'k-fold CV k=%g \n', k);
fclose(fileID);

if strcmp(split_type,'rating')
    
    fold_size = floor(n_r/k);
    rating_indices = randperm(n_r);
    
    for fld = 1 : k
        test_indices_urmRows = rating_indices((fld-1)*fold_size+1:fld*fold_size);
        train_indices_urmRows = setdiff(rating_indices, test_indices_urmRows)   ;
        urm_train = urm(train_indices_urmRows,:) ;
        urm_test = urm(test_indices_urmRows,:)  ;
        
        dup_ind = ismember(table2array(urm_train),table2array(urm_test),'rows');
        if isempty(find(dup_ind, 1))
            disp(['Fold ' num2str(fld) ': No duplicate entries (user,item,rating) found between train and test URMs.']);
        else
            disp(['Fold ' num2str(fld) ': A duplicate entries (user,item,rating) found between train and test URMs!'])
            fprintf('\n')
            disp('Check the following rows in urm_train:')
            find(dup_ind)
        end
        
        writetable(urm_train,fullfile(output_fold,['urm_train_split_type_' split_type '_fold' num2str(fld) 'of' num2str(k) '_pop_removed_' num2str(pop_thr) '.csv']))
        writetable(urm_test,fullfile(output_fold,['urm_test_split_type_' split_type '_fold' num2str(fld) 'of' num2str(k) '_pop_removed_' num2str(pop_thr) '.csv']))
        disp(['Fold ' num2str(fld) ' printed ...'])
        
    end
    
elseif strcmp(split_type,'item')
    
    unique_itemIds = unique(itemIds);
               n_i = length(unique_itemIds);
         fold_size = floor(n_i/k);
      item_indices = randperm(n_i);
    
    for fld = 1 : k
        test_itemIds = unique_itemIds(item_indices((fld-1)*fold_size+1:fld*fold_size));
       train_itemIds = setdiff(unique_itemIds, test_itemIds)       ;
         
        test_indices_urmRows = ismember(itemIds,test_itemIds);
       train_indices_urmRows = not(test_indices_urmRows);
       
       
       urm_train = urm(train_indices_urmRows,:)   ;
        urm_test = urm(test_indices_urmRows,:)  ;

         dup_ind = ismember(table2array(urm_train(:,2)),table2array(urm_test(:,2)));

     if isempty(find(dup_ind, 1))
         disp(['Fold ' num2str(fld) ': No duplicate item found between train and test URMs.']);
     else
         disp(['Fold ' num2str(fld) ': A duplicate item found between train and test URMs!']);
         fprintf('\n');
         disp('Check the following rows in urm_train:')
         find(dup_ind)
     end
     
        writetable(urm_train,fullfile(output_fold,['urm_train_split_type_' split_type '_fold' num2str(fld) 'of' num2str(k) '_pop_removed_' num2str(pop_thr) '.csv']))
        writetable(urm_test,fullfile(output_fold,['urm_test_split_type_' split_type '_fold' num2str(fld) 'of' num2str(k) '_pop_removed_' num2str(pop_thr) '.csv']))
        disp(['Fold ' num2str(fld) ' printed ...'])    
        
    end
end


