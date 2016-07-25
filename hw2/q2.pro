;; Problem 2

; (a)
; Consider an O star with a bolometric luminosity of 10^38 erg/s. 
; At which distance from this star will the energy density of its radiation field
; equal that of the CMB?

h = double(6.626e-27)
k = double( 1.38e-16)
c = double(3.e10)


L_star = double(1.e38)


T_cmb = 2.7
nu_cmb = double(160.2e9)

;B_cmb = (2.*h*n(u^3.)/(c^2.))*(1/ (exp(h*nu/(k*T_cmb)) -1  ) )
B_cmb = (2.*(!PI^4.)*(k^4.)*(T_cmb^4.)/(15.*(h^3.)*(c^2.)))

E_density_cmb = (4.*!PI/c)*B_cmb


F_star = L_star/(4.*!PI) 

E_density_star = L_star * (1./c) * (1/ (4.*!PI))

END
