function output = evaluate_urms_custom_mrr_Borda(urmTest,urmPred1_str,urmPred2_str,cut_off_trg,flag_rec,baselineFeature)
tic
rng(12345);
fprintf('Evaluation started ...  \n');


% AVF
 urmPred1{1} = urmPred1_str.urm1;
 urmPred1{2} = urmPred1_str.urm2;
 urmPred1{3} = urmPred1_str.urm3;
 
 urmPred2{1} = urmPred2_str.urm1;
 urmPred2{2} = urmPred2_str.urm2;
 urmPred2{3} = urmPred2_str.urm3;

urmPred1_f = urmPred1{flag_rec};
urmPred2_f = urmPred2{flag_rec};

p = 0;
tic
for u = 1 : size(urmTest,1)
    
    if strcmp(baselineFeature,'Random') ==1
        ranked_list = randperm(size(urmTest,2));
    else
        [rp_ivec1,ranked_list1] = sort(urmPred1_f(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_ivec2,ranked_list2] = sort(urmPred2_f(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        
        cnt = 0 ;
        for a = linspace(0,1,100)
            cnt = cnt + 1 ;
            ranked_list_aggr{cnt} = aggregate_rank_borda(ranked_list1, ranked_list2,urmTest,a,1-a);
        end

    end
    pos_items_ids = find(urmTest(u,:)>3);
    
    if isempty(pos_items_ids)
        continue
    end
    
    if mod(p,2500)==1
        fprintf('%d true users evaluated \n',p)
    end
    
    p = p + 1;
    
    for cnt = 1 : 100
        eval(['mrr_ranked_list' num2str(cnt) '(p) = RR_at_k(ranked_list_aggr{' num2str(cnt) '},pos_items_ids,cut_off_trg);'])
    end

end

toc
fprintf('Evaluation completed! %d evaluated out of %d \n',p,size(urmTest,1))

for cnt = 1 : 100
    
    eval(['output.mrr_ranked_list' num2str(cnt) ' = mean(mrr_ranked_list' num2str(cnt) ');']);
    
end





end








