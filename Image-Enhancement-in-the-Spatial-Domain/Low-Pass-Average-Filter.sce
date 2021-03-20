a=imread('bima.jpg');
b=double(a);
c=imnoise(a,'salt & pepper',0.2);
d=double(c);
m=(1/9)*(ones(3,3));
me=a(:,:,1);
hi=a(:,:,2);
bi=a(:,:,3);
dme=d(:,:,1);
dhi=d(:,:,2);
dbi=d(:,:,3);
[r1,c1]=size(a);
for i=1:r1
    for j=1:c1
        new1(i,j)=me(i,j);
        new2(i,j)=hi(i,j);
        new3(i,j)=bi(i,j);
    end
end

for i=2:1:r1-1
    for j=2:1:c1-1
        new1(i,j)=(m(1)*dme(i-1,j-1))+(m(2)*dme(i-1,j))+(m(3)*dme(i-1,j+1))+(m(4)*dme(i,j-1))+(m(5)*dme(i,j))+(m(6)*dme(i,j+1))+(m(7)*dme(i+1,j-1))+(m(8)*dme(i+1,j))+(m(9)*dme(i+1,j+1));
        new2(i,j)=(m(1)*dhi(i-1,j-1))+(m(2)*dhi(i-1,j))+(m(3)*dhi(i-1,j+1))+(m(4)*dhi(i,j-1))+(m(5)*dhi(i,j))+(m(6)*dhi(i,j+1))+(m(7)*dhi(i+1,j-1))+(m(8)*dhi(i+1,j))+(m(9)*dhi(i+1,j+1));
        new3(i,j)=(m(1)*dbi(i-1,j-1))+(m(2)*dbi(i-1,j))+(m(3)*dbi(i-1,j+1))+(m(4)*dbi(i,j-1))+(m(5)*dbi(i,j))+(m(6)*dbi(i,j+1))+(m(7)*dbi(i+1,j-1))+(m(8)*dbi(i+1,j))+(m(9)*dbi(i+1,j+1));
     end
end
img=cat(3,new1,new2,new3);
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
