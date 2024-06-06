Header
FUNCTION_BLOCK FB_Square_200_ms
VAR_INPUT
    Enable 	: BOOL;
END_VAR
VAR_OUTPUT
    InOperation	:  BOOL;
    Signal 	:  BOOL;
    Error		:  BOOL;
END_VAR
VAR
    eInOp		: E_InOperationBase;
    bTestError	: BOOL;
    diCount     	: DINT;
END_VAR
code
CASE eInOp OF
    E_InOperationBase.Idle:
        If Enable THEN
            eInOp := E_InOperationBase.Init;
        END_IF
		
    E_InOperationBase.Init:
        If bTestError THEN
            eInOp := E_InOperationBase.Error;
        ELSIF NOT Enable THEN
            eInOp := E_InOperationBase.idle;
        ELSE
            bSignal := FALSE;
            diCount := 0;
            eInOp := E_InOperationBase.inOp;
        END_IF
    E_InOperationBase.InOp:
        IF NOT Enable THEN
            diCount := 0;
        ELSE
            IF diCount > 9 THEN
                diCount := 0;
            END_IF
            diCount := diCount + 1;
        END_IF
    E_InOperationBase.Error:
        If NOT Enable THEN
            eInOp := E_InOperationBase.Idle;
        END_IF
END_CASE

InOperation	:= eInOp = E_InOperationBase.InOp;
Error		:= eInOp = E_InOperationBase.Error;
Signal		:= (diCount > 5) AND eInOp = E_InOperationBase.Error;
