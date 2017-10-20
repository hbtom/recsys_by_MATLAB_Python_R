function output = evaluate_urms_custom_recall(urmTest,urmPred1_str,urmPred2_str,urmPred_base1_str,urmPred_base2_str,cut_off_trg,flag_rec)
tic
rng(12563);
fprintf('Evaluation started ...  \n');


% Audio i-vec
 
 urmPred1{1} = urmPred1_str.urm1;
 urmPred1{2} = urmPred1_str.urm2;
 urmPred1{3} = urmPred1_str.urm3;
 urmPred1{4} = urmPred1_str.urm4;
 urmPred1{5} = urmPred1_str.urm5;
 urmPred1{6} = urmPred1_str.urm6;
 urmPred1{7} = urmPred1_str.urm7;
 urmPred1{8} = urmPred1_str.urm8;
 urmPred1{9} = urmPred1_str.urm9;

 % Audio BLF
 urmPred2{1} = urmPred2_str.urm1;
 urmPred2{2} = urmPred2_str.urm2;
 urmPred2{3} = urmPred2_str.urm3;
 urmPred2{4} = urmPred2_str.urm4;
 urmPred2{5} = urmPred2_str.urm5;
 urmPred2{6} = urmPred2_str.urm6;
 urmPred2{7} = urmPred2_str.urm7;
 urmPred2{8} = urmPred2_str.urm8;
 urmPred2{9} = urmPred2_str.urm9;
 
 
% Genre
 urmPred_base1{1} = urmPred_base1_str.urm1;
 urmPred_base1{2} = urmPred_base1_str.urm2;
 urmPred_base1{3} = urmPred_base1_str.urm3;
 urmPred_base1{4} = urmPred_base1_str.urm4;
 urmPred_base1{5} = urmPred_base1_str.urm5;
 urmPred_base1{6} = urmPred_base1_str.urm6;
 urmPred_base1{7} = urmPred_base1_str.urm7;
 urmPred_base1{8} = urmPred_base1_str.urm8;
 urmPred_base1{9} = urmPred_base1_str.urm9;
 
 % Tag
 urmPred_base2{1} = urmPred_base2_str.urm1;
 urmPred_base2{2} = urmPred_base2_str.urm2;
 urmPred_base2{3} = urmPred_base2_str.urm3;
 urmPred_base2{4} = urmPred_base2_str.urm4;
 urmPred_base2{5} = urmPred_base2_str.urm5;
 urmPred_base2{6} = urmPred_base2_str.urm6;
 urmPred_base2{7} = urmPred_base2_str.urm7;
 urmPred_base2{8} = urmPred_base2_str.urm8;
 urmPred_base2{9} = urmPred_base2_str.urm9;
 
urmPred1_f = urmPred1{flag_rec};
urmPred2_f = urmPred2{flag_rec};
urmPred_base1_f = urmPred_base1{flag_rec};
urmPred_base2_f = urmPred_base2{flag_rec};
 

p = 0;
tic
for u = 1 : size(urmTest,1)
    nz1 = nnz(urmPred1_f(u,:));
    nz2 = nnz(urmPred2_f(u,:));
    nz3 = nnz(urmPred_base1_f(u,:));
    nz4 = nnz(urmPred_base2_f(u,:));

    
    nzref = nnz(urmTest(u,:));
    
    if (nz1 == nzref && nz2 == nzref && nz3 == nzref && nz4 == nzref)
    

         [rp_ivec,ranked_list_ivec] = sort(urmPred1_f(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
           [rp_blf,ranked_list_blf] = sort(urmPred2_f(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
       [rp_genre,ranked_list_genre] = sort(urmPred_base1_f(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
           [rp_tag,ranked_list_tag] = sort(urmPred_base2_f(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
           
                   
        % Aggregation 'ranked_list_ivec + ranked_list_blf'

        ranked_list_aggr_ivec_blf_thr19 = aggregate_rank_borda(ranked_list_ivec, ranked_list_blf,urmTest,0.1,0.9);
        ranked_list_aggr_ivec_blf_thr28 = aggregate_rank_borda(ranked_list_ivec, ranked_list_blf,urmTest,0.2,0.8);
        ranked_list_aggr_ivec_blf_thr37 = aggregate_rank_borda(ranked_list_ivec, ranked_list_blf,urmTest,0.3,0.7);
        ranked_list_aggr_ivec_blf_thr46 = aggregate_rank_borda(ranked_list_ivec, ranked_list_blf,urmTest,0.4,0.6);
        ranked_list_aggr_ivec_blf_thr55 = aggregate_rank_borda(ranked_list_ivec, ranked_list_blf,urmTest,0.5,0.5);
        ranked_list_aggr_ivec_blf_thr64 = aggregate_rank_borda(ranked_list_ivec, ranked_list_blf,urmTest,0.6,0.4);
        ranked_list_aggr_ivec_blf_thr73 = aggregate_rank_borda(ranked_list_ivec, ranked_list_blf,urmTest,0.7,0.3);
        ranked_list_aggr_ivec_blf_thr82 = aggregate_rank_borda(ranked_list_ivec, ranked_list_blf,urmTest,0.8,0.2);
        ranked_list_aggr_ivec_blf_thr91 = aggregate_rank_borda(ranked_list_ivec, ranked_list_blf,urmTest,0.9,0.1);

        % Aggregation 'ranked_list_ivec + ranked_list_genre'
        ranked_list_aggr_ivec_genre_thr19 = aggregate_rank_borda(ranked_list_ivec, ranked_list_genre,urmTest,0.1,0.9);
        ranked_list_aggr_ivec_genre_thr28 = aggregate_rank_borda(ranked_list_ivec, ranked_list_genre,urmTest,0.2,0.8);
        ranked_list_aggr_ivec_genre_thr37 = aggregate_rank_borda(ranked_list_ivec, ranked_list_genre,urmTest,0.3,0.7);
        ranked_list_aggr_ivec_genre_thr46 = aggregate_rank_borda(ranked_list_ivec, ranked_list_genre,urmTest,0.4,0.6);
        ranked_list_aggr_ivec_genre_thr55 = aggregate_rank_borda(ranked_list_ivec, ranked_list_genre,urmTest,0.5,0.5);
        ranked_list_aggr_ivec_genre_thr64 = aggregate_rank_borda(ranked_list_ivec, ranked_list_genre,urmTest,0.6,0.4);
        ranked_list_aggr_ivec_genre_thr73 = aggregate_rank_borda(ranked_list_ivec, ranked_list_genre,urmTest,0.7,0.3);
        ranked_list_aggr_ivec_genre_thr82 = aggregate_rank_borda(ranked_list_ivec, ranked_list_genre,urmTest,0.8,0.2);
        ranked_list_aggr_ivec_genre_thr91 = aggregate_rank_borda(ranked_list_ivec, ranked_list_genre,urmTest,0.9,0.1);

        % Aggregation 'ranked_list_ivec + ranked_list_tag'

        ranked_list_aggr_ivec_tag_thr19 = aggregate_rank_borda(ranked_list_ivec, ranked_list_tag,urmTest,0.1,0.9);
        ranked_list_aggr_ivec_tag_thr28 = aggregate_rank_borda(ranked_list_ivec, ranked_list_tag,urmTest,0.2,0.8);
        ranked_list_aggr_ivec_tag_thr37 = aggregate_rank_borda(ranked_list_ivec, ranked_list_tag,urmTest,0.3,0.7);
        ranked_list_aggr_ivec_tag_thr46 = aggregate_rank_borda(ranked_list_ivec, ranked_list_tag,urmTest,0.4,0.6);
        ranked_list_aggr_ivec_tag_thr55 = aggregate_rank_borda(ranked_list_ivec, ranked_list_tag,urmTest,0.5,0.5);
        ranked_list_aggr_ivec_tag_thr64 = aggregate_rank_borda(ranked_list_ivec, ranked_list_tag,urmTest,0.6,0.4);
        ranked_list_aggr_ivec_tag_thr73 = aggregate_rank_borda(ranked_list_ivec, ranked_list_tag,urmTest,0.7,0.3);
        ranked_list_aggr_ivec_tag_thr82 = aggregate_rank_borda(ranked_list_ivec, ranked_list_tag,urmTest,0.8,0.2);
        ranked_list_aggr_ivec_tag_thr91 = aggregate_rank_borda(ranked_list_ivec, ranked_list_tag,urmTest,0.9,0.1);
        
        
        
        % Aggregation 'ranked_list_blf + ranked_list_genre'
        ranked_list_aggr_blf_genre_thr19 = aggregate_rank_borda(ranked_list_blf, ranked_list_genre,urmTest,0.1,0.9);
        ranked_list_aggr_blf_genre_thr28 = aggregate_rank_borda(ranked_list_blf, ranked_list_genre,urmTest,0.2,0.8);
        ranked_list_aggr_blf_genre_thr37 = aggregate_rank_borda(ranked_list_blf, ranked_list_genre,urmTest,0.3,0.7);
        ranked_list_aggr_blf_genre_thr46 = aggregate_rank_borda(ranked_list_blf, ranked_list_genre,urmTest,0.4,0.6);
        ranked_list_aggr_blf_genre_thr55 = aggregate_rank_borda(ranked_list_blf, ranked_list_genre,urmTest,0.5,0.5);
        ranked_list_aggr_blf_genre_thr64 = aggregate_rank_borda(ranked_list_blf, ranked_list_genre,urmTest,0.6,0.4);
        ranked_list_aggr_blf_genre_thr73 = aggregate_rank_borda(ranked_list_blf, ranked_list_genre,urmTest,0.7,0.3);
        ranked_list_aggr_blf_genre_thr82 = aggregate_rank_borda(ranked_list_blf, ranked_list_genre,urmTest,0.8,0.2);
        ranked_list_aggr_blf_genre_thr91 = aggregate_rank_borda(ranked_list_blf, ranked_list_genre,urmTest,0.9,0.1);

        % Aggregation 'ranked_list_blf + ranked_list_tag'

        ranked_list_aggr_blf_tag_thr19 = aggregate_rank_borda(ranked_list_blf, ranked_list_tag,urmTest,0.1,0.9);
        ranked_list_aggr_blf_tag_thr28 = aggregate_rank_borda(ranked_list_blf, ranked_list_tag,urmTest,0.2,0.8);
        ranked_list_aggr_blf_tag_thr37 = aggregate_rank_borda(ranked_list_blf, ranked_list_tag,urmTest,0.3,0.7);
        ranked_list_aggr_blf_tag_thr46 = aggregate_rank_borda(ranked_list_blf, ranked_list_tag,urmTest,0.4,0.6);
        ranked_list_aggr_blf_tag_thr55 = aggregate_rank_borda(ranked_list_blf, ranked_list_tag,urmTest,0.5,0.5);
        ranked_list_aggr_blf_tag_thr64 = aggregate_rank_borda(ranked_list_blf, ranked_list_tag,urmTest,0.6,0.4);
        ranked_list_aggr_blf_tag_thr73 = aggregate_rank_borda(ranked_list_blf, ranked_list_tag,urmTest,0.7,0.3);
        ranked_list_aggr_blf_tag_thr82 = aggregate_rank_borda(ranked_list_blf, ranked_list_tag,urmTest,0.8,0.2);
        ranked_list_aggr_blf_tag_thr91 = aggregate_rank_borda(ranked_list_blf, ranked_list_tag,urmTest,0.9,0.1);

        pos_items_ids = find(urmTest(u,:)>3);
        
        if isempty(pos_items_ids)
            continue
        end
        
        if mod(p,25000)==1
            fprintf('%d true users evaluated \n',p)
        end
                
              p = p + 1;
            
               Re_ranked_list_ivec(p) = recall_at_k(ranked_list_ivec,pos_items_ids,cut_off_trg);
                Re_ranked_list_blf(p) = recall_at_k(ranked_list_blf,pos_items_ids,cut_off_trg);
              Re_ranked_list_genre(p) = recall_at_k(ranked_list_genre,pos_items_ids,cut_off_trg);
                Re_ranked_list_tag(p) = recall_at_k(ranked_list_tag,pos_items_ids,cut_off_trg);
                
                
                   
        % Aggregation 'ranked_list_ivec + ranked_list_blf'

        Re_ranked_list_aggr_ivec_blf_thr19(p) = recall_at_k(ranked_list_aggr_ivec_blf_thr19,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_blf_thr28(p) = recall_at_k(ranked_list_aggr_ivec_blf_thr28,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_blf_thr37(p) = recall_at_k(ranked_list_aggr_ivec_blf_thr37,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_blf_thr46(p) = recall_at_k(ranked_list_aggr_ivec_blf_thr46,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_blf_thr55(p) = recall_at_k(ranked_list_aggr_ivec_blf_thr55,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_blf_thr64(p) = recall_at_k(ranked_list_aggr_ivec_blf_thr64,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_blf_thr73(p) = recall_at_k(ranked_list_aggr_ivec_blf_thr73,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_blf_thr82(p) = recall_at_k(ranked_list_aggr_ivec_blf_thr82,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_blf_thr91(p) = recall_at_k(ranked_list_aggr_ivec_blf_thr91,pos_items_ids,cut_off_trg);

        % Aggregation 'ranked_list_ivec + ranked_list_genre'
        Re_ranked_list_aggr_ivec_genre_thr19(p) = recall_at_k(ranked_list_aggr_ivec_genre_thr19,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_genre_thr28(p) = recall_at_k(ranked_list_aggr_ivec_genre_thr28,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_genre_thr37(p) = recall_at_k(ranked_list_aggr_ivec_genre_thr37,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_genre_thr46(p) = recall_at_k(ranked_list_aggr_ivec_genre_thr46,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_genre_thr55(p) = recall_at_k(ranked_list_aggr_ivec_genre_thr55,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_genre_thr64(p) = recall_at_k(ranked_list_aggr_ivec_genre_thr64,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_genre_thr73(p) = recall_at_k(ranked_list_aggr_ivec_genre_thr73,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_genre_thr82(p) = recall_at_k(ranked_list_aggr_ivec_genre_thr82,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_genre_thr91(p) = recall_at_k(ranked_list_aggr_ivec_genre_thr91,pos_items_ids,cut_off_trg);

        % Aggregation 'ranked_list_ivec + ranked_list_tag'

        Re_ranked_list_aggr_ivec_tag_thr19(p) = recall_at_k(ranked_list_aggr_ivec_tag_thr19,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_tag_thr28(p) = recall_at_k(ranked_list_aggr_ivec_tag_thr28,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_tag_thr37(p) = recall_at_k(ranked_list_aggr_ivec_tag_thr37,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_tag_thr46(p) = recall_at_k(ranked_list_aggr_ivec_tag_thr46,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_tag_thr55(p) = recall_at_k(ranked_list_aggr_ivec_tag_thr55,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_tag_thr64(p) = recall_at_k(ranked_list_aggr_ivec_tag_thr64,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_tag_thr73(p) = recall_at_k(ranked_list_aggr_ivec_tag_thr73,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_tag_thr82(p) = recall_at_k(ranked_list_aggr_ivec_tag_thr82,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_ivec_tag_thr91(p) = recall_at_k(ranked_list_aggr_ivec_tag_thr91,pos_items_ids,cut_off_trg);
        
 
        % Aggregation 'ranked_list_blf + ranked_list_genre'
       
        Re_ranked_list_aggr_blf_genre_thr19(p) = recall_at_k(ranked_list_aggr_blf_genre_thr19,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_blf_genre_thr28(p) = recall_at_k(ranked_list_aggr_blf_genre_thr28,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_blf_genre_thr37(p) = recall_at_k(ranked_list_aggr_blf_genre_thr37,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_blf_genre_thr46(p) = recall_at_k(ranked_list_aggr_blf_genre_thr46,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_blf_genre_thr55(p) = recall_at_k(ranked_list_aggr_blf_genre_thr55,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_blf_genre_thr64(p) = recall_at_k(ranked_list_aggr_blf_genre_thr64,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_blf_genre_thr73(p) = recall_at_k(ranked_list_aggr_blf_genre_thr73,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_blf_genre_thr82(p) = recall_at_k(ranked_list_aggr_blf_genre_thr82,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_blf_genre_thr91(p) = recall_at_k(ranked_list_aggr_blf_genre_thr91,pos_items_ids,cut_off_trg);

        % Aggregation 'ranked_list_blf + ranked_list_tag'

        Re_ranked_list_aggr_blf_tag_thr19(p) = recall_at_k(ranked_list_aggr_blf_tag_thr19,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_blf_tag_thr28(p) = recall_at_k(ranked_list_aggr_blf_tag_thr28,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_blf_tag_thr37(p) = recall_at_k(ranked_list_aggr_blf_tag_thr37,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_blf_tag_thr46(p) = recall_at_k(ranked_list_aggr_blf_tag_thr46,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_blf_tag_thr55(p) = recall_at_k(ranked_list_aggr_blf_tag_thr55,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_blf_tag_thr64(p) = recall_at_k(ranked_list_aggr_blf_tag_thr64,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_blf_tag_thr73(p) = recall_at_k(ranked_list_aggr_blf_tag_thr73,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_blf_tag_thr82(p) = recall_at_k(ranked_list_aggr_blf_tag_thr82,pos_items_ids,cut_off_trg);
        Re_ranked_list_aggr_blf_tag_thr91(p) = recall_at_k(ranked_list_aggr_blf_tag_thr91,pos_items_ids,cut_off_trg);
              
              
    end
end
toc
fprintf('Evaluation completed! %d evaluated out of %d \n',p,size(urmTest,1))

      output.Re_ranked_list_ivec_all = mean(Re_ranked_list_ivec)  ;
       output.Re_ranked_list_blf_all = mean(Re_ranked_list_blf)   ;
     output.Re_ranked_list_genre_all = mean(Re_ranked_list_genre) ;
       output.Re_ranked_list_tag_all = mean(Re_ranked_list_tag)   ;
       

                
                   
        % Aggregation 'ranked_list_ivec + ranked_list_blf'

        output.Re_ranked_list_aggr_ivec_blf_thr19_all = mean(Re_ranked_list_aggr_ivec_blf_thr19) ;
        output.Re_ranked_list_aggr_ivec_blf_thr28_all = mean(Re_ranked_list_aggr_ivec_blf_thr28) ;
        output.Re_ranked_list_aggr_ivec_blf_thr37_all = mean(Re_ranked_list_aggr_ivec_blf_thr37) ;
        output.Re_ranked_list_aggr_ivec_blf_thr46_all = mean(Re_ranked_list_aggr_ivec_blf_thr46) ;
        output.Re_ranked_list_aggr_ivec_blf_thr55_all = mean(Re_ranked_list_aggr_ivec_blf_thr55) ;
        output.Re_ranked_list_aggr_ivec_blf_thr64_all = mean(Re_ranked_list_aggr_ivec_blf_thr64) ;
        output.Re_ranked_list_aggr_ivec_blf_thr73_all = mean(Re_ranked_list_aggr_ivec_blf_thr73) ;
        output.Re_ranked_list_aggr_ivec_blf_thr82_all = mean(Re_ranked_list_aggr_ivec_blf_thr82) ;
        output.Re_ranked_list_aggr_ivec_blf_thr91_all = mean(Re_ranked_list_aggr_ivec_blf_thr91) ;

        % Aggregation 'ranked_list_ivec + ranked_list_genre'
        output.Re_ranked_list_aggr_ivec_genre_thr19_all = mean(Re_ranked_list_aggr_ivec_genre_thr19) ;
        output.Re_ranked_list_aggr_ivec_genre_thr28_all = mean(Re_ranked_list_aggr_ivec_genre_thr28) ;
        output.Re_ranked_list_aggr_ivec_genre_thr37_all = mean(Re_ranked_list_aggr_ivec_genre_thr37) ;
        output.Re_ranked_list_aggr_ivec_genre_thr46_all = mean(Re_ranked_list_aggr_ivec_genre_thr46) ;
        output.Re_ranked_list_aggr_ivec_genre_thr55_all = mean(Re_ranked_list_aggr_ivec_genre_thr55) ;
        output.Re_ranked_list_aggr_ivec_genre_thr64_all = mean(Re_ranked_list_aggr_ivec_genre_thr64) ;
        output.Re_ranked_list_aggr_ivec_genre_thr73_all = mean(Re_ranked_list_aggr_ivec_genre_thr73) ;
        output.Re_ranked_list_aggr_ivec_genre_thr82_all = mean(Re_ranked_list_aggr_ivec_genre_thr82) ;
        output.Re_ranked_list_aggr_ivec_genre_thr91_all = mean(Re_ranked_list_aggr_ivec_genre_thr91) ;

        % Aggregation 'ranked_list_ivec + ranked_list_tag'

        output.Re_ranked_list_aggr_ivec_tag_thr19_all = mean(Re_ranked_list_aggr_ivec_tag_thr19) ;
        output.Re_ranked_list_aggr_ivec_tag_thr28_all = mean(Re_ranked_list_aggr_ivec_tag_thr28) ;
        output.Re_ranked_list_aggr_ivec_tag_thr37_all = mean(Re_ranked_list_aggr_ivec_tag_thr37) ;
        output.Re_ranked_list_aggr_ivec_tag_thr46_all = mean(Re_ranked_list_aggr_ivec_tag_thr46) ;
        output.Re_ranked_list_aggr_ivec_tag_thr55_all = mean(Re_ranked_list_aggr_ivec_tag_thr55) ;
        output.Re_ranked_list_aggr_ivec_tag_thr64_all = mean(Re_ranked_list_aggr_ivec_tag_thr64) ;
        output.Re_ranked_list_aggr_ivec_tag_thr73_all = mean(Re_ranked_list_aggr_ivec_tag_thr73) ;
        output.Re_ranked_list_aggr_ivec_tag_thr82_all = mean(Re_ranked_list_aggr_ivec_tag_thr82) ;
        output.Re_ranked_list_aggr_ivec_tag_thr91_all = mean(Re_ranked_list_aggr_ivec_tag_thr91) ;
        
 
        % Aggregation 'ranked_list_blf + ranked_list_genre'
       
        output.Re_ranked_list_aggr_blf_genre_thr19_all = mean(Re_ranked_list_aggr_blf_genre_thr19) ;
        output.Re_ranked_list_aggr_blf_genre_thr28_all = mean(Re_ranked_list_aggr_blf_genre_thr28) ;
        output.Re_ranked_list_aggr_blf_genre_thr37_all = mean(Re_ranked_list_aggr_blf_genre_thr37) ;
        output.Re_ranked_list_aggr_blf_genre_thr46_all = mean(Re_ranked_list_aggr_blf_genre_thr46) ;
        output.Re_ranked_list_aggr_blf_genre_thr55_all = mean(Re_ranked_list_aggr_blf_genre_thr55) ;
        output.Re_ranked_list_aggr_blf_genre_thr64_all = mean(Re_ranked_list_aggr_blf_genre_thr64) ;
        output.Re_ranked_list_aggr_blf_genre_thr73_all = mean(Re_ranked_list_aggr_blf_genre_thr73) ;
        output.Re_ranked_list_aggr_blf_genre_thr82_all = mean(Re_ranked_list_aggr_blf_genre_thr82) ;
        output.Re_ranked_list_aggr_blf_genre_thr91_all = mean(Re_ranked_list_aggr_blf_genre_thr91) ;

        % Aggregation 'ranked_list_blf + ranked_list_tag'

        output.Re_ranked_list_aggr_blf_tag_thr19_all = mean(Re_ranked_list_aggr_blf_tag_thr19) ;
        output.Re_ranked_list_aggr_blf_tag_thr28_all = mean(Re_ranked_list_aggr_blf_tag_thr28) ;
        output.Re_ranked_list_aggr_blf_tag_thr37_all = mean(Re_ranked_list_aggr_blf_tag_thr37) ;
        output.Re_ranked_list_aggr_blf_tag_thr46_all = mean(Re_ranked_list_aggr_blf_tag_thr46) ;
        output.Re_ranked_list_aggr_blf_tag_thr55_all = mean(Re_ranked_list_aggr_blf_tag_thr55) ;
        output.Re_ranked_list_aggr_blf_tag_thr64_all = mean(Re_ranked_list_aggr_blf_tag_thr64) ;
        output.Re_ranked_list_aggr_blf_tag_thr73_all = mean(Re_ranked_list_aggr_blf_tag_thr73) ;
        output.Re_ranked_list_aggr_blf_tag_thr82_all = mean(Re_ranked_list_aggr_blf_tag_thr82) ;
        output.Re_ranked_list_aggr_blf_tag_thr91_all = mean(PR_ranked_list_aggr_blf_tag_thr91) ;



end








