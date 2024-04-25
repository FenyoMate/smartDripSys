// Agent Control in project smartDripSys

/* Initial beliefs and rules */

nedves[source(x),source(y),source(z)].
szaraz[source(x),source(y),source(z)].

/* Initial goals */
!start.

/* Plans */

+!start
    <-  .print("Starting the watering system.");
        !water(0,0,0).

+!water(X,Y,Z) : X<0.5 & Y<0.5 & Z<0.5
    <-  .print("Watering all sources.", X, Y, Z);
        !water(X+0.1, Y+0.1, Z+0.1).

+!water(X,Y,Z) : X>=0.5 & Y>=0.5 & Z>=0.5
    <-  .print("All sources are wet enough.").

