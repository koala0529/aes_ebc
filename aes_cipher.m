clear all;
clc;
info='hello i am koala';%����
[x,y]=size(info);
for i=1:16
info(i)=uint8(info(i));
end
clear i;
clear x y;

for i=1:16
k(i)=uint8(i+64);%��Կ
end
disp('key=');
str=sprintf('%s',k);
disp(str);
%������֯����
for i=1:4
    for j=1:4
        m(j,i)=uint8(info((i-1)*4+j));
    end
end
str=sprintf('ming wen: %s',m);
disp(str);
disp(m);
str=sprintf('%02x ',m);
disp(str);
%��Կ��֯����
for i=1:4
    for j=1:4
        key(j,i)=k((i-1)*4+j);
    end
end
[keyexp1,rcon]=keyexp(key);
%��ʼ����
tic;
s=addk(m,key);

for i=1:10 
    s=sbox(s);
    s=byterot(s);
    if(i~=10)
        s=mixcol(s);
    end
    s=addk(s,keyexp1(:,i*4+1:i*4+4));
end
toc;
str=sprintf('mi wen:');
disp(str);
disp(s);
str=sprintf('%02x ',s);
disp(str);
%��ʼ����
tic;
s=addk(s,keyexp1(:,41:44));
for i=10:-1:1 
    if(i~=10)
        s=invmixcol(s);%!!!
    end
    s=invbyterot(s);%!!!
    s=sinvbox(s);%!!!
    s=addk(s,keyexp1(:,(i-1)*4+1:(i-1)*4+4));   
end
toc;
str=sprintf('ming wen:');
disp(str);
disp(s);
str=sprintf('%02x ',s);
disp(str);
