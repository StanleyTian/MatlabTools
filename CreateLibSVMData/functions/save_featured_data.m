% this function is used to convert cifar-10 data to elm compatible data


function [ features_with_labels ] = save_featured_data( full_data )

data = full_data.data;
labels = full_data.labels;

[n,m] = size(data);
features = zeros(n,m/3); % create a new mat same size of data
for i=1:1:10000
    tmp_image = array_to_color_image(data(i,:));
    tmp_image_gray = rgb2gray(tmp_image);
    tmp_image_vector = double(tmp_image_gray(:)')/255.0; % turn to one row vector and convert to 0~1 double
    %extract feature here
    features(i,:) = tmp_image_vector;
    %figure,imshow(tmp_image);
end

features_with_labels = [double(labels) features];

end


