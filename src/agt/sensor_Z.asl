//5%

+z(Z).

+!decide(Target,Y)  
        <- 
        .print("Decide: ",Target);
        .print("Decision of Y: ",Y);
        Also = Target - Target/20;
        Felso = Target + Target/20;
        ?z(Z);
        .print("Correctional values: ", Also, " ", Felso);
        !doVote(Also,Felso,Z,Y).

+!doVote(Also,Felso,Actual,Prev) : Actual < Also
        <-
                -z(_);
                Vote = Prev + 1;
                .print("Vote: ",Vote);
                .send(control,achieve,receiveVotes(Vote)).
+!doVote(Also,Felso,Actual,Prev) : Actual > Also & Actual < Felso 
        <-
                -z(_);
                .print("Vote: ",Prev);
                .send(control,achieve,receiveVotes(Prev)).
+!doVote(Also,Felso,Actual,Prev) : Actual > Felso
        <-
                -z(_);
                Vote = Prev - 1;
                .print("Vote: ",Vote);
                .send(control,achieve,receiveVotes(Vote)).