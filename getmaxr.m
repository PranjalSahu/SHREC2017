%get max radius
Files = dir('m*');
sizes = size(Files, 1);
pqmax = zeros(sizes, 1);
pqmin = zeros(sizes, 1);

for i = 1:sizes

f = Files(i).name;
p = dlmread(f);

x2= p(:, 1).^2;
y2= p(:, 2).^2;
z2= p(:, 3).^2;

rad = (x2+y2+z2).^0.5;

mr = max(rad);
mi = min(rad);

pqmax(i, 1) = mr;
pqmin(i, 1) = mi;

end

min(pqmin)
max(pqmax)