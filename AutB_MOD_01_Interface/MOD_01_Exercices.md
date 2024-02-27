<h1 align="left">
  <br>
  <img src="./img/hei-en.png" alt="HEI-Vs Logo" width="350">
  <br>
  Industrial Automation Base
  <br>
</h1>

Cours AutB

Author: [Cédric Lenoir](mailto:cedric.lenoir@hevs.ch)

# Module 01 Exercices / Übung,

## Exercice / Übung 1 
Représenter le diagramme donné en exemple pour Batch Processes sous forme de type structuré IEC 61131-3.

Stellen Sie das Beispieldiagramm für Batch-Prozesse in strukturierter Typform gemäß IEC 61131-3 dar.

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