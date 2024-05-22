//5%

+z(Z).

+!decide(Target,Y)  
        <- 
        Also = Target - Target/20;
        Felso = Target + Target/20;
        ?z(Z);
        !doVote(Also,Felso,Z,Y).

+!doVote(Also,Felso,Actual,Prev) : Actual < Also
        <-
                -z(_);
                Vote = Prev + 1;
                .send(control,achieve,receiveVotes(Vote)).
+!doVote(Also,Felso,Actual,Prev) : Actual > Also & Actual < Felso 
        <-
                -z(_);
                .send(control,achieve,receiveVotes(Prev)).
+!doVote(Also,Felso,Actual,Prev) : Actual > Felso
        <-
                -z(_);
                Vote = Prev - 1;
                .send(control,achieve,receiveVotes(Vote)).