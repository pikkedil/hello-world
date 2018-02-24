d = lees('reeks-1974.dat');

res = d(1:5,1:6);
g = [];

res = [15 18 26 27 37 42];

for i=1:1
  S = sum(d(i,1:6));
  kl = res(i,1);
  kh = res(i,6);
  e = reeks(S,10,kl,kh);
  %for j=1:length(e)
  %  disp(e(j,1:6))
  %  if sum(e) == S
  %    disp(e)
  %  end
  %end
  g = [g;res(i,:);e];
end

disp(g)