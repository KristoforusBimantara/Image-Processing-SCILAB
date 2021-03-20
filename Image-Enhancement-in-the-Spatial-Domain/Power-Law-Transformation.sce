a=imread('bima.jpg');
r=size(a,1);
c=size(a,2);
k=size(a,3);
G=0.6; //1.2
for i=1:r
    for j=1:c
        for z=1:k
            b=double(a(i,j,z));
            x(i,j,z)=b.^G;
        end
    end
end
new=x;
new1=uint8(new);
figure(); 
subplot(221); imshow(new1); xtitle('Foto Asli');
subplot(222); imshow(new1(:,:,1)); xtitle('Lapisan Merah');
subplot(223); imshow(new1(:,:,2)); xtitle('Lapisan Hijau');
subplot(224); imshow(new1(:,:,3)); xtitle('Lapisan Biru');

