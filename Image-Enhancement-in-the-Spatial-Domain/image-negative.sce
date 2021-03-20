a=uigetfile('*.*','Select the Image:-');
a=imread(a);
new=255 – a;
new=uint8(new);
figure(); 
subplot(221); imshow(new); xtitle('Foto Asli');
subplot(222); imshow(new(:,:,1)); xtitle('Lapisan Merah');
subplot(223); imshow(new(:,:,2)); xtitle('Lapisan Hijau');
subplot(224); imshow(new(:,:,3)); xtitle('Lapisan Biru');
