//3%

+y(Y).

+!decide(Target,Xvote)  
        <- 
        Also = Target - Target/33;
        Felso = Target + Target/33;
        ?y(Y);
        !doVote(Target,Also,Felso,Y,Xvote).

+!doVote(Target,Also,Felso,Actual,Prev) : Actual < Also
        <-
                -y(_);
                Vote = Prev + 1;
                .send(sensor_Z,achieve,decide(Target,Vote)).
+!doVote(Target,Also,Felso,Actual,Prev) : Actual > Also & Actual < Felso 
        <-
                -y(_);
                .send(sensor_Z,achieve,decide(Target,Prev)).
+!doVote(Target,Also,Felso,Actual,Prev) : Actual > Felso
        <-
                -y(_);
                Vote = Prev -1;
                .send(sensor_Z,achieve,decide(Target,Vote)).