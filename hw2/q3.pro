; Problem 3 - calculating HI profile
;   Calculate the HI profile we would observe for a single layer.
;   Sample the HI line in channels that are 0.5 km/s wide.
;   Plot brightness temperature as a measure of intensity.
;   
;---------------------Settings for plotting----------------------------------;
!P.background = 'FFFFFF'X
loadct=39
charsize=1.3
thick=1.5
;----------------------------------------------------------------------------;
k = double(1.38e-16)
width = double(0.5*1.e5)    ;channel width [cm/s]
nu_o = double(1.42e9)       ;central frequency [MHz]
cloud_center = 0.           ;center the cloud at 0 [km/s]
m_u = double(1.67e-24)      ;atomic mass unit [g]
c = double(3.e10)           ;speed of light [cm/s]
temp = double(120.)         ;gas temperature [K]

;---------------------Profile Function---------------------------------------;
nu = [1419.e6:1421.e6]        ;frequency range (GHz)
delta_nu = (nu_o/c)*sqrt(2.*k*temp/m_u)
sigma=(1./(delta_nu*sqrt(!PI)))*exp(-(nu-nu_o)^2./(delta_nu^2.))
;plot, nu, sigma, color=0
;----------------------------------------------------------------------------;
; a - Case 1
; Thermally broadened line
; --> plot the various profiles in the same plot.

N=[0.1,0.5,1.0,5.0,10.]	;column density [*10^21 / cm^2]

vel_limit = 1.e5
velocity = [-vel_limit:vel_limit:width]

;Set up arrays for optical depth (tau) and 
;   brightness temperature (T_b)
tau=fltarr(n_elements(N),n_elements(velocity))
T_b=fltarr(n_elements(N),n_elements(velocity))

FOR i = 0,n_elements(N)-1 DO BEGIN
    tau[i,*] = 2.19*N[i]*100.*2.*!PI*velocity*sigma/(temp*c)
    T_b[i,*] = temp*(1.-exp(-tau[i,*]))
END

plot, velocity, T_b[4,*], color=0,$
                          ;yrange=[0,0.023],             ystyle=1, $
                          ;xrange=[-vel_limit,vel_limit],xstyle=1, $
                          xtitle='velocity [cm/s]', ytitle='T_b [K]',$
                          charsize=charsize, thick=thick
oplot, velocity, T_b[3,*], color=30, thick=thick
oplot, velocity, T_b[2,*], color=60, thick=thick
oplot, velocity, T_b[1,*], color=230, thick=thick
oplot, velocity, T_b[0,*], color=140, thick=thick


END 
