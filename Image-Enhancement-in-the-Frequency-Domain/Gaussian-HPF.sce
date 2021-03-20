clear;clc;clear;
a=imread('bima1.jpg');
a=double(a);
r=size(a,1);
c=size(a,2);
d0=10;
for u=1:1:r
    for v=1:1:c
        d=(((u-(r/2))^2)+((v-(c/2))^2))^0.5;
        dd=d*d;
        h(u,v)=1-exp(-dd/(2*d0*d0));
    end
end
//merah
me=a(:,:,1);
bme=fft2(me);
cme=fftshift(bme);
newme=cme.*h;
new1me=abs(fft(newme,1));
//hijau
hi=a(:,:,2);
bhi=fft2(hi);
chi=fftshift(bhi);
newhi=chi.*h;
new1hi=abs(fft(newhi,1));
//biru
bi=a(:,:,3);
bbi=fft2(bi);
cbi=fftshift(bbi);3
newbi=cbi.*h;
new1bi=abs(fft(newbi,1));

figure();
subplot(321);imshow(uint8(cat(3, me, zeros(hi), zeros(bi))));xtitle('Lapisan Merah');
subplot(322);imshow(uint8(cat(3, new1me, zeros(new1hi), zeros(new1bi))));xtitle(['Filtered Image with radius = 10']);
subplot(323);imshow(uint8(cat(3, zeros(me), hi, zeros(bi))));xtitle('Lapisan Hijau');
subplot(324);imshow(uint8(cat(3, zeros(new1me), new1hi, zeros(new1bi))));xtitle(['Filtered Image with radius = 10']);
subplot(325);imshow(uint8(cat(3, zeros(me), zeros(hi), bi)));xtitle('Lapisan Biru');
subplot(326);imshow(uint8(cat(3, zeros(new1me), zeros(new1hi), new1bi)));xtitle(['Filtered Image with radius = 10']);
figure();
subplot(121);imshow(uint8(cat(3,me,hi,bi)));xtitle('Gambar Asli')
subplot(122);imshow(uint8(cat(3,new1me,new1hi,new1bi)));xtitle(['Filtered Image with radius = 10']);
figure();
surf(h);xtitle('filter function response with radius = 10')
