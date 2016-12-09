% 2016-10-29
% author: Stanley
% Description: This function is use to convert an cifar image array to an 
% real image in matlab with 3 channels
% The cifar data is in one row which length is 3072
% The first 1024 units stands for red, the following for green,blue...
% The output image is 32*32*3 size

function color_image = array_to_color_image( array )
    C = uint8(zeros(32,32,3));%image size of 32*32*3
    
    redArray = array(1,1:1024);
    greenArray = array(1,1025:2048);
    blueArray = array(1,2049:3072);

    redMatrix = vec2mat(redArray,32);
    greenMatrix = vec2mat(greenArray,32);
    blueMatrix = vec2mat(blueArray,32);

    C(:,:,1) = redMatrix; %red color matrix 32*32
    C(:,:,2) = greenMatrix; %green color matrix 32*32
    C(:,:,3) = blueMatrix; %blue color matrix 32*32

    color_image = C;

end

