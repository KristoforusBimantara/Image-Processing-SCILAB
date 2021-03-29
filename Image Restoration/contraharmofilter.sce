clc;clear;
a=imread('gtw.jpg');
Q=3;
c=im2double(a);
me=c(:,:,1);
hi=c(:,:,2);
bi=c(:,:,3);
dme=me;
dhi=hi;
dbi=bi;
bme=dme;
bhi=dhi;
bbi=dbi;
[r1,c1]=size(double(a));
for i=2:r1-1
    for j=2:c1-1
        a1me=double(dme(i-1,j-1))+double(dme(i-1,j))+double(dme(i-1,j+1))+mtlb_double(dme(i,j-1))+double(dme(i,j))+double(dme(i,j+1))+double(dme(i+1,j-1))+double(dme(i+1,j))+double(dme(i+1,j+1));
        a1hi=double(dhi(i-1,j-1))+double(dhi(i-1,j))+double(dhi(i-1,j+1))+mtlb_double(dhi(i,j-1))+double(dhi(i,j))+double(dhi(i,j+1))+double(dhi(i+1,j-1))+double(dhi(i+1,j))+double(dhi(i+1,j+1));
        a1bi=double(dbi(i-1,j-1))+double(dbi(i-1,j))+double(dbi(i-1,j+1))+mtlb_double(dbi(i,j-1))+double(dbi(i,j))+double(dbi(i,j+1))+double(dbi(i+1,j-1))+double(dbi(i+1,j))+double(dbi(i+1,j+1));
        a2me=a1me.^mtlb_a(mtlb_double(Q),1);
        a2hi=a1hi.^mtlb_a(mtlb_double(Q),1);
        a2bi=a1bi.^mtlb_a(mtlb_double(Q),1);
        a3me=a1me.^mtlb_double(Q);
        a3hi=a1hi.^mtlb_double(Q);
        a3bi=a1bi.^mtlb_double(Q);
        bme(i,j)=a2me./a3me;
        bhi(i,j)=a2hi./a3hi;
        bbi(i,j)=a2bi./a3bi;
    end
end
brgb=cat(3,bme,bhi,bbi);
b=brgb;
b=b*28;
b=uint8(b);
figure();
subplot(121);imshow(a); title('Original Image','fontsize',8);
subplot(122);imshow(b); title('Contra Harmonic Filtered Image','fontsize',8);
