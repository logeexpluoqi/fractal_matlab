clear; clc; close all;

maxIterations=8000;
gridSize=1000;
xlim=[-2 1];
ylim=[-1.5 1.5];

% Setup
x=linspace(xlim(1),xlim(2),gridSize);
y=linspace(ylim(1),ylim(2),gridSize);
[xGrid,yGrid]=meshgrid(x,y);
z0=xGrid+1i*yGrid;
count=ones(size(z0));

% Calculate
z=z0;
for n=0:maxIterations
    z=z.*z+z0;
    inside=abs(z)<=2;
    count=count+inside;
end
count=log(count);

% Show
imagesc(x,y,count);
colormap([flipud(pink());0 0 0]);


