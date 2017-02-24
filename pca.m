% align using pca
Files = dir('/Users/pranjal/Downloads/SHREC17/model_pdb_cent/m*');
sizes = size(Files);

for i = 1:sizes

p  = dlmread(Files(i).name);

x2 = sum(p(:, 1).*p(:, 1));
xy = sum(p(:, 1).*p(:, 2));
xz = sum(p(:, 1).*p(:, 3));
yz = sum(p(:, 2).*p(:, 3));
y2 = sum(p(:, 2).*p(:, 2));
z2 = sum(p(:, 3).*p(:, 3));

m  = [x2, xy, xz; xy, y2, yz; xz, yz, z2];

[v, d] = eig(m);

va = [1, 0, 0;0, 1, 0;0, 0, 1];
r  = v*va';
pr = p*r;

dlmwrite(strcat('/Users/pranjal/Downloads/SHREC17/model_pdb_pca/', Files(i).name), pr, 'delimiter', ',', 'precision', 7); 

end
