
M_sun = 2.e33 ;[g]

; 1b

    N_HI = double(1.e21)	; column density of HI (gas)
    H = double(120. * (3.e18))	; scale height [cm]
    nn_HI = N_HI/( 2.*H )	; number density of HI 
    ;print, nn_HI


; 1c
   
    N_HI = double(1.e21)              ; column density of HI (gas)
    R_galaxy = double(15. * (3.e18))  ; [cm]
    m_u = double(1.67e-24)
    M_HI = ( ( N_HI * !PI*R_galaxy^2) * ( m_u ) )
    ;print, M_HI
    ;print, M_HI/M_sun
    M_everythingelse = 0.3*(M_HI/0.7)
    ;print, M_everythingelse
    ;print, M_everythingelse/M_sun
   

; Problem 2

    r_d = double(0.1e-4)	; [cm]
    rho_d = 1.			; [g cm^-3]

 ; 2b1

    N_dust = 1.67e-5		; [g cm^-2]
    N_dust = N_dust / ( rho_d * ( (4./3.)*!PI*(r_d^3) ) )
    cross_sec = !PI*r_d^2
    delta_m = -2.5*alog10( exp(-N_dust*cross_sec) )
    ;print, N_dust
    ;print, delta_m

 ; 2b2

    rho_dust_grain = 1.
    radius_dust_grain = 0.1e-4   ; [cm]
    mass_dust_grain = rho_dust_grain*(4./3.)*!PI*(radius_dust_grain^3)

    n_dust_grain = 0.01*m_u/mass_dust_grain
    ;print, n_dust_grain
    delta_m = -2.5*alog10( exp(-3.14e-10*1.2e10) )
    print, delta_m

 ; 2br32
      sigma = 3.14e-10
      N = 4.e9/0.707
      delta_m = -2.5*alog( exp(-N*sigma))
      print, delta_m
  STOP

; Problem 3

;  3a

    k = 1.38e-16
    m_u = double(1.67e-24)
    m_e = double(9.10e-24)

    T = 5000.
    m = m_e
    FWHM = sqrt( 8.*k*T*alog(2.)/m  )
 ;   print, FWHM

;  3d

centralfreq = 1420.e6
centralwave = 21.      
T = 5000.
freq = (sqrt(8.*alog(2)*k/((3.e10)^2))*sqrt(T/m_u))*centralfreq
;print, freq
;print, freq*centralwave




END
