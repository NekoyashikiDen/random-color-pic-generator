width=100 % width & length of the pic
length=100

seed=1234; % random seed of the generator
rng(seed,'twister');

pic=zeros(width,length,3);
temp=zeros(1,3);
r=32; % amount of generated values in each channel
g=32;
b=32;
for m=randperm(256,r)-1 % generate random values
    for n=randperm(256,g)-1
        for l=randperm(256,b)-1
            temp(1,:)=[m n l];
            for k=1:3
               for i=1:width
                  for j=1:length
                      pic(i,j,k)=temp(k);
                  end
               end
            end
            pic=uint8(pic); % transfer the matrix into pic file
            code=lower([dec2hex(temp(1),2),dec2hex(temp(2),2),dec2hex(temp(3),2)]); % hex file name
            name=['0x',code,'.jpg'];
            imwrite(pic,name);
        end
    end
end
