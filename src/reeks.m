function y = reeks(S,n,ll,lh)
%
% Funktion to generate 6 random numbers in the range
% 1 and 49. Definitions:
% S  : sum of all the numbers
% n  : number of series to generate
% ll : smallest number
% lh : highest number
%
y = [];
i = 0;
while i<n
  A = randperm(49);
  B = sort(A(1:6));
  T = sum(B);
  if B(1) == ll && B(6) == lh
    if T == S
      y = [y; B];
      i = i+1;
    end
  end  
end