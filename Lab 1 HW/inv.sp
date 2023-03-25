* The first line is always a comment line.
* Case-insensitive

* Control
.option post INGOLD=2

* Include the following file to load transistor models.
.include './45nm_PTM_HP_v2.1.pm'

* Parameters
* Supply voltage
.param Vsup = 1.0V

* Inverter. use NMOS_HP and PMOS_HP for NMOS and PMOS transistors.

*** Transistor names should begin with "m".
*** Use "nXXXXX" for node names.
*** Use 0 for the ground.
* Format: <transistor name> <drain> <gate> <source> <body> <type> L(Length) W(Width)
mn1 nOut nA n2 0 NMOS_HP L=45n W=50n

mn2 n2 nB 0 0 NMOS_HP L=45n W=50n

mn3 nOut nC 0 0 NMOS_HP L=45n W=50n

mp1 nOut nA n1 nVdd PMOS_HP L=45n W=75n

mp2 nOut nB n1 nVdd PMOS_HP L=45n W=75n

mp3 n1 nC nVdd nVdd PMOS_HP L=45n W=75n

*** Output load capacitance. Capacitors should begin with "c".
* Format: <capacitor name> <node 1> <node 2> <value>
cout nOut 0 10f

* Power supply
* Format: <power supply name> <node 1> <node 2> <value>
*** Voltage source names should begin with "v".
VVdd nVdd 0 Vsup

* Input signal (independent voltage source)
* Format: <signal name> <node 1> <node 2> <signal>
* For the signal, we use a piecewise linear (PWL) source. Format: ... PWL time1 value1 time2 value2 ...
VC nC 0 PWL 0n 0 200p 0 210p Vsup 1.7n Vsup 1.71n 0 6.2n 0 6.21n Vsup 7n Vsup
VB nB 0 PWL 0n 0 3.2n 0 3.21n Vsup 4.7n Vsup 4.71n 0 6.2n 0 6.21n Vsup 7n Vsup
VA nA 0 PWL 0n 0 3.2n 0 3.21n Vsup 4.7n Vsup 4.71n 0 6.2n 0 6.21n Vsup 7n Vsup

* Transient analysis. Simulate up to 2.5ns.
.tran 1p 7n

.end
