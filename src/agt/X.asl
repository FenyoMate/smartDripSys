// Agent X in project smartDripSys

/* Szenzorok szimulált változói */
moisturness(0.3).

/* Raining and watering events */

+raining(Intensity, Duration) : moisturness(N) & N <= 0.4 <-
    +replace(moisturness(N), moisturness(N + 0.1)).
    !broadcastM(N).

+drying() : moisturness(N) <-
    +replace(moisturness(N), moisturness(N - 0.1)).
    !broadcastM(N).

+watering(Duration) : moisturness(N) & N <= 0.4 <-
    +replace(moisturness(N), moisturness(N + 0.1)).
    !broadcastM(N).

+replace(Old, New) : moisturness(Old) <- moisturness(New).

// ---------------------------------------------------------------------

+!broadcastM(N) <-
    ?replace(moisturness(N), moisturness(N));
    .print("Moisturness is: ", N);
    ?replace(moisturness(N), moisturness(N));
    .broadcast(tell, moisture(N));
    !didWeWater(N).



/* Goal */



/* Plans */

+!poll(success) : 