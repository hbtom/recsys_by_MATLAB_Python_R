function []=run_demo_CB_ItemItem_Knn(nn_ind)

feature_name = 'genre' ;
 rand_rec_ON = 'NO';   

nnList = [5,10,20];
nn = nnList(nn_ind);
for gmm_size = [128]
    for tvDim = [40]
        [gmm_size,tvDim,nn]
        demo_CB_ItemItem_Knn
    end
end

    %     gmm_size = 128;       % small = [128,256]  big = [16,32,64,128,256,512]
%        tvDim = 40 ;       % small = [40,100, 200];
