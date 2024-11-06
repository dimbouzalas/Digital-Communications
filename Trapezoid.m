clear; clc; close all;
a=0;
b=2*pi;
N=100;
h=(b-a)/N;
sum=0; %sum
f = @(x) abs(cos(x) + cos(2*x))^2;
for(i=0:1:N-1)
   sum = sum + f(i);  
end 
trap = (h/2)*(f(a)+f(b)+2*sum)
disp(trap)
