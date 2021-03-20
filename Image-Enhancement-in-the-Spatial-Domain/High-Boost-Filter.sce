a=imread('bima.jpg');
d=double(a);
A=1.1;
BB=(9*A)-1;
m1=[-1 -1 -1;-1 BB -1;-1 -1 -1];
m=[-1 -1 -1;-1 8 -1;-1 -1 -1];
dme=d(:,:,1);
dhi=d(:,:,2);
dbi=d(:,:,3);
[r1,c1]=size(a);
for i=2:1:r1-1
    for j=2:1:c1-1
        new1(i,j)=(m1(1)*dme(i-1,j-1))+(m1(2)*dme(i-1,j))+(m1(3)*dme(i-1,j+1))+(m1(4)*dme(i,j-1))+(m1(5)*dme(i,j))+(m1(6)*dme(i,j+1))+(m1(7)*dme(i+1,j-1))+(m1(8)*dme(i+1,j))+(m1(9)*dme(i+1,j+1));
        new2(i,j)=(m1(1)*dhi(i-1,j-1))+(m1(2)*dhi(i-1,j))+(m1(3)*dhi(i-1,j+1))+(m1(4)*dhi(i,j-1))+(m1(5)*dhi(i,j))+(m1(6)*dhi(i,j+1))+(m1(7)*dhi(i+1,j-1))+(m1(8)*dhi(i+1,j))+(m1(9)*dhi(i+1,j+1));
        new3(i,j)=(m1(1)*dbi(i-1,j-1))+(m1(2)*dbi(i-1,j))+(m1(3)*dbi(i-1,j+1))+(m1(4)*dbi(i,j-1))+(m1(5)*dbi(i,j))+(m1(6)*dbi(i,j+1))+(m1(7)*dbi(i+1,j-1))+(m1(8)*dbi(i+1,j))+(m1(9)*dbi(i+1,j+1));
     end
end
img=cat(3,new1,new2,new3);
newimg=uint8(img);
figure();
subplot(221); imshow(newimg); xtitle('Foto Asli Setelah Filter');
subplot(222); imshow(newimg(:,:,1)); xtitle('Lapisan Merah Setelah Filter');
subplot(223); imshow(newimg(:,:,2)); xtitle('Lapisan Hijau Setelah Filter');
subplot(224); imshow(newimg(:,:,3)); xtitle('Lapisan Biru Setelah Filter');

