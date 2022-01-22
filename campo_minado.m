clear; clc; close all;

% celular 
% nx = 22;
% ny = 12;
% bombas = 15/100;

% facil camputador 
nx = 9;
ny = 9;
bombas = 10/nx/ny;
% 
% medio camputador 
% nx = 16;
% ny = 14;
% bombas = 40/nx/ny;

% dificil camputador 
% nx = 30;
% ny = 16;
% bombas = 99/nx/ny;

[x,y] = get_centroides(nx,ny);
plot_grid(x,y,1);
vals = get_vals(nx,ny,bombas);
markers = zeros(size(vals));
visible = zeros(size(vals));
verify = zeros(size(vals));
verify(vals~=-1) = 1;

while sum(sum(verify-visible)) ~= 0

xb = -1; yb = -1;
while xb <= 0 || xb >= nx*10 || yb <= 0 || yb >= ny*10 
    [xb, yb, button ] = ginput(1);
end
d = sqrt( (x-xb).^2 + (y-yb).^2 );
[~,id] = min(d);

if button == 1 && markers(id)==0
    if vals(id) == -1
        game_over(nx,ny,x,y,vals,id);
        stop  = 1;
        break;
    end
    if vals(id) == 0
        id = blank_cells(vals,x,y,id);
    end
    id = id(visible(id)==0);
    show_cells(x,y,vals,id);
    visible(id) = 1;
elseif button == 3 && visible(id) == 0
    if markers(id) == 0
        plot(x(id),y(id)-1,'^r','MarkerSize',10,'MarkerEdgeColor',[0.5 0 0],'MarkerFaceColor','red');
        markers(id) = 1;
    elseif markers(id) == 1
        rectangle('Position',[x(id)-5 y(id)-5 10 10],'FaceColor',[1 1 1]*0.8,'EdgeColor','k');
        markers(id) = 0;
    end
end

end

if vals(id) ~= -1
    title('YOU WIN BABY','fontweight','bold');
end