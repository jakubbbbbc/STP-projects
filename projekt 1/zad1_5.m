b0 = 0.041;
b1 = 8.776;
b2 = 10.149;
a0 = -0.001;
a1 = -0.974;
a2 = 244.696;

A = [a2 1 0; a1 0 1; a0 0 0];
B = [b2; b1; b0];
C = [1 0 0];

sterowalny = det([B A*B A^2*B])
obserwowalny = det([C; C*A; C*A^2])