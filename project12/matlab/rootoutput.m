%% IMPORT

% energy1
fileID = fopen(['../output/energy1.dat']);
energy1 = fread(fileID,'float');
fclose(fileID);

% globalPosX1
fileID = fopen(['../output/globalPosX1.dat']);
globalPosX1 = fread(fileID,'float');
fclose(fileID);

% globalPosY1
fileID = fopen(['../output/globalPosY1.dat']);
globalPosY1 = fread(fileID,'float');
fclose(fileID);

% globalPosZ1
fileID = fopen(['../output/globalPosZ1.dat']);
globalPosZ1 = fread(fileID,'float');
fclose(fileID);

% numberOfEntries
fileID = fopen(['../output/numberOfEntries.dat']);
numberOfEntries = fread(fileID,'float');
fclose(fileID);

% perfectCrystalPosX1
fileID = fopen(['../output/perfectCrystalPosX1.dat']);
perfectCrystalPosX1 = fread(fileID,'float');
fclose(fileID);

% perfectCrystalPosY1
fileID = fopen(['../output/perfectCrystalPosY1.dat']);
perfectCrystalPosY1 = fread(fileID,'float');
fclose(fileID);

% perfectCrystalPosZ1
fileID = fopen(['../output/perfectCrystalPosZ1.dat']);
perfectCrystalPosZ1 = fread(fileID,'float');
fclose(fileID);

% virtualVolumeInPosX1
fileID = fopen(['../output/virtualVolumeInPosX1.dat']);
virtualVolumeInPosX1 = fread(fileID,'float');
fclose(fileID);

% virtualVolumeInPosY1
fileID = fopen(['../output/virtualVolumeInPosY1.dat']);
virtualVolumeInPosY1 = fread(fileID,'float');
fclose(fileID);

% virtualVolumeInPosZ1
fileID = fopen(['../output/virtualVolumeInPosZ1.dat']);
virtualVolumeInPosZ1 = fread(fileID,'float');
fclose(fileID);

% virtualVolumeOutPosX1
fileID = fopen(['../output/virtualVolumeOutPosX1.dat']);
virtualVolumeOutPosX1 = fread(fileID,'float');
fclose(fileID);

% virtualVolumeOutPosY1
fileID = fopen(['../output/virtualVolumeOutPosY1.dat']);
virtualVolumeOutPosY1 = fread(fileID,'float');
fclose(fileID);

% virtualVolumeOutPosZ1
fileID = fopen(['../output/virtualVolumeOutPosZ1.dat']);
virtualVolumeOutPosZ1 = fread(fileID,'float');
fclose(fileID);

% energy1ff
fileID = fopen(['../output/ffenergy1.dat']);
energy1ff = fread(fileID,'float');
fclose(fileID);

% globalPosX1ff
fileID = fopen(['../output/ffglobalPosX1.dat']);
globalPosX1ff = fread(fileID,'float');
fclose(fileID);

% globalPosY1ff
fileID = fopen(['../output/ffglobalPosY1.dat']);
globalPosY1ff = fread(fileID,'float');
fclose(fileID);

% globalPosZ1ff
fileID = fopen(['../output/ffglobalPosZ1.dat']);
globalPosZ1ff = fread(fileID,'float');
fclose(fileID);

% numberOfEntriesff
fileID = fopen(['../output/ffnumberOfEntries.dat']);
numberOfEntriesff = fread(fileID,'float');
fclose(fileID);

% perfectCrystalPosX1ff
fileID = fopen(['../output/ffperfectCrystalPosX1.dat']);
perfectCrystalPosX1ff = fread(fileID,'float');
fclose(fileID);

% perfectCrystalPosY1ff
fileID = fopen(['../output/ffperfectCrystalPosY1.dat']);
perfectCrystalPosY1ff = fread(fileID,'float');
fclose(fileID);

% perfectCrystalPosZ1ff
fileID = fopen(['../output/ffperfectCrystalPosZ1.dat']);
perfectCrystalPosZ1ff = fread(fileID,'float');
fclose(fileID);

% virtualVolumeInPosX1ff
fileID = fopen(['../output/ffvirtualVolumeInPosX1.dat']);
virtualVolumeInPosX1ff = fread(fileID,'float');
fclose(fileID);

% virtualVolumeInPosY1ff
fileID = fopen(['../output/ffvirtualVolumeInPosY1.dat']);
virtualVolumeInPosY1ff = fread(fileID,'float');
fclose(fileID);

% virtualVolumeInPosZ1ff
fileID = fopen(['../output/ffvirtualVolumeInPosZ1.dat']);
virtualVolumeInPosZ1ff = fread(fileID,'float');
fclose(fileID);

% virtualVolumeOutPosX1ff
fileID = fopen(['../output/ffvirtualVolumeOutPosX1.dat']);
virtualVolumeOutPosX1ff = fread(fileID,'float');
fclose(fileID);

% virtualVolumeOutPosY1ff
fileID = fopen(['../output/ffvirtualVolumeOutPosY1.dat']);
virtualVolumeOutPosY1ff = fread(fileID,'float');
fclose(fileID);

% virtualVolumeOutPosZ1ff
fileID = fopen(['../output/ffvirtualVolumeOutPosZ1.dat']);
virtualVolumeOutPosZ1ff = fread(fileID,'float');
fclose(fileID);

filename = 'workspace.mat';
save(filename);
