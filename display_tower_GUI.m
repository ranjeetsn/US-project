function display_tower_GUI(axes_handle, tower)

image_map = ones(250,700,3)*0.5;


col1 = [tower.Peg1{:}];
col2 = [tower.Peg2{:}];
col3 = [tower.Peg3{:}];

%num_rings = sum(length(col1) + length(col2) + length(col3));

spacing = 175;
disc_width = 20;

disc_center = spacing;
disc_height = 20;

for column = 1:3
    disc_bottom = 225;
    image_map(100:disc_bottom,disc_center-1:disc_center+1,  :) = 0; 
    
    switch column
        case 1
            col = col1;
        case 2
            col = col2;
        case 3
            col = col3;
    end
    
    
    for k = 1:length(col)
        disk_size = col(k).Size;
        disk_color = col(k).Color;
        
        switch disk_color
            case 'r'
                red_val = 1;
                green_val = 0;
                blue_val = 0;
            case 'g'
                red_val = 0;
                green_val = 1;
                blue_val = 0;
            case 'b'
                red_val = 0;
                green_val = 0;
                blue_val = 1;
            case 'y'
                red_val = 1;
                green_val = 1;
                blue_val = 0;
            case 'w'
                red_val = 1;
                green_val = 1;
                blue_val = 1;
            case 'k'
                red_val = 0;
                green_val = 0;
                blue_val = 0;
            case 'm'
                red_val = 1;
                green_val = 0;
                blue_val = 1;
            case 'c'
                red_val = 0;
                green_val = 1;
                blue_val = 1;
            otherwise
                red_val = 1;
                green_val = 1;
                blue_val = 1;                
        end
        
        image_map(disc_bottom-disc_height:disc_bottom,  disc_center-disk_size/2*disc_width:disc_center+disk_size/2*disc_width, 1) = red_val;
        image_map(disc_bottom-disc_height:disc_bottom,  disc_center-disk_size/2*disc_width:disc_center+disk_size/2*disc_width, 2) = green_val;
        image_map(disc_bottom-disc_height:disc_bottom,  disc_center-disk_size/2*disc_width:disc_center+disk_size/2*disc_width, 3) = blue_val;
        disc_bottom = disc_bottom - disc_height;
        
    end
    
    
    disc_center = disc_center + spacing;
    
    
    
end

imshow( image_map, 'Parent', axes_handle)