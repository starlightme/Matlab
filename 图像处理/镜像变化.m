close all;
clear all;
clc;
I=imread('LENA.bmp');
I=im2double(I);
subplot(1,2,1);
imshow(I);
title('原图');
[M,N]=size(I);
J=zeros(M,N);
for i=1:M
    for j=1:N
         J(i,j)=I(i,N+1-j);
    end
end
subplot(1,2,2);
imshow(J);
title('镜像反转后');

