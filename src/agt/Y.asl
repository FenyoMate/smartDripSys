// Agent Y in project smartDripSys

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- .print("Starting measurement."). 
                   +incomingData(Y).
                   !decideY.

+!decideY : incomingData(Y) & desiredData(D) & (Y > D * 1.03) <- .send(Control, tell, -1).
                                                                 .send(Z, achieve, decideZ).
+!decideY : incomingData(Y) & desiredData(D) & (Y <= D * 1.03) & (Y >= D * 0.97) <- .send(Control, tell, 0).
                                                                                      .send(Z, achieve, decideZ).
+!decideY : incomingData(Y) & desiredData(D) & (Y < D * 0.97) <- .send(Control, tell, 1).
                                                                   .send(Z, achieve, decideZ).

