


;Constants/Conversions
m_u = double(1.6e-24)    ;[g]
pc_to_cm = double(3.e18) ;[cm]
M_sun = double(2.e33)    ;[g]
kpc_to_pc = double(1000.);[pc]
micron_to_cm = 1.e-4      ;[cm]
k = double(1.38e-30)	 ;[erg K^-1]

; Exercise 1

N_HI_cgs = 1.e21 ; Column density [cm^-2]

 ; 1a
    N_HI_astro = N_HI_cgs * (pc_to_cm)^2 * m_u * (1./M_sun)
   ; print, N_HI_astro

 ; 1b
    H = 120. ;Scale height [pc]
    H = H*pc_to_cm ;Scale height [cm]
    n = N_HI_cgs/(2*H)
   ;print, n

 ; 1c 
    R = 15.*kpc_to_pc*pc_to_cm ; Galaxy disk radius [cm]
    M = N_HI_cgs * m_u * !PI * (R^2.) ; Total mass of galaxy [g]
    M_solar = M/M_sun

 ; print, M
 ; print, M_solar



; Exercise 2

N_HI_cgs = 1.e21 ;Column density [cm^-2]
H = 120. ;Scale height [pc]
H = H*pc_to_cm ;Scale height [cm]
m_dust_to_gas = 0.01 ; dust to gas mass ratio
r_d = 0.1*micron_to_cm  ; radius of dust grain (d) [cm]
rho_d = 1. ; mass density of dust material [g cm^-3]
area = !PI*(R^2.)

 ; 2a
    N_d = (m_dust_to_gas*M)/area   ; dust column density [g cm^-2]
   ; print, "Dust column density = ",N_d, " g cm^-2"

 ; 2b
    N_d = N_d*(3./(4.*!PI*(r_d^3.)))
    ;print, "Dust column density = ",N_d, " cm^-2"
    area_d = !PI*(r_d^2.)  ; cross sec. of dust grain [cm^-2]

    ;2b1
       delta_m = -2.5*alog10(exp( -(N_d*area_d)  ))
 ;      print, "The magnitude difference is: ",delta_m
    ;2b2
       N_plane = 1.9e8
       delta_m = -2.5*alog10(exp( -(N_plane*area_d)  ))
  ;     print, "The magnitude difference is: ",delta_m
    ;2b3
       delta_m = -2.5*alog10(exp( -(N_d*area_d)  ))
   ;    print, "The magnitude difference is: ",delta_m
    
   number_density_dust = (4./3.)*!PI*(r_d)^3.
  ; print, "The number density of dust in the plane is ",number_density_dust
   column_density_dust = number_density_dust * (pc_to_cm)
  ; print, "The column density of dust in the plane is ",column_density_dust,$
              ;  " per square parsec."






; Exercise 3 - Maxwellian velocity distribution f(w)


    temp = 5000
    m_p = m_u
    w_mp = sqrt( (2.*k*temp)/m_p )
    w = FINDGEN(1000, increment=0.001, start=-0.5)
    f = ( m_p/(2.*!PI*k*temp) )^(3./2.) * exp( -(m_p*w^2.)/(2.*k*temp)  )

  ; plot, w,f

  ; 3a Calculate the FWHM of f(w) for protons in a 5000 K plasma
      
      f = FIX(f)
      HM = WHERE( f EQ MAX(f)/2. ) 
      ii = HM[0]
      jj = HM[1]
    ;  print, "FWHM = ", w[ jj ] - w[ ii ]

  ; Now for electrons in a 5000 K plasma...

    m_e = 9.1e-28 ; electron mass [g]
    w = FINDGEN(1000, increment=0.001, start=-0.5)
    f = ( m_e/(2.*!PI*k*temp) )^(3./2.) * exp( -(m_e*w^2.)/(2.*k*temp)  )
      f = FIX(f)
      HM = WHERE( f EQ MAX(f)/2. ) 
      ii = HM[0]
      jj = HM[1]
     ; print, "FWHM = ", w[ jj ] - w[ ii ]

sigma = sqrt( k*temp/m_p )
FWHM = (2.*sqrt( 2.*alog(2.) )) * sigma 
;print, sigma
print, "The fwhm is :",FWHM

 ; 3b 

   lambda = 6563. ; central wavelength for Halpha [Angstronms]
   c = 3.e10 ; speed of light [cm s^-1]
   delta_lambda = (lambda/c)*sqrt( (2.*k*temp)/m_p  )
 ;  print, delta_lambda
   delta_lambda = 4.301e-7*lambda*sqrt(temp)  ;/m_u)
 ;  print, delta_lambda

END



