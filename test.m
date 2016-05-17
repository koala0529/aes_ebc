clear all;
clc;
% a=['e0';'b4';'52';'ae'];
% a=uint8(hex2dec(a));
% b=mixcol(a);
% b=dec2hex(b);
% disp(b);
sx=['32';'88';'31';'e0';'43';'5a';'31';'37';'f6';'30';'98';'07';'a8';'8d';'a2';'f4'];
%sx=['88';'88';'31';'e0';'99';'5a';'31';'37';'f6';'30';'98';'00';'a8';'8d';'a2';'ff'];
%t=dec2hex(0);
% for i=1:16  
%     sx(i,:)='77';
% end
sx1=hex2dec(sx);

for i=1:4
    for j=1:4
        s(i,j)=uint8(sx1((i-1)*4+j));
    end
end
disp(s);
shex=dec2hex(s);
k=['2b';'7e';'15';'16';'28';'ae';'d2';'a6';'ab';'f7';'15';'88';'09';'cf';'4f';'3c'];
k1=uint8(hex2dec(k));
keyhex=dec2hex(k1);
for i=1:4
    for j=1:4
        key2(j,i)=uint8(k1((i-1)*4+j));
    end
end
[expand,rcon]=keyexp(key2);

s=addk(s,key2);

for i=1:10
    
    s=sbox(s);
%      disp(i);
%     %disp(s);
%     str=sprintf('%02x ',s);
%     disp(str);
    
    s=byterot(s);
    if(i~=10)
        s=mixcol(s);
    end
   
    s=addk(s,expand(:,i*4+1:i*4+4));
%     str=sprintf('%s',s);
%     disp(str);
    %pause;
end
    str=sprintf('%02x ',s);
    disp(str);
    
s=addk(s,expand(:,41:44));
for i=10:-1:1 
    %---------------------
    disp(i);
     %disp(s);
    str=sprintf('%02x ',s);
    disp(str);
    %---------------------
    s=invbyterot(s);%!!!
    s=sinvbox(s);%!!!
    s=addk(s,expand(:,(i-1)*4+1:(i-1)*4+4));
    if(i~=1)
        s=invmixcol(s);%!!!
    end
end
disp(s);
% a=uint8([k1(1:4)]);
% b=['a0';'fa';'fe';'17'];
% tmp=uint8(hex2dec(b));
% x=addk(a,tmp);
% 
% 
% t=['49';'de';'d2';'89';'45';'db';'96';'f1';'7f';'39';'87';'1a';'77';'02';'53';'3b'];
% 
% t1=hex2dec(t);
% for i=1:4
%     for j=1:4
%         s(j,i)=uint8(t1((i-1)*4+j));
%     end
% end
% ek=['f2';'c2';'95';'f2';'7a';'96';'b9';'43';'59';'35';'80';'7a';'73';'59';'f6';'7f'];
% ek2=hex2dec(ek);
% for i=1:4
%     for j=1:4
%         ek3(j,i)=uint8(ek2((i-1)*4+j));
%     end
% end
% s=byterot(s);
% s=mixcol(s);
% s=addk(ek3,s);



