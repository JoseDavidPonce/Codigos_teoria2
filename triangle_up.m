clear
clc
fc = 24e9;
f = 26e9;
S = 0;
A = 1;
W = 0;
eta_cero = sqrt((4*pi*1e-7)/(8.85e-12));
c = 3e8;
z = 1;
t = linspace(0, 2.5e-10, 1000);
for n = 1:10;
  Sn = (A*8/pi^2)*cos(2*pi*f*(2*n-1)*t)/(2*n-1)^2;
  fn = f*(2*n-1);
  An = (A*8/pi^2)/(2*n-1)^2;
  beta = ((2*pi*fn)/c)*sqrt(-(fc/fn)^2+1);
  imp = eta_cero/sqrt(-(fc/fn)^2+1);
  wave_out = An*cos(2*pi*fn*t+beta*z);
  v = c/sqrt(1-(fc/fn)^2);
  printf("%f\n", v);
  %printf("%f\n", imp);
  %printf("%f\n", beta);
  S = S+ Sn;
  W = W+ wave_out;

endfor
plot(t, W, t, S);
title("Señal Triangular (f = 26GHz)");
xlabel("t");
ylabel("V/m");