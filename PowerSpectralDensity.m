clear; clc; close all;
fmin=0;
fmax=10000;
N=10000;
h=(fmax-fmin)/N;
sum=0; %sum
G = @(f) (10^(-6))*f^(2);
for(i=0:1:N-1)
   sum = sum + G(i);  
end 
trap1 = (h/2)*(G(fmin)+G(fmax)+2*sum)
disp(trap1)

fmin=5000;
fmax=6000;
N=10000;
sum=0;
h=(fmax-fmin)/N;
for(i=0:1:N-1)
   sum = sum + G(i);  
end 
trap2 = (h/2)*(G(fmin)+G(fmax)+2*sum)
disp(trap2)