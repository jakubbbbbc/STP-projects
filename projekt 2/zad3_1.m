% wyznaczenie K krytycznego

clear;

Kkryt=1.645; % dobieramy K krytyczne

K0 = 1.4;
T0 = 5;
T1=1.71;
T2= 5.53;
Gs = tf(K0, [T1*T2 T1+T2 1], 'InputDelay', 5);

reg = pid(Kkryt);
output = feedback(Gs, reg);

simT = 100;
step(output, simT);
set(gca,'fontsize',12);
title('')
xlabel('t')
ylabel('y(k)')
% print('rysunki/3.png','-dpng','-r500');