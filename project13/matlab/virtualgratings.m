close all
slit=0.0040;
period=0.0100;
det_z = 4.4715;
%load('workspace.mat')
j=1;
results=zeros(23102698,4);
tic
for i=2:2:23102698
    if (perfectCrystalPosX1(i) <= 3)...
        && (perfectCrystalPosX1(i) >= -3)...
        && (perfectCrystalPosY1(i) <= 3)...
        && (perfectCrystalPosY1(i) >= -3)
        results(j,1)= perfectCrystalPosX1(i);
        results(j,2)= perfectCrystalPosY1(i);
        results(j,3)= globalPosX1(i);
        results(j,4)= globalPosY1(i);
        j = j+1;
    end
end
results =results(1:j,:);
toc
figure; hist3(results(:,1:2),'CDataMode','auto')
figure; hist3(results(:,3:4),'CDataMode','auto')


%% FLATFIELD

close all
slit=0.0040;
period=0.0100;
det_z = 4.4751;
%load('workspace.mat')
j=1;
results=zeros(23102698,4);
tic
for i=1:1:25957186
    if (mod(virtualVolumeInPosX1ff(i)+0.0008,period) <=slit)...
        && (mod(virtualVolumeOutPosX1ff(i)+0.0008,period) <=slit)...
        && (perfectCrystalPosX1ff(i) <= 0.3)...
        && (perfectCrystalPosX1ff(i) >= -0.3)...
        && (perfectCrystalPosY1ff(i) <= 0.3)...
        && (perfectCrystalPosY1ff(i) >= -0.3)
        results(j,1)= perfectCrystalPosX1ff(i);
        results(j,2)= perfectCrystalPosY1ff(i);
        results(j,3)= globalPosX1ff(i);
        results(j,4)= globalPosY1ff(i);
        j = j+1;
    end
end
results =results(1:j,:);
toc
figure; hist3(results(:,1:2),'CDataMode','auto')
figure; hist3(results(:,3:4),'CDataMode','auto')
