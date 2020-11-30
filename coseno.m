clear
clc
f = 4;
S = 0;
t = linspace(-1, 1, 1000);
for n = 1:10;
  S = S+ (2/n)*(-1)^(n+1)*sin(2*pi*f*n*t);
endfor
plot(t, S);