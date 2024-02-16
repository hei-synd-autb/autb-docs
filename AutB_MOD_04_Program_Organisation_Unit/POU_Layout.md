<h1 align="left">
  <br>
  <img src="./img/hei-en.png" alt="HEI-Vs Logo" width="350">
  <br>
  HEI-Vs Engineering School - Industrial Automation Base
  <br>
</h1>

Cours AutB

Author: [Cédric Lenoir](mailto:cedric.lenoir@hevs.ch)

# Module 04 / Layout

[Program Layout](#program-layout)

[Function Block Layout](#function-block-layout)

[Function Layout](#function-layout)

## Program Layout
Exemple de structure d'un programme / Beispiel einer Programmstruktur..
```iecst
(*
    Some information about the program here...
    
    www.hevs.ch
    Institut Systemes Industriels
    Project:    CA Vision
    Author:     Cedric Lenoir
    Date:       2022 September 02
*)
PROGRAM Ca_Overlap_IO
VAR CONSTANT
    cVariableOne            : DINT := 50;       // My comments
    cVariableTwo            : BOOL := FALSE;    // My comments
    cFFTLengthPwrSpectrum   : UDINT := 65536;   // length of FFT
END_VAR

VAR
    aSpectrumResult         : ARRAY[1..(cFFTLengthPwr/2+1)] OF LREAL;       
    fbSourceSpectrum        : FB_CMA_Source :=(stInit := cInitSourceSpectrum, 
                                               nOwnID := eID_SourceSpectrum, 
                                               aDestIDs := [eID_Spectr]);
                                        
    fbSinkSpectrum          : FB_CMA_Sink   := (nOwnID := eID_SinkSpec);
    diAnyVariable           : DINT;
    diAnotherVariable       : DINT := 51;
END_VAR

(****************************************************************************** 
    Implementation
    Source - Sink - Post Processing for Power Spectrum with Overlap
******************************************************************************) 
fbSourceSpectrum.Input1D( pDataIn           := ADR(aBuffer),
                          nDataInSize       := SIZEOF(aBuffer), 
                          eElementType      := eMA_TypeCode_LREAL,
                          nWorkDim          := 0,
                          pStartIndex       := 0,
                          nOptionPars       := 0);
                          
// check for errors in function blocks and keep record
IF fbSourceSpectrum.bError THEN
    fbErrHist.AddError(bErr:=TRUE,
                       hrErrCode:=fbSourceSpectrum.hrErrorCode,
                       sErrSource:='Ca_Overlap_IO.fbSourceSpectrum');   
END_IF
```

## Function Block Layout
Exemple de structure du code d'un Function Block / Beispiel für die Codestruktur eines Funktionsblocks

```iecst
(*
    Some information about the function block here...
    
    www.hevs.ch
    Institut Systemes Industriels
    Project:    CA Vision
    Author:     Cedric Lenoir
    Date:       2022 September 02
*)
FUNCTION_BLOCK FB_FunctionGenerator
VAR_INPUT
    bEnable         : BOOL  := TRUE;    // set TRUE to generate the specified signal
    fFrequency      : LREAL := 1000;    // in [Hz]
    fAmplitude      : LREAL := 1;
    fOffset         : LREAL := 0;   
    nDutyCycle      : UINT  := 50;      // in [%] (for pulse function)
    eFunction       : E_FunctionType := E_FunctionType.Sine;    
END_VAR

VAR_IN_OUT
    aSignal         : ARRAY[1..cOversamples] OF LREAL;
END_VAR

VAR_OUTPUT
    bError          : BOOL;
END_VAR

VAR
    bInit           : BOOL := TRUE;
    fbGetTaskIdx    : GETCURTASKINDEX;  
    fLastFrequency  : LREAL;            // in [Hz]
END_VAR

(****************************************************************************** 
    Implementation
******************************************************************************) 
IF bEnable THEN
    IF fLastFrequency <> fFrequency THEN
        bInit := TRUE; // For automatic initializing
        fLastFrequency := fFrequency;
    END_IF
    IF bInit THEN
        // Get task info    
        fbGetTaskIdx();
    END_IF
ELSE
    bInit := TRUE;
    bError := FALSE;
END_IF
FOR nSamples := 1 TO cOversamples DO
    // base signal * carrier signal
    aSignal[nSamples] := fAmplitude*SIN(2*PI*(fAngularIncrement+(nSamples-1)));
END_FOR
```

## Function Layout
Exemple de structure du code d'une fonction / Beispiel für die Codestruktur einer Funktion..

```iecst
(*
    Convert a UDINT to an array of 4 bytes with lowest byte in first position
    A conversion ratio can be added to scale the value.
    The Input is multiplied by scale before conversion to BYTE(s)
    Returns true
    
    www.hevs.ch
    Institut Systemes Industriels
    Project:    CA Vision
    Author:     Cedric Lenoir
    Date:       2022 September 02
*)
FUNCTION FC_Hevs_LREAL_TO_BYTES : BOOL
VAR_INPUT
    Input   : LREAL;
    Scale   : LREAL := 1;   // Scale is multiplied to Input before conversion to bytes.
END_VAR

VAR_IN_OUT
    pOutput : ARRAY [0..7] OF BYTE; 
END_VAR

VAR
    Scaled : LREAL;
    nShift: BYTE :=8;
    pt:POINTER TO ULINT;
    myInput :ULINT;
END_VAR

(*****************************************************************************
    Implementation
    Function must return something... could be TRUE if correct, false if error
******************************************************************************) 
Scaled := Input * Scale;
pt := ADR(Scaled);      // Not valid ofr TIA Portal (Siemens World)
myInput := pt^;         // Not valid ofr TIA Portal (Siemens World)

pOutput[0] :=  ULINT_TO_BYTE(16#FF AND myInput);
myInput := SHR(myInput,nShift);
pOutput[1] :=  ULINT_TO_BYTE(16#FF AND myInput);
myInput := SHR(myInput,nShift);
pOutput[2] :=  ULINT_TO_BYTE(16#FF AND myInput);
myInput := SHR(myInput,nShift);
pOutput[3] :=  ULINT_TO_BYTE(16#FF AND myInput);
myInput := SHR(myInput,nShift);
pOutput[4] :=  ULINT_TO_BYTE(16#FF AND myInput);
myInput := SHR(myInput,nShift);
pOutput[5] :=  ULINT_TO_BYTE(16#FF AND myInput);
myInput := SHR(myInput,nShift);
pOutput[6] :=  ULINT_TO_BYTE(16#FF AND myInput);
myInput := SHR(myInput,nShift);
pOutput[7] :=  ULINT_TO_BYTE(16#FF AND myInput);

// Function done
FC_Hevs_LREAL_TO_BYTES := TRUE;
```