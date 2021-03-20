clear;
clc;
a=imread('bima.jpg');
a=double(a);
r1=min(min(a));
r2=max(max(a));
alpa=0.5;
betta=0.5;
gama=3;
s1=alpa*r1;
s2=s1+(gama*(r2-r1));
[r,c,k]=size(a);
for i=1:r
    for j=1:c
        for z=1:k
            if (a(i,j,z)<r1)
                new(i,j,z)=alpa*a(i,j,z);
            elseif (a(i,j,z)>=r1&a(i,j,z)<r2)
                new(i,j,z)=(betta*(a(i,j,z)-r1))+s1;
            else
                new(i,j,z)=(gama*(a(i,j,z)-r2))+s2;
            end
        end
    end
end
new=uint8(new);
figure();
subplot(221); imshow(new); xtitle('Foto Asli');
subplot(222); imshow(new(:,:,1)); xtitle('Lapisan Merah');
subplot(223); imshow(new(:,:,2)); xtitle('Lapisan Hijau');
subplot(224); imshow(new(:,:,3)); xtitle('Lapisan Biru');
