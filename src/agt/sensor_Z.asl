// Agent X in project smartDripSys

/* Szenzorok szimulált változói */
+z(Z).

+!decide(Target,YVote) : true
        <- 
        .send(control,tell,receiveVotes(ZVote)).