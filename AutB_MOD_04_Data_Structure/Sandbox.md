
```mermaid
stateDiagram-v2
    [*] --> Idle
    Idle --> MoveOne
    MoveOne --> MoveOneCheckDone
    MoveOneCheckDone --> MoveTwo
    MoveTwo --> MoveTwoCheckDone
    MoveTwoCheckDone --> ErrorStop
    ErrorStop --> Stopped
    Stopped --> [*]
```
```