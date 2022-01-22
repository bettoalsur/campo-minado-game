function plot_grid(x,y,indicador)

dx = 10;
L = x(end)+dx/2;
W = max(y)+dx/2;

xp = 0:dx:L;
yp = 0:dx:W;

clf;
subplot(1,1,1); hold on;

if indicador == 1
    color = [1 1 1]*0.8; % when starts
else
    color = [1 1 1]*0.9; % when game over
end
rectangle('Position',[0 0 L W],'FaceColor',color,'EdgeColor','k');

for lh = 1:length(yp)
    plot([0 L],[1 1]*yp(lh),'k');
end
for lv = 1:length(xp)
    plot([1 1]*xp(lv),[0 W],'k');
end

axis equal;
axis([-dx/2 L+dx/2 -dx/2 W+dx/2]);
set(gcf,'position',[230    95   910   475]);
set(gca,'xtick',[]);
set(gca,'ytick',[]);
box on;


