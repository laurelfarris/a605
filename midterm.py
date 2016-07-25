

import math

T1 = 5000.
T2 = 100.
T3 = 5000.
tau1 = 0.04
tau2 = 2.
tau3 = 0.04

# 2(a)

Tb3 = T3*(1.-math.exp(-tau3))
Tb2 = Tb3*math.exp(-tau2) + T2*(1.-math.exp(-tau2))
Tb1 = Tb2*math.exp(-tau1) + T1*(1.-math.exp(-tau1))

print Tb1

# 2(b)

Tbr = 1000.
Tb3 = Tbr*math.exp(-tau3) + T3*(1.-math.exp(-tau3))
Tb2 = Tb3*math.exp(-tau2) + T2*(1.-math.exp(-tau2))
Tb1 = Tb2*math.exp(-tau1) + T1*(1.-math.exp(-tau1))

print Tb1
