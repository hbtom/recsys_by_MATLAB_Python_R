function output = evaluate_urms_custom_mrr_avf(urmTest,urmPred1_str,urmPred_base1_str,urmPred_base2_str,cut_off_trg,flag_rec)
tic
rng(12563);
fprintf('Evaluation started ...  \n');


% AVF
urmPred1{1} = urmPred1_str.urm1;
urmPred1{2} = urmPred1_str.urm2;
urmPred1{3} = urmPred1_str.urm3;

% Genre
urmPred_base1{1} = urmPred_base1_str.urm1;
urmPred_base1{2} = urmPred_base1_str.urm2;
urmPred_base1{3} = urmPred_base1_str.urm3;

% Tag
urmPred_base2{1} = urmPred_base2_str.urm1;
urmPred_base2{2} = urmPred_base2_str.urm2;
urmPred_base2{3} = urmPred_base2_str.urm3;


urmPred1_f = urmPred1{flag_rec};
urmPred_base1_f = urmPred_base1{flag_rec};
urmPred_base2_f = urmPred_base2{flag_rec};


p = 0;
tic
for u = 1 : size(urmTest,1)
    nz1 = nnz(urmPred1_f(u,:));
    nz3 = nnz(urmPred_base1_f(u,:));
    nz4 = nnz(urmPred_base2_f(u,:));
    
    
    nzref = nnz(urmTest(u,:));
    
    if (nz1 == nzref && nz3 == nzref && nz4 == nzref)
        
        
%         [rp_ivec,ranked_list_avf] = sort(urmPred1_f(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
                 ranked_list_avf            = randperm(size(urmTest,2));

        [rp_genre,ranked_list_genre] = sort(urmPred_base1_f(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_tag,ranked_list_tag] = sort(urmPred_base2_f(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        
        
        pos_items_ids = find(urmTest(u,:)>3);
        
        if isempty(pos_items_ids)
            continue
        end
        
        if mod(p,25000)==1
            fprintf('%d true users evaluated \n',p)
        end
        
        p = p + 1;
        
        mrr_ranked_list_avf(p) = RR_at_k(ranked_list_avf,pos_items_ids,cut_off_trg);
        mrr_ranked_list_genre(p) = RR_at_k(ranked_list_genre,pos_items_ids,cut_off_trg);
        mrr_ranked_list_tag(p) = RR_at_k(ranked_list_tag,pos_items_ids,cut_off_trg);
        
        
        
        
    end
end

toc
fprintf('Evaluation completed! %d evaluated out of %d \n',p,size(urmTest,1))

output.mrr_ranked_list_avf_all = mean(mrr_ranked_list_avf)  ;
output.mrr_ranked_list_genre_all = mean(mrr_ranked_list_genre) ;
output.mrr_ranked_list_tag_all = mean(mrr_ranked_list_tag)   ;






