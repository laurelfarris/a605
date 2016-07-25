; Problem 3 - part b
;   Calculate the HI profile we would observe for a single layer.
;   Sample the HI line in channels that are 0.5 km/s wide.
;   Plot brightness temperature as a measure of intensity.
;   


k = double(1.38e-16)
width = double(0.5e5)       ;channel width [cm/s]
nu_o = double(1.42e9)       ;central frequency [MHz]
cloud_center = 0.           ;center the cloud at 0 [km/s]
m_u = double(1.67e-24)      ;atomic mass unit [g]
c = double(3.e10)           ;speed of light [cm/s]
temp = double(120.)         ;gas temperature [K]

;nu = [1419.e6:1421.e6]        ;frequency range
delta_nu = (nu_o/c)*sqrt(2.*k*temp/m_u)
;profile_func = (1./(delta_nu*sqrt(!PI)))*exp(-(nu-nu_o)^2./(delta_nu^2.))

;plot, nu, profile_func

;----------------------------------------------------------------------------;

; b - Case 2
; Broadening due to turbulence
; --> plot HI profile for N=10 cm^-3

N=10.   ;column density [*10^21 / cm^2]

sigma = 8.e5		;[cm/s]
vel_limit = 5.e6	;[cm/s]
velocity = [-vel_limit:vel_limit:width]

tau=fltarr(n_elements(velocity))
T_b=fltarr(n_elements(velocity))

    tau = 2.19*N*(100./temp)*(1./sigma)*exp(-velocity^2./(2.*sigma^2.))
    T_b = (temp*(1.-exp(-tau)))

!P.background='FFFFFF'X
loadct=39
charsize=1.3
thick=1.5

plot, velocity, T_b,      color=0,$
                          xrange=[-vel_limit,vel_limit],xstyle=1, $
                          xtitle='velocity [cm/s]',$
						  ;charsize=charsize,$
						  ytitle='T_b [K]',$
                          charsize=charsize, thick=thick


END 
