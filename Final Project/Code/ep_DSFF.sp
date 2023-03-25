*Explicit Pulsed dual edge-triggered flip-flop schematic

*control 
.option post INGOLD =2

*load transistor model
.include './45nm_PTM_HP_v2.1.pm'

*parameters 
* Supply voltage
.param Vsup = 1.0V

*Inverters
minv1n n1 nClk 0 0 NMOS_HP L=90n W=50n
minv1p n1 nClk nVdd nVdd PMOS_HP L=90n W=75n
minv2n n2 n1 0 0 NMOS_HP L=90n W=50n
minv2p n2 n1 nVdd nVdd PMOS_HP L=90n W=75n
minv3n n3 n2 0 0 NMOS_HP L=90n W=50n
minv3p n3 n2 nVdd nVdd PMOS_HP L=90n W=75n

mtg1n n1 n3 n5 0 NMOS_HP L=45n W=800n 
mtg1p n5 n3b n1 nVdd PMOS_HP L=45n W=1200n

mtg2n nClk n3b n5 0 NMOS_HP L=45n W=800n 
mtg2p n5 n3 nClk nVdd PMOS_HP L=45n W=1200n

mtg3n nD n5b nQ 0 NMOS_HP L=45n W=800n 
mtg3p nQ n5 nD nVdd PMOS_HP L=45n W=1200n

*Inverters 
minv4n n5b n5 0 0 NMOS_HP L=45n W=150n
minv4p n5b n5 nVdd nVdd PMOS_HP L=45n W=200n

minv5n n6 nQ 0 0 NMOS_HP L=45n W=50n
minv5p n6 nQ nVdd nVdd PMOS_HP L=45n W=75n

minv6n nQ n6 0 0 NMOS_HP L=45n W=50n
minv6p nQ n6 nVdd nVdd PMOS_HP L=45n W=75n

minv7n nQb nQ 0 0 NMOS_HP L=45n W=200n
minv7p nQb nQ nVdd nVdd PMOS_HP L=45n W=300n

cout nQb 0 10f

VVdd nVdd 0 Vsup

VClk nClk 0 Pulse (0 Vsup 200p 10p 10p 490p 1n)

VD nD 0 PWL 0p 0 1n 0 1.01n Vsup 2n Vsup 2.01n 0

.tran 1p 3.5n
.measure tran avg_power avg power from 1n to 3n

.end
