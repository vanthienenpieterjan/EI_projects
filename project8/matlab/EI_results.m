%% FILE LOADING
load('workspace');

%% CONTRAST EXTRACTION
% fill in constrast formulas

% attenuation contrast = -log(area under gaussian of projection / area under Gaussian of flatfields)
attenuation_contrast=-log((a2.*sqrt(c2.^2))./(a1.*sqrt(c1.^2)));

% phase contrast = refraction angle = (M/zod)*shift of the gaussian (approximately)
phase_contrast=(M/zod)*(b2-b1);

% dark field contrast = broadening of the Gaussian = difference in variances
dark_field_contrast = c2.^2-c1.^2;


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