// Agent Control in project smartDripSys

/* Initial beliefs and rules */
+InitialBeliefs : true <- .print("Initial beliefs and rules").
reportX(0).
reportY(0).
reportZ(0).
getReportFromAgent(X, reportX).
getReportFromAgent(Y, reportY).
getReportFromAgent(Z, reportZ).


/* Initial goals */
!start.

/* Plans */

+!start : true 
    <-  .print("Starting the agent control system.");
        .print(reportX, reportY, reportZ);
        .print("Waiting for agents to report.").

// Receive reports from agents X, Y, and Z
+reportFromAgent(agentName, report) : true
    <- .print("Received report from ", agentName, ": ", report);
       .if (agentName == "X") { .add_belief(reportX(report)); }
       .if (agentName == "Y") { .add_belief(reportY(report)); }
       .if (agentName == "Z") { .add_belief(reportZ(report)); }
       .print("Checking majority of the reports.");

       !check.

// Check the majority of the reports and decide to activate the watering system or not
+!check : majorityReports(X, Y, Z) & (X + Y + Z > 1) <- .send(Actuator, achieve, water).
+!check : majorityReports(X, Y, Z) & (X + Y + Z <= 1) <- .send(Actuator, achieve, noWater).

// Helper plans to check the majority of the reports
+majorityReports(X, Y, Z) : reportX(X) & reportY(Y) & reportZ(Z) <- true.