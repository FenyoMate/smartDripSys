// Agent Z in project smartDripSys

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- .print("Starting measurement."). 
                   +incomingData(Z).
                   !decideZ.

+!decideZ : incomingData(Z) & desiredData(D) & (Z > D * 1.01) <- .send(Control, tell, -1).
+!decideZ : incomingData(Z) & desiredData(D) & (Z <= D * 1.01) & (Z >= D * 0.99) <- .send(Control, tell, 0).
+!decideZ : incomingData(Z) & desiredData(D) & (Z < D * 0.99) <- .send(Control, tell, 1).