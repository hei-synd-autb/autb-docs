<h1 align="left">
  <br>
  <img src="./img/hei-en.png" alt="HEI-Vs Logo" width="350">
  <br>
  Industrial Automation Base
  <br>
</h1>

Cours AutB

Author: [Cédric Lenoir](mailto:cedric.lenoir@hevs.ch)

# A simple PI regler
The regler here is only an illustation of how simple it is to write a PI regler in a PLC.
There are some conditions.

The task cycle time should be precise, **No freewheeling !**
The task cycle time should be small enough to compare to process cycle time.

Very often, there exist PID controllers libraries from various PLC suppliers, but knowing how to write your own Function Block, you can adapt it to your particular situation, for example by adding a feed-forward or other compensations.

## Header
```iecst
FUNCTION_BLOCK FB_PI_regulator
VAR_INPUT
	(* Default Input *)
	Enable				: BOOL;
	(* User Defined Inputs *)
	SetPoint            : REAL;     // Value the process should reach 
    MeasureProcess      : REAL;     // Measure from process
    
    Tn                  : REAL;     // Integration time
    Kp                  : REAL;     // Proportional gain
    
    LimitHigh           : REAL;     // Upper limit of the regler
    LimitLow            : REAL;     // Lower limit of the regler
    
END_VAR
VAR_OUTPUT
	(* Default Outputs *)
	InOperation			: BOOL;
	Error				: BOOL;
	(* User Outputs *)
	Output              : REAL;
END_VAR
VAR
    eInOperationBase	: E_InOperationBase := E_InOperationBase.Idle;
    errorSetProcess     : REAL;     // Difference between set point and measure of process
    Ki                  : REAL;     // Used to check if Tn is 0 / integration gain
    sumError            : REAL;     // Result of integration
    sumPI               : REAL;     // Sum of proportional and integration gain               
END_VAR
```
## Code
```iecst
(*
    Input management.
    Could be needed for adpatation of measure.
    Here: nothing
*)

(*
	Main State Machine
*)
CASE eInOperationBase OF
	E_InOperationBase.Idle :
		IF Enable THEN
			eInOperationBase := E_InOperationBase.Init;	
		END_IF
		
	E_InOperationBase.Init :
		// Used to reset integrator
                sumError := 0;
                eInOperationBase := E_InOperationBase.InOp;
		
	E_InOperationBase.InOp :
		(*
			Sub State Machine Here
		*)
		// Machine initilized in E_InOperationBase.Init
		// Error condition again, air pressure could be removed while machine is running
		IF NOT Enable THEN
			eInOperationBase := E_InOperationBase.Idle;
		// ELSIF errorCondition THEN
		// Here: no errorCondition, error state is neved used.
		// 	eInOperationBase := E_InOperationBase.Error;
		ELSE // The PI regler works here
            errorSetProcess := Setpoint - MeasureProcess;

            // Integrator
            // If Tn = 0, no integration
            IF Tn > 0 THEN
                Ki := 1/Tn;
            ELSE
                Ki := 0;
            END_IF;
            sumError := sumError + errorSetProcess;

            // Before Limit
            sumPI := Kp * errorSetProcess + Ki * sumError;
            
            // Set Limits
            IF sumPI > LimitHigh then
                Output := LimitHigh;
            ELSIF sumPI < LimitLow then
                Output := LimitLow;	
            ELSE
                Output := sumPI;
            END_IF
        END_IF
        
	E_InOperationBase.Error :
		IF NOT Enable THEN
			eInOperationBase := E_InOperationBase.Idle;
		END_IF
END_CASE

(*
	Output Management
*)
InOperation			:= (eInOperationBase = E_InOperationBase.InOp);
Error				:= (eInOperationBase = E_InOperationBase.Error);
// Could be needed to adapt output for process
```
