%�ýű�������ʾһ��ͼ���lbpֱ��ͼ
img=imread('D:\opencvimages\read\common test\lena_128.jpg');
scales=3;
MBLBPimg=MBLBP(img,scales);
imshow(MBLBPimg,[])
mapping = getmapping(8,'u2');
uni_MBLBPimg_hist = map_a_lbp_image(MBLBPimg,mapping,'h');
plot(uni_MBLBPimg_hist)