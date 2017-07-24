clear
clc
close all

% This scripts runs a file namely movies.csv prvided by movielens group and
% return a year and genre seperated file as shown in the following. The
% output is useful for classfication experiments:

%%%%%%%%%
% Input %
%%%%%%%%%
% movieId,title,genres
% 1,Toy Story (1995),Adventure|Animation|Children|Comedy|Fantasy
% 2,Jumanji (1995),Adventure|Children|Fantasy
% ...
% 40697,Babylon 5,Sci-Fi

%%%%%%%%%%
% Output %
%%%%%%%%%%

% header: movieId   Year   Action  Adventure  Animation  Children ...
%           1      1995     0         1         1         1     
%           2      1995     0         1         0         1
%          ...
%          40697    NaN     0         0         0         0



% Notes
% 1: It is assumed that Year (of prduction) is inside paranthese. In some
%    cases when the Year is NOT avilable, it is filled with a NaN.
% 2(important): In order for the script to work, you need to manually
% import the movies.csv file, set the delimiter to comma (,) and line (|) 
% and then rename each genre column to g1, g2, g3, g4, g5 and g6 and save
% it as movies. 
% 
% movies:
% header: movieId        title               g1             g2          g3         g4        g5      g6
%           1      "Toy Story (1995)"    "Adventure"   "Animation"  "Children"  "Comedy"  "Fantasy"  ""
%           2      "Jumanji (1995)"      "Adventure"   "Children"   "Fantasy"    ""        ""        ""
%
% Yashar Deldjoo
% July 22, 2017
% Linz, Austria
%
% Refs:
% MovieLens Group dataset: http://files.grouplens.org/datasets/movielens/
%
load ML_movies.mat   % contains variable movies as explained above

% Genre list are taken from the mvoie lens website:
% http://files.grouplens.org/datasets/movielens/ml-20m-README.html (18 genres)
genresDic = {'Action','Adventure','Animation','Children','Comedy','Crime', ...
          'Documentary','Drama','Fantasy','Film-Noir','Horror','Musical',...
           'Mystery','Romance','Sci-Fi','Thriller','War','Western'};   

genresDicT = {'Action','Adventure','Animation','Children','Comedy','Crime', ...
          'Documentary','Drama','Fantasy','Film_Noir','Horror','Musical',...
           'Mystery','Romance','Sci_Fi','Thriller','War','Western'};
       
 
              
 mlTable_Year_Genre_Sep = array2table(zeros([size(movies,1) 20]));
 mlTable_Year_Genre_Sep.Properties.VariableNames = [{'movieId' 'Year'} genresDicT];
 
for file = 1 : size(movies)
    try
    % it is assumed each movie has maximum 6 genres    
    g1 = char(movies.g1(file));
    g2 = char(movies.g2(file));
    g3 = char(movies.g3(file));
    g4 = char(movies.g4(file));
    g5 = char(movies.g5(file));
    g6 = char(movies.g6(file));
    
    movieG = {g1,g2,g3,g4,g5,g6};
    [~,ind] =  ismember(upper(movieG),upper(genresDic));
    ind = ind(ind>0);
    
    mlTable_Year_Genre_Sep.movieId(file) = movies.movieId(file);
    mlTable_Year_Genre_Sep(file,ind+2) = array2table(1);
        
    % Look for 4 digit number iside paranthese (as for Year of production)
    mlTable_Year_Genre_Sep.Year(file) = str2double(char(regexp(movies.title(file), '\d{4}', 'match', 'once')));
    catch
        % if there is an error, it is becuase of the year of production is
        % not avilable, fill it with NaN,
        mlTable_Year_Genre_Sep.Year(file) = nan;
        
    end
    
end

save('ml20MTable_Year_Genre_Sep.mat','mlTable_Year_Genre_Sep')

