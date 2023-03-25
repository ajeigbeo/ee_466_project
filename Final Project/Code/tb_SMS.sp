*Time-borrowing static master-slave (tb-SMS).


*control 
.option post INGOLD =2

*load transistor model
.include './45nm_PTM_HP_v2.1.pm'

*parameters 
*Supply voltage
.param Vsup = 1.0V


minv1n nClkb nClk 0 0 NMOS_HP L=90n W=50n
minv1p nClkb nClk nVdd nVdd PMOS_HP L=90n W=75n
minv2n n2 nClkb 0 0 NMOS_HP L=90n W=50n
minv2p n2 nClkb nVdd nVdd PMOS_HP L=90n W=75n
minv3n n3 n2 0 0 NMOS_HP L=90n W=50n
minv3p n3 n2 nVdd nVdd PMOS_HP L=90n W=75n
minv4n n3b n3 0 0 NMOS_HP L=90n W=50n
minv4p n3b n3 nVdd nVdd PMOS_HP L=90n W=75n

mtg1p n6 n3b nD nVdd PMOS_HP L=45n W=800n 
mtg1n nD n3 n6 0 NMOS_HP L=45n W=1200n

mp1 n5 n8 nVdd nVdd PMOS_HP L=45n W=90n
mp2 n6 n3 n5 nVdd PMOS_HP L=45n W=90n 
mn1 n6 n3b n7 0 NMOS_HP L=45n W=90n
mn2 n7 n8 0 0 NMOS_HP L=45n W=90n 

minv5n n8 n6 0 0 NMOS_HP L=45n W=50n
minv5p n8 n6 nVdd nVdd PMOS_HP L=45n W=75n

mtg2p n10 n8 nClkb nVdd PMOS_HP L=45n W=800n 
mtg2n n8 nClk n10 0 NMOS_HP L=45n W=1200n

mp3 n9 n12 nVdd nVdd PMOS_HP L=45n W=150n
mp4 n10 nClk n9 nVdd PMOS_HP L=45n W=150n 
mn3 n10 nClkb n11 0 NMOS_HP L=45n W=400n
mn4 n11 n12 0 0 NMOS_HP L=45n W=400n 

minv7n n12 n10 0 0 NMOS_HP L=45n W=100n
minv7p n12 n10 nVdd nVdd PMOS_HP L=45n W=150n

minv6n nQ n10 0 0 NMOS_HP L=45n W=200n
minv6p nQ n10 nVdd nVdd PMOS_HP L=45n W=300n

cout nQ 0 10f

VVdd nVdd 0 Vsup

VClk nClk 0 Pulse (0 Vsup 200p 10p 10p 490p 1n)

VD nD 0 PWL 0p 0 1n 0 1.01n Vsup 2n Vsup 2.01n 0

.tran 1p 3.5n
.measure tran avg_power avg power from 1n to 3n

.end
 
