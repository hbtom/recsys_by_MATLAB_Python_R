import pandas as pd
import numpy as np
import os

os.system('clear')


input_rating_file = '/Users/yashar/Documents/GitHub/data/inputs/ml-20m/ratings.csv'

urm_df = pd.read_csv(input_rating_file, header=0, sep=',')
k = 10

userIds = urm_df['userId']
itemIds = urm_df['movieId']
ratings = urm_df['rating']

n_r = urm_df.shape[0]
n_i = np.unique(itemIds).shape[0]
n_u = np.unique(userIds).shape[0]
den = n_r / (n_u * n_i)

print('******************************* ')
print('*** Original URM statistics *** ')
print('******************************* ')
print('Number of unique users: {} ' .format(n_u))
print('Number of unique items: {} ' .format(n_i))
print('Number of ratings: {} ' .format(n_r))
print('Density of URM: {} ' .format(den))

# some_values = [586, 590]
a = urm_df['movieId'] .value_counts()
ap = a[0: 10]
b = ap.values
c = np.array(ap.index)
print(ap)
print(b)
print(c)

# print(urm_df['movieId'].value_counts())
# a = urm_df['movieId'].value_counts().idxmax()
# print(a)
# print(urm_df.mode())
# pop_thr = 0.1
# if pop_thr > 0:
#     n_pop = np.floor(pop_thr * n_i)
#     unique_itemIds = np.unique(itemIds)
#     print(unique_itemIds)
# nCount = histc(itemIds, unique_itemIds)

# [v, ind] = sort(nCount, 'descend')
# itemIds_pop = unique_itemIds(ind(1: n_pop))

# remove_rows_ind = ismember(itemIds, itemIds_pop)
# urm(remove_rows_ind, : ) = []

# userIds = table2array(urm(: , 1))
# itemIds = table2array(urm(: , 2))
# ratings = table2array(urm(: , 3))

# n_u = length(unique(userIds))
# n_i = length(unique(itemIds))
# n_r = length(ratings)
# den = n_r / (n_u * n_i)

# fprintf('\n')
# fprintf('****************************************************** \n')
# fprintf('*** URM statistics after %g%% popular-item removal *** \n', 100 * pop_thr)
# fprintf('****************************************************** \n')
# fprintf('Number of unique users: %g \n', n_u)
# fprintf('Number of unique items: %g \n', n_i)
# fprintf('Number of ratings: %d \n', n_r)
# fprintf('Density of URM: %g \n', den)

# rating_indices = np.random.permutation(n_r)
# print(rating_indices.shape[0])
# for fld in range(0, k):
#     test_indices_urmRows = rating_indices[fld * fold_size:(fld + 1) * fold_size - 1]
#     train_indices_urmRows = np.setdiff1d(rating_indices, test_indices_urmRows)
#     print(test_indices_urmRows.shape[0])
#     print(train_indices_urmRows.shape[0])
