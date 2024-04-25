// Agent X in project smartDripSys

/* Szenzorok szimulált változói */
nedvesseg(0.2).
/* Plans */

+!nedves(N): N>0.5 <- .send(control, tell, nedves); .send(control, tell, N).

+!nedves(N): N<=0.5 <- .send(control, tell, szaraz); .send(control, tell, N).