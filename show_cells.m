function show_cells(x,y,vals,list)

for cont = 1:size(list,1)
    id = list(cont);
    rectangle('Position',[x(id)-5 y(id)-5 10 10],'FaceColor',[1 1 1]*0.9,'EdgeColor','k');
    if vals(id) > 0
        switch vals(id)
            case 1, str = 'blue';
            case 2, str = 'green';
            case 3, str = 'red';
            case 4, str = [0 0 0.5];
            case 5, str = [0.5 0 0];
            case 6, str = [0.5 0 0.5];
            case 7, str = [0 0.5 0.5];
            case 8, str = [0.45 0.3 0];
        end
        text(x(id)-1,y(id),num2str(vals(id)),'color',str,'fontweight','bold','fontsize',13);
    end
end







