clear;

Kk = 1.645;
Tk = 19.7;

Kr = 0.6*Kk
Ti = 0.5*Tk
Td = 0.12*Tk

Tp=0.5;
r2=Kr*Td/Tp
r1=Kr*(Tp/(2*Ti)-2*Td/Tp-1)
r0=Kr*(1+Tp/(2*Ti)+Td/Tp)


