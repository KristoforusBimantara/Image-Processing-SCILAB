a=imread('bima.jpg');
c=1;
[r,c,k]=size(a);
for i=1:r
    for j=1:c
        for z=1:k
            b=double(a(i,j,z));
            s(i,j,z)=c*log10(1+b);
        end
    end
end
new=s;
new1=uint8(new*100);
figure(); 
subplot(221); imshow(new1); xtitle('Foto Asli');
subplot(222); imshow(new1(:,:,1)); xtitle('Lapisan Merah');
subplot(223); imshow(new1(:,:,2)); xtitle('Lapisan Hijau');
subplot(224); imshow(new1(:,:,3)); xtitle('Lapisan Biru');
