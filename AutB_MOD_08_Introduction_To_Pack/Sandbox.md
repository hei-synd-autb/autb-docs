


### State Complete

Ein **SC State Complete**-Befehl wird ausgegeben, wenn alle definierten Module der Maschine ihre eigene Phase des aktiven Zustands, in dem sich die Maschine befindet, abgeschlossen haben.

Im folgenden Beispiel müssen drei Achsen, X, Y und Z, synchronisiert werden, bevor der Befehl „Ausführen“ ausgeführt wird.

> Dabei stellen wir uns die Synchronisierung von 3 unabhängigen elektromechanischen Achsen vor, die dann gemeinsam im dreidimensionalen Raum bewegt werden können müssen.

```mermaid
---
title: SC State Complete when all modules completed
---

stateDiagram-v2
    direction LR

    state join_state <<join>>
    state "Starting CM_Axis_X" as  Starting_X
    state "Starting CM_Axis_Y" as  Starting_Y
    state "Starting CM_Axis_Z" as  Starting_Z

    Idle --> Starting
    state Starting{
        Starting_X
        Starting_Y
        Starting_Z
    }

    Starting_X --> join_state : SC
    Starting_Y --> join_state : SC
    Starting_Z --> join_state : SC

    join_state --> Execute
```

Im folgenden Sonderfall bewegen wir die X-Achse zum Startpunkt einer Trajektorie und synchronisieren sie dann mit der Trajektorie.

```mermaid
---
title: Example of Starting Axis X, Move to Synch and Synch.
---

stateDiagram-v2

    state "Starting CM_Axis_X" as  Starting_X

    state Starting_X{
        Idle --> MoveToSynchPoint
        MoveToSynchPoint --> Synchronize
        Synchronize --> Done 
    }

    note left of Done : SC State Complete.
```