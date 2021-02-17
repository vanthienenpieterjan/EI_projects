%% EDGE ILLUMINATION
% picture reconstruction script

close all
fig_bool=1;

%% DATA READING FLATFIELD
% open gate simulation files of flatfields

%file1

fileID1=fopen('../output/flatfield_000.dat');       
data1=fread(fileID1,'float');
fclose(fileID1);
data1=reshape(data1,[300 300]); %reshape the data to the image dimensions (row pixels, column pixels)
data1=imrotate(data1,-90);      %rotate image -90° (specific to Matlab)


%file2

fileID2=fopen('../output/flatfield_001.dat');       
data2=fread(fileID2,'float');
fclose(fileID2);
data2=reshape(data2,[300 300]); %reshape the data to the image dimensions (row pixels, column pixels)
data2=imrotate(data2,-90);      %rotate image -90° (specific to Matlab)

%file3

fileID3=fopen('../output/flatfield_002.dat');       
data3=fread(fileID3,'float');
fclose(fileID3);
data3=reshape(data3,[300 300]); %reshape the data to the image dimensions (row pixels, column pixels)
data3=imrotate(data3,-90);      %rotate image -90° (specific to Matlab)


%file4

fileID4=fopen('../output/flatfield_003.dat');       
data4=fread(fileID4,'float');
fclose(fileID4);
data4=reshape(data4,[300 300]); %reshape the data to the image dimensions (row pixels, column pixels)
data4=imrotate(data4,-90);      %rotate image -90° (specific to Matlab)


%file5

fileID5=fopen('../output/flatfield_004.dat');       
data5=fread(fileID5,'float');
fclose(fileID5);
data5=reshape(data5,[300 300]); %reshape the data to the image dimensions (row pixels, column pixels)
data5=imrotate(data5,-90);      %rotate image -90° (specific to Matlab)

%% DATA READING PHANTOM
% open gate simulation files of phantom

%file1

fileID11=fopen('../output/phantom_000.dat');       
data11=fread(fileID11,'float');
fclose(fileID11);
data11=reshape(data11,[300 300]); %reshape the data to the image dimensions (row pixels, column pixels)
data11=imrotate(data11,-90);      %rotate image -90° (specific to Matlab)

%file2

fileID12=fopen('../output/phantom_001.dat');       
data12=fread(fileID12,'float');
fclose(fileID12);
data12=reshape(data12,[300 300]); %reshape the data to the image dimensions (row pixels, column pixels)
data12=imrotate(data12,-90);      %rotate image -90° (specific to Matlab)

%file3

fileID13=fopen('../output/phantom_002.dat');       
data13=fread(fileID13,'float');
fclose(fileID13);
data13=reshape(data13,[300 300]); %reshape the data to the image dimensions (row pixels, column pixels)
data13=imrotate(data13,-90);      %rotate image -90° (specific to Matlab)

%file4

fileID14=fopen('../output/phantom_003.dat');       
data14=fread(fileID14,'float');
fclose(fileID14);
data14=reshape(data14,[300 300]); %reshape the data to the image dimensions (row pixels, column pixels)
data14=imrotate(data14,-90);      %rotate image -90° (specific to Matlab)

%file5

fileID15=fopen('../output/phantom_004.dat');       
data15=fread(fileID15,'float');
fclose(fileID15);
data15=reshape(data15,[300 300]); %reshape the data to the image dimensions (row pixels, column pixels)
data15=imrotate(data15,-90);      %rotate image -90° (specific to Matlab)

%% FILTERING
% optinal
for i=2:1:299
    data1(i,:)=(data1(i-1,:)+data1(i,:)+data1(i+1,:))/3;
    data2(i,:)=(data2(i-1,:)+data2(i,:)+data2(i+1,:))/3;
    data3(i,:)=(data3(i-1,:)+data3(i,:)+data3(i+1,:))/3;
    data4(i,:)=(data4(i-1,:)+data4(i,:)+data4(i+1,:))/3;
    data5(i,:)=(data5(i-1,:)+data5(i,:)+data5(i+1,:))/3;
    data11(i,:)=(data11(i-1,:)+data11(i,:)+data11(i+1,:))/3;
    data12(i,:)=(data12(i-1,:)+data12(i,:)+data12(i+1,:))/3;
    data13(i,:)=(data13(i-1,:)+data13(i,:)+data13(i+1,:))/3;
    data14(i,:)=(data14(i-1,:)+data14(i,:)+data14(i+1,:))/3;
    data15(i,:)=(data15(i-1,:)+data15(i,:)+data15(i+1,:))/3;
end


%% FLAT FIELD FIGURES
% Show flatfield figures and save them as PNG
if fig_bool==1

    figure;
    imshow(data1,[]);
    title('missallignment -16 µm');
    colorbar;
    exportgraphics(gcf,'../results/ff1.png','Resolution',300);

    figure;
    imshow(data2,[]);
    title('missallignment -8 µm');
    colorbar;
    exportgraphics(gcf,'../results/ff2.png','Resolution',300);

    figure;
    imshow(data3,[]);
    title('missallignment 0 µm');
    colorbar;
    exportgraphics(gcf,'../results/ff3.png','Resolution',300);

    figure;
    imshow(data4,[]);
    title('missallignment 8 µm');
    colorbar;
    exportgraphics(gcf,'../results/ff4.png','Resolution',300);

    figure;
    imshow(data5,[]);
    title('missallignment 16 µm');
    colorbar;
    exportgraphics(gcf,'../results/ff5.png','Resolution',300);
end

%% PHANTOM FIGURES
% Show phantom figures and save them as PNG
if fig_bool==1
    figure;
    imshow(data11,[]);
    title('missallignment -16 µm');
    colorbar;
    exportgraphics(gcf,'../results/ph1.png','Resolution',300);

    figure;
    imshow(data12,[]);
    title('missallignment -8 µm');
    colorbar;
    exportgraphics(gcf,'../results/ph2.png','Resolution',300);

    figure;
    imshow(data13,[]);
    title('missallignment 0 µm');
    colorbar;
    exportgraphics(gcf,'../results/ph3.png','Resolution',300);

    figure;
    imshow(data14,[]);
    title('missallignment 8 µm');
    colorbar;
    exportgraphics(gcf,'../results/ph4.png','Resolution',300);

    figure;
    imshow(data15,[]);
    title('missallignment 16 µm');
    colorbar;
    exportgraphics(gcf,'../results/ph5.png','Resolution',300);
end

%% ILLUMINATION CURVE
% fit data into illumination curve
y_fit = [-16 -8 0 8 16];
a1=zeros(300,300);
b1=zeros(300,300);
c1=zeros(300,300);
a2=zeros(300,300);
b2=zeros(300,300);
c2=zeros(300,300);

zod = 390000;                    % distance between the object and the detector in µm
M = 1.25;                        % magnification factor of the experiment


for i=1:1:300
    for j=1:1:300
    test_IC_1(i+300*(j-1),:) = [data1(i,j) data2(i,j) data3(i,j) data4(i,j) data5(i,j)];
    test_IC_2(i+300*(j-1),:) = [data11(i,j) data12(i,j) data13(i,j) data14(i,j) data15(i,j)];
    end
end

fprintf('fitting has begun \n')

tic
for i=1:1:300
    fprintf('row %.4f complete \n',i)
    for j=1:1:300
        try
            g_fit_1 = fit(y_fit.',test_IC_1(i+300*(j-1),:).','gauss1');
            a1(i,j)=g_fit_1(1);
            b1(i,j)=g_fit_1(2);
            c1(i,j)=g_fit_1(3);
            g_fit_2 = fit(y_fit.',test_IC_2(i+300*(j-1),:).','gauss1');
            a2(i,j)=g_fit_2(1);
            b2(i,j)=g_fit_2(2);
            c2(i,j)=g_fit_2(3);
        catch
            a1(i,j)= a1(i-1,j);
            b1(i,j)= b1(i-1,j);
            c1(i,j)= c1(i-1,j);
            a2(i,j)= a2(i-1,j);
            b2(i,j)= b2(i-1,j);
            c2(i,j)= c2(i-1,j);
        end
    end
end


toc
fprintf('fitting has ended \n')

%% CONTRAST EXTRACTION
% fill in constrast formulas

% attenuation contrast = -log(area under gaussian of projection / area under Gaussian of flatfields)
attenuation_contrast=-log((a2.*sqrt(c2.^2))./(a1.*sqrt(c1.^2)));

% phase contrast = refraction angle = (M/zod)*shift of the gaussian (approximately)
phase_contrast=(M/zod)*(b2-b1);

% dark field contrast = broadening of the Gaussian = difference in variances
dark_field_contrast = c2.^2-c1.^2;

%% CONTRAST FIGURES
if fig_bool==1
    figure;
    imshow(attenuation_contrast,[]);
    title('attenuation contrast');
    colorbar;
    exportgraphics(gcf,'../results/attenuation_contrast.png','Resolution',300);

    figure;
    imshow(phase_contrast,[]);
    title('phase contrast');
    colorbar;
    exportgraphics(gcf,'../results/phase_contrast.png','Resolution',300);

    figure;
    imshow(dark_field_contrast,[]);
    title('dark field contrast');
    colorbar;
    exportgraphics(gcf,'../results/dark_field_contrast.png','Resolution',300);
end

figure;
subplot(1,3,1);
imshow(attenuation_contrast,[]);
title('attenuation');
colorbar;

subplot(1,3,2);
imshow(phase_contrast,[]);
title('phase');
colorbar;

subplot(1,3,3);
imshow(dark_field_contrast,[]);
title('dark field');
colorbar;
exportgraphics(gcf,'../results/trip_contrast.png','Resolution',800);



