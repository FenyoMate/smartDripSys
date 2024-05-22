agent(sensor_X).

+x(X).

+!decide(Expected)  
        <- ?x(X);
       .send(sensor_Y,achieve,decide(N,xVote));
        .print(Expected + X).
