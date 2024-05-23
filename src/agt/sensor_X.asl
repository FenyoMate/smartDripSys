//1%

+x(X).

+!decide(Target)  
        <- 
        .print("Decide: ",Target);
        Bottom = Target - Target/100;
        Top = Target + Target/100;
        ?x(X);
        .print("Correctional values: " , Bottom , " " , Top);
        !doVote(Target,Bottom,Top,X).

+!doVote(Target,Bottom,Top,Actual) : Actual < Bottom
        <-
                -x(_);
                .print("Vote: 1");
                .send(sensor_Y,achieve,decide(Target,1)).
+!doVote(Target,Bottom,Top,Actual) : Actual > Bottom & Actual < Top 
        <-
                -x(_);
                .print("Vote: 0");
                .send(sensor_Y,achieve,decide(Target,0)).
+!doVote(Target,Bottom,Top,Actuale) : Actual > Top
        <-
                -x(_);
                .print("Vote: -1");
                .send(sensor_Y,achieve,decide(Target,-1)).
