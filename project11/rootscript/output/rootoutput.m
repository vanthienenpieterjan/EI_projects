%% IMPORT

% energy1
fileID = fopen(['energy1.dat']);
energy1 = fread(fileID,'float');
fclose(fileID);

% globalPosX1
fileID = fopen(['globalPosX1.dat']);
globalPosX1 = fread(fileID,'float');
fclose(fileID);

% globalPosY1
fileID = fopen(['globalPosY1.dat']);
globalPosY1 = fread(fileID,'float');
fclose(fileID);

% globalPosZ1
fileID = fopen(['globalPosZ1.dat']);
globalPosZ1 = fread(fileID,'float');
fclose(fileID);

% numberOfEntries
fileID = fopen(['numberOfEntries.dat']);
numberOfEntries = fread(fileID,'float');
fclose(fileID);

% perfectCrystalPosX1
fileID = fopen(['perfectCrystalPosX1.dat']);
perfectCrystalPosX1 = fread(fileID,'float');
fclose(fileID);

% perfectCrystalPosY1
fileID = fopen(['perfectCrystalPosY1.dat']);
perfectCrystalPosY1 = fread(fileID,'float');
fclose(fileID);

% perfectCrystalPosZ1
fileID = fopen(['perfectCrystalPosZ1.dat']);
perfectCrystalPosZ1 = fread(fileID,'float');
fclose(fileID);

% virtualVolumeInPosX1
fileID = fopen(['virtualVolumeInPosX1.dat']);
virtualVolumeInPosX1 = fread(fileID,'float');
fclose(fileID);

% virtualVolumeInPosY1
fileID = fopen(['virtualVolumeInPosY1.dat']);
virtualVolumeInPosY1 = fread(fileID,'float');
fclose(fileID);

% virtualVolumeInPosZ1
fileID = fopen(['virtualVolumeInPosZ1.dat']);
virtualVolumeInPosZ1 = fread(fileID,'float');
fclose(fileID);

% virtualVolumeOutPosX1
fileID = fopen(['virtualVolumeOutPosX1.dat']);
virtualVolumeOutPosX1 = fread(fileID,'float');
fclose(fileID);

% virtualVolumeOutPosY1
fileID = fopen(['virtualVolumeOutPosY1.dat']);
virtualVolumeOutPosY1 = fread(fileID,'float');
fclose(fileID);

% virtualVolumeOutPosZ1
fileID = fopen(['virtualVolumeOutPosZ1.dat']);
virtualVolumeOutPosZ1 = fread(fileID,'float');
fclose(fileID);

