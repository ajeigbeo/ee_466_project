* The first line is always a comment line.
* Case-insensitive

* Control
.option post INGOLD=2

* Include the following file to load transistor models.
.include './45nm_PTM_HP_v2.1.pm'

* Parameters
* Supply voltage
.param Vsup = 1.0V

mp1 n1 nClk nVdd nVdd PMOS_HP L=90n W=75n
mn1 n1 nClk 0 0 NMOS_HP L=90n W=50n
mp2 n2 n1 nVdd nVdd PMOS_HP L=90n W=75n
mn2 n2 n1 0 0 NMOS_HP L=90n W=50n
mp3 n3 n2 nVdd nVdd PMOS_HP L=90n W=75n
mn3 n3 n2 0 0 NMOS_HP L=90n W=50n


mpa nF nClk nVdd nVdd PMOS_HP L=45n W=100n
mna nF nd n7 0 NMOS_HP L=45n W=150n
mnb n7 nClk n8 0 NMOS_HP L=45n W=150n
mnc n8 n3 0 0 NMOS_HP L=45n W=150n


mp4 n4 nF nVdd nVdd PMOS_HP L=45n W=90n
mn4 n4 nF 0 0 NMOS_HP L=45n W=75n

mp5 nF n4 nVdd nVdd PMOS_HP L=45n W=90n
mn5 nF n4 0 0 NMOS_HP L=45n W=75n



mpb nQ nF nVdd nVdd PMOS_HP L=45n W=200n
mnd nQ nClk n9 0 NMOS_HP L=45n W=400n
mne n9 nF 0 0 NMOS_HP L=45n W=400n


mp6 n5 nQ nVdd nVdd PMOS_HP L=45n W=90n
mn6 n5 nQ 0 0 NMOS_HP L=45n W=75n
mp7 nQ n5 nVdd nVdd PMOS_HP L=45n W=90n
mn7 nQ n5 0 0 NMOS_HP L=45n W=75n

mp8 nQb nQ nVdd nVdd PMOS_HP L=45n W=200n
mn8 nQb nQ 0 0 NMOS_HP L=45n W=300n

 
cout nQb 0 10f

VVdd nVdd 0 Vsup

VClk nClk 0 Pulse (0 Vsup 200p 10p 10p 490p 1n)

VD nd 0 PWL 0p 0 1n 0 1.01n Vsup 2n Vsup 2.01n 0

.tran 1p 3.5n
.measure tran avg_power avg power from 1n to 3n

.end










