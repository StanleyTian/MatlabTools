function [] = libsvm_data_to_file( libsvm_data ,output_file)
%LIBSVM_DATA_TO_FILE Summary of this function goes here
%   Detailed explanation goes here

fid = fopen(output_file,'wt'); 

for i = 1:size(libsvm_data,1)
    tmp_cell = libsvm_data(i,:);% fetch cell
    str = tmp_cell{1};% get the cell's content
    fprintf(fid,'%s\n',str);  
end

fclose(fid);
end

