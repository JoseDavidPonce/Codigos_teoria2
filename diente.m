clear
clc
fc = 24e9;
f = 15e9;
S = 0;
A = 1;
W = 0;
eta_cero = sqrt((4*pi*1e-7)/(8.85e-12));
c = 3e8;
z = 1;
t = linspace(0, 2.5e-10, 1000);
for n = 1:10;
  Sn = (2*A/pi)*sin(2*pi*f*n*t)/n;
  fn = f*n;
  An = (A/pi)/(n);
  
  if n==1
    alpha = (2*pi*fn)/c*sqrt((fc/fn)^2-1);  
    wave_out = Sn*e^(-alpha*z);
    imp = eta_cero/sqrt((fc/fn)^2-1);
    %printf("Constante de p %d: %f\n", n, alpha);
  else 
    beta = (2*pi*fn)/c*sqrt(-(fc/fn)^2+1);
    wave_out = An*cos(2*pi*fn*t+beta*z);
    imp = eta_cero/sqrt(-(fc/fn)^2+1);
    v = c/sqrt(1-(fc/fn)^2);
    printf("%f\n", v);
    %printf("Constante de p %d: %f\n", n, beta);
  endif  
  
  %printf("Impedancia intrínseca: %f\n", imp);
  
  S = S+ Sn;
  W = W+ wave_out;
  %plot(t, Sn, t, wave_out);
  %hold on
endfor
plot(t, W, t, S);
title("Diente de sierra (f = 15GHz)");
xlabel("t");
ylabel("V/m");
