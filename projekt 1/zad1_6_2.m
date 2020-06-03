tkonc = 6;
zb1 = 0.5;
a = [0.01 0.03 0.05];
b = [0.01 0.03 0.05];

%remember to set initial values in the model to -1 -2 5
T=0.5;
b0 = 0.041;
b1 = 8.776;
b2 = 10.149;
a0 = -0.001;
a1 = -0.974;
a2 = 244.696;
A = [a2 1 0; a1 0 1; a0 0 0];
B = [b2; b1; b0];

%a1
K = acker(A,B, [zb1, complex(a(1), b(1)), complex(a(1), -b(1))]);
sim('model_dyskretny_2_reg', tkonc);

%x1 a1
figure(1);
stairs(ans.x1.time(:),ans.x1.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('x1(t)');
xlabel('t [s]');
title('wykres x1(t)');

%x2 a1
figure(2);
stairs(ans.x2.time(:),ans.x2.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('x2(t)');
xlabel('t [s]');
title('wykres x2(t)');

%x3 a1
figure(3);
stairs(ans.x3.time(:),ans.x3.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('x3(t)');
xlabel('t [s]');
title('wykres x3(t)');

%u a1
figure(4);
stairs(ans.u.time(:),ans.u.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('u(t)');
xlabel('t [s]');
title('wykres u(t)');


%a2
K = acker(A,B, [zb1, complex(a(2), b(1)), complex(a(2), -b(1))]);
sim('model_dyskretny_2_reg', tkonc);

%x1 a2
figure(1);
stairs(ans.x1.time(:),ans.x1.signals.values(:), 'm--','lineWidth', 1.5);

%x2 a2
figure(2);
stairs(ans.x2.time(:),ans.x2.signals.values(:), 'm--','lineWidth', 1.5);

%x3 a2
figure(3);
stairs(ans.x3.time(:),ans.x3.signals.values(:), 'm--','lineWidth', 1.5);

%u a2
figure(4);
stairs(ans.u.time(:),ans.u.signals.values(:), 'm--','lineWidth', 1.5);


%a3
K = acker(A,B, [zb1, complex(a(3), b(1)), complex(a(3), -b(1))]);
sim('model_dyskretny_2_reg', tkonc);

%x1 a3
figure(1);
stairs(ans.x1.time(:),ans.x1.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend(['a = ',num2str(a(1)), ', b = ', num2str(b(1))], ['a = ',num2str(a(2)), ', b = ', num2str(b(1))], ['a = ',num2str(a(3)), ', b = ', num2str(b(1))]);
%print('rysunki/6_2_a_x1.png','-dpng','-r500');

%x2 a3
figure(2);
stairs(ans.x2.time(:),ans.x2.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend(['a = ',num2str(a(1)), ', b = ', num2str(b(1))], ['a = ',num2str(a(2)), ', b = ', num2str(b(1))], ['a = ',num2str(a(3)), ', b = ', num2str(b(1))]);
%print('rysunki/6_2_a_x2.png','-dpng','-r500');

%x3 a3
figure(3);
stairs(ans.x3.time(:),ans.x3.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend(['a = ',num2str(a(1)), ', b = ', num2str(b(1))], ['a = ',num2str(a(2)), ', b = ', num2str(b(1))], ['a = ',num2str(a(3)), ', b = ', num2str(b(1))]);
%print('rysunki/6_2_a_x3.png','-dpng','-r500');

%u a3
figure(4);
stairs(ans.u.time(:),ans.u.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend(['a = ',num2str(a(1)), ', b = ', num2str(b(1))], ['a = ',num2str(a(2)), ', b = ', num2str(b(1))], ['a = ',num2str(a(3)), ', b = ', num2str(b(1))]);
%print('rysunki/6_2_a_u.png','-dpng','-r500');



%b1
K = acker(A,B, [zb1, complex(a(1), b(1)), complex(a(1), -b(1))]);
sim('model_dyskretny_2_reg', tkonc);

%x1 b1
figure(5);
stairs(ans.x1.time(:),ans.x1.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('x1(t)');
xlabel('t [s]');
title('wykres x1(t)');

%x2 b1
figure(6);
stairs(ans.x2.time(:),ans.x2.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('x2(t)');
xlabel('t [s]');
title('wykres x2(t)');

%x3 b1
figure(7);
stairs(ans.x3.time(:),ans.x3.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('x3(t)');
xlabel('t [s]');
title('wykres x3(t)');

%u b1
figure(8);
stairs(ans.u.time(:),ans.u.signals.values(:), 'b','lineWidth', 1.5);
hold on;
set(gca,'fontsize',12);
ylabel('u(t)');
xlabel('t [s]');
title('wykres u(t)');


%b2
K = acker(A,B, [zb1, complex(a(1), b(2)), complex(a(1), -b(2))]);
sim('model_dyskretny_2_reg', tkonc);

%x1 b2
figure(5);
stairs(ans.x1.time(:),ans.x1.signals.values(:), 'm--','lineWidth', 1.5);

%x2 b2
figure(6);
stairs(ans.x2.time(:),ans.x2.signals.values(:), 'm--','lineWidth', 1.5);

%x3 b2
figure(7);
stairs(ans.x3.time(:),ans.x3.signals.values(:), 'm--','lineWidth', 1.5);

%u b2
figure(8);
stairs(ans.u.time(:),ans.u.signals.values(:), 'm--','lineWidth', 1.5);


%b3
K = acker(A,B, [zb1, complex(a(1), b(3)), complex(a(1), -b(3))]);
sim('model_dyskretny_2_reg', tkonc);

%x1 b3
figure(5);
stairs(ans.x1.time(:),ans.x1.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend(['a = ',num2str(a(1)), ', b = ', num2str(b(1))], ['a = ',num2str(a(1)), ', b = ', num2str(b(2))], ['a = ',num2str(a(1)), ', b = ', num2str(b(3))]);
%print('rysunki/6_2_b_x1.png','-dpng','-r500');

%x2 b3
figure(6);
stairs(ans.x2.time(:),ans.x2.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend(['a = ',num2str(a(1)), ', b = ', num2str(b(1))], ['a = ',num2str(a(1)), ', b = ', num2str(b(2))], ['a = ',num2str(a(1)), ', b = ', num2str(b(2))]);
%print('rysunki/6_2_b_x2.png','-dpng','-r500');

%x3 b3
figure(7);
stairs(ans.x3.time(:),ans.x3.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend(['a = ',num2str(a(1)), ', b = ', num2str(b(1))], ['a = ',num2str(a(1)), ', b = ', num2str(b(2))], ['a = ',num2str(a(1)), ', b = ', num2str(b(2))]);
%print('rysunki/6_2_b_x3.png','-dpng','-r500');

%u b3
figure(8);
stairs(ans.u.time(:),ans.u.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
legend(['a = ',num2str(a(1)), ', b = ', num2str(b(1))], ['a = ',num2str(a(1)), ', b = ', num2str(b(2))], ['a = ',num2str(a(1)), ', b = ', num2str(b(2))]);
%print('rysunki/6_2_b_u.png','-dpng','-r500');
