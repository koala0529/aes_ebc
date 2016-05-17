function j = invmixcol(m)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
a=[uint8(14) uint8(11) uint8(13) uint8(9)];
[x,y]=size(m);
for i=1:y
    %disp(a);
    for j=1:x
        a0= mux(a(1),m(1,i));
        a1= mux(a(2),m(2,i));
        a2= mux(a(3),m(3,i));
        a3= mux(a(4),m(4,i));
        tmp=bitxor(a0,a1);
        tmp=bitxor(a2,tmp);
        tmp=bitxor(a3,tmp);
        k(j,i)=tmp;
        a=[a(4),a(1:3)];
    end
end 
j=k;
end

