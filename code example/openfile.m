% 读相应二进制文件 
fileName = '15-06-13.drf';
fid = fopen(fileName);
% data = fread(fid,'int32');

%读取前19位有用信息，第2为为帧数，15位为发射中心频率，第16位为采样频率，第17位为脉冲间隔
data = zeros(19,1);
for i = 1: 19
data(i) = fread(fid,1,'int32');
end

% data = fread(fid,'int32');
frame = data(2);
data2 = zeros(50,frame);%此处50为本次实测中的快拍数，可根据项目修改，快拍数=总文件二进制位数/帧数
% data2 = fread(fid,[13,2292],'int32');
count = 0;
for i = 1:frame
    fread(fid,1,'int32');
    data2(:,i) = fread(fid,50,'bit16');
end

save vivo_6_6M.mat data2;%保存

% while(~feof(fid))
%     count = count + 1;
% data2 = fread(fid,1,'int32');
% data3 = fread(fid,1,'bit16');
% end
% frameIndex = 1;
% [data, properties] = readSavedFile(fileName, frameIndex);