b0 = 0.041;
b1 = 8.776;
b2 = 10.149;
a0 = -0.001;
a1 = -0.974;
a2 = 244.696;

simTime = 2;
ic = 0.01;
licz = [b2 b1 b0];
mian = [1  -a2  -a1 -a0];
T=0.5;
t=0:T:simTime;
H = tf(licz,mian,T,'Inputdelay',2);
[y1,t1]=step(H,t,'y');

set(0,'defaultLineLineWidth',1.5);
stairs(t1, y1, 'b','lineWidth', 3.5);
hold on;


sim('model_dyskretny_1_2',simTime)
stairs(ans.y_war1.time(:),ans.y_war1.signals.values(:), 'y-','lineWidth', 1.5);
stairs(ans.y_war2.time(:),ans.y_war2.signals.values(:), 'r--','lineWidth', 1.5);
hold off;
set(gca,'fontsize',12);
ylabel('y(t)');
xlabel('t [s]');
legend('y(t) transmitancji G(z)', 'y(t) modelu, - wariant 1', 'y(t) modelu - wariant 2', 'Location','northwest')
%print('rysunki/4b.png','-dpng','-r500');