//1%

+x(X).

+!decide(Target)  
        <- 
        Also = Target - Target/100;
        Felso = Target + Target/100;
        ?x(X);
        !doVote(Target,Also,Felso,X).

+!doVote(Target,Also,Felso,Actual) : Actual < Also
        <-
                -x(_);
                .send(sensor_Y,achieve,decide(Target,1)).
+!doVote(Target,Also,Felso,Actual) : Actual > Also & Actual < Felso 
        <-
                -x(_);
                .send(sensor_Y,achieve,decide(Target,0)).
+!doVote(Target,Also,Felso,Actuale) : Actual > Felso
        <-
                -x(_);
                .send(sensor_Y,achieve,decide(Target,-1)).
