b0 = 0.041;
b1 = 8.776;
b2 = 10.149;
a0 = -0.001;
a1 = -0.974;
a2 = 244.696;

A = [a2 1 0; a1 0 1; a0 0 0];
B = [b2; b1; b0];
C = [1 0 0];
z = sym("z");
zI = [z 0 0; 0 z 0; 0 0 z];
k1 = sym("k1");
k2 = sym("k2");
k3 = sym("k3");
K = [k1 k2 k3];

det1 = det(zI-A+B*K);


zb = sym("zb");
wsp = [10.1490 8.7760 0.0410; 8.7760 -2157.3 -10.0427; 0.0410 -10.0427 0.0312];
wyn = [-3*zb+244.696; 3*zb^2-0.9740; -zb^3-0.001];
k = wsp \ wyn

