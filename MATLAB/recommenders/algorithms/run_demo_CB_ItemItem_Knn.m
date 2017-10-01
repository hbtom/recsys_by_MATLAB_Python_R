clear
clc
close 

tvDim_List = [40,100];
for nn = [5,10,20,50]
    for gmm_size = [128,256]
        parfor t = [1,2]
            tvDim = tvDim_List(t);
            [gmm_size,tvDim,nn]
            demo_CB_ItemItem_Knn
        end
    end
end
    
    %     gmm_size = 128;       % small = [128,256]  big = [16,32,64,128,256,512]
%        tvDim = 40 ;       % small = [40,100, 200];
