clear
clc
close all
warning off

saveAddr = '/Volumes/SP PHD U3/OneDrivePolimi/OneDrive - Politecnico di Milano/dataset/metadata';

tags = readtable('tags2.csv');

movieIds_all = tags.movieId        ;
movieIds_unq = unique(tags.movieId);
% 

for m = 1 : length(movieIds_unq)
    
    doc_ind_with_mov_id_m = find(movieIds_all==movieIds_unq(m)); 
    
       doc_text_with_mov_id_m = tags(doc_ind_with_mov_id_m,3);
                      tagCell = cellstr(doc_text_with_mov_id_m.tag);
    merged_text_with_mov_id_m = cellstr(strjoin(tagCell));
    
    documentsTokens(m,1) = array2table(movieIds_unq(m));
    documentsTokens(m,2) = array2table(merged_text_with_mov_id_m);
    
    
end
documentsTokens.Properties.VariableNames = {'movieId','tag'};


       tagCell = cellstr(documentsTokens.tag);
 cleanTextData = erasePunctuation(tagCell);
 cleanTextData = lower(cleanTextData);
cleanDocuments = tokenizedDocument(cleanTextData);
cleanDocuments = removeWords(cleanDocuments,stopWords);


cleanDocuments = removeShortWords(cleanDocuments,2);
cleanDocuments = removeLongWords(cleanDocuments,15);

cleanDocuments = normalizeWords(cleanDocuments);
      cleanBag = bagOfWords(cleanDocuments);
      cleanBag = removeInfrequentWords(cleanBag,2);
   tag_MLlastest_tfidf = tfidf(cleanBag);
   tag_MLlastest_tfidf(isnan(tag_MLlastest_tfidf))= 0;
   
   tag_MLlastest_tfidf = [movieIds_unq tag_MLlastest_tfidf];
   tag_MLlastest_tfidf_table = array2table(tag_MLlastest_tfidf);
   tag_MLlastest_tfidf_table.Properties.VariableNames = ['movieId' sprintfc('tfid%d',1:size(tag_MLlastest_tfidf,2)-1)];
   
   
   save(fullfile(saveAddr,'tag_MLlastest_tfidf.mat'),'tag_MLlastest_tfidf_table');
   writetable(tag_MLlastest_tfidf_table,fullfile(saveAddr,'tag_MLlastest_tfidf.csv'));