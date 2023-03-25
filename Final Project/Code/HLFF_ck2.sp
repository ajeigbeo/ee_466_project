* Basic HLFF circuit

* Control
.option post INGOLD=2

* Include the following file to load transistor models.
.include './45nm_PTM_HP_v2.1.pm'


* Parameters
* Supply voltage
.param Vsup = 1.0V

mn1 n1 nClk 0 0 NMOS_HP L=200n W=50n
mp1 n1 nClk nVdd nVdd PMOS_HP L=200n W=50n 
mn2 n2 n1 0 0 NMOS_HP L=200n W=50n 
mp2 n2 n1 nVdd nVdd PMOS_HP L=200n W=50n 
mn3 n3 n2 0 0 NMOS_HP L=200n W=50n 
mp3 n3 n2 nVdd nVdd PMOS_HP L=200n W=50n 

mp4 nX nClk nVdd nVdd PMOS_HP L=45n W=45n 
mn4 nX nClk n4 0 NMOS_HP L=45n W=150n 
mn5 n4 nD n5 0 NMOS_HP L=45n W=150n
mn6 n5 n3 0 0 NMOS_HP L=45n W=150n 

mp5 nX nD nVdd nVdd PMOS_HP L=45n W=150n 
mp6 nX n3 nVdd nVdd PMOS_HP L=45n W=150n 

mp7 nQ nX nVdd nVdd PMOS_HP L=45n W=90n 
mn7 nQ nClk n7 0 NMOS_HP L=45n W=90n 
mn8 n7 nX n6 0 NMOS_HP L=45n W=90n 
mn9 n6 n3 0 0 NMOS_HP L=45n W=90n 

mn10 nQb nQ 0 0 NMOS_HP L=45n W=300n 
mp8 nQb nQ nVdd nVdd PMOS_HP L=45n W=400n

mn11 nQ nQb 0 0 NMOS_HP L=45n W=45n 
mp9 nQ nQb nVdd nVdd PMOS_HP L=45n W=45n 


cout nQb 0 10f

VVdd nVdd 0 Vsup

VClk nClk 0 Pulse (0 Vsup 200p 10p 10p 490p 1n)

VD nD 0 PWL 0p 0 1n 0 1.01n Vsup 2n Vsup 2.01n 0

.tran 1p 3.5n
.measure tran avg_power avg power from 1n to 3n

.end
