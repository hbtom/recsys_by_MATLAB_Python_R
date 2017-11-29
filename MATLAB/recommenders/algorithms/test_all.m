clear
clc
close all


run_demo_CBF_ItemItem_Knn('audio_ivec','NO',10,[256],[40],[1],0)
run_demo_CBF_ItemItem_Knn('audio_ivec','NO',10,[256],[100],[1],0)
run_demo_CBF_ItemItem_Knn('audio_ivec','NO',10,[256],[200],[1],0)

run_demo_CBF_ItemItem_Knn('audio_ivec','NO',10,[512],[40],[1],0)
run_demo_CBF_ItemItem_Knn('audio_ivec','NO',10,[512],[100],[1],0)
run_demo_CBF_ItemItem_Knn('audio_ivec','NO',10,[512],[200],[1],0)

