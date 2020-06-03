clear

% ustawianie parametrów
D = 70;
N = 22;
Nu = 3;
lambda = 4;
color=  'b';
% kk = 140;
kk = 3000; %do zad 6


T_Tnom=[1    1.1  1.2  1.3  1.4  1.5  1.6  1.7  1.8  1.9  2];
K_Knom=[6.27 6.29 6.27 6.29 6.27 6.29 6.27 6.29 5.71 5.29 5.14];
ind = 11;

figure(3);
plot(T_Tnom, K_Knom, 'bo--');
hold on
set(gca,'fontsize',12);
ylabel('K0/K0nom');
xlabel('T0/T0nom');
% print('rysunki/6_dmc.png', '-dpng', '-r500');

% parametry obiektu obiektu
K0 = 1.4;
K0 = K0*K_Knom(ind);
T0 = 5;
T0 = T0*T_Tnom(ind);
T1=1.71;
T2= 5.53;
Tp=0.5;
Gs = tf(K0, [T1*T2 T1+T2 1], 'InputDelay', 5);
G = c2d(Gs, Tp)
s=step(G);
coef = [G.Numerator{1,1}(2) G.Numerator{1,1}(3) -1.66 0.6819]


u=zeros(kk,1);
y=zeros(kk,1);
yzad=zeros(kk,1);
yzad(13:kk) = 1;

deltau = zeros(1, D-1);

M=zeros(N,Nu);
for i=1:N
    for j=1:Nu
        if (i>=j)
            M(i,j)=s(i-j+1);
        else
            break
        end
    end
end

Mp=zeros(N,D-1);
for i=1:N
    for j=1:D-1
        if i+j<D
            Mp(i,j)=s(i+j)-s(j);
        else
            Mp(i,j)=s(D)-s(j);
        end
    end
end

% parametry regulatora
I = eye(Nu);
K = ((M'*M + lambda*I)^-1)*M';
Ku = K(1,:)*Mp;
Ke = sum(K(1,:));

e=zeros(kk, 1);
for k=T0/0.5+3:kk
   y(k)= coef(1)*u(k-(T0/0.5+1)) + coef(2)*u(k-(T0/0.5+2)) - coef(3)*y(k-1) - coef(4)*y(k-2);
    for n=D-1:-1:2
        deltau(n) = deltau(n-1);
    end
    e(k) = yzad(k)-y(k);
    delta_uk = Ke*e(k)-Ku*deltau';
    deltau(1) = delta_uk;
    u(k) = u(k-1) + delta_uk;
end


figure(1)
% subplot(2,1,1)
stairs(u, sprintf('%s-', color), 'LineWidth', 1.5)
% hold on
xlabel('k')
xlim([10 kk])
ylabel('u(k)')
% ylim([0 1.65])
% ylim([0 6])% do 6a
ylim([-0.1 0.5]) % do 6b
set(gca,'fontsize',12);
% legend('regulator DMC', 'regulator PID') % do 6a
% legend('sygnał sterujący, lambda=20', 'sygnał sterujący, lambda=10', 'sygnał sterujący, lambda=4', 'sygnał sterujący, lambda=2', 'sygnał sterujący, lambda=1', 'location', 'southeast')
% print('rysunki/6_u.png','-dpng','-r500')

figure(2)
% subplot(2,1,2)
stairs(yzad,'y:', 'LineWidth', 1.5)
hold on
stairs(y, sprintf('%s-', color), 'LineWidth', 1.5)
hold off
xlim([10 kk])
% ylim([0 1.2])
% ylim([0 1.35])
ylim([0 2]) % do 6b
xlabel('k')
ylabel('y(k)')
set(gca,'fontsize',12);
% legend('wartość zadana', 'regulator DMC', 'regulator PID')
% legend( 'wartość zadana', 'wyjście systemu, lambda=20', 'wyjście systemu, lambda=10', 'wyjście systemu, lambda=4', 'wyjście systemu, lambda=2', 'wyjście systemu, lambda=1', 'location', 'southeast')
% print('rysunki/6_y.png','-dpng','-r500')


% plot(T0nom, K0nom)
% grid
% ylabel('K0/K0nom')
% xlabel('T0/T0nom')
% title('Obszar stabilności DMC')
% % print('18.png','-dpng','-r400')