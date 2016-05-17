clear all;
clc;
tx=['6d';'9b';'02';'2b';'f1';'16';'eb';'5a';'80';'ee';'2e';'20';'4e';'c8';'74';'1c'];
tx1=hex2dec(tx);
%密文组织排列
for i=1:4
    for j=1:4
        m(j,i)=uint8(tx1((i-1)*4+j));
    end
end
%-------------------------------------
for i=1:16
k(i)=uint8(i+64);%秘钥
end
for i=1:4
    for j=1:4
        key(j,i)=k((i-1)*4+j);
    end
end
[keyexp1,rcon]=keyexp(key);%秘钥展开

s=addk(m,keyexp1(:,41:44));
for i=10:1 
    s=invbyterot(s);%!!!
    s=sinvbox(s);%!!!
    s=addk(s,keyexp1(:,(i-1)*4+1:(i-1)*4+4));
    if(i~=1)
        s=invmixcol(s);%!!!
    end
end
disp(s);