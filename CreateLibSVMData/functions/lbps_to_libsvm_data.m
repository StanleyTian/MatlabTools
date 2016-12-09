function [ libsvm_data ] = lbps_to_libsvm_data( lbps_data,class )
% convert lbps(created by images_to_lbps) features to libsvm compatible data
% class could be +1 or -1

%create an empty matrix to store all stringed lbps feature
libsvm_data = repmat({''},size(lbps_data,1),1);
for i = 1:size(lbps_data,1)
    tmp_str = '';
    tmp_str = [tmp_str,class];
    for j = 1:size(lbps_data,2);
        tmp_str = [tmp_str,' ',num2str(j),':',num2str(lbps_data(i,j))];
        %lbps_data(i,j);
    end
    libsvm_data(i,:) = cellstr(tmp_str);
end

end

