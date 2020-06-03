K0 = 1.4;
T0 = 5;
T1=1.71;
T2= 5.53;

simT = 50;

Gs = tf(K0, [T1*T2 T1+T2 1], 'InputDelay', 5);
G = c2d(Gs, 0.5);

[ys, ts] = step(Gs, simT);
[y, t] = step(G, simT);


set(0, 'DefaultLineLineWidth', 1.5);

figure(1)
plot(ts, ys);
% step(Gs)
hold on
% (testt, testy, 'b--');
% step(G, 'r--');
stairs(t, y, 'r--','lineWidth', 1.5);
hold off
set(gca,'fontsize',12);
xlabel('t [s]')
ylabel('y(t)')
legend('Transmitancja ciągła G(s)', 'Transmitancja dyskretna G(z)', 'location', 'southeast')
ylim ([0 1.5])
xlim ([0 simT])
% print('rysunki/1.png','-dpng','-r500');