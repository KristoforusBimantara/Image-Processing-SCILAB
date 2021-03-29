clc;clear;
a=imread('gtw.jpg');
z=double(a);
me=z(:,:,1);
hi=z(:,:,2);
bi=z(:,:,3);
r=size(a,1);
c=size(a,2);
d=8;
for i=6-(d/2):r-(1+(d/2))
    for j=6-(d/2):c-(1+(d/2))
        nme=me(i-1,j-1)+me(i-1,j)+me(i-1,j+1)+me(i,j-1)+me(i,j)+me(i,j+1)+me(i+1,j-1)+me(i+1,j)+me(i+1,j+1);
        nhi=hi(i-1,j-1)+hi(i-1,j)+hi(i-1,j+1)+hi(i,j-1)+hi(i,j)+hi(i,j+1)+hi(i+1,j-1)+hi(i+1,j)+hi(i+1,j+1);
        nbi=bi(i-1,j-1)+bi(i-1,j)+bi(i-1,j+1)+bi(i,j-1)+bi(i,j)+bi(i,j+1)+bi(i+1,j-1)+bi(i+1,j)+bi(i+1,j+1);
        newme(i,j)=(1/(9-(d/2)))*nme;
        newhi(i,j)=(1/(9-(d/2)))*nhi;
        newbi(i,j)=(1/(9-(d/2)))*nbi;
    end
end
imgrgb=cat(3,newme,newhi,newbi);
figure();
subplot(121);imshow(a); title('Original Image','fontsize',8);
subplot(122);imshow(uint8(imgrgb)); title('Alpha Trimmed Mean Filtered Image','fontsize',8);
