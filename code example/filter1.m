
%巴特沃斯高通滤波
fs = 4e3;
Wp=80/(fs/2);
Ws=40/(fs/2);
[n,Wn]=buttord(Wp,Ws,3,20);  

% load('pma2.mat')
data=data2;
  [a,b]=butter(n,Wn,'high');
  [shots,~] = size(data); 
  data_hilbert = [];
 %Hilbert变换 
for i=1:shots
  if (rem(i,10)==0)
    i
  end

  data(i,:)=filter(a,b,data(i,:));
  
    %  Decimate the data and store it in data
  data_hilbert=[data_hilbert;hilbert(data(i,:))];  
end
save vivo_6_6M_filter.mat data_hilbert 
