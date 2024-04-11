// Agent Control in project smartDripSys

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

+!start : true <- .print("Waiting for votes.").

+doVoteX(X) : true <- .print("Received vote from X: ", X).
+doVoteY(Y) : true <- .print("Received vote from Y: ", Y).
+doVoteZ(Z) : true <- .print("Received vote from Z: ", Z).
                       +allVotes(X, Y, Z).
                       !check.

+!check : allVotes(X, Y, Z) & (X + Y + Z > 1) <- .send(Actuator, achieve, water).
+!check : allVotes(X, Y, Z) & (X + Y + Z < -1) <- .send(Actuator, achieve, noWater).
+!check : allVotes(X, Y, Z) & (X + Y + Z >= -1) & (X + Y + Z <= 1) <- .send(Actuator, achieve, nothing).