clear
clc
close all

inputRating = [1    4     3;
               5    8   2.5;
               9   12     4;
               13  12     5;
               5   14     1];
           
inputRating = array2table(inputRating)
inputRating.Properties.VariableNames = {'userId','movieId','rating'};

output = prepare_ratingMat_Id2ind(inputRating,'userId','movieId','rating');
inputRating_New = output.inputRating_New
user_Id2idx = output.user_Id2idx
item_Id2Idx = output.item_Id2Idx

urmNew = sparse(inputRating_New.userId,inputRating_New.movieId,inputRating.rating)