close all;
clear all;
clc all;
I=imread('rice.tif','tif');
imshow(I);
figure;
imhist(I);
J=imadjust(I,[0 1],[0.3 0.7]);
[a,b]=size(I);
J=I;
for i = 1:a;
    for j = 1:b;
        J(i,j) = 255 -I(i,j);
    end
end
imshow(I);figure;imshow(J);