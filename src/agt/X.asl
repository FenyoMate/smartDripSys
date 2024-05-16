agent(sensor_X).

!start.

    // A szabályok végrehajtásának kezdete
+!start <-
    // Végrehajtja a páratartalom-mérést
    .print("Starting humidity measurement");
    .perform_measurement(XValue);
    // Kinyeri a kívánt értéket a helyzetből
    .print("Extracting desired value from situation");
    .percept(situation(DesiredValue));
    // Meghatározza az eltérést a mért és a kívánt érték között
    .print("Calculating difference");
    Difference == XValue - DesiredValue;
    .print("Deciding for sensor X");
    .decideX(Difference, Vote);
    .send(vote(sensor_X, Vote)).

// Páratartalom-mérés
+!perform_measurement(XValue) <-
    // A páratartalom-mérés elvégzése (például szenzorolvasás)
    // Itt XValue kapja meg a mért értéket
    XValue = 20. // Példa érték; valódi szenzorolvasás helye

// Döntés meghozatala az X szenzor számára
+!decideX(Difference, Vote) : Difference > 5 <-
        Vote = -1.

+!decideX(Difference, Vote) : Difference < -5 <-
        Vote = 1.   

+!decideX(Difference, Vote) <-
        Vote = 0.