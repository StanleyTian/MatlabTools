% 2016-12-09
% author: Stanley
% Description: This function is use to convert all cifar-images
% (mat version) to jpg files.
% param:
% cifar_data_full_path: full path to cifar data, include file name
% like ...../cifar-10-batches-mat/data_batch_1.mat'
% ouput_path: where to dump all files



function [] = cifar_to_jpg( cifar_data_full_path,output_path)
%CIFAR_TO_JPG Summary of this function goes here
%   Detailed explanation goes here
full_data = load(cifar_data_full_path);
data = full_data.data;

for i=1:1:size(data,1)
    tmp_data = data(i,:);%get the ith row data
    tmp_image = array_to_color_image(tmp_data);
    %figure, imshow(tmp_image);
    imwrite(tmp_image,strcat(output_path,int2str(i),'.jpg'));
end

end

