%?????????????????????????????????

function [ all_lbps ] = images_to_lbps( images_path,total_images_count )
all_files = find_files_in_dir(images_path);
total_images_count = size(all_files,1);
%IMAGES_TO_LBPS Summary of this function goes here
all_lbps = zeros(total_images_count,59,'double');
mapping=getmapping(8,'u2');% uniform pattern

for i = 1:size(all_lbps,1);
    %tmp_img = imread(strcat(images_path,int2str(i),'.jpg'));
%     tmp_file_name = all_files(i,1);
%     b = cell2mat(tmp_file_name);
%     a = tmp_file_name(1,1);
    tmp_img = imread(cell2mat(all_files(i,1)));
    %figure,imshow(tmp_img);
    % get lbp histogram of each image
    %   LBP histogram in (8,1) neighborhood
    %   using uniform patterns 
    %   'nh' means normalized histogram
    tmp_hist=lbp(tmp_img,1,8,mapping,'nh'); 
    all_lbps(i,:) = tmp_hist;
    %stem(tmp_hist1);
    disp([num2str(100*(i/total_images_count)),'% finished']);
end