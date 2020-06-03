tkonc = 10;
T=0.5;
zb = 0.01;
zb2 = complex(0.03, 0.01);
zb3 = complex(0.03, -0.01);
zo = [0.6 0.1];
%wartości macierzy
b0 = 0.041;
b1 = 8.776;
b2 = 10.149;
a0 = -0.001;
a1 = -0.974;
a2 = 244.696;
zb1 = 0.05;
%potrzebne macierze
A = [a2 1 0; a1 0 1; a0 0 0];
B = [b2; b1; b0];
A11 = a2;
A12 = [1 0];
A21 = [a1; a0];
A22 = [0 1; 0 0];
B1 = b2;
B2 = [b1; b0];
%współczynniki obserwatora
L = acker(A22',A12', [zo(1), zo(1)])';
y2z = (A22-L*A12)*L + A21-L*A11;
z2z = A22-L*A12;
u2z = B2-L*B1;

% regulator 1
K = acker(A,B, [zb, zb, zb]);
opt = simset('InitialState',[-1 0 0 5 -2]); % x1, z1, z2, x3, x2
sim('model_dyskretny_2_reg_obs', tkonc, opt);

% reg1 bieg1 x2
figure(1)
stairs(ans.x2.time(:),ans.x2.signals.values(:), 'b','lineWidth', 1.5);
hold on;
stairs(ans.x2obs.time(:),ans.x2obs.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
set(gca,'fontsize',12);
ylabel('x2(t)');
xlabel('t [s]');
title(['wykres x2(t), zo=', num2str(zo(1))]);
legend('obiekt', 'obserwator');
%print('rysunki/9_reg1_bieg1_x2.png','-dpng','-r500');

% reg1 bieg1 x3
figure(2)
stairs(ans.x3.time(:),ans.x3.signals.values(:), 'b','lineWidth', 1.5);
hold on;
stairs(ans.x3obs.time(:),ans.x3obs.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
set(gca,'fontsize',12);
ylabel('x3(t)');
xlabel('t [s]');
title(['wykres x3(t), zo=', num2str(zo(1))]);
legend('obiekt', 'obserwator');
%print('rysunki/9_reg1_bieg1_x3.png','-dpng','-r500');

L = acker(A22',A12', [zo(2), zo(2)])';
y2z = (A22-L*A12)*L + A21-L*A11;
z2z = A22-L*A12;
u2z = B2-L*B1;
sim('model_dyskretny_2_reg_obs', tkonc, opt);
% reg1 bieg2 x2
figure(3)
stairs(ans.x2.time(:),ans.x2.signals.values(:), 'b','lineWidth', 1.5);
hold on;
stairs(ans.x2obs.time(:),ans.x2obs.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
set(gca,'fontsize',12);
ylabel('x2(t)');
xlabel('t [s]');
title(['wykres x2(t), zo=', num2str(zo(2))]);
legend('obiekt', 'obserwator');
%print('rysunki/9_reg1_bieg2_x2.png','-dpng','-r500');

% reg1 bieg2 x3
figure(4)
stairs(ans.x3.time(:),ans.x3.signals.values(:), 'b','lineWidth', 1.5);
hold on;
stairs(ans.x3obs.time(:),ans.x3obs.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
set(gca,'fontsize',12);
ylabel('x3(t)');
xlabel('t [s]');
title(['wykres x3(t), zo=', num2str(zo(2))]);
legend('obiekt', 'obserwator');
%print('rysunki/9_reg1_bieg2_x3.png','-dpng','-r500');


% regulator 2
K = acker(A,B, [zb1, zb2, zb3]);
L = acker(A22',A12', [zo(1), zo(1)])';
y2z = (A22-L*A12)*L + A21-L*A11;
z2z = A22-L*A12;
u2z = B2-L*B1;
sim('model_dyskretny_2_reg_obs', tkonc, opt);

% reg2 bieg1 x2
figure(5)
stairs(ans.x2.time(:),ans.x2.signals.values(:), 'b','lineWidth', 1.5);
hold on;
stairs(ans.x2obs.time(:),ans.x2obs.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
set(gca,'fontsize',12);
ylabel('x2(t)');
xlabel('t [s]');
title(['wykres x2(t), zo=', num2str(zo(1))]);
legend('obiekt', 'obserwator');
%print('rysunki/9_reg2_bieg1_x2.png','-dpng','-r500');

% reg2 bieg1 x3
figure(6)
stairs(ans.x3.time(:),ans.x3.signals.values(:), 'b','lineWidth', 1.5);
hold on;
stairs(ans.x3obs.time(:),ans.x3obs.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
set(gca,'fontsize',12);
ylabel('x3(t)');
xlabel('t [s]');
title(['wykres x3(t), zo=', num2str(zo(1))]);
legend('obiekt', 'obserwator');
%print('rysunki/9_reg2_bieg1_x3.png','-dpng','-r500');

L = acker(A22',A12', [zo(2), zo(2)])';
y2z = (A22-L*A12)*L + A21-L*A11;
z2z = A22-L*A12;
u2z = B2-L*B1;
sim('model_dyskretny_2_reg_obs', tkonc, opt);
% reg2 bieg2 x2
figure(7)
stairs(ans.x2.time(:),ans.x2.signals.values(:), 'b','lineWidth', 1.5);
hold on;
stairs(ans.x2obs.time(:),ans.x2obs.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
set(gca,'fontsize',12);
ylabel('x2(t)');
xlabel('t [s]');
title(['wykres x2(t), zo=', num2str(zo(2))]);
legend('obiekt', 'obserwator');
%print('rysunki/9_reg2_bieg2_x2.png','-dpng','-r500');

% reg2 bieg2 x3
figure(8)
stairs(ans.x3.time(:),ans.x3.signals.values(:), 'b','lineWidth', 1.5);
hold on;
stairs(ans.x3obs.time(:),ans.x3obs.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
set(gca,'fontsize',12);
ylabel('x3(t)');
xlabel('t [s]');
title(['wykres x3(t), zo=', num2str(zo(2))]);
legend('obiekt', 'obserwator');
%print('rysunki/9_reg2_bieg2_x3.png','-dpng','-r500');




