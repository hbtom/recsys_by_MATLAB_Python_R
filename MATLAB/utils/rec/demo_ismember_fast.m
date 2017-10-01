clear
clc
close all

load data.mat
M = a;
M = M';
x = table2array(b);

% M = rand(100000000,700);
%  
% x = [M(45,:);M(100,:);M(1001,:)];




tic
ind2 = ismember(M,x);
toc


s=sort(M);
edge= [-Inf s(2:end) Inf];
ind = false(size(M));
%for ... 100M iterations
tic
[~,~,bin]=histcounts(x,edge);
ind(bin)= ind(bin)==x;
toc
%...
ind(bin) = false;

% Mnorms=sqrt(sum(M.^2,1));
% tic
% [~,loc]=max(bsxfun(@rdivide,x.'*M, Mnorms),[],2);
% toc

%    
% n=1;
% ind1 = find(any(all(bsxfun(@eq,reshape(x.',1,n,[]),M),2),3))
% toc