
c = 3.e10	; speed of light [cm/s]
h = 6.626e-27	; Planck's constant [cm^2 g s^-1]
k = 1.38e-16	; Boltzmann's constant [cm^2 g s^2 K^-1]

; CMB
temp=2.7	; temperature [K]
freq=160.2e9	; frequency [Hz]

;Calculate the blackbody function [erg cm^-2 sr^-1 Hz^-1] ~ Intensity
B_freq = (2.*h*freq^3/(c^2))*(1./   ( exp( h*freq/(k*temp)  )-1 ))

; Star
