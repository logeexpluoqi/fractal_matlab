% Region #1¡°Triple Spiral Valley¡±
clear; clc; close all;

maxIterations=800;
gridSize=1000;
xlim=[-0.090,-0.086];
ylim=[0.654,0.657];

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

spinmap(10)