clc;
clear;
I=imread('LENA256.bmp');
subplot(2,2,1);
imshow(I);
%手动设置为灰度的一半
I2=im2bw(I,0.5);
subplot(2,2,2);
imshow(I2);
%大津法
level = graythresh(I);
I3 = im2bw(I,level);
subplot(2,2,3);
imshow(I3);
%Bernsen算法,用时较长
I_gray=double(I);
[m,n] = size(I);
a=0.3;
A=0;T1=0;S=0;
for i=1:m
for j=1:n
A=A+I_gray(i,j) ;
end
end
A=A*0.9;
while(S<A)
T1=T1+1;
for i=1:m
for j=1:n
if(I_gray(i,j)==T1) S=S+I_gray(i,j);
end
end
end
end
T2=zeros(m,n);
T3=zeros(m,n);
M=3;
N=3;
for i=M+1:m-M
for j=N+1:n-N
    max=1;min=255;
for k=i-M:i+M
for l=j-N:j+N
if I_gray(k,l)>max
    max=I_gray(k,l);
end
if I_gray(k,l)<min
    min=I_gray(k,l);
end
end
end
T2(i,j)=(max+min)/2;
T3(i,j)=max-min;
end

end
T4=medfilt2(T2,[M,N]);
T5=(T1+T4)/2;
I_bw=zeros(m,n);

for i=1:m
for j=1:n
if I_gray(i,j)>(1+a)*T1 I_bw(i,j)=255;
end
if I_gray(i,j)<(1-a)*T1 I_bw(i,j)=0;
end
if (1-a)*T1<=I_gray(i,j)<=(1-a)*T1 if T3(i,j)>a*T1
if I_gray(i,j)>=T4(i,j) I_bw(i,j)=255; else
    I_bw(i,j)=0;
end
else if I_gray(i,j)>=T5(i,j) I_bw(i,j)=255; else
I_bw(i,j)=0;
    end
end
end
end
end
subplot(2,2,4),imshow(I_bw);