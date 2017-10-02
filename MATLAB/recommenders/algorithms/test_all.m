clear
clc
close all

parpool('local',2)

parfor nn_ind = 1 : 4
    run_demo_CB_ItemItem_Knn(nn_ind)
    
end
    
    
    