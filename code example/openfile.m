% ����Ӧ�������ļ� 
fileName = '15-06-13.drf';
fid = fopen(fileName);
% data = fread(fid,'int32');

%��ȡǰ19λ������Ϣ����2ΪΪ֡����15λΪ��������Ƶ�ʣ���16λΪ����Ƶ�ʣ���17λΪ������
data = zeros(19,1);
for i = 1: 19
data(i) = fread(fid,1,'int32');
end

% data = fread(fid,'int32');
frame = data(2);
data2 = zeros(50,frame);%�˴�50Ϊ����ʵ���еĿ��������ɸ�����Ŀ�޸ģ�������=���ļ�������λ��/֡��
% data2 = fread(fid,[13,2292],'int32');
count = 0;
for i = 1:frame
    fread(fid,1,'int32');
    data2(:,i) = fread(fid,50,'bit16');
end

save vivo_6_6M.mat data2;%����

% while(~feof(fid))
%     count = count + 1;
% data2 = fread(fid,1,'int32');
% data3 = fread(fid,1,'bit16');
% end
% frameIndex = 1;
% [data, properties] = readSavedFile(fileName, frameIndex);