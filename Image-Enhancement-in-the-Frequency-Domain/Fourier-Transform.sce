clc;clear;
a=imread('bima1.jpg');
a1=double(a);
f=fft2(a1);
m=abs(f);
p=angle(f);
//Merah
me=a1(:,:,1);
fme=fft2(me);
mme=abs(fme);
pme=angle(fme);
//Hijau
hi=a1(:,:,2);
fhi=fft2(hi);
mhi=abs(fhi);
phi=angle(fhi);
//Biru
bi=a1(:,:,3);
fbi=fft2(bi);
mbi=abs(fbi);
pbi=angle(fbi);

figure();
subplot(131);imshow(a);title('Orignial Image');
subplot(132);m=uint8(m);imshow(m);title("Magnitude Plot");
subplot(133);imshow(p);title('Phase PLot');
figure();
subplot(331);imshow(uint8(cat(3, me, zeros(hi), zeros(bi))));title('Orignial Image (RED)');
subplot(332);imshow(uint8(cat(3, mme, zeros(mhi), zeros(mbi))));title("Magnitude Plot (RED)");
subplot(333);imshow(cat(3, pme, zeros(phi), zeros(pbi)));title('Phase PLot (RED)');
subplot(334);imshow(uint8(cat(3, zeros(me), hi, zeros(bi))));title('Orignial Image (GREEN)');
subplot(335);imshow(uint8(cat(3, zeros(mme), mhi, zeros(mbi))));title("Magnitude Plot (GREEN)");
subplot(336);imshow(cat(3, zeros(pme), phi, zeros(pbi)));title('Phase PLot (GREEN)');
subplot(337);imshow(uint8(cat(3, zeros(me), zeros(hi), bi)));title('Orignial Image (BLUE)');
subplot(338);imshow(uint8(cat(3, zeros(mme), zeros(mhi), mbi)));title("Magnitude Plot (BLUE)");
subplot(339);imshow(cat(3, zeros(me), zeros(phi), pbi));title('Phase PLot (BLUE)');
figure();
subplot(131);imshow(uint8(cat(3,me,hi,bi)));title('Orignial Image');
subplot(132);imgmag=uint8(cat(3,mme,mhi,mbi));imshow(imgmag);title("Magnitude Plot");
subplot(133);imshow(cat(3,pme,phi,pbi));title('Phase Plot');
