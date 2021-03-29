clc;clear;
a=imread('gtw.jpg');
d=double(mtlb_double(a));
me=d(:,:,1);
hi=d(:,:,2);
bi=d(:,:,3);
bme=me;
bhi=hi;
bbi=bi;
m=(1/9)*(ones(3,3));
[r1,c1]=size(mtlb_double(a));
for i=2:r1-1
    for j=2:c1-1
        a1me=[me(i-1,j-1),me(i-1,j),me(i-1,j+1),me(i,j-1),me(i,j),me(i,j+1),me(i+1,j-1),me(i+1,j),me(i+1,j+1)];
        a1hi=[hi(i-1,j-1),hi(i-1,j),hi(i-1,j+1),hi(i,j-1),hi(i,j),hi(i,j+1),hi(i+1,j-1),hi(i+1,j),hi(i+1,j+1)];
        a1bi=[bi(i-1,j-1),bi(i-1,j),bi(i-1,j+1),bi(i,j-1),bi(i,j),bi(i,j+1),bi(i+1,j-1),bi(i+1,j),bi(i+1,j+1)];
        a2me=gsort(a1me,"g","i");
        a2hi=gsort(a1hi,"g","i");
        a2bi=gsort(a1bi,"g","i");
        medme=a2me(5);
        medhi=a2hi(5);
        medbi=a2bi(5);
        bme(i,j)=medme;
        bhi(i,j)=medhi;
        bbi(i,j)=medbi;
    end
end
imgrgb=cat(3,bme,bhi,bbi);
figure();
subplot(121);imshow(a); title('Original Image', 'fontsize',8);
subplot(122);imshow(uint8(imgrgb)); title('Median Filtered Image','fontsize',8);
