function vals = get_vals(nx,ny,bombas)

cells = nx*ny;
bombas = round(cells*bombas);
vals = zeros(ny,nx);

vec = randperm(cells);
vals(vec(1:bombas)) = 1;

aux = zeros(ny,nx);

for i = 1:nx
    for j = 1:ny
        if vals(j,i) == 0
            if i == 1 && j == 1
                aux(j,i) = sum(sum(vals(j:j+1,i:i+1)));
            elseif i == 1 && j > 1 && j < ny
                aux(j,i) = sum(sum(vals(j-1:j+1,i:i+1)));
            elseif i == 1 && j == ny
                aux(j,i) = sum(sum(vals(j-1:j,i:i+1)));
                
            elseif i == nx && j == 1
                aux(j,i) = sum(sum(vals(j:j+1,i-1:i)));
            elseif i == nx && j > 1 && j < ny
                aux(j,i) = sum(sum(vals(j-1:j+1,i-1:i)));
            elseif i == nx && j == ny
                aux(j,i) = sum(sum(vals(j-1:j,i-1:i)));
                
            elseif j == 1 && i > 1 && i < nx
                aux(j,i) = sum(sum(vals(j:j+1,i-1:i+1)));
            elseif j == ny && i > 1 && i < nx
                aux(j,i) = sum(sum(vals(j-1:j,i-1:i+1)));
                
            else
                aux(j,i) = sum(sum(vals(j-1:j+1,i-1:i+1)));
            end
        end
    end
end

aux(vals==1) = -1;
vals = aux;
