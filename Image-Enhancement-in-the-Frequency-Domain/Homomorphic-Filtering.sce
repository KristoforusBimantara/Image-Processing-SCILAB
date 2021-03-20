clear;clc;clear;
a=imread('bima1.jpg');
me=a(:,:,1);
hi=a(:,:,2);
bi=a(:,:,3);
GMme=im2double(me);
GMhi=im2double(hi);
GMbi=im2double(bi);
t=640;
p=1/t:1/t:1;
for k=1:t
    l(k,:)=p(:);
end
//Merah
productme=GMme.*l;
log_GMme=log(GMme+1);
log_productme=log(productme+1);
fft_GMme=(fftshift(fft2(log_GMme)));
fft_productme=(fftshift(fft2(log_productme)));
diff_illme=(fft_productme-fft_GMme);
restoredme=(fft_productme-diff_illme);
restored_imme=fft(restoredme,1);
restored_imageme=(exp(restored_imme))-1;
abs_restored_imageme=abs(restored_imageme);
//Hijau
producthi=GMhi.*l;
log_GMhi=log(GMhi+1);
log_producthi=log(producthi+1);
fft_GMhi=(fftshift(fft2(log_GMhi)));
fft_producthi=(fftshift(fft2(log_producthi)));
diff_illhi=(fft_producthi-fft_GMhi);
restoredhi=(fft_producthi-diff_illhi);
restored_imhi=fft(restoredhi,1);
restored_imagehi=(exp(restored_imhi))-1;
abs_restored_imagehi=abs(restored_imagehi);
//Biru
productbi=GMbi.*l;
log_GMbi=log(GMbi+1);
log_productbi=log(productbi+1);
fft_GMbi=(fftshift(fft2(log_GMbi)));
fft_productbi=(fftshift(fft2(log_productbi)));
diff_illbi=(fft_productbi-fft_GMbi);
restoredbi=(fft_productbi-diff_illbi);
restored_imbi=fft(restoredbi,1);
restored_imagebi=(exp(restored_imbi))-1;
abs_restored_imagebi=abs(restored_imagebi);

figure();
subplot(331);imshow(cat(3,me,uint8(zeros(hi)),uint8(zeros(bi))));xtitle('Lapisan Merah');
subplot(332);imshow(cat(3,log_productme,zeros(log_producthi),zeros(log_productbi)));xtitle('Lapisan Merah (corrupt)');
subplot(333);imshow(cat(3,abs_restored_imageme,zeros(abs_restored_imagehi),zeros(abs_restored_imagebi)));xtitle('Lapisan Merah (Restored)');
subplot(334);imshow(cat(3,uint8(zeros(me)),hi,uint8(zeros(bi))));xtitle('Lapisan Hijau');
subplot(335);imshow(cat(3,zeros(log_productme),log_producthi,zeros(log_productbi)));xtitle('Lapisan Hijau (corrupt)');
subplot(336);imshow(cat(3,zeros(abs_restored_imageme),abs_restored_imagehi,zeros(abs_restored_imagebi)));xtitle('Lapisan Hijau (Restored)');
subplot(337);imshow(cat(3,uint8(zeros(me)),uint8(zeros(hi)),bi));xtitle('Lapisan Biru');
subplot(338);imshow(cat(3,zeros(log_productme),zeros(log_producthi),log_productbi));xtitle('Lapisan Biru (corrupt)');
subplot(339);imshow(cat(3,zeros(abs_restored_imageme),zeros(abs_restored_imagehi),abs_restored_imagebi));xtitle('Lapisan Biru (Restored)');
figure();
subplot(121);imshow(cat(3,me,hi,bi));xtitle('Gambar Asli');
subplot(122);imshow(cat(3,log_productme,log_producthi,log_productbi));xtitle('Gambar Asli (Corrupt)');
figure();
imshow(cat(3,abs_restored_imageme,abs_restored_imagehi,abs_restored_imagebi));xtitle('Gambar Asli (Restored)');
