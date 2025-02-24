<h1 align="left">
  <br>
  <img src="./img/hei-en.png" alt="HEI-Vs Logo" width="350">
  <br>
  Industrial Automation Base
  <br>
</h1>

Cours AutB

Author: [Cédric Lenoir](mailto:cedric.lenoir@hevs.ch)

# Module 02 Exercices / Übung,

## Exercice / Übung 1 
Représenter le diagramme donné en exemple pour Batch Processes sous forme de type structuré IEC 61131-3.
-  Commencer par représenter un mermaid Class Diagram avec [Unit, EM, CM selon](./README.md#un-exemple-de-batch-process) 
-  Pour chaque classe de mermaid, ajouter les variables des types structurés, **XV**, **SIC**, **PT**, **M**.

Stellen Sie das Beispieldiagramm für Batch-Prozesse in strukturierter Typform gemäß IEC 61131-3 dar.
- Beginnen Sie mit der Darstellung eines Mermaid-Klassendiagramms, mit [Unit, EM. CM nach](README_DE.md#ein-beispiel-für-einen-batch-prozess)
- Fügen Sie für jede Mermaid-Klasse die Variablen der strukturierten Typen **XV**, **SIC**, **PT**, **M** hinzu.

<figure>
    <img src="./img/PI_D_Drink Processing.svg"
         alt="Lost image PI_D_Drink_Processing">
    <figcaption>Drink Processing version Pipe & Process Diagram</figcaption>
</figure>

Les structures, ```TYPES```, des différents Control Modules sont donnés.
Die Strukturen, ```TYPES```, der verschiedenen Steuermodule werden angegeben.

```iecst
TYPE XV_Valve_typ
   STRUCT
      SetPoint : REAL;
      Position : REAL;
      Alarm    : BOOL;
   END_STRUCT;
END_TYPE
```

```iecst
TYPE SIC_FrequencyConverter_typ
   STRUCT
      PowerOn      : BOOL; 
      Frequency    : REAL;
      MotorCurrent : REAL;
      Active       : BOOL;
      Alarm        : BOOL;
   END_STRUCT;
END_TYPE
```
```iecst
TYPE PT_PressureTransmitter_typ
   STRUCT
      Pressure     : REAL; 
      Alarm        : REAL;
   END_STRUCT;
END_TYPE
```

```iecst
TYPE M_Pump_typ
   STRUCT
      PowerOn : BOOL; 
      Alarm   : BOOL;
   END_STRUCT;
END_TYPE
```

[Solutions / Lösungen](./MOD_01_Exercice%20Solution_Losung.md)