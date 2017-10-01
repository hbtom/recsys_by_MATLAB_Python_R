function outputRandom_rec = evaluate_urms_random(urmTest, urmPred)

fprintf('Evaluation strtated ...  \n');

p = 0;
for u = 1 : size(urmTest,1)
    if nnz(urmPred(u,:)) == nnz(urmTest(u,:))
                
        [rp_u,ranked_list] = sort(urmPred(u,:)-0.1+0.2*rand(1,size(urmTest,2)),'descend');
             pos_items_ids = find(urmTest(u,:)>3);
             
             if isempty(pos_items_ids)
                continue 
             end
             
             if mod(p,2500)==1
                fprintf('%d true users evaluated \n',p) 
             end
              
              ranked_list = randperm(size(urmTest,2));
              p = p + 1;

              PR1_u(p) = precision_at_k(ranked_list,pos_items_ids,1) ;
              PR3_u(p) = precision_at_k(ranked_list,pos_items_ids,3) ;
              PR4_u(p) = precision_at_k(ranked_list,pos_items_ids,4) ;
              PR5_u(p) = precision_at_k(ranked_list,pos_items_ids,5) ;
              PR10_u(p) = precision_at_k(ranked_list,pos_items_ids,10) ;
              PR20_u(p) = precision_at_k(ranked_list,pos_items_ids,20) ;
              PR30_u(p) = precision_at_k(ranked_list,pos_items_ids,30) ;
              PR50_u(p) = precision_at_k(ranked_list,pos_items_ids,50) ;        
              PR100_u(p) = precision_at_k(ranked_list,pos_items_ids,100) ;

             
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
   eval(['outputRandom_rec.Precision_' num2str(cut_off) '= mean(PR' num2str(cut_off) '_u);'])  
   eval(['outputRandom_rec.Recall_' num2str(cut_off) '= mean(Re' num2str(cut_off) '_u);'])  
   eval(['outputRandom_rec.F1_' num2str(cut_off) '= (' num2str(2) '*outputRandom_rec.Precision_' num2str(cut_off) '*outputRandom_rec.Recall_' num2str(cut_off)...
       ')/(' 'outputRandom_rec.Precision_' num2str(cut_off) '+' 'outputRandom_rec.Recall_' num2str(cut_off) ');'])  
   eval(['outputRandom_rec.MAP_' num2str(cut_off) '= mean(MAP' num2str(cut_off) '_u);'])  
   eval(['outputRandom_rec.NDCG_' num2str(cut_off) '= mean(NDCG' num2str(cut_off) '_u);'])  
   eval(['outputRandom_rec.MRR_' num2str(cut_off) '= mean(MRR' num2str(cut_off) '_u);'])  
   
end
for cut_off = [1 3 4 5 10 20 30 50 100]
      eval(['Precision_all = [Precision_all ' 'outputRandom_rec.Precision_' num2str(cut_off) '];'])  
      eval(['Recall_all    = [Recall_all ' 'outputRandom_rec.Recall_' num2str(cut_off) '];'])  
      eval(['F1_all = [F1_all ' 'outputRandom_rec.F1_' num2str(cut_off) '];'])  
      eval(['MAP_all = [MAP_all ' 'outputRandom_rec.MAP_' num2str(cut_off) '];'])  
      eval(['NDCG_all = [NDCG_all ' 'outputRandom_rec.NDCG_' num2str(cut_off) '];'])  
      eval(['MRR_all = [MRR_all ' 'outputRandom_rec.MRR_' num2str(cut_off) '];'])  

    
end

outputRandom_rec.Precision_all= Precision_all;
outputRandom_rec.Recall_all = Recall_all ;
outputRandom_rec.F1_all = F1_all;
outputRandom_rec.MAP_all = MAP_all;
outputRandom_rec.NDCG_all = NDCG_all;
outputRandom_rec.MRR_all = MRR_all;
end








