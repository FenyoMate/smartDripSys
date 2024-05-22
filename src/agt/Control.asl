agent(control).

// Folyamat kezdete
//!start.


+start_sensors(N)
    <- .send(sensor_X,achieve,decide(N));
       .send(sensor_Y,achieve,decide(N));
       .send(sensor_Z,achieve,decide(N));
       -start_sensors;
        .print("sent beliefs").

+!water
    <-  .print("tobb viz").

+!no_water
    <- .print("kevesebb viz").

+!nothing
    <- .print("jo igy").

/*+!start <-
    // Kezdetben nincs összes szavazat
    .retractall(allVotes);
    // Figyeli a szenzorok szavazatait
    watchVotes.

//0 Szenzorok szavazatainak figyelése
+!watchVotes(desiredValue,XValue,YValue,ZValue) <-
    // X szenzor szavazata
    doVoteX(desiredValue,XValue,VoteX);
    // Y szenzor szavazata
    doVoteY(desiredValue,YValue,VoteY);
    // Z szenzor szavazata:w
    doVoteZ(desiredValue,ZValue,VoteZ);
    // Ha minden szavazat beérkezett; összegzi a szavazatokat és döntést hoz
    !!decide(VoteX + VoteY + VoteZ).
// Döntés meghozatala az öntözésről
+!decide(SumVotes) : SumVotes > 1 <-
    .print("Öntözés");
    +addBelief(water).

+!decide(SumVotes) : SumVotes < -1 <-
    .print("Nem öntözés");
    +addBelief(noWater).

+!decide(SumVotes) : SumVotes = 0 <-
    .print("Nem történt dönté;s");
    +addBelief(nothing).
    
// Minden szavazat beérkezett
+doVoteZ(-1) : control <- 
    .print("X szavaz");
    .retractall(allVotes);
    .assert(allVotes).*/