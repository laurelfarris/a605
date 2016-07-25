


r_d = 0.1e-4
cross_sec = !PI*r_d^2.
N_d = 1.6e-5 ;Dust column density [g cm^-2]
M_d_total = 1.e41
R_galaxy = 15000. * (3.e18) ;[cm]
rho_d = 1. ;[g cm^2]
volume_d = (4./3.)*!PI*r_d^3.
m_d = rho_d * volume_d

z_o = double(7.1e21/(3.e18))
print, z_o


END
