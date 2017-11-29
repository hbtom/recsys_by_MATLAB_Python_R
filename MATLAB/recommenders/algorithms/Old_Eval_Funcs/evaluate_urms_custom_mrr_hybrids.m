function output = evaluate_urms_custom_mrr_hybrids(urmTest,urmPred1_str,urmPred2_str,urmPred_base1_str,urmPred_base2_str,cut_off_trg,flag_rec)
tic
rng(12563);
fprintf('Evaluation started ...  \n');


% Prediction 1
 urmPred1{1} = urmPred1_str.urm1;
 urmPred1{2} = urmPred1_str.urm2;
 urmPred1{3} = urmPred1_str.urm3;

 
% Prediction 2
 urmPred2{1} = urmPred2_str.urm1;
 urmPred2{2} = urmPred2_str.urm2;
 urmPred2{3} = urmPred2_str.urm3;
 
 % Genre
 urmPred_base1{1} = urmPred_base1_str.urm1;
 urmPred_base1{2} = urmPred_base1_str.urm2;
 urmPred_base1{3} = urmPred_base1_str.urm3;
 
 % Tag
 urmPred_base2{1} = urmPred_base2_str.urm1;
 urmPred_base2{2} = urmPred_base2_str.urm2;
 urmPred_base2{3} = urmPred_base2_str.urm3;

 
urmPred1_f = urmPred1{flag_rec};
urmPred2_f = urmPred2{flag_rec};
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
    

         [rp_ivec,ranked_list_pred1] = sort(urmPred1_f(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
          [rp_ivec,ranked_list_pred2] = sort(urmPred2_f(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
           
           ranked_list_aggr_hybrid_thr19 = aggregate_rank_borda(ranked_list_pred1, ranked_list_pred2,urmTest,0.1,0.9);
           ranked_list_aggr_hybrid_thr28 = aggregate_rank_borda(ranked_list_pred1, ranked_list_pred2,urmTest,0.2,0.8);
           ranked_list_aggr_hybrid_thr37 = aggregate_rank_borda(ranked_list_pred1, ranked_list_pred2,urmTest,0.3,0.7);
           ranked_list_aggr_hybrid_thr46 = aggregate_rank_borda(ranked_list_pred1, ranked_list_pred2,urmTest,0.4,0.6);
           ranked_list_aggr_hybrid_thr55 = aggregate_rank_borda(ranked_list_pred1, ranked_list_pred2,urmTest,0.5,0.5);
           ranked_list_aggr_hybrid_thr64 = aggregate_rank_borda(ranked_list_pred1, ranked_list_pred2,urmTest,0.6,0.4);
           ranked_list_aggr_hybrid_thr73 = aggregate_rank_borda(ranked_list_pred1, ranked_list_pred2,urmTest,0.7,0.3);
           ranked_list_aggr_hybrid_thr82 = aggregate_rank_borda(ranked_list_pred1, ranked_list_pred2,urmTest,0.8,0.2);
           ranked_list_aggr_hybrid_thr91 = aggregate_rank_borda(ranked_list_pred1, ranked_list_pred2,urmTest,0.9,0.1);

        
        
        pos_items_ids = find(urmTest(u,:)>3);
        
        if isempty(pos_items_ids)
            continue
        end
        
        if mod(p,25000)==1
            fprintf('%d true users evaluated \n',p)
        end
                
              p = p + 1;
                            
           mrr_ranked_list_aggr_hybrid_thr19(p) = RR_at_k(ranked_list_aggr_hybrid_thr19,pos_items_ids,cut_off_trg);
           mrr_ranked_list_aggr_hybrid_thr28(p) = RR_at_k(ranked_list_aggr_hybrid_thr28,pos_items_ids,cut_off_trg);
           mrr_ranked_list_aggr_hybrid_thr37(p) = RR_at_k(ranked_list_aggr_hybrid_thr37,pos_items_ids,cut_off_trg); 
           mrr_ranked_list_aggr_hybrid_thr46(p) = RR_at_k(ranked_list_aggr_hybrid_thr46,pos_items_ids,cut_off_trg);
           mrr_ranked_list_aggr_hybrid_thr55(p) = RR_at_k(ranked_list_aggr_hybrid_thr55,pos_items_ids,cut_off_trg);
           mrr_ranked_list_aggr_hybrid_thr64(p) = RR_at_k(ranked_list_aggr_hybrid_thr64,pos_items_ids,cut_off_trg); 
           mrr_ranked_list_aggr_hybrid_thr73(p) = RR_at_k(ranked_list_aggr_hybrid_thr73,pos_items_ids,cut_off_trg); 
           mrr_ranked_list_aggr_hybrid_thr82(p) = RR_at_k(ranked_list_aggr_hybrid_thr82,pos_items_ids,cut_off_trg); 
           mrr_ranked_list_aggr_hybrid_thr91(p) = RR_at_k(ranked_list_aggr_hybrid_thr91,pos_items_ids,cut_off_trg);
           
           
                

              
    end
end
toc
fprintf('Evaluation completed! %d evaluated out of %d \n',p,size(urmTest,1))


       
       output.mrr_ranked_list_hybrid_thr19 = mean(mrr_ranked_list_aggr_hybrid_thr19)  ;
       output.mrr_ranked_list_hybrid_thr28 = mean(mrr_ranked_list_aggr_hybrid_thr28)  ;
       output.mrr_ranked_list_hybrid_thr37 = mean(mrr_ranked_list_aggr_hybrid_thr37)  ;
       output.mrr_ranked_list_hybrid_thr46 = mean(mrr_ranked_list_aggr_hybrid_thr46)  ;
       output.mrr_ranked_list_hybrid_thr55 = mean(mrr_ranked_list_aggr_hybrid_thr55)  ;
       output.mrr_ranked_list_hybrid_thr64 = mean(mrr_ranked_list_aggr_hybrid_thr64)  ;
       output.mrr_ranked_list_hybrid_thr73 = mean(mrr_ranked_list_aggr_hybrid_thr73)  ;
       output.mrr_ranked_list_hybrid_thr82 = mean(mrr_ranked_list_aggr_hybrid_thr82)  ;
       output.mrr_ranked_list_hybrid_thr91 = mean(mrr_ranked_list_aggr_hybrid_thr91)  ;

       
                



end








