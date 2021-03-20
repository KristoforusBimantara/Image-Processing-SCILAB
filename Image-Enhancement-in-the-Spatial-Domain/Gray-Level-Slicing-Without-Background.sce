a=imread('bima.jpg');
a1=58;
b1=158;
[r,c,k]=size(a);
for i=1:r
    for j=1:c
        for z=1:k
            m=a(i,j,z);
            if ((m>a1) & (m<b1))
                x(i,j,z)=255;
            else
                x(i,j,z)=0;
            end
        end
    end
end
x=uint8(x);
figure(); 
subplot(221); imshow(x); xtitle('Foto Asli');
subplot(222); imshow(x(:,:,1)); xtitle('Lapisan Merah');
subplot(223); imshow(x(:,:,2)); xtitle('Lapisan Hijau');
subplot(224); imshow(x(:,:,3)); xtitle('Lapisan Biru');
