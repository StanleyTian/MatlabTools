lbps = images_to_lbps('dataset/testimages/',13);
libsvm_data = lbps_to_libsvm_data(lbps,'+1');

libsvm_data_to_file(libsvm_data,'dataset/data_scale.txt');
