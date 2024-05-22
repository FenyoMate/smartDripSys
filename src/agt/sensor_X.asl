//1%

+x(X).

+!decide(Target)  
        <- 
        .print("Decide: ",Target);
        Also = Target - Target/100;
        Felso = Target + Target/100;
        ?x(X);
        .print("Correctional values: " , Also , " " , Felso);
        !doVote(Target,Also,Felso,X).

+!doVote(Target,Also,Felso,Actual) : Actual < Also
        <-
                -x(_);
                .print("Vote: 1");
                .send(sensor_Y,achieve,decide(Target,1)).
+!doVote(Target,Also,Felso,Actual) : Actual > Also & Actual < Felso 
        <-
                -x(_);
                .print("Vote: 0");
                .send(sensor_Y,achieve,decide(Target,0)).
+!doVote(Target,Also,Felso,Actuale) : Actual > Felso
        <-
                -x(_);
                .print("Vote: -1");
                .send(sensor_Y,achieve,decide(Target,-1)).
