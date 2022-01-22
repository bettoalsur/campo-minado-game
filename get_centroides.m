function [x,y] = get_centroides(nx,ny)

dx = 10;
L = nx*dx;
W = ny*dx;

x = linspace(dx/2,L-dx/2,nx)';
x = kron(x,ones(ny,1));
y = linspace(W-dx/2,dx/2,ny)';
y = repmat(y,nx,1);