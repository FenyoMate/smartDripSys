//1%

+x(X).

+!decide(Target)  
        <- 
        Also = Target - Target/100;
        Felso = Target + Target/100;
        ?x(X).
        !doVote(Also,Felso,X);
        .print(Expected + X).

+!doVote(Also,Felso,Actual) : Actual < Also
        <-
                .send(sensor_Y,achieve,decide(N,1)).
+!doVote(Also,Felso,Actual) : Actual > Also & Actual < Felso 
        <-
                .send(sensor_Y,achieve,decide(N,0)).
+!doVote(Also,Felso,Actual) : Actual > Felso
        <-
                .send(sensor_Y,achieve,decide(N,-1)).
