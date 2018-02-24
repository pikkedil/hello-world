function d = lees(f)
  %d = load(f);
  % 1. 1
  % 2. 05.01.1974
  % 3. 8
  % 4. 17
  % 5. 22
  % 6. 31
  % 7. 37
  % 8. 38
  %
  d = [];
  sz = false;
  fid = fopen(f,'rt');
  week = fgetl(fid);
  while ischar(week)
    datum = fgetl(fid);
    g1 = str2num(fgetl(fid));
    g2 = str2num(fgetl(fid));
    g3 = str2num(fgetl(fid));
    g4 = str2num(fgetl(fid));
    g5 = str2num(fgetl(fid));
    g6 = str2num(fgetl(fid));
    % save position and read next line
    a = ftell(fid);
    tl1 = fgetl(fid);
    b = ftell(fid);
    tl2 = fgetl(fid);
    tl3 = fgetl(fid);
    if tl3 > 0
      if length(tl3) > 2
        g7 = str2num(tl1);
        sz = true;
        fseek(fid,b,'bof');
        ln = [g1 g2 g3 g4 g5 g6 g7];
        week = fgetl(fid);
      else
        fseek(fid,a,'bof');
        ln = [g1 g2 g3 g4 g5 g6 -1];
        week = fgetl(fid);
      end
    else
      % end-of-file
      if sz 
        g7 = str2num(tl1);
        fseek(fid,b,'bof');
        ln = [g1 g2 g3 g4 g5 g6 g7];
        week = fgetl(fid);
      else
        fseek(fid,a,'bof');
        ln = [g1 g2 g3 g4 g5 g6 -1];
        week = fgetl(fid);
      end
    end
    d = [d; ln];
  end
  fclose(fid);
  return
end