%Region #12¡°Elephant Valley¡±
clear; close all; clc;

maxIterations=500;
gridSize=1000;
xlim=[.275, .28];
ylim=[.006, .01];

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
axis off

colormap([bone();0 0 0]);