close all;
clear all;
clc;
I=imread('LENA.bmp');
imshow(I);
[M,N]=size(I);
%也可以选择不用接下的两行，直接复制，但是降低了效率
J=zeros(M,N);
I=im2double(I);
for i=1:M;
    for j=1:N
        J(i,j)=I(i,j);
    end
end
figure;
imshow(J);