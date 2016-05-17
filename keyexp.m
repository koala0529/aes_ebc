function [keyexpt,rcon] = keyexp(key)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
w=key;
rcon=[1,0,0,0;
        2,0,0,0;
        4,0,0,0;
        8,0,0,0;
        16,0,0,0;
        32,0,0,0;
        64,0,0,0;
        128,0,0,0;
        27,0,0,0;
        54,0,0,0
        ];
for i=5:44
    tmp=w(:,i-1);
    if mod(i-1,4)==0
        tmp=[tmp(2:4);tmp(1)];
        tmp=sbox(tmp);
%         rcon(:,i-4)=uint8([2^(fix((i-1)/4)-1),0,0,0]');
%         rcon(:,33)=uint8([27,0,0,0]');
%         rcon(:,37)=uint8([54,0,0,0]');
        k=fix((i-1)/4);
        r=uint8(rcon(k,:));
        %disp(rcon(:,i-4)');
        tmp=bitxor(tmp,r');
        %tmp=bitxor(tmp,rcon(:,i-4));
    end
    j=w(:,i-4);
    w(:,i)=bitxor(j,tmp);   
end
keyexpt=w;
end

