e=exp(1);
b2 = 10.1132 - 0.0795 + 0.1152;
b1 = 10.1132*(e^-6 + e^-6.5) - 0.0795*(e^5.5 + e^-6.5) + 0.1152*(e^5.5 + e^-6);
b0 = 10.1132*(e^-12.5) - 0.0795*(e^-1) + 0.1152*(e^-0.5);

a2 = -(e^5.5 + e^-6 + e^-6.5);
a1 = e^-0.5 + e^-1 + e^-12.5;
a0 = e^-7;