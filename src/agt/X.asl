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
       Data = 0.1; // Assume the data collected is 0.1
       .send(control, tell, reportFromAgent("X", Data)).
    
// Handle failures in the getData() function
-!collectData : true
    <-  .print("Failed to collect data. Retrying...");
        // You can add a delay here if necessary
        !collectData.