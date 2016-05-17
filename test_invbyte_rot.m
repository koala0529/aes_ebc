tx=['6d';'9b';'02';'2b';'f1';'16';'eb';'5a';'80';'ee';'2e';'20';'4e';'c8';'74';'1c'];
tx1=hex2dec(tx);
%密文组织排列
for i=1:4
    for j=1:4
        m(j,i)=uint8(tx1((i-1)*4+j));
    end
end
disp(m);
b= invbyterot(m);
disp(b);