function ind = ismember_fast(M,x,n)

% This function is faaster version of the 'ismember()' function in MATLAB
% by a factor 15-20 times faster. 

ind = find(any(all(bsxfun(@eq,reshape(x.',1,n,[]),M),2),3)); 
