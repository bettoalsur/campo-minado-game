function game_over(nx,ny,x,y,vals,id_p)

plot_grid(x,y,0);
title('GAME OVER MOTHERFUCKER','fontweight','bold');

all = (1:nx*ny)';
list = all(vals ~= 0);

for cont = 1:size(list,1)
    id = list(cont);
    if vals(id) == -1
        if id == id_p
            plot(x(id),y(id),'sr','MarkerSize',10,'MarkerEdgeColor',[0.5 0 0],'MarkerFaceColor','red');
        else
            plot(x(id),y(id),'or','MarkerSize',7,'MarkerEdgeColor',[0.5 0 0],'MarkerFaceColor','red');
        end
    elseif vals(id) > 0
        switch vals(id)
            case 1, str = 'blue';
            case 2, str = 'green';
            case 3, str = 'red';
            case 4, str = [0 0 0.5];
            case 5, str = [0.5 0 0];
            case 6, str = [0.5 0 0.5];
            case 7, str = [0 0.5 0.5];
            case 8, str = [0.35 0.2 0];
        end
        text(x(id)-1,y(id),num2str(vals(id)),'color',str,'fontweight','bold','fontsize',13);
    end
end

