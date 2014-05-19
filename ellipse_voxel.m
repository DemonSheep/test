clear
clc
% Ellipse generator and voxel generator
syms theta
a = 400;
b = 300;
%% the semi-major axis is along the X-axis
X = 0:a;
theta = acos(X/a);
Y = b*sin(theta);
Y = double(Y);
bar(X,Y)
Y_prime = ceil(Y);
figure(1)
hold on
bar(X,Y_prime,'r')
Y_prime = [Y_prime, Y_prime(end)];
X = [X, X(end)+1];
%% now make plot of the edges of the voxel
foo = size(X);
figure(2)
for i = 1:foo(2)
   Xcoords = [X(i+1),X(i+2),X(i+2),X(i+1),X(i+1)];
   Ycoords = [Y_prime(i)+1,Y_prime(i)+1,Y_prime(i+1),Y_prime(i+1),Y_prime(i)+1];
   if mod(i,2) == 0
       fill(Xcoords,Ycoords,'r')
       hold on
   else
       fill(Xcoords,Ycoords,'b')
       hold on
   end
end
figure(2)
hold on
plot(X,Y,'b')
