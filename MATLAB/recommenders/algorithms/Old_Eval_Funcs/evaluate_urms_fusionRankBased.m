function output = evaluate_urms_fusionRankBased(urmTest, urmPred1, urmPred2,w1,w2)
%

fprintf('Evaluation strtated ...  \n');
a = 1: size(urmTest,2);
p = 0;
for u = 1 : size(urmTest,1)
    if nnz(urmPred1(u,:)) == nnz(urmTest(u,:)) && nnz(urmPred2(u,:)) == nnz(urmTest(u,:))
% 
        [rp_u1,ranked_list1] = sort(urmPred1(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        [rp_u2,ranked_list2] = sort(urmPred2(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
        
           ind2Id = [a(:) ranked_list1(:)];
        sigma_u_1 = sortrows(ind2Id,2);
        sigma_u_1 = sigma_u_1(:,1);
        
           ind2Id = [a(:) ranked_list2(:)];
        sigma_u_2 = sortrows(ind2Id,2);
        sigma_u_2 = sigma_u_2(:,1);

        
        Nrl1 = max(sigma_u_1);
        Nrl2 = max(sigma_u_2);
        ranked_list3 = w1*(Nrl1-sigma_u_1+1)/Nrl1 + w2*(Nrl2-sigma_u_2+1)/Nrl2;

        [rp_u,ranked_list] = sort(ranked_list3,'descend');
        
        
             pos_items_ids = find(urmTest(u,:)>3);

             if isempty(pos_items_ids)
                continue
             end

             if mod(p,25000)==1
                fprintf('%d true users evaluated \n',p)
             end

              p = p + 1;
              PR1_u(p) = precision_at_k(ranked_list,pos_items_ids,1); 
              PR3_u(p) = precision_at_k(ranked_list,pos_items_ids,3); 
              PR4_u(p) = precision_at_k(ranked_list,pos_items_ids,4); 
              PR5_u(p) = precision_at_k(ranked_list,pos_items_ids,5); 
              PR10_u(p) = precision_at_k(ranked_list,pos_items_ids,10); 
              PR20_u(p) = precision_at_k(ranked_list,pos_items_ids,20); 
              PR30_u(p) = precision_at_k(ranked_list,pos_items_ids,30); 
              PR50_u(p) = precision_at_k(ranked_list,pos_items_ids,50); 
              PR100_u(p) = precision_at_k(ranked_list,pos_items_ids,100); 
         

              Re1_u(p) = recall_at_k(ranked_list,pos_items_ids,1) ;
              Re3_u(p) = recall_at_k(ranked_list,pos_items_ids,3) ;
              Re4_u(p) = recall_at_k(ranked_list,pos_items_ids,4) ;
              Re5_u(p) = recall_at_k(ranked_list,pos_items_ids,5) ;
             Re10_u(p) = recall_at_k(ranked_list,pos_items_ids,10) ;
             Re20_u(p) = recall_at_k(ranked_list,pos_items_ids,20) ;
             Re30_u(p) = recall_at_k(ranked_list,pos_items_ids,30) ;
             Re50_u(p) = recall_at_k(ranked_list,pos_items_ids,50) ;
            Re100_u(p) = recall_at_k(ranked_list,pos_items_ids,100) ;

             MAP1_u(p) = AP_at_k(ranked_list,pos_items_ids,1);
             MAP3_u(p) = AP_at_k(ranked_list,pos_items_ids,3);
             MAP4_u(p) = AP_at_k(ranked_list,pos_items_ids,4);
             MAP5_u(p) = AP_at_k(ranked_list,pos_items_ids,5);
            MAP10_u(p) = AP_at_k(ranked_list,pos_items_ids,10);
            MAP20_u(p) = AP_at_k(ranked_list,pos_items_ids,20);
            MAP30_u(p) = AP_at_k(ranked_list,pos_items_ids,30);
            MAP50_u(p) = AP_at_k(ranked_list,pos_items_ids,50);
           MAP100_u(p) = AP_at_k(ranked_list,pos_items_ids,100);

            NDCG1_u(p) = NDCG(ranked_list,pos_items_ids,rp_u,1,'exp');
            NDCG3_u(p) = NDCG(ranked_list,pos_items_ids,rp_u,3,'exp');
            NDCG4_u(p) = NDCG(ranked_list,pos_items_ids,rp_u,4,'exp');
            NDCG5_u(p) = NDCG(ranked_list,pos_items_ids,rp_u,5,'exp');
           NDCG10_u(p) = NDCG(ranked_list,pos_items_ids,rp_u,10,'exp');
           NDCG20_u(p) = NDCG(ranked_list,pos_items_ids,rp_u,20,'exp');
           NDCG30_u(p) = NDCG(ranked_list,pos_items_ids,rp_u,30,'exp');
           NDCG50_u(p) = NDCG(ranked_list,pos_items_ids,rp_u,50,'exp');
          NDCG100_u(p) = NDCG(ranked_list,pos_items_ids,rp_u,100,'exp');

          MRR1_u(p) =  RR_at_k(ranked_list,pos_items_ids,1);
          MRR3_u(p) =  RR_at_k(ranked_list,pos_items_ids,3);
          MRR4_u(p) =  RR_at_k(ranked_list,pos_items_ids,4);
          MRR5_u(p) =  RR_at_k(ranked_list,pos_items_ids,5);
          MRR10_u(p) =  RR_at_k(ranked_list,pos_items_ids,10);
          MRR20_u(p) =  RR_at_k(ranked_list,pos_items_ids,20);
          MRR30_u(p) =  RR_at_k(ranked_list,pos_items_ids,30);
          MRR50_u(p) =  RR_at_k(ranked_list,pos_items_ids,50);
          MRR100_u(p) =  RR_at_k(ranked_list,pos_items_ids,100);


    end
end


fprintf('Evaluation completed! %d evaluated out of %d \n',p,size(urmTest,1))

Precision_all = [];
   Recall_all = [];
       F1_all = [];
      MAP_all = [];
     NDCG_all = [];
      MRR_all = [];

for cut_off = [1 3 4 5 10 20 30 50 100]
   eval(['output.Precision_' num2str(cut_off) '= mean(PR' num2str(cut_off) '_u);'])
   eval(['output.Recall_' num2str(cut_off) '= mean(Re' num2str(cut_off) '_u);'])
   eval(['output.F1_' num2str(cut_off) '= (' num2str(2) '*output.Precision_' num2str(cut_off) '*output.Recall_' num2str(cut_off)...
       ')/(' 'output.Precision_' num2str(cut_off) '+' 'output.Recall_' num2str(cut_off) ');'])
   eval(['output.MAP_' num2str(cut_off) '= mean(MAP' num2str(cut_off) '_u);'])
   eval(['output.NDCG_' num2str(cut_off) '= mean(NDCG' num2str(cut_off) '_u);'])
   eval(['output.MRR_' num2str(cut_off) '= mean(MRR' num2str(cut_off) '_u);'])

end
for cut_off = [1 3 4 5 10 20 30 50 100]
      eval(['Precision_all = [Precision_all ' 'output.Precision_' num2str(cut_off) '];'])
      eval(['Recall_all    = [Recall_all ' 'output.Recall_' num2str(cut_off) '];'])
      eval(['F1_all = [F1_all ' 'output.F1_' num2str(cut_off) '];'])
      eval(['MAP_all = [MAP_all ' 'output.MAP_' num2str(cut_off) '];'])
      eval(['NDCG_all = [NDCG_all ' 'output.NDCG_' num2str(cut_off) '];'])
      eval(['MRR_all = [MRR_all ' 'output.MRR_' num2str(cut_off) '];'])


end

output.Precision_all= Precision_all;
output.Recall_all = Recall_all ;
output.F1_all = F1_all;
output.MAP_all = MAP_all;
output.NDCG_all = NDCG_all;
output.MRR_all = MRR_all;
end








