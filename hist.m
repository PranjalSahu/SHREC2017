% get top 1000 models using shell 
Files = dir('m*');
sizes = size(Files);
numofdivs = 120;

for i = 1:sizes

f = Files(i).name;
p = dlmread(f);

x2= p(:, 1).^2;
y2= p(:, 2).^2;
z2= p(:, 3).^2;

rad = (x2+y2+z2).^0.5;
div = rad/120.0;
divs = [1:120];

divs = divs*div;
hist = zeros(1, numofdivs)

for k = 1:120
hist(k) = find(rad < divs(k))
end

sp = strcat('/Users/pranjal/Downloads/SHREC17/model_pdb_hist_120/', f);
dlmwrite(sp, hist, 'delimiter', ',', 'precision', 7); 

end

