% Region #4. ¡°Valley of the Seahorses¡±
clear; close all; clc;

maxIterations=50000;
gridSize=1000;
xlim=[-0.748766713922161, -0.748766707771757];
ylim=[ 0.123640844894862,  0.123640851045266];

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
spinmap(10)



