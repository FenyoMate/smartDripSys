//3%

+y(Y).

+!decide(Target,Xvote)  
        <- 
        .print("Decide: ",Target);
        .print("Decision of X is: ",Xvote);
        Bottom = Target - Target/33;
        Top = Target + Target/33;
        ?y(Y);
        .print("Correctional values: ", Bottom, " ", Top);
        !doVote(Target,Bottom,Top,Y,Xvote).

+!doVote(Target,Bottom,Top,Actual,Prev) : Actual < Bottom
        <-
                -y(_);
                Vote = Prev + 1;
                .print("Vote: ", Vote);
                .send(sensor_Z,achieve,decide(Target,Vote)).
+!doVote(Target,Bottom,Top,Actual,Prev) : Actual > Bottom & Actual < Top 
        <-
                -y(_);
                .print("Vote: ", Prev);
                .send(sensor_Z,achieve,decide(Target,Prev)).
+!doVote(Target,Bottom,Top,Actual,Prev) : Actual > Top
        <-
                -y(_);
                Vote = Prev -1;
                .print("Vote: ", Vote);
                .send(sensor_Z,achieve,decide(Target,Vote)).