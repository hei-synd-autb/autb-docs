<h1 align="left">
  <br>
  <img src="./img/hei-en.png" alt="HEI-Vs Logo" width="350">
  <br>
  Industrial Automation Base
  <br>
</h1>

Cours AutB

Author: [Cédric Lenoir](mailto:cedric.lenoir@hevs.ch)

# Module 01 Solutions / Lösungen,

## Exercice / Übung 1 

```iecst
TYPE EM_PrepareProduct_1_typ
   STRUCT
      xvValve_11 : XV_Valve_typ;
      xvValve_12 : XV_Valve_typ;
   END_STRUCT;
END_TYPE
```

```iecst
TYPE EM_PrepareProduct_2_typ
   STRUCT
      xvValve_21 : XV_Valve_typ;
      xvValve_22 : XV_Valve_typ;
      xvValve_23 : XV_Valve_typ;
   END_STRUCT;
END_TYPE
```

```iecst
TYPE EM_TemperatureControl_typ
   STRUCT
      xvValve_31               : XV_Valve_typ;
      ptPressureTransmitter_32 : PT_PressureTransmitter_typ;
   END_STRUCT;
END_TYPE
```
```iecst
TYPE EM_Agitator_typ
   STRUCT
      sicFrequencyConverter_41 : SIC_FrequencyConverter_typ;
   END_STRUCT;
END_TYPE
```

```iecst
TYPE EM_TransferToBottle_typ
   STRUCT
      xvValve_52  : XV_Valve_typ;
      mPump_51    : M_Pump_typ;
   END_STRUCT;
END_TYPE
```

```iecst
TYPE Unit_DrinkPreparation
   STRUCT
      emPrepareProduct_1   : EM_PrepareProduct_1_typ;
      emPrepareProduct_2   : EM_PrepareProduct_2_typ;
      emTemperatureControl : EM_TemperatureControl_typ;
      emAgitator           : EM_Agitator_typ;
      emTransferToBottle   : EM_TransferToBottle_typ;
   END_STRUCT;
END_TYPE
```
