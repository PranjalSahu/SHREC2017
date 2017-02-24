% get shell histograms
Files = dir('m*');
sizes = size(Files);

for i = 1:sizes

f = Files(i).name;
p = dlmread(f);

x2= p(:, 1).^2;
y2= p(:, 2).^2;
z2= p(:, 3).^2;

rad = (x2+y2+z2).^0.5;

divs = [0:59];
hist = zeros(1, size(divs, 2));

for k = 1:size(divs, 2)
hist(k) = size(find(rad < divs(k)), 1);
end

histd = diff(hist)/size(p, 1);

sp = strcat('/Users/pranjal/Downloads/SHREC17/model_pdb_hist_60/', f);
dlmwrite(sp, histd, 'delimiter', ',', 'precision', 7); 

end
