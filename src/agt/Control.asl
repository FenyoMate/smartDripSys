agent(control).



+start_sensors(N)
    <- 
        .print("Start polling sensors");
        .send(sensor_X,achieve,decide(N));
        -start_sensors(_).

+!receiveVotes(V) : V > 1 
    <- 
    .print("Voting successful, starts dripping: " , V);
    +water.

+!receiveVotes(V) : V < -1
    
    <- 
    .print("Voting successful, stops dripping: " , V);
    +no_water.

+!receiveVotes(V) : V > -1 & V < 1
    <- 
    .print("Voting successful, no change: " , V);
    +nothing.

+water
    <-  .print("Watering").

+no_water
    <- .print("Turning off").

+nothing
    <- .print("No water needed").

