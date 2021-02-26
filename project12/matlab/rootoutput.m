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

% energy1
fileID = fopen(['../output/energy1.dat']);
energy1 = fread(fileID,'float');
fclose(fileID);

% globalPosX1ff
fileID = fopen(['../output/globalPosX1ff.dat']);
globalPosX1ff = fread(fileID,'float');
fclose(fileID);

% globalPosY1ff
fileID = fopen(['../output/globalPosY1.dat']);
globalPosY1 = fread(fileID,'float');
fclose(fileID);

% globalPosZ1ff
fileID = fopen(['../output/globalPosZ1ff.dat']);
globalPosZ1ff = fread(fileID,'float');
fclose(fileID);

% numberOfEntriesff
fileID = fopen(['../output/numberOfEntriesff.dat']);
numberOfEntriesff = fread(fileID,'float');
fclose(fileID);

% perfectCrystalPosX1ff
fileID = fopen(['../output/perfectCrystalPosX1ff.dat']);
perfectCrystalPosX1ff = fread(fileID,'float');
fclose(fileID);

% perfectCrystalPosY1ff
fileID = fopen(['../output/perfectCrystalPosY1ff.dat']);
perfectCrystalPosY1ff = fread(fileID,'float');
fclose(fileID);

% perfectCrystalPosZ1ff
fileID = fopen(['../output/perfectCrystalPosZ1ff.dat']);
perfectCrystalPosZ1ff = fread(fileID,'float');
fclose(fileID);

% virtualVolumeInPosX1ff
fileID = fopen(['../output/virtualVolumeInPosX1ff.dat']);
virtualVolumeInPosX1 = fread(fileID,'float');
fclose(fileID);

% virtualVolumeInPosY1ff
fileID = fopen(['../output/virtualVolumeInPosY1ff.dat']);
virtualVolumeInPosY1ff = fread(fileID,'float');
fclose(fileID);

% virtualVolumeInPosZ1ff
fileID = fopen(['../output/virtualVolumeInPosZ1ff.dat']);
virtualVolumeInPosZ1ff = fread(fileID,'float');
fclose(fileID);

% virtualVolumeOutPosX1ff
fileID = fopen(['../output/virtualVolumeOutPosX1ff.dat']);
virtualVolumeOutPosX1ff = fread(fileID,'float');
fclose(fileID);

% virtualVolumeOutPosY1ff
fileID = fopen(['../output/virtualVolumeOutPosY1ff.dat']);
virtualVolumeOutPosY1ff = fread(fileID,'float');
fclose(fileID);

% virtualVolumeOutPosZ1ff
fileID = fopen(['../output/virtualVolumeOutPosZ1ff.dat']);
virtualVolumeOutPosZ1ff = fread(fileID,'float');
fclose(fileID);

filename = 'workspace.mat';
save(filename);
