* The first line is always a comment line.

.option post INGOLD=2

.include './45nm_PTM_HP_v2.1.pm'

.param Vsup = 1.0V

minv1n n1 nClk 0 0 NMOS_HP L=90n W=50n
minv1p n1 nClk nVdd nVdd PMOS_HP L=90n W=75n
minv2n n2 n1 0 0 NMOS_HP L=90n W=50n
minv2p n2 n1 nVdd nVdd PMOS_HP L=90n W=75n
minv3n n3 n2 0 0 NMOS_HP L=90n W=50n
minv3p n3 n2 nVdd nVdd PMOS_HP L=90n W=75n

mnandn1 n4 nClk n5 0 NMOS_HP L=45n W=50n
mnandn2 n5 n3 0 0 NMOS_HP L=45n W=50n
mnandp1 n4 nClk nVdd nVdd PMOS_HP L=45n W=75n
mnandp2 n4 n3 nVdd nVdd PMOS_HP L=45n W=75n

minv4n n6 n4 0 0 NMOS_HP L=45n W=50n
minv4p n6 n4 nVdd nVdd PMOS_HP L=45n W=75n

mp1 n7 n6 nVdd nVdd PMOS_HP L=45n W=150n
mn1 n7 nD n8 0 NMOS_HP L=45n W=400n
mn2 n8 n6 0 0 NMOS_HP L=45n W=400n

mp2 n9 n7 nVdd nVdd PMOS_HP L=45n W=150n
mn3 n9 n6 n10 0 NMOS_HP L=45n W=400n
mn4 n10 n7 0 0 NMOS_HP L=45n W=400n

minv5n n7 n11 0 0 NMOS_HP L=45n W=50n
minv5p n7 n11 nVdd nVdd PMOS_HP L=45n W=75n
minv6n n11 n7 0 0 NMOS_HP L=45n W=50n
minv6p n11 n7 nVdd nVdd PMOS_HP L=45n W=75n

minv7n n9 n12 0 0 NMOS_HP L=45n W=50n
minv7p n9 n12 nVdd nVdd PMOS_HP L=45n W=75n
minv8n n12 n9 0 0 NMOS_HP L=45n W=50n
minv8p n12 n9 nVdd nVdd PMOS_HP L=45n W=75n

minv9n nQb n9 0 0 NMOS_HP L=45n W=100n
minv9p nQb n9 nVdd nVdd PMOS_HP L=45n W=150n

minv10n nQ nQb 0 0 NMOS_HP L=45n W=200n
minv10p nQ nQb nVdd nVdd PMOS_HP L=45n W=300n

* load cap (use 10fF)
cout nQ 0 10f

VVdd nVdd 0 Vsup

* Pulse (<initial voltage> <peak voltage> <initial delay> <rise time> <fall time> <pulse width>
VClk nClk 0 Pulse (0 Vsup 200p 10p 10p 490p 1n)

VD nD 0 PWL 0p 0 1n 0 1.01n Vsup 2n Vsup 2.01n 0

.tran 1p 3.5n
.measure tran avg_power avg power from 1n to 3n

.end
