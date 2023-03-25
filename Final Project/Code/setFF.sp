*Semidynamic edge-triggered flip-flop.

*control 
.option post INGOLD =2

*load transistor model
.include './45nm_PTM_HP_v2.1.pm'

*parameters 
*Supply voltage
.param Vsup = 1.0V

mn1 n1 nClk 0 0 NMOS_HP L=90n W=50n 
mp1 n1 nClk nVdd nVdd PMOS_HP L=90n W=75n 
mn2 n2 n1 0 0 NMOS_HP L=90n W=50n 
mp2 n2 n1 nVdd nVdd PMOS_HP L=90n W=75n

mp3 n6 nX nVdd nVdd PMOS_HP L=45n W=75n 
mp4 n6 n2 nVdd nVdd PMOS_HP L=45n W=75n 
mn3 n6 nX n3 0 NMOS_HP L=45n W=50n
mn4 n3 n2 0 0 NMOS_HP L=45n W=50n 

mp5 nX nClk nVdd nVdd PMOS_HP L=45n W=150n 
mn5 nX n6 n5 0 NMOS_HP L=45n W=400n 
mn6 n5 nD n4 0 NMOS_HP L=45n W=400n 
mn7 n4 nClk 0 0 NMOS_HP L=45n W=400n 

mp7 n9 nX nVdd nVdd PMOS_HP L=45n W=75n
mn8 n9 nX 0 0 NMOS_HP L=45n W=50n 
mp8 nX n9 nVdd nVdd PMOS_HP L=45n W=75n 
mn9 nX n9 0 0 NMOS_HP L=45n W=50n 

mp9 n8 nX nVdd nVdd PMOS_HP L=45n W=150n 
mn10 n8 nClk n7 0 NMOS_HP L=45n W=400n 
mn14 n7 nX 0 0 NMOS_HP L=45n W=400n

mp10 n10 n8 nVdd nVdd PMOS_HP L=45n W=75n 
mn11 n10 n8 0 0 NMOS_HP L=45n W=50n 
mp11 n8 n10 nVdd nVdd PMOS_HP L=45n W=75n 
mn12 n8 n10 0 0 NMOS_HP L=45n W=50n 

mp12 nQb n8 nVdd nVdd PMOS_HP L=45n W=200n 
mn13 nQb n8 0 0 NMOS_HP L=45n W=300n 
 

cout nQb 0 10f

VVdd nVdd 0 Vsup

VClk nClk 0 Pulse (0 Vsup 200p 10p 10p 490p 1n)

VD nD 0 PWL 0p 0 1n 0 1.01n Vsup 2n Vsup 2.01n 0

.tran 1p 3.5n
.measure tran avg_power avg power from 1n to 3n

.end
 
