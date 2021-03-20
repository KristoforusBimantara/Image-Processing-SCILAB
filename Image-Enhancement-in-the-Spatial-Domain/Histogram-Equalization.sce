a=imread('bima.jpg');
a=double(a);
big=max(max(a));
[r c]=size(a);
tot=r*c;
me=a(:,:,1);
hi=a(:,:,2);
bi=a(:,:,3);
h=zeros(1,256);
zz=zeros(1,256);
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
        h(me(i,j))=h(me(i,j))+1;
        h(hi(i,j))=h(hi(i,j))+1;
        h(bi(i,j))=h(bi(i,j))+1;
    end
end
//Menghitung histogram rata-rata dari ketiga histogram ini.
for i=1:256
    h(i)=double(h(i)/3);
end
pdf=h/tot;
cdf(1)=pdf(1);
for i=2:1:big
    cdf(i)=pdf(i)+cdf(i-1);
end
new=round(cdf*big);
new=new+1;
for i=1:1:r
    for j=1:1:c
        b1(i,j)=new(me(i,j));
        b2(i,j)=new(hi(i,j));
        b3(i,j)=new(bi(i,j));
        //Membuat Histogram R,G,B
        hme(b1(i,j))=hme(b1(i,j))+1;
        hhi(b2(i,j))=hhi(b2(i,j))+1;
        hbi(b3(i,j))=hbi(b3(i,j))+1;
        //Membuat Histogram
        zz(b1(i,j))=zz(b1(i,j))+1;
        zz(b2(i,j))=zz(b2(i,j))+1;
        zz(b3(i,j))=zz(b3(i,j))+1;
    end
end
//Menggabungkan citra R,G,B menjadi satu
imgout=cat(3,b1,b2,b3);
imgpros=uint8(imgout);
figure();
subplot(121); imshow(imgpros(:,:,1)); xtitle('Lapisan Merah');
subplot(122); plot2d(hme,style=[color('red')]); xtitle('Histogram Lapisan Merah');
figure();
subplot(121); imshow(imgpros(:,:,2)); xtitle('Lapisan Hijau');
subplot(122); plot2d(hhi,style=[color('green')]); xtitle('Histogram Lapisan Hijau');
figure();
subplot(121); imshow(imgpros(:,:,3)); xtitle('Lapisan Biru');
subplot(122); plot2d(hbi,style=[color('blue')]); xtitle('Histogram Lapisan Biru');
figure();
subplot(121); imshow(imgpros); xtitle('Foto Asli Setelah Proses');
subplot(122); plot2d(zz,style=[color('gray0')]); xtitle('Histogram Foto Asli Setelah Proses');

