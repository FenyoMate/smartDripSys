//5%

+z(Z).

+!decide(Target,Y)  
        <- 
        .print("Decide: ",Target);
        .print("Decision of Y: ",Y);
        Bottom = Target - Target/20;
        Top = Target + Target/20;
        ?z(Z);
        .print("Correctional values: ", Bottom, " ", Top);
        !doVote(Bottom,Top,Z,Y).

+!doVote(Bottom,Top,Actual,Prev) : Actual < Bottom
        <-
                -z(_);
                Vote = Prev + 1;
                .print("Vote: ",Vote);
                .send(control,achieve,receiveVotes(Vote)).
+!doVote(Bottom,Top,Actual,Prev) : Actual > Bottom & Actual < Top 
        <-
                -z(_);
                .print("Vote: ",Prev);
                .send(control,achieve,receiveVotes(Prev)).
+!doVote(Bottom,Top,Actual,Prev) : Actual > Top
        <-
                -z(_);
                Vote = Prev - 1;
                .print("Vote: ",Vote);
                .send(control,achieve,receiveVotes(Vote)).