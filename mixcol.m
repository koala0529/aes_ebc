function j = mixcol(m)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
a=[uint8(2) uint8(3) uint8(1) uint8(1)];
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

function m = mux(a,b)
%disp(a);
bw(1)=b;
m=uint8(0);
for i=2:5
    bw(i)=bitshift(bw(i-1),1);
    if bitget(bw(i-1),8)==1
       bw(i)=bitxor(bw(i),uint8(27)); 
       %disp(bw(i));
    end
end
for i=1:4
    if bitget(a,i)==1
        m=bitxor(m,bw(i));
    end
end
end