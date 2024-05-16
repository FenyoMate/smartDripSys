agent(control).

// Folyamat kezdete
!start.

+!start <-
    // Kezdetben nincs összes szavazat
    .retractall(allVotes);
    // Figyeli a szenzorok szavazatait
    .watchVotes.

//0 Szenzorok szavazatainak figyelése
+!watchVotes <-
    // X szenzor szavazata
    .doVoteX(VoteX);
    // Y szenzor szavazata
    .doVoteY(VoteY);
    // Z szenzor szavazata
    .doVoteZ(VoteZ);
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
    .print("Nem történt döntés");
    +addBelief(nothing).
    
// Minden szavazat beérkezett
+doVoteZ(-1) : control <- 
    .print("X szavaz");
    .retractall(allVotes);
    .assert(allVotes).