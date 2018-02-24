res = [];
for jaar=1955:2018
  f = ['../toetsdata/reeks-' num2str(jaar) '.dat'];
  fid = fopen(f,'rt');
  if fid < 0
    continue;
  end
  fclose(fid);
  d = lees(f);
  res = [res; d];
end

x = 1:length(res);
zl = res(:,1);
zh = res(:,6);
zs = sum(res')/6;

plot(x,zl,x,zh,x,zs);

ml = mean(zl)
mh = mean(zh)
ms = mean(zs)