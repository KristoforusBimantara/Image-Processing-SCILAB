clc;clear;
a=imread('gtw.jpg');
d=double(mtlb_double(a));
me=d(:,:,1);
hi=d(:,:,2);
bi=d(:,:,3);
bme=me;
bhi=hi;
bbi=bi;
m=(1/9)*ones(3,3);
[r1,c1]=size(mtlb_double(a));
for i=2:r1-1
    for j=2:c1-1
        a1me=1/me(i-1,j-1)+1/me(i-1,j)+1/me(i-1,j+1)+1/me(i,j-1)+1/me(i,j)+1/me(i,j+1)+1/me(i+1,j-1)+1/me(i+1,j)+1/me(i+1,j+1);
        a1hi=1/hi(i-1,j-1)+1/hi(i-1,j)+1/hi(i-1,j+1)+1/hi(i,j-1)+1/hi(i,j)+1/hi(i,j+1)+1/hi(i+1,j-1)+1/hi(i+1,j)+1/hi(i+1,j+1);
        a1bi=1/bi(i-1,j-1)+1/bi(i-1,j)+1/bi(i-1,j+1)+1/bi(i,j-1)+1/bi(i,j)+1/bi(i,j+1)+1/bi(i+1,j-1)+1/bi(i+1,j)+1/bi(i+1,j+1);
        bme(i,j)=9/a1me;
        bhi(i,j)=9/a1hi;
        bbi(i,j)=9/a1bi;
    end
end
imgrgb=cat(3,bme,bhi,bbi);
figure();
subplot(121);imshow(a); title('Original Image','fontsize',8);
subplot(122);imshow(uint8(imgrgb)); title('Filtered Image','fontsize',8);
