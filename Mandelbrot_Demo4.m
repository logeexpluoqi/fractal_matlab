% Region #9  ¡°microbugs¡±
clear; clc; close all;

maxIterations=1000;
gridSize=1000;
xlim=[-3e-10,3e-10]-1.7497591451303665;
ylim=[-3e-10,3e-10]-0.0000000036851380;

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
% b=bone(20);
% colormap([repmat(b,[10,1]);bone();0 0 0]);

% colormap(bone();0 0 0]);

h=flipud(hot(20));
colormap([repmat(h,[25,1]);flipud(hot());0 0 0]);

