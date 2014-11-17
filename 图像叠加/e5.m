clear;
clc;
a=imread('man.jpg');
b=imread('rice.jpg');
%预分配变量
c=uint8(zeros(160,160));   
for i=1:160
    for j=1:160
        c(i,j)=a(i,j)+b(i,j);
    end
end
imshow(c);
