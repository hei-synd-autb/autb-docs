```mermaid
---
title: Complete State Machine for Move Two Positions with Halt
---

stateDiagram-v2
[*] --> Idle
Idle --> isPowerOff : mcReadStatus is Disabled
isPowerOff --> WaitPowerOn : Power.Enable = TRUE
WaitPowerOn --> isPowerOn : mcReadStatus is Standstill
isPowerOn --> InitMotion : mcMoveAbsolute.Execute = TRUE



InitMotion --> InitMotionDone : mcMoveAbsolute.Done = TRUE
InitMotionDone --> MoveDown : mcMoveAbsolute.Execute = TRUE
MoveDown --> MoveDownDone : mcMoveAbsolute.Done = TRUE
MoveDownDone --> CloseGripper : Pick
CloseGripper --> GripperClosed : Picked
GripperClosed --> InitMotion : mcMoveAbsolute.Execute = TRUE


isPowerOff --> ErrorStop : error
WaitPowerOn --> ErrorStop : error
isPowerOn --> ErrorStop : error
InitMotion --> ErrorStop : error

InitMotion --> Stopping : stop
Stopping --> isPowerOn : mcReadStatus is Standstil

ErrorStop --> isPowerOn : reset


```

| Name           | Type         | Description                                      |
|----------------|--------------|--------------------------------------------------|
| **VAR_INPUT**  |              |                                                  |
| Execute        | BOOL         | Rising edge starts the processing               |
| Position       | LREAL        | Target position                                 |
| Velocity       | LREAL        | Maximum velocity                                |
| Acceleration   | LREAL        | Acceleration                                    |
| Deceleration   | LREAL        | Deceleration                                    |
| Jerk           | LREAL        | Maximum jerk                                   |
| BufferMode     | MC_BUFFER_MO | Buffered or direct command execution           |
| Axis           | AXIS_REF     | Axis to be controlled                          |
| **VAR_OUTPUT** |              |                                                  |
| Done           | BOOL         | The axis was reset                             |
| InBuffer       | BOOL         | The command is in the buffer, but it is not executed |
| Active         | BOOL         | The function block is active                   |
| CommandAborted | BOOL         | The command was aborted during the execution   |
| Error          | BOOL         | An error occurred                              |
| ErrorID        | ERROR_CODE   | Error classification                           |
| ErrorIdent     | ERROR_STRUCT | Error Diagnostics                              |
