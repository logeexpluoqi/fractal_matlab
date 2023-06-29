% Region #5¡°West Wing¡±
clear; close all; clc;

maxIterations=500;
gridSize=1000;
xlim=[-7e-5,7e-5]-1.6735;
ylim=[-7e-5,7e-5]+0.0003318;

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
figure()
imagesc(x,y,count);
axis off
colormap([jet(70);jet();0 0 0]);
