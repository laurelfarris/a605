import math
import astropy.constants as cnst
import numpy

pi = math.pi
sb = cnst.sigma_sb.cgs.value
Rsun = cnst.R_sun.cgs.value
c = cnst.c.cgs.value
h = cnst.h.cgs.value
k = cnst.k_B.cgs.value

# (1b)

Teff = 42000.
radius = Rsun*11.5
Nu = 17.4e48
rS = 77.
tau = 0.48

S_volume = (4./3.)*pi*(rS*3.e18)**3
S_surfaceArea = (4.)*pi*(rS*3.e18)**2

# For "typical O6 star"
alpha = 4.e-13
sigma = 6.e-18

Lstar = sb*(Teff**4.)*4.*pi*radius**2.
Ephoton = Lstar/Nu
wavelength = h*c/Ephoton
Ephoton = h*c/(6563.e-8)
L_Halpha = Ephoton*(0.5*Nu)
#print L_Halpha

# (1c)

wavelength = 6563.e-8
BB = ( ( 2.*pi*h*(c**2)/(wavelength**5) ) *
( 1./((math.exp(h*c/(wavelength*k*Teff)))-1.)) )
surface_area = 4.*pi*radius**2
stellarLum = BB * surface_area * 1.e-8 * pi
#print stellarLum
#print 'EW = ', L_Halpha/stellarLum

# (1d)

ne = 1.
rate = 3.e-25
#print rate*ne*0.45*Nu

# (1e)

n_e = 10.
R_so = ( 3.*Nu/(4.*pi*alpha*(n_e**2)) )**(1./3.)
Ncol = 2.*(rS*3.e18)*n_e
ext = 13.*(1.805*2.9e-22/3.1)
tau = ext*Ncol/1.086
#print tau


# (1g)
d = 6.
temp = 1.e4
n_e = 1.
me = cnst.m_e.cgs.value
e_ff = ( (2.*pi*k*temp/(3.*me)) * (32.*pi*math.exp(6.)/(3.*h*me*c**3))
           * n_e**2  )

hv = 0.87/6.2415e11
j_v = ( (5.44e-39 * (n_e**2) / (math.sqrt(temp))) *
math.exp(-hv/(k*temp)) )
wavelength = 1.4e-4
nu = c/wavelength

j_v = ((j_v*4.*pi*S_volume)/(4.*pi*d**2)) * nu

#print 'radio continuum: ', j_v, ' [erg/cm^3/s]'

# (1h)

H_beta = (L_Halpha/4.) * 10.**(-0.4*( (1./6563.e-8)-(1./4861.e-8)  ))
print H_beta

