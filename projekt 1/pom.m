b0 = 0.041;
b1 = 8.776;
b2 = 10.149;
a0 = -0.001;
a1 = -0.974;
a2 = 244.696;

simTime = 50;
ic = 0.0;
licz = [b2 b1 b0];
mian = [1  -a2  -a1 -a0];
T=0.5;
t=0:T:simTime;
H = tf(licz,mian,T,'Inputdelay',0);
[y1,t1]=step(H,t,'y');

set(0,'defaultLineLineWidth',1.5);
stairs(t1, y1, 'b','lineWidth', 1.5);
hold on;


s=tf('s');
G=((s+1)*(s+10))/((s-11)*(s+12)*(s+13));

[y1,t1] = step(G, simTime);
plot(t1, y1, 'r--');

hold off;
set(gca,'fontsize',12);
ylabel('y(t)');
xlabel('t [s]');
%legend('y(t) transmitancji G(z)', 'y(t) modelu, - wariant 1', 'y(t) modelu - wariant 2', 'Location','northwest')
%print('rysunki/4b.png','-dpng','-r500');