// Agent X in project smartDripSys

/* Szenzorok szimulált változói */
+y(Y).

+!decide(Target,XVote) : true 
        <- 
        .send(sensor_Z,achieve,decide(N,YVote)).
