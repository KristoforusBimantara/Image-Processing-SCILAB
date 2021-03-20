a=imread('bima.jpg');
[r,c]=size(a);
me=a(:,:,1);
hi=a(:,:,2);
bi=a(:,:,3);
h=zeros(1,256);
hme=zeros(1,256);
hhi=zeros(1,256);
hbi=zeros(1,256);
for i=1:r
    for j=1:c
        if (me(i,j)==0)
            me(i,j)=1;
        elseif(hi(i,j)==0)
            hi(i,j)=1;
        elseif(bi(i,j)==0)
            bi(i,j)=1;
        end
        hme(me(i,j))=hme(me(i,j))+1;
        hhi(hi(i,j))=hhi(hi(i,j))+1;
        hbi(bi(i,j))=hbi(bi(i,j))+1;
        //
        h(me(i,j))=h(me(i,j))+1;
        h(hi(i,j))=h(hi(i,j))+1;
        h(bi(i,j))=h(bi(i,j))+1;
    end
end
figure();
subplot(121); imshow(me); xtitle('Lapisan Merah');
subplot(122); plot2d(hme,style=[color('red')]); xtitle('Histogram Lapisan Merah');
figure();
subplot(121); imshow(hi); xtitle('Lapisan Hijau');
subplot(122); plot2d(hhi,style=[color('green')]); xtitle('Histogram Lapisan Hijau');
figure();
subplot(121); imshow(bi); xtitle('Lapisan Biru');
subplot(122); plot2d(hbi,style=[color('blue')]); xtitle('Histogram Lapisan Biru');
figure();
subplot(121); imshow(a); xtitle('Foto Asli');
subplot(122); plot2d(h,style=[color('gray0')]); xtitle('Histogram Foto Asli');
