a=imread('bima.jpg');
b=double(a);
c=imnoise(a,'salt & pepper',0.2);
d=double(c);
m=(1/9)*(ones(3,3));
dme=d(:,:,1);
dhi=d(:,:,2);
dbi=d(:,:,3);
[r1,c1]=size(a);
for i=2:1:r1-1
    for j=2:1:c1-1
        new1=[dhi(i-1,j-1) dhi(i-1,j) dhi(i-1,j+1) dhi(i,j-1) dhi(i,j) dhi(i,j+1) dhi(i+1,j-1) dhi(i+1,j) dhi(i+1,j+1)];
        new2=[dhi(i-1,j-1) dhi(i-1,j) dhi(i-1,j+1) dhi(i,j-1) dhi(i,j) dhi(i,j+1) dhi(i+1,j-1) dhi(i+1,j) dhi(i+1,j+1)];
        new3=[dbi(i-1,j-1) dbi(i-1,j) dbi(i-1,j+1) dbi(i,j-1) dbi(i,j) dbi(i,j+1) dbi(i+1,j-1) dbi(i+1,j) dbi(i+1,j+1)];
        new11=gsort(new1);
        new22=gsort(new2);
        new33=gsort(new3);
        med1=new11(5);
        med2=new22(5);
        med3=new33(5);
        me(i,j)=med1;
        hi(i,j)=med2;
        bi(i,j)=med3;
     end
end
img=cat(3,me,hi,bi);
newimg=uint8(img);
figure();
subplot(221); imshow(c); xtitle('Foto Asli Dengan Noise');
subplot(222); imshow(c(:,:,1)); xtitle('Lapisan Merah Dengan Noise');
subplot(223); imshow(c(:,:,2)); xtitle('Lapisan Hijau Dengan Noise');
subplot(224); imshow(c(:,:,3)); xtitle('Lapisan Biru Dengan Noise');
figure();
subplot(221); imshow(newimg); xtitle('Foto Asli Setelah Filter');
subplot(222); imshow(newimg(:,:,1)); xtitle('Lapisan Merah Setelah Filter');
subplot(223); imshow(newimg(:,:,2)); xtitle('Lapisan Hijau Setelah Filter');
subplot(224); imshow(newimg(:,:,3)); xtitle('Lapisan Biru Setelah Filter');
