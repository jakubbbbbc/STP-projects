%{
b0 = 0.041;
b1 = 8.776;
b2 = 10.149;
a0 = -0.001;
a1 = -0.974;
a2 = 244.696;
%}
b0 = sym("b0");
b1 = sym("b1");
b2 = sym("b2");
a0 = sym("a0");
a1 = sym("a1");
a2 = sym("a2");
z = sym("z");

A1 = [\frac];
B1 = [1; 0; 0];
C1 = [b2 b1 b0];
pom = [z 0 0; 0 z 0; 0 0 z];

G1 = C1*((pom-A1)^(-1))*B1

A2 = [a2 1 0; a1 0 1; a0 0 0];
B2 = [b2; b1; b0];
C2 = [1 0 0];
pom = [z 0 0; 0 z 0; 0 0 z];

G2 = C2*((pom-A2)^(-1))*B2

%czy transmitancje w obu wariantach są takie same?
%G2-G1

