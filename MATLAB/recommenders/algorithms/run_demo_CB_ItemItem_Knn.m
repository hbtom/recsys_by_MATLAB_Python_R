clear
clc
close 
for gmm_size = [128,256]
    for tvDim = [40,100]
            for nn = [10,20]
                gmm_size
                tvDim
                nn
                demo_CB_ItemItem_Knn
            end
    end
end
    
    %     gmm_size = 128;       % small = [128,256]  big = [16,32,64,128,256,512]
%        tvDim = 40 ;       % small = [40,100, 200];
