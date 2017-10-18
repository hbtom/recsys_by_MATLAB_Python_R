function ranked_list_aggr = aggregate_rank_borda(ranked_list1, ranked_list2,urmTest,w1,w2)

a = 1: size(urmTest,2);

ind2Id = [a(:) ranked_list1(:)];
sigma_u_1 = sortrows(ind2Id,2);
sigma_u_1 = sigma_u_1(:,1);

ind2Id = [a(:) ranked_list2(:)];
sigma_u_2 = sortrows(ind2Id,2);
sigma_u_2 = sigma_u_2(:,1);


Nrl1 = max(sigma_u_1);
Nrl2 = max(sigma_u_2);
ranked_list3 = w1*(Nrl1-sigma_u_1+1)/Nrl1 + w2*(Nrl2-sigma_u_2+1)/Nrl2;

[rp_u,ranked_list_aggr] = sort(ranked_list3,'descend');