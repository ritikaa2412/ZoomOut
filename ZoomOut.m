%reading the original image
a=imread('C:\Users\HP\Desktop\Career_prof_animation_3.jpg');
a=rgb2gray(a);
figure,imshow(a)
a=im2double(a);

%taking the size of original image
[r1,c1]=size(a);
P=3.2;

%forming a new image by scaling pixels
b=zeros(p*r1,p*c1);
[r2,c2]=size(b);

%copying the value of corner pixels

b(1,1)=a(1,1);
b(1,c2)=a(1,c1);
b(r2,1)=a(r1,1);

%direct mapping of pixels

b(r2,c2)=a(r1,c1);
for i=1:1:r2-1;
   if mod(i/p,1)== 0 
         for j=1:1:c2-1
             if mod(j/p,1)==0
                 b(i,j)=a(i/p,j/p);
            end
         end
   end
end

 % bilinear interpolation leaving the last and first rows and columns of image

for i=2:1:r2-1
    for j=2:1:c2-1
        if b(i,j)==0
        c=j/p;
        r=i/p;
        rd=floor(r);
        ru=ceil(r);
        cl=floor(c);
        cr=ceil(c);
        r=mod(r,1);
        c=mod(c,1);
        intensity1=a(rd,cl)*(1-r)+a(rd,cr)*r;
        intensity2=a(ru,cl)*(1-r)+a(ru,cr)*r;
        f_intensity=intensity1*(1-c)+intensity2*c;
        b(i,j)=f_intensity;
        end
    end
end

figure,imshow(b)