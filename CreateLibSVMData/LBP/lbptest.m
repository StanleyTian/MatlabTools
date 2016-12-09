% %%%%%%%%%%%%%%%%%%%LBP±ä»»ºóµÄÍ¼Ïñ%%%%%%%%%%%%%%%%%%
I1 = imread('ÁÑÎÆ.bmp');
I11 = I1(:,:,1);
% SP=[-1 -1; -1 0; -1 1; 0 -1; -0 1; 1 -1; 1 0; 1 1];
% I12=lbp(I11,SP,0,'i');
% imshow(I12);
% 
I2 = imread('»®ÉË.bmp');
I21 = I2(:,:,1);
% SP=[-1 -1; -1 0; -1 1; 0 -1; -0 1; 1 -1; 1 0; 1 1];
% I22=lbp(I21,SP,0,'i');
% 
% re1 = abs(I22-I12);
% % re1 = 255 - re1;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I3 = imread('Ñ¹ºÛ.bmp');
I31 = I3(:,:,1);
% SP=[-1 -1; -1 0; -1 1; 0 -1; -0 1; 1 -1; 1 0; 1 1];
% I32=lbp(I31,SP,0,'i');
% 
I4 = imread('°¼¿Ó.bmp');
I41 = I4(:,:,1);
% SP=[-1 -1; -1 0; -1 1; 0 -1; -0 1; 1 -1; 1 0; 1 1];
% I42=lbp(I41,SP,0,'i');
% 
% re2 = abs(I32-I42);
% % re2 = 255 - re2;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% re3 = abs(I32 - I12);
% % re3 = 255 - abs(I32 - I12);
% re4 = abs(I32 - I22);
% re5 = abs(I42 - I12);
% re6 = abs(I42 - I22);

%%%%%%%%%%%%%%%%%%%%%%Ö±·½Í¼%%%%%%%%%%%%%%%%%%%%%%%%
mapping=getmapping(8,'u2');
H11=lbp(I11,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% subplot(2,2,1),stem(H11);
% H12=lbp(I11);
subplot(2,2,1),stem(H11);

H21=lbp(I21,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% subplot(2,2,3),stem(H21);
% H22=lbp(I21);
subplot(2,2,2),stem(H21);

H31=lbp(I31,1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood using uniform patterns
% subplot(2,2,3),stem(H31);
% H32=lbp(I31);
subplot(2,2,3),stem(H31);

H41=lbp(I41,1,8,mapping,'h');
% H42=lbp(I41);
subplot(2,2,4),stem(H41);

% %%%%%%%%%%%%%%%%%%%%%%%ÎÞÁÄÏ¹Ð´%%%%%%%%%%%%%%%%%%%%%%%%
% [row, col] = size(I11);
% It1 = ones(row, col);
% for i = 2 : col
%     It1(:, i - 1) = abs(I11(:, i) - I11(:, i - 1));
% end
% 
% It2 = ones(row, col);
% for i = 2 : row
%     It2(i-1,:) = abs(I11(i,:) - I11(i-1,:));
% end






