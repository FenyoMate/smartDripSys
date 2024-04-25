// Agent Y in project smartDripSys

/* Initial beliefs and rules */
+InitialBeliefs : true <- .print("Initial beliefs and rules").

/* Initial goals */
!collectData.

/* Plans */

// Collect data and send it to the controller
+!collectData : true
    <- .print("Collecting data...");
       // Assume getData() is a function that collects data from the soil
       Data = 0.4; // Assume the data is 0.4 for now
       .send(control, tell, reportFromAgent("Y", Data)).
       

// Handle failures in the getData() function
-!collectData : true
    <-  .print("Failed to collect data. Retrying...");
        // You can add a delay here if necessary
        !collectData.