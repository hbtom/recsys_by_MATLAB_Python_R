function output = evaluate_urms_custom(urmTest, urmPred1_str,urmPred2_str,cut_off_trg)
tic
rng(12563);
fprintf('Evaluation started ...  \n');

% Audio
 urm11 = urmPred1_str.urm1;
 urm12 = urmPred1_str.urm2;
 urm13 = urmPred1_str.urm3;
 urm14 = urmPred1_str.urm4;
 urm15 = urmPred1_str.urm5;
 urm16 = urmPred1_str.urm6;
 urm17 = urmPred1_str.urm7;
 urm18 = urmPred1_str.urm8;
 urm19 = urmPred1_str.urm9;

% Genre
 urm21 = urmPred2_str.urm1;
 urm22 = urmPred2_str.urm2;
 urm23 = urmPred2_str.urm3;
 urm24 = urmPred2_str.urm4;
 urm25 = urmPred2_str.urm5;
 urm26 = urmPred2_str.urm6;
 urm27 = urmPred2_str.urm7;
 urm28 = urmPred2_str.urm8;
 urm29 = urmPred2_str.urm9;
 
%  urmPred2_str.urm1 = output_urmPred_Avg;
%  urmPred2_str.urm2 = output_urmPred_weightedAvg;
%  urmPred2_str.urm3 = output_urmPred_weightedAvg_skg1;
%  urmPred2_str.urm4 = output_urmPred_weightedAvg_skg01;
%  urmPred2_str.urm5 = output_urmPred_weightedAvg_skg001;
%  urmPred2_str.urm6 = output_SIMpow_urmPred_weightedAvg;
%  urmPred2_str.urm7 = output_SIMpow_urmPred_weightedAvg_skg1;
%  urmPred2_str.urm8 = output_SIMpow_urmPred_weightedAvg_skg01;
%  urmPred2_str.urm9 = output_SIMpow_urmPred_weightedAvg_skg001;

p = 0;
tic
for u = 1 : size(urmTest,1)
    nz11 = nnz(urm11(u,:));
    nz12 = nnz(urm12(u,:));
    nz13 = nnz(urm13(u,:));
    nz14 = nnz(urm14(u,:));
    nz15 = nnz(urm15(u,:));
    nz16 = nnz(urm16(u,:));
    nz17 = nnz(urm17(u,:));
    nz18 = nnz(urm18(u,:));
    nz19 = nnz(urm19(u,:));
    nz21 = nnz(urm21(u,:));
    nz22 = nnz(urm22(u,:));
    nz23 = nnz(urm23(u,:));
    nz24 = nnz(urm24(u,:));
    nz25 = nnz(urm25(u,:));
    nz26 = nnz(urm26(u,:));
    nz27 = nnz(urm27(u,:));
    nz28 = nnz(urm28(u,:));
    nz29 = nnz(urm29(u,:));
    
    nzref = nnz(urmTest(u,:));
    
    if (nz11 == nzref && nz12 == nzref && nz13 == nzref && nz14 == nzref && nz15 == nzref && nz16 == nzref && nz17 == nzref && nz18 == nzref && nz19 == nzref...
            && nz21 == nzref && nz22 == nzref && nz23 == nzref && nz24 == nzref && nz25 == nzref && nz26 == nzref && nz27 == nzref && nz28 == nzref && nz29 == nzref)
    

        [rp_u11,ranked_list11] = sort(urm11(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_u12,ranked_list12] = sort(urm12(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_u13,ranked_list13] = sort(urm13(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_u14,ranked_list14] = sort(urm14(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_u15,ranked_list15] = sort(urm15(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_u16,ranked_list16] = sort(urm16(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_u17,ranked_list17] = sort(urm17(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_u18,ranked_list18] = sort(urm18(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_u19,ranked_list19] = sort(urm19(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        
        [rp_u21,ranked_list21] = sort(urm21(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_u22,ranked_list22] = sort(urm22(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_u23,ranked_list23] = sort(urm23(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_u24,ranked_list24] = sort(urm24(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_u25,ranked_list25] = sort(urm25(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_u26,ranked_list26] = sort(urm26(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_u27,ranked_list27] = sort(urm27(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_u28,ranked_list28] = sort(urm28(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_u29,ranked_list29] = sort(urm29(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');

        % Recommender 1
        ranked_list_aggr_thr1_1 = aggregate_rank_borda(ranked_list11, ranked_list21,urmTest,0.5,0.5);
        ranked_list_aggr_thr2_1 = aggregate_rank_borda(ranked_list11, ranked_list21,urmTest,0.1,0.9);
        ranked_list_aggr_thr3_1 = aggregate_rank_borda(ranked_list11, ranked_list21,urmTest,0.2,0.8);
        ranked_list_aggr_thr4_1 = aggregate_rank_borda(ranked_list11, ranked_list21,urmTest,0.3,0.7);
        ranked_list_aggr_thr5_1 = aggregate_rank_borda(ranked_list11, ranked_list21,urmTest,0.4,0.6);
        ranked_list_aggr_thr6_1 = aggregate_rank_borda(ranked_list11, ranked_list21,urmTest,0.6,0.4);
        ranked_list_aggr_thr7_1 = aggregate_rank_borda(ranked_list11, ranked_list21,urmTest,0.7,0.3);
        ranked_list_aggr_thr8_1 = aggregate_rank_borda(ranked_list11, ranked_list21,urmTest,0.8,0.2);
        ranked_list_aggr_thr9_1 = aggregate_rank_borda(ranked_list11, ranked_list21,urmTest,0.9,0.1);

        % Recommender 2
        ranked_list_aggr_thr1_2 = aggregate_rank_borda(ranked_list12, ranked_list22,urmTest,0.5,0.5);
        ranked_list_aggr_thr2_2 = aggregate_rank_borda(ranked_list12, ranked_list22,urmTest,0.1,0.9);
        ranked_list_aggr_thr3_2 = aggregate_rank_borda(ranked_list12, ranked_list22,urmTest,0.2,0.8);
        ranked_list_aggr_thr4_2 = aggregate_rank_borda(ranked_list12, ranked_list22,urmTest,0.3,0.7);
        ranked_list_aggr_thr5_2 = aggregate_rank_borda(ranked_list12, ranked_list22,urmTest,0.4,0.6);
        ranked_list_aggr_thr6_2 = aggregate_rank_borda(ranked_list12, ranked_list22,urmTest,0.6,0.4);
        ranked_list_aggr_thr7_2 = aggregate_rank_borda(ranked_list12, ranked_list22,urmTest,0.7,0.3);
        ranked_list_aggr_thr8_2 = aggregate_rank_borda(ranked_list12, ranked_list22,urmTest,0.8,0.2);
        ranked_list_aggr_thr9_2 = aggregate_rank_borda(ranked_list12, ranked_list22,urmTest,0.9,0.1);
        
        % Recommender 3
        ranked_list_aggr_thr1_3 = aggregate_rank_borda(ranked_list13, ranked_list23,urmTest,0.5,0.5);
        ranked_list_aggr_thr2_3 = aggregate_rank_borda(ranked_list13, ranked_list23,urmTest,0.1,0.9);
        ranked_list_aggr_thr3_3 = aggregate_rank_borda(ranked_list13, ranked_list23,urmTest,0.2,0.8);
        ranked_list_aggr_thr4_3 = aggregate_rank_borda(ranked_list13, ranked_list23,urmTest,0.3,0.7);
        ranked_list_aggr_thr5_3 = aggregate_rank_borda(ranked_list13, ranked_list23,urmTest,0.4,0.6);
        ranked_list_aggr_thr6_3 = aggregate_rank_borda(ranked_list13, ranked_list23,urmTest,0.6,0.4);
        ranked_list_aggr_thr7_3 = aggregate_rank_borda(ranked_list13, ranked_list23,urmTest,0.7,0.3);
        ranked_list_aggr_thr8_3 = aggregate_rank_borda(ranked_list13, ranked_list23,urmTest,0.8,0.2);
        ranked_list_aggr_thr9_3 = aggregate_rank_borda(ranked_list13, ranked_list23,urmTest,0.9,0.1);
        
        % Recommender 4
        ranked_list_aggr_thr1_4 = aggregate_rank_borda(ranked_list14, ranked_list24,urmTest,0.5,0.5);
        ranked_list_aggr_thr2_4 = aggregate_rank_borda(ranked_list14, ranked_list24,urmTest,0.1,0.9);
        ranked_list_aggr_thr3_4 = aggregate_rank_borda(ranked_list14, ranked_list24,urmTest,0.2,0.8);
        ranked_list_aggr_thr4_4 = aggregate_rank_borda(ranked_list14, ranked_list24,urmTest,0.3,0.7);
        ranked_list_aggr_thr5_4 = aggregate_rank_borda(ranked_list14, ranked_list24,urmTest,0.4,0.6);
        ranked_list_aggr_thr6_4 = aggregate_rank_borda(ranked_list14, ranked_list24,urmTest,0.6,0.4);
        ranked_list_aggr_thr7_4 = aggregate_rank_borda(ranked_list14, ranked_list24,urmTest,0.7,0.3);
        ranked_list_aggr_thr8_4 = aggregate_rank_borda(ranked_list14, ranked_list24,urmTest,0.8,0.2);
        ranked_list_aggr_thr9_4 = aggregate_rank_borda(ranked_list14, ranked_list24,urmTest,0.9,0.1);
        
        % Recommender 5
        ranked_list_aggr_thr1_5 = aggregate_rank_borda(ranked_list15, ranked_list25,urmTest,0.5,0.5);
        ranked_list_aggr_thr2_5 = aggregate_rank_borda(ranked_list15, ranked_list25,urmTest,0.1,0.9);
        ranked_list_aggr_thr3_5 = aggregate_rank_borda(ranked_list15, ranked_list25,urmTest,0.2,0.8);
        ranked_list_aggr_thr4_5 = aggregate_rank_borda(ranked_list15, ranked_list25,urmTest,0.3,0.7);
        ranked_list_aggr_thr5_5 = aggregate_rank_borda(ranked_list15, ranked_list25,urmTest,0.4,0.6);
        ranked_list_aggr_thr6_5 = aggregate_rank_borda(ranked_list15, ranked_list25,urmTest,0.6,0.4);
        ranked_list_aggr_thr7_5 = aggregate_rank_borda(ranked_list15, ranked_list25,urmTest,0.7,0.3);
        ranked_list_aggr_thr8_5 = aggregate_rank_borda(ranked_list15, ranked_list25,urmTest,0.8,0.2);
        ranked_list_aggr_thr9_5 = aggregate_rank_borda(ranked_list15, ranked_list25,urmTest,0.9,0.1);
        
        
        % Recommender 6
        ranked_list_aggr_thr1_6 = aggregate_rank_borda(ranked_list16, ranked_list26,urmTest,0.5,0.5);
        ranked_list_aggr_thr2_6 = aggregate_rank_borda(ranked_list16, ranked_list26,urmTest,0.1,0.9);
        ranked_list_aggr_thr3_6 = aggregate_rank_borda(ranked_list16, ranked_list26,urmTest,0.2,0.8);
        ranked_list_aggr_thr4_6 = aggregate_rank_borda(ranked_list16, ranked_list26,urmTest,0.3,0.7);
        ranked_list_aggr_thr5_6 = aggregate_rank_borda(ranked_list16, ranked_list26,urmTest,0.4,0.6);
        ranked_list_aggr_thr6_6 = aggregate_rank_borda(ranked_list16, ranked_list26,urmTest,0.6,0.4);
        ranked_list_aggr_thr7_6 = aggregate_rank_borda(ranked_list16, ranked_list26,urmTest,0.7,0.3);
        ranked_list_aggr_thr8_6 = aggregate_rank_borda(ranked_list16, ranked_list26,urmTest,0.8,0.2);
        ranked_list_aggr_thr9_6 = aggregate_rank_borda(ranked_list16, ranked_list26,urmTest,0.9,0.1);
        
        % Recommender 7
        ranked_list_aggr_thr1_7 = aggregate_rank_borda(ranked_list17, ranked_list27,urmTest,0.5,0.5);
        ranked_list_aggr_thr2_7 = aggregate_rank_borda(ranked_list17, ranked_list27,urmTest,0.1,0.9);
        ranked_list_aggr_thr3_7 = aggregate_rank_borda(ranked_list17, ranked_list27,urmTest,0.2,0.8);
        ranked_list_aggr_thr4_7 = aggregate_rank_borda(ranked_list17, ranked_list27,urmTest,0.3,0.7);
        ranked_list_aggr_thr5_7 = aggregate_rank_borda(ranked_list17, ranked_list27,urmTest,0.4,0.6);
        ranked_list_aggr_thr6_7 = aggregate_rank_borda(ranked_list17, ranked_list27,urmTest,0.6,0.4);
        ranked_list_aggr_thr7_7 = aggregate_rank_borda(ranked_list17, ranked_list27,urmTest,0.7,0.3);
        ranked_list_aggr_thr8_7 = aggregate_rank_borda(ranked_list17, ranked_list27,urmTest,0.8,0.2);
        ranked_list_aggr_thr9_7 = aggregate_rank_borda(ranked_list17, ranked_list27,urmTest,0.9,0.1);
        
        % Recommender 8
        ranked_list_aggr_thr1_8 = aggregate_rank_borda(ranked_list18, ranked_list28,urmTest,0.5,0.5);
        ranked_list_aggr_thr2_8 = aggregate_rank_borda(ranked_list18, ranked_list28,urmTest,0.1,0.9);
        ranked_list_aggr_thr3_8 = aggregate_rank_borda(ranked_list18, ranked_list28,urmTest,0.2,0.8);
        ranked_list_aggr_thr4_8 = aggregate_rank_borda(ranked_list18, ranked_list28,urmTest,0.3,0.7);
        ranked_list_aggr_thr5_8 = aggregate_rank_borda(ranked_list18, ranked_list28,urmTest,0.4,0.6);
        ranked_list_aggr_thr6_8 = aggregate_rank_borda(ranked_list18, ranked_list28,urmTest,0.6,0.4);
        ranked_list_aggr_thr7_8 = aggregate_rank_borda(ranked_list18, ranked_list28,urmTest,0.7,0.3);
        ranked_list_aggr_thr8_8 = aggregate_rank_borda(ranked_list18, ranked_list28,urmTest,0.8,0.2);
        ranked_list_aggr_thr9_8 = aggregate_rank_borda(ranked_list18, ranked_list28,urmTest,0.9,0.1);
        
        % Recommender 9
        ranked_list_aggr_thr1_9 = aggregate_rank_borda(ranked_list19, ranked_list29,urmTest,0.5,0.5);
        ranked_list_aggr_thr2_9 = aggregate_rank_borda(ranked_list19, ranked_list29,urmTest,0.1,0.9);
        ranked_list_aggr_thr3_9 = aggregate_rank_borda(ranked_list19, ranked_list29,urmTest,0.2,0.8);
        ranked_list_aggr_thr4_9 = aggregate_rank_borda(ranked_list19, ranked_list29,urmTest,0.3,0.7);
        ranked_list_aggr_thr5_9 = aggregate_rank_borda(ranked_list19, ranked_list29,urmTest,0.4,0.6);
        ranked_list_aggr_thr6_9 = aggregate_rank_borda(ranked_list19, ranked_list29,urmTest,0.6,0.4);
        ranked_list_aggr_thr7_9 = aggregate_rank_borda(ranked_list19, ranked_list29,urmTest,0.7,0.3);
        ranked_list_aggr_thr8_9 = aggregate_rank_borda(ranked_list19, ranked_list29,urmTest,0.8,0.2);
        ranked_list_aggr_thr9_9 = aggregate_rank_borda(ranked_list19, ranked_list29,urmTest,0.9,0.1);
        
        pos_items_ids = find(urmTest(u,:)>3);
        
        if isempty(pos_items_ids)
            continue
        end
        
        if mod(p,25000)==1
            fprintf('%d true users evaluated \n',p)
        end
                
              p = p + 1;
            
              for alg = 1 : 9
                 eval(['PR1' num2str(alg) '_u(p) = precision_at_k(ranked_list1' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                 eval(['PR2' num2str(alg) '_u(p) = precision_at_k(ranked_list2' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                 eval(['PRag_thr1_' num2str(alg) '_u(p) = precision_at_k(ranked_list_aggr_thr1_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                 eval(['PRag_thr2_' num2str(alg) '_u(p) = precision_at_k(ranked_list_aggr_thr2_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                 eval(['PRag_thr3_' num2str(alg) '_u(p) = precision_at_k(ranked_list_aggr_thr3_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                 eval(['PRag_thr4_' num2str(alg) '_u(p) = precision_at_k(ranked_list_aggr_thr4_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                 eval(['PRag_thr5_' num2str(alg) '_u(p) = precision_at_k(ranked_list_aggr_thr5_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                 eval(['PRag_thr6_' num2str(alg) '_u(p) = precision_at_k(ranked_list_aggr_thr6_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                 eval(['PRag_thr7_' num2str(alg) '_u(p) = precision_at_k(ranked_list_aggr_thr7_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                 eval(['PRag_thr8_' num2str(alg) '_u(p) = precision_at_k(ranked_list_aggr_thr8_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                 eval(['PRag_thr9_' num2str(alg) '_u(p) = precision_at_k(ranked_list_aggr_thr9_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                 
              end
              
              for alg = 1 : 9
                  eval(['Re1' num2str(alg) '_u(p) = recall_at_k(ranked_list1' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['Re2' num2str(alg) '_u(p) = recall_at_k(ranked_list2' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['Reag_thr1_' num2str(alg) '_u(p) = recall_at_k(ranked_list_aggr_thr1_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['Reag_thr2_' num2str(alg) '_u(p) = recall_at_k(ranked_list_aggr_thr2_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['Reag_thr3_' num2str(alg) '_u(p) = recall_at_k(ranked_list_aggr_thr3_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['Reag_thr4_' num2str(alg) '_u(p) = recall_at_k(ranked_list_aggr_thr4_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['Reag_thr5_' num2str(alg) '_u(p) = recall_at_k(ranked_list_aggr_thr5_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['Reag_thr6_' num2str(alg) '_u(p) = recall_at_k(ranked_list_aggr_thr6_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['Reag_thr7_' num2str(alg) '_u(p) = recall_at_k(ranked_list_aggr_thr7_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['Reag_thr8_' num2str(alg) '_u(p) = recall_at_k(ranked_list_aggr_thr8_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['Reag_thr9_' num2str(alg) '_u(p) = recall_at_k(ranked_list_aggr_thr9_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  
              end
              
              for alg = 1 : 9
                  eval(['MAP1' num2str(alg) '_u(p) = AP_at_k(ranked_list1' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MAP2' num2str(alg) '_u(p) = AP_at_k(ranked_list2' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MAPag_thr1_' num2str(alg) '_u(p) = AP_at_k(ranked_list_aggr_thr1_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MAPag_thr2_' num2str(alg) '_u(p) = AP_at_k(ranked_list_aggr_thr2_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MAPag_thr3_' num2str(alg) '_u(p) = AP_at_k(ranked_list_aggr_thr3_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MAPag_thr4_' num2str(alg) '_u(p) = AP_at_k(ranked_list_aggr_thr4_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MAPag_thr5_' num2str(alg) '_u(p) = AP_at_k(ranked_list_aggr_thr5_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MAPag_thr6_' num2str(alg) '_u(p) = AP_at_k(ranked_list_aggr_thr6_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MAPag_thr7_' num2str(alg) '_u(p) = AP_at_k(ranked_list_aggr_thr7_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MAPag_thr8_' num2str(alg) '_u(p) = AP_at_k(ranked_list_aggr_thr8_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MAPag_thr9_' num2str(alg) '_u(p) = AP_at_k(ranked_list_aggr_thr9_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  
              end
              
              for alg = 1 : 9
                  eval(['MRR1' num2str(alg) '_u(p) = RR_at_k(ranked_list1' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MRR2' num2str(alg) '_u(p) = RR_at_k(ranked_list2' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MRRag_thr1_' num2str(alg) '_u(p) = RR_at_k(ranked_list_aggr_thr1_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MRRag_thr2_' num2str(alg) '_u(p) = RR_at_k(ranked_list_aggr_thr2_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MRRag_thr3_' num2str(alg) '_u(p) = RR_at_k(ranked_list_aggr_thr3_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MRRag_thr4_' num2str(alg) '_u(p) = RR_at_k(ranked_list_aggr_thr4_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MRRag_thr5_' num2str(alg) '_u(p) = RR_at_k(ranked_list_aggr_thr5_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MRRag_thr6_' num2str(alg) '_u(p) = RR_at_k(ranked_list_aggr_thr6_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MRRag_thr7_' num2str(alg) '_u(p) = RR_at_k(ranked_list_aggr_thr7_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MRRag_thr8_' num2str(alg) '_u(p) = RR_at_k(ranked_list_aggr_thr8_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  eval(['MRRag_thr9_' num2str(alg) '_u(p) = RR_at_k(ranked_list_aggr_thr9_' num2str(alg) ',pos_items_ids,' num2str(cut_off_trg) ') ;'])
                  
              end
              

              
    end
end
toc
fprintf('Evaluation completed! %d evaluated out of %d \n',p,size(urmTest,1))

for alg = 1 : 9
    eval(['output.Precision_all_1' num2str(alg) '= mean([PR1' num2str(alg) '_u]);'])
    eval(['output.Precision_all_2' num2str(alg) '= mean([PR2' num2str(alg) '_u]);'])
    eval(['output.Precision_all_ag_thr1_'  num2str(alg) '= mean([PRag_thr1_' num2str(alg) '_u]);'])
    eval(['output.Precision_all_ag_thr2_' num2str(alg) '= mean([PRag_thr2_' num2str(alg) '_u]);'])
    eval(['output.Precision_all_ag_thr3_' num2str(alg) '= mean([PRag_thr3_' num2str(alg) '_u]);'])
    eval(['output.Precision_all_ag_thr4_' num2str(alg) '= mean([PRag_thr4_' num2str(alg) '_u]);'])
    eval(['output.Precision_all_ag_thr5_' num2str(alg) '= mean([PRag_thr5_' num2str(alg) '_u]);'])
    eval(['output.Precision_all_ag_thr6_' num2str(alg) '= mean([PRag_thr6_' num2str(alg) '_u]);'])
    eval(['output.Precision_all_ag_thr7_' num2str(alg) '= mean([PRag_thr7_' num2str(alg) '_u]);'])
    eval(['output.Precision_all_ag_thr8_' num2str(alg) '= mean([PRag_thr8_' num2str(alg) '_u]);'])
    eval(['output.Precision_all_ag_thr9_' num2str(alg) '= mean([PRag_thr9_' num2str(alg) '_u]);'])

end

for alg = 1 : 9
    eval(['output.Recall_all_1' num2str(alg) '= mean([Re1' num2str(alg) '_u]);'])
    eval(['output.Recall_all_2' num2str(alg) '= mean([Re2' num2str(alg) '_u]);'])
    eval(['output.Recall_all_ag_thr1_'  num2str(alg) '= mean([Reag_thr1_' num2str(alg) '_u]);'])
    eval(['output.Recall_all_ag_thr2_' num2str(alg) '= mean([Reag_thr2_' num2str(alg) '_u]);'])
    eval(['output.Recall_all_ag_thr3_' num2str(alg) '= mean([Reag_thr3_' num2str(alg) '_u]);'])
    eval(['output.Recall_all_ag_thr4_' num2str(alg) '= mean([Reag_thr4_' num2str(alg) '_u]);'])
    eval(['output.Recall_all_ag_thr5_' num2str(alg) '= mean([Reag_thr5_' num2str(alg) '_u]);'])
    eval(['output.Recall_all_ag_thr6_' num2str(alg) '= mean([Reag_thr6_' num2str(alg) '_u]);'])
    eval(['output.Recall_all_ag_thr7_' num2str(alg) '= mean([Reag_thr7_' num2str(alg) '_u]);'])
    eval(['output.Recall_all_ag_thr8_' num2str(alg) '= mean([Reag_thr8_' num2str(alg) '_u]);'])
    eval(['output.Recall_all_ag_thr9_' num2str(alg) '= mean([Reag_thr9_' num2str(alg) '_u]);'])

end

for alg = 1 : 9
    eval(['output.MRR_all_1' num2str(alg) '= mean([MRR1' num2str(alg) '_u]);'])
    eval(['output.MRR_all_2' num2str(alg) '= mean([MRR2' num2str(alg) '_u]);'])
    eval(['output.MRR_all_ag_thr1_'  num2str(alg) '= mean([MRRag_thr1_' num2str(alg) '_u]);'])
    eval(['output.MRR_all_ag_thr2_' num2str(alg) '= mean([MRRag_thr2_' num2str(alg) '_u]);'])
    eval(['output.MRR_all_ag_thr3_' num2str(alg) '= mean([MRRag_thr3_' num2str(alg) '_u]);'])
    eval(['output.MRR_all_ag_thr4_' num2str(alg) '= mean([MRRag_thr4_' num2str(alg) '_u]);'])
    eval(['output.MRR_all_ag_thr5_' num2str(alg) '= mean([MRRag_thr5_' num2str(alg) '_u]);'])
    eval(['output.MRR_all_ag_thr6_' num2str(alg) '= mean([MRRag_thr6_' num2str(alg) '_u]);'])
    eval(['output.MRR_all_ag_thr7_' num2str(alg) '= mean([MRRag_thr7_' num2str(alg) '_u]);'])
    eval(['output.MRR_all_ag_thr8_' num2str(alg) '= mean([MRRag_thr8_' num2str(alg) '_u]);'])
    eval(['output.MRR_all_ag_thr9_' num2str(alg) '= mean([MRRag_thr9_' num2str(alg) '_u]);'])

end

for alg = 1 : 9
    eval(['output.MAP_all_1' num2str(alg) '= mean([MAP1' num2str(alg) '_u]);'])
    eval(['output.MAP_all_2' num2str(alg) '= mean([MAP2' num2str(alg) '_u]);'])
    eval(['output.MAP_all_ag_thr1_'  num2str(alg) '= mean([MAPag_thr1_' num2str(alg) '_u]);'])
    eval(['output.MAP_all_ag_thr2_' num2str(alg) '= mean([MAPag_thr2_' num2str(alg) '_u]);'])
    eval(['output.MAP_all_ag_thr3_' num2str(alg) '= mean([MAPag_thr3_' num2str(alg) '_u]);'])
    eval(['output.MAP_all_ag_thr4_' num2str(alg) '= mean([MAPag_thr4_' num2str(alg) '_u]);'])
    eval(['output.MAP_all_ag_thr5_' num2str(alg) '= mean([MAPag_thr5_' num2str(alg) '_u]);'])
    eval(['output.MAP_all_ag_thr6_' num2str(alg) '= mean([MAPag_thr6_' num2str(alg) '_u]);'])
    eval(['output.MAP_all_ag_thr7_' num2str(alg) '= mean([MAPag_thr7_' num2str(alg) '_u]);'])
    eval(['output.MAP_all_ag_thr8_' num2str(alg) '= mean([MAPag_thr8_' num2str(alg) '_u]);'])
    eval(['output.MAP_all_ag_thr9_' num2str(alg) '= mean([MAPag_thr9_' num2str(alg) '_u]);'])

end


end








