*Explicit-pulsed semidynamic flip-flops.

*control 
.option post INGOLD =2

*load transistor model
.include './45nm_PTM_HP_v2.1.pm'

*parameters 
* Supply voltage
.param Vsup = 1.0V

*Inverters 1-4
minv1n n1 nClk 0 0 NMOS_HP L=90n W=50n
minv1p n1 nClk nVdd nVdd PMOS_HP L=90n W=75n
minv2n n2 n1 0 0 NMOS_HP L=90n W=50n
minv2p n2 n1 nVdd nVdd PMOS_HP L=90n W=75n
minv3n n3 n2 0 0 NMOS_HP L=90n W=50n
minv3p n3 n2 nVdd nVdd PMOS_HP L=90n W=75n


*Nand Circuit
mn1 n4 n3 0 0 NMOS_HP L=45n W=45n
mn2 n6 nClk n4 0 NMOS_HP L=45n W=45n
mp1 n6 nClk nVdd nVdd PMOS_HP L=45n W=90n 
mp2 n6 n3 nVdd nVdd PMOS_HP L= 45n W=90n 

*Transmission Gate
mtgn nD n6b nQ 0 NMOS_HP L=45n W=400n 
mtgp nQ n6 nD nVdd PMOS_HP L=45n W=800n 

minv4n n6b n6 0 0 NMOS_HP L=45n W=50n
minv4p n6b n6 nVdd nVdd PMOS_HP L=45n W=100n

*Inverters 
minv5n n7 nQ 0 0 NMOS_HP L=45n W=50n
minv5p n7 nQ nVdd nVdd PMOS_HP L=45n W=75n

*Inverters 
minv6n nQ n7 0 0 NMOS_HP L=45n W=100n
minv6p nQ n7 nVdd nVdd PMOS_HP L=45n W=180n

*Inverters 
minv7n nQb nQ 0 0 NMOS_HP L=45n W=200n
minv7p nQb nQ nVdd nVdd PMOS_HP L=45n W=300n

cout nQb 0 10f

VVdd nVdd 0 Vsup

VClk nClk 0 Pulse (0 Vsup 200p 10p 10p 490p 1n)

VD nD 0 PWL 0p 0 1n 0 1.01n Vsup 2n Vsup 2.01n 0

.tran 1p 3.5n
.measure tran avg_power avg power from 1n to 3n

.end
