// Agent X in project smartDripSys

/* Szenzorok szimulált változói */
nedvesseg(0.0).

/* Plans */

+!nedves(N): N>0.5 <- .send(control, tell, nedves); .send(control, tell, nedvesseg).

+!nedves(N): N<=0.5 <- .send(control, tell, szaraz); .send(control, tell, nedvesseg).