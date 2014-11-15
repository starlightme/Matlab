clc;
clear;
I=imread('LENA256.bmp');
J=imnoise(I,'gaussian',0,0.03);
subplot(1,2,1);imshow(I);title('原图');
subplot(1,2,2);imshow(J);title('噪声处理后');
K=zeros(256,256);
for i=1:100
    J=imnoise(I,'gaussian',0,0.03);
    J1=im2double(J);
    K=K+J1;
end
K=K/100;
figure;imshow(K);title('模拟处理后');