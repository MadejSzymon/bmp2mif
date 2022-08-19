function img256 = rgb256(img_name)
    img = imread(img_name);
    load rgb_256.mat r_rgb b_rgb g_rgb;
    img_size = size(img);
    img_r = double(img(:,:,1));
    img_g = double(img(:,:,2));
    img_b = double(img(:,:,3));
    
    r_rgb = double(r_rgb);
    g_rgb = double(g_rgb);
    b_rgb = double(b_rgb);
    
    distances = zeros(256,1);
    img256 = zeros(img_size(1),img_size(2));
    
    for i = 1:img_size(1)
        for j = 1:img_size(2)
            for k = 1:256
               distances(k) = sqrt(abs(r_rgb(k)-img_r(i,j))^2+abs(g_rgb(k)-img_g(i,j))^2+abs(b_rgb(k)-img_b(i,j))^2);
               [~,min_indx] = min(distances);
               img256(i,j) = min_indx-1;
            end
        end
    end
    img256 = uint8(img256);
end