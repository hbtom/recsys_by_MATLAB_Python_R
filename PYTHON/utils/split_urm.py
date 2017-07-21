import pandas as pd
import numpy as np

input_rating_file = '/Users/yashar/Documents/GitHub/data/inputs/ml-20m/ratings2.csv'

urm_df = pd.read_csv(input_rating_file, header=0, sep=',')
k = 10

userIds = urm_df['userId']
itemIds = urm_df['movieId']
ratings = urm_df['rating']

n_r = urm_df.shape[0]

fold_size = np.floor(n_r / k)

rating_indices = np.random.permutation(n_r)
print(type(rating_indices))
