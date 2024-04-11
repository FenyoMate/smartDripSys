// Agent X in project smartDripSys

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- .print("Starting measurement."). 
                   +incomingData(X).
                   !decideX.

+!decideX : incomingData(X) & desiredData(D) & (X > D * 1.05) <- .send(Control, tell, -1).
                                                                 .send(Y, achieve, decideY).
+!decideX : incomingData(X) & desiredData(D) & (X <= D * 1.05) & (X >= D * 0.95) <- .send(Control, tell, 0).
                                                                                      .send(Y, achieve, decideY).
+!decideX : incomingData(X) & desiredData(D) & (X < D * 0.95) <- .send(Control, tell, 1).
                                                                   .send(Y, achieve, decideY).

