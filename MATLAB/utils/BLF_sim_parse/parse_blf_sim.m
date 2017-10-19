clear
clc
close all

if ismac

    dataAddr = '/Users/yashar/Documents/GitHub/data';
    
end
% fileID = fopen(fullfile(dataAddr,'BLF_sims_original.txt'));
% % A=[];
% m = 1;
% % % Skip 14094 headerlines
% % for n=1:14094
% %   tline = fgetl(fileID);
% % end
% % while ischar(tline)
% %   tline = fgetl(fileID);
% % %   A = [A;str2num(tline(1,1:end))];
% %   m = m+1;
% %   if mod(m,1000)==1
% %       
% %      fprintf('Line %d \n',m) 
% %   end
% % 
% % end
% % fclose(fileID);
% 
% % To read movie Ids
% m = 1;
% movieIds_list = [];
% for n= 1 : 1
%     tline = fgetl(fileID);
% end
% while ischar(tline)
%     tline = fgetl(fileID);
%     tmp1 = strsplit(tline,' ');
%     string = tmp1{1,2};
%     tmp2 = strsplit(string, '\');
%     filename = tmp2{1,3};
%     movieId = str2num(strtok(filename,'.wav'));
%     if isnumeric(movieId)
%         movieIds_list = [movieIds_list;movieId];
%     else
%         error('A non-numeric movie Id found');
%     end
%     m = m+1;
%     if mod(m,1000)==1
%         
%         fprintf('Line %d \n',m)
%     end
%     if m == 14093 % There exists 14092 movies on top after reading them we skip the loop
%        break 
%     end
% end

load('BLF_sim_with_movieId.mat');
itemIds = movieIds_list;

sim_type = 'cosine';

tmp = ones(length(movieIds_list));
tmp = tril(tmp,-1); %# creates a matrix that has 1's below the diagonal

[rowIdx,colIdx] = find(tmp);
     sim_inds = sub2ind(size(blf_sim),rowIdx,colIdx);

distArray = [itemIds(colIdx),itemIds(rowIdx),1-blf_sim(sim_inds)];


distArray = array2table(distArray);
distArray.Properties.VariableNames = {'item_i','item_j',[sim_type '_dist_score']};


save('simArray_BLF.mat','distArray','-v7.3')
