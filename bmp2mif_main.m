function bmp2mif_main (img) 
mif_name = strcat(img(1:end-3));
img256 = rgb256(img);
img256 = img256';
img_vector = img256(:);
img_size = length(img_vector);
img_size_pow2 = 2^nextpow2(img_size);
mif_name = strcat(mif_name,'mif');

fid = fopen(mif_name,'W'); 
if (fid)     
    fprintf(fid,'WIDTH = 8;\n');
    fprintf(fid,'DEPTH = %d;\n',img_size_pow2);
    fprintf(fid,'ADDRESS_RADIX = HEX;\n');
    fprintf(fid,'DATA_RADIX = HEX;\n');
    fprintf(fid,'CONTENT BEGIN\n\n');
    for i=1:img_size_pow2
        if i<= img_size
          fprintf(fid ,'%s:%s;\n', dec2hex(i-1),dec2hex(img_vector(i))); % write data  
        else
            fprintf(fid ,'%s:%s;\n', dec2hex(i-1),dec2hex(img_vector(1)));
        end
    end 
    fprintf(fid,'END;\n');    
    fclose(fid);
end
fprintf('Size of the sprite: %d B\n',img_size_pow2)
