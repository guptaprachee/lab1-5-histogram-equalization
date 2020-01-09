%lab1-5 histogram equalization
clc;clear;close all;
a=imread('l1.jpg');
r=size(a,1); %no. of rows
c=size(a,2); %no.of rows
final=uint8(zeros(r,c));
n=r*c; %totla no. of pixels

frq=zeros(256,1);
pdf=zeros(256,1);
cdf=zeros(256,1);
cum=zeros(256,1);
out=zeros(256,1);

for i=1:r
    for j=1:c
        v=a(i,j);
        frq(v+1)=frq(v+1)+1;
        pdf(v+1)=frq(v+1)/n;
    end
end

sum=0; len=255;
for i=1:size(pdf)
    sum=sum+frq(i);
    cum(i)=sum;
    cdf(i)=cum(i)/n;
    out(i) = round(cdf(i)*len);
end

for i = 1:r
    for j = 1:c
        final(i,j) = out(a(i,j)+1);
    end
end
figure
imshow(final)
figure
imshow(a)
        
