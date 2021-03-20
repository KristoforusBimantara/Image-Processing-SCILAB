a=imread('bima.jpg');
a=double(a);
[r,c,m]=size(a);
com=[128 64 32 16 8 4 2 1];
for k=1:1:length(com);
    for i=1:r
        for j=1:c
            for z=1:m
                new(i,j,z)=bitand(a(i,j,z), com(k));
            end
        end
    end
    figure(); 
    subplot(221); imshow(new); xtitle('Foto Asli');
    subplot(222); imshow(new(:,:,1)); xtitle('Lapisan Merah');
    subplot(223); imshow(new(:,:,2)); xtitle('Lapisan Hijau');
    subplot(224); imshow(new(:,:,3)); xtitle('Lapisan Biru');
end
