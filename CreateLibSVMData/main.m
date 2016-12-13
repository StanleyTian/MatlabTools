clear;
clc;
folder_path = '/Users/shidanlifuhetian/Desktop/TestField/sampleB/';
class = '-1';
output_file_full_path = '/Users/shidanlifuhetian/Desktop/TestField/Bdata_scale.txt';

lbps = images_to_lbps(folder_path);
libsvm_data = lbps_to_libsvm_data(lbps,class);
libsvm_data_to_file(libsvm_data,output_file_full_path);