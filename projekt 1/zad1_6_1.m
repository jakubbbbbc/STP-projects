zb = [0.2 -0.2 0.01];
tkonc = 6;

% remember to set initial values in model to -1 -2 5
T=0.5;
b0 = 0.041;
b1 = 8.776;
b2 = 10.149;
a0 = -0.001;
a1 = -0.974;
a2 = 244.696;

A = [a2 1 0; a1 0 1; a0 0 0];
B = [b2; b1; b0];

K = acker(A,B, [zb(1), zb(1), zb(1)])
sim('model_dyskretny_2_reg', tkonc);

%x1 zb1
figure(1);
stairs(ans.x1.time(:),ans.x1.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('x1(t)');
xlabel('t [s]');
title('wykres x1(t)');

%x2 zb1
figure(2);
stairs(ans.x2.time(:),ans.x2.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('x2(t)');
xlabel('t [s]');
title('wykres x2(t)');

%x3 zb1
figure(3);
stairs(ans.x3.time(:),ans.x3.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('x3(t)');
xlabel('t [s]');
title('wykres x3(t)');

%u zb1
figure(4);
stairs(ans.u.time(:),ans.u.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('u(t)');
xlabel('t [s]');
title('wykres u(t)');


K = acker(A,B, [zb(2), zb(2), zb(2)])
sim('model_dyskretny_2_reg', tkonc);

%x1 zb2
figure(1);
stairs(ans.x1.time(:),ans.x1.signals.values(:), 'm--','lineWidth', 1.5);

%x2 z2
figure(2);
stairs(ans.x2.time(:),ans.x2.signals.values(:), 'm--','lineWidth', 1.5);

%x3 zb2
figure(3);
stairs(ans.x3.time(:),ans.x3.signals.values(:), 'm--','lineWidth', 1.5);

%uzb2
figure(4);
stairs(ans.u.time(:),ans.u.signals.values(:), 'm--','lineWidth', 1.5);


K = acker(A,B, [zb(3), zb(3), zb(3)])
sim('model_dyskretny_2_reg', tkonc);

%x1 zb3
figure(1);
stairs(ans.x1.time(:),ans.x1.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend(['zb = ',num2str(zb(1))], ['zb = ',num2str(zb(2))], ['zb = ',num2str(zb(3))]);
%print('rysunki/6_1_x1.png','-dpng','-r500');

%x2 zb3
figure(2);
stairs(ans.x2.time(:),ans.x2.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend(['zb = ',num2str(zb(1))], ['zb = ',num2str(zb(2))], ['zb = ',num2str(zb(3))]);
%print('rysunki/6_1_x2.png','-dpng','-r500');

%x3 zb3
figure(3);
stairs(ans.x3.time(:),ans.x3.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend(['zb = ',num2str(zb(1))], ['zb = ',num2str(zb(2))], ['zb = ',num2str(zb(3))]);
%print('rysunki/6_1_x3.png','-dpng','-r500');

%u zb3
figure(4);
stairs(ans.u.time(:),ans.u.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend(['zb = ',num2str(zb(1))], ['zb = ',num2str(zb(2))], ['zb = ',num2str(zb(3))]);
%print('rysunki/6_1_u.png','-dpng','-r500');
