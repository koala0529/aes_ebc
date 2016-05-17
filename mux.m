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
