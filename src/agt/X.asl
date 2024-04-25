// Agent X in project smartDripSys

/* Initial beliefs and rules */
+InitialBeliefs : true <- .print("Initial beliefs and rules").

/* Initial goals */
!collectData.

/* Plans */

// Collect data and send it to the controller
+!collectData : true
    <- .print("Collecting data...");
       // Assume getData() is a function that collects data from the soil
       ?getData(Data);
       .send(control, tell, reportFromAgent("X", Data)).