clear;

Kk = 1.645;
Tk = 19.7;

Kr = 0.6*Kk;
Ti = 0.5*Tk;
Td = 0.12*Tk;

simT = 3000;

T_Tnom=[1    1.1  1.2  1.3  1.4  1.5  1.6  1.7  1.8  1.9  2];
K_Knom=[1.59 1.51 1.45 1.39 1.33 1.28 1.23 1.19 1.15 1.11 1.07];
ind = 11;

figure(3);
% plot(T_Tnom, K_Knom, 'go-');
ylabel('K0/K0nom');
xlabel('T0/T0nom');
set(gca,'fontsize',12);
legend('regulator DMC', 'regulator PID', 'location', 'east') % do 6b
% print('rysunki/6_pid.png','-dpng','-r500');

K0 = 1.4;
% K0 = K0*K_Knom(ind);
T0 = 5;
% T0 = T0*T_Tnom(ind);
T1=1.71;
T2= 5.53;
Gs = tf(K0, [T1*T2 T1+T2 1], 'InputDelay', 5);
G = c2d(Gs, 0.5)
coef = [G.Numerator{1,1}(2) G.Numerator{1,1}(3) -1.66 0.6819]

% reg = pid(Kr, 1/Ti, Td);
% output = feedback(Gs, reg);

Tp=0.5;
r2=Kr*Td/Tp;
r1=Kr*(Tp/(2*Ti)-2*Td/Tp-1);
r0=Kr*(1+Tp/(2*Ti)+Td/Tp);

u=zeros(simT,1);
y=zeros(simT,1);
yzad(1:9)=0;
yzad(10:simT)=1;
e(1:12)=0; 

for k =T0/0.5+3:simT
   y(k)= coef(1)*u(k-(T0/0.5+1)) + coef(2)*u(k-(T0/0.5+2)) - coef(3)*y(k-1) - coef(4)*y(k-2);
   e(k)=yzad(k)-y(k);
   u(k)=r2*e(k-2)+r1*e(k-1)+r0*e(k)+u(k-1);
end

 
%wyniki symulacji
figure(1);
stairs(u, 'b-', 'linewidth', 1.5);
set(gca,'fontsize',12);
ylabel('u(k)')
xlabel('k');
% print('rysunki/4_pid_u.png','-dpng','-r500');

figure(2);
stairs(y, 'b-', 'linewidth', 1.5); 
% hold on; 
% stairs(yzad,':', 'linewidth', 1.5);
% hold off;
set(gca,'fontsize',12);
% legend( 'wyjście systemu', 'wartość zadana', 'location', 'southeast')
xlabel('k')
ylabel('y(k)')
%print('rysunki/4_pid_y.png','-dpng','-r500');


