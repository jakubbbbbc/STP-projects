tkonc = 10;
T=0.5;
zb = 0.01;
zb1 = 0.05;
zb2 = complex(0.03, 0.01);
zb3 = complex(0.03, -0.01);
zo = [0.6 0.1];
opt = simset('InitialState',[-1 0 0 5 -2]); % x1, z1, z2, x3, x2
%wartości macierzy
b0 = 0.041;
b1 = 8.776;
b2 = 10.149;
a0 = -0.001;
a1 = -0.974;
a2 = 244.696;
%potrzebne macierze
A = [a2 1 0; a1 0 1; a0 0 0];
B = [b2; b1; b0];
A11 = a2;
A12 = [1 0];
A21 = [a1; a0];
A22 = [0 1; 0 0];
B1 = b2;
B2 = [b1; b0];

% regulator 1
K = acker(A,B, [zb, zb, zb]);

% reg1 obs1
L = acker(A22',A12', [zo(1), zo(1)])';
y2z = (A22-L*A12)*L + A21-L*A11;
z2z = A22-L*A12;
u2z = B2-L*B1;

sim('model_dyskretny_2_reg_obs', tkonc, opt);
% reg1 obs1 x1
figure(1);
stairs(ans.x1.time(:),ans.x1.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('x1(t)');
xlabel('t [s]');
title('wykres x1(t)');

% reg1 obs1 x2
figure(2);
stairs(ans.x2.time(:),ans.x2.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('x2(t)');
xlabel('t [s]');
title('wykres x2(t)');

% reg1 obs1 x3
figure(3);
stairs(ans.x3.time(:),ans.x3.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('x3(t)');
xlabel('t [s]');
title('wykres x3(t)');

% reg1 obs1 u
figure(4);
stairs(ans.u.time(:),ans.u.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('u(t)');
xlabel('t [s]');
title('wykres u(t)');

% reg1 obs2
L = acker(A22',A12', [zo(2), zo(2)])';
y2z = (A22-L*A12)*L + A21-L*A11;
z2z = A22-L*A12;
u2z = B2-L*B1;

sim('model_dyskretny_2_reg_obs', tkonc, opt);
% reg1 obs2 x1
figure(1);
stairs(ans.x1.time(:),ans.x1.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend('obserwator wolny', 'obserwator szybki');
%print('rysunki/10_reg1_x1.png','-dpng','-r500');

% reg1 obs2 x2
figure(2);
stairs(ans.x2.time(:),ans.x2.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend('obserwator wolny', 'obserwator szybki');
%print('rysunki/10_reg1_x2.png','-dpng','-r500');

% reg1 obs2 x3
figure(3);
stairs(ans.x3.time(:),ans.x3.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend('obserwator wolny', 'obserwator szybki');
%print('rysunki/10_reg1_x3.png','-dpng','-r500');

% reg1 obs2 u
figure(4);
stairs(ans.u.time(:),ans.u.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend('obserwator wolny', 'obserwator szybki');
%print('rysunki/10_reg1_u.png','-dpng','-r500');


% regulator 2
K = acker(A,B, [zb1, zb2, zb3]);

% reg2 obs1
L = acker(A22',A12', [zo(1), zo(1)])';
y2z = (A22-L*A12)*L + A21-L*A11;
z2z = A22-L*A12;
u2z = B2-L*B1;

sim('model_dyskretny_2_reg_obs', tkonc, opt);
% reg2 obs1 x1
figure(1);
stairs(ans.x1.time(:),ans.x1.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('x1(t)');
xlabel('t [s]');
title('wykres x1(t)');

% reg2 obs1 x2
figure(2);
stairs(ans.x2.time(:),ans.x2.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('x2(t)');
xlabel('t [s]');
title('wykres x2(t)');

% reg2 obs1 x3
figure(3);
stairs(ans.x3.time(:),ans.x3.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('x3(t)');
xlabel('t [s]');
title('wykres x3(t)');

% reg2 obs1 u
figure(4);
stairs(ans.u.time(:),ans.u.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('u(t)');
xlabel('t [s]');
title('wykres u(t)');

% reg2 obs2
L = acker(A22',A12', [zo(2), zo(2)])';
y2z = (A22-L*A12)*L + A21-L*A11;
z2z = A22-L*A12;
u2z = B2-L*B1;

sim('model_dyskretny_2_reg_obs', tkonc, opt);
% reg2 obs2 x1
figure(1);
stairs(ans.x1.time(:),ans.x1.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend('obserwator wolny', 'obserwator szybki');
%print('rysunki/10_reg2_x1.png','-dpng','-r500');

% reg2 obs2 x2
figure(2);
stairs(ans.x2.time(:),ans.x2.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend('obserwator wolny', 'obserwator szybki');
%print('rysunki/10_reg2_x2.png','-dpng','-r500');

% reg2 obs2 x3
figure(3);
stairs(ans.x3.time(:),ans.x3.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend('obserwator wolny', 'obserwator szybki');
%print('rysunki/10_reg2_x3.png','-dpng','-r500');

% reg2 obs2 u
figure(4);
stairs(ans.u.time(:),ans.u.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend('obserwator wolny', 'obserwator szybki');
%print('rysunki/10_reg2_u.png','-dpng','-r500');
