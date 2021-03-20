a=imread('bima.jpg');
T=58;
[r,c,k]=size(a);
for i=1:r
    for j=1:c
        for z=1:k
            if (a(i,j,z)<=T)
                x(i,j,z)=0;
            else
                x(i,j,z)=255;
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
