function list = blank_cells(vals,x,y,id)

all = (1:size(x,1))';

list(1,:) = [id 1];
erro = 1;

while erro > 0 
    tam = size(list,1);
    new = [];
    for i = 1:tam
        if list(i,2) == 1
            list(i,2) = 0;
            xp = x(list(i,1));
            yp = y(list(i,1));
            d = sqrt( (x-xp).^2 + (y-yp).^2 );
            cand = all( d <= 10*1.01 );
            cand = cand(vals(cand) == 0);
            new = [ new ; cand ];
        end
    end
    new = unique( new );
    new = new( ismember( new , list(:,1) ) == 0 );
    list = [ list ; [ new ones(size(new)) ] ];
    erro = size(list,1) - tam;
end

new = [];
for i = 1:size(list,1)
    xp = x(list(i,1));
    yp = y(list(i,1));
    d = sqrt( (x-xp).^2 + (y-yp).^2 );
    cand = all( d <= 10*sqrt(2)*1.01 );
    cand = cand(vals(cand) > 0);
    new = [new ; cand];
end
new = unique( new );
new = new( ismember( new , list(:,1) ) == 0 );
list = [ list(:,1) ;  new  ];
    





