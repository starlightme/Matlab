close all;
clear all;
clc;
I=imread('LENA.bmp');
imshow(I);
[M,N]=size(I);
%Ҳ����ѡ���ý��µ����У�ֱ�Ӹ��ƣ����ǽ�����Ч��
J=zeros(M,N);
I=im2double(I);
for i=1:M;
    for j=1:N
        J(i,j)=I(i,j);
    end
end
figure;
imshow(J);