function [c, d] = myfunc(infilename, outfilename, filterOrder) 
data = load(infilename);
% ====== 巴特沃斯濾波器 ======
%[b, a] = butter(filterOrder, [1/(50/2) 2/(50/2)]);  %低通1/(50/2)，高通2/(50/2)
[b, a] = butter(filterOrder, [15/(120/2)], 'low');
y = filter(b, a, data);

c = data;
d = y;

fid=fopen(outfilename,'w');
fprintf(fid, '%.4f ', y);
fclose(fid);

