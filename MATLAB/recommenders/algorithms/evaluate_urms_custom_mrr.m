function output = evaluate_urms_custom_mrr(urmTest,urmPred1_str,cut_off_trg,flag_rec,baselineFeature)
tic
rng(12345);
fprintf('Evaluation started ...  \n');


% AVF
 urmPred1{1} = urmPred1_str.urm1;
 urmPred1{2} = urmPred1_str.urm2;
 urmPred1{3} = urmPred1_str.urm3;

urmPred1_f = urmPred1{flag_rec};

p = 0;
tic
for u = 1 : size(urmTest,1)
    
    if strcmp(baselineFeature,'Random') ==1
        ranked_list = randperm(size(urmTest,2));
    else
        [rp_ivec,ranked_list] = sort(urmPred1_f(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
    end
    pos_items_ids = find(urmTest(u,:)>3);
    
    if isempty(pos_items_ids)
        continue
    end
    
    if mod(p,2500)==1
        fprintf('%d true users evaluated \n',p)
    end
    
    p = p + 1;
    
    mrr_ranked_list(p) = RR_at_k(ranked_list,pos_items_ids,cut_off_trg);
    
end

toc
fprintf('Evaluation completed! %d evaluated out of %d \n',p,size(urmTest,1))

output.mrr_ranked_list = mean(mrr_ranked_list)  ;






end








