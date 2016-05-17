function byterot= invbyterot(m)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%disp(m);
j(1,:)=m(1,:);
j(2,:)=[m(2,4),m(2,1:3)];
j(3,:)=[m(3,3:4),m(3,1:2)];
j(4,:)=[m(4,2:4),m(4,1)];
byterot=j;
%disp(m);
end
