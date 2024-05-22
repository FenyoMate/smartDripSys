agent(sensor_X).

+!decide(Expected,Incoming) : true 
        <- .print(Incoming);
        .send(control,tell,percept(Expected + Incoming)).
