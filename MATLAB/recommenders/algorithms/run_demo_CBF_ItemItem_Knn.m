function []=run_demo_CBF_ItemItem_Knn(feature_name,rand_rec_ON,nn,gmm_size,tvDim,fold_no,cold_per)

% feature_name = 'genre'; 'audio_ivec'
% rand_rec_ON = 'YES';


for gmm_size = gmm_size
    for tvDim = tvDim
        for fold_no = fold_no
            fold_no
            feature_name
            rand_rec_ON
            cold_per
            [gmm_size,tvDim,nn]
            demo_CBF_ItemItem_Knn
        end
    end
end

    %     gmm_size = 128;       % small = [128,256]  big = [16,32,64,128,256,512]
%        tvDim = 40 ;       % small = [40,100, 200];
