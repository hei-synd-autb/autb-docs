# Your own code and tests here:

There is nothing important here, the goal is to use this page to test some features for mermaid, copilot, markdown and so on.


```mermaid
stateDiagram
    [*] --> eIdle

    eIdle --> eRed : Alarm
    eIdle --> eGreen : No Alarm
    eRed --> eGreen : No Alarm
    %% eRed --> eSpecialCase
    %% eGreen --> eSpecialCase
    eGreen --> eRed : Alarm

    note right of eRed
        Light is RED
    end note

    note right of eGreen
        Light is GREEN
    end note

    note right of eIdle
        Light is OFF
    end note
```

**Suppose we want to add a special case**

---

### Other example

```mermaid
stateDiagram
    [*] --> Still

    Still --> Move_1
    Move_1 --> Still
    Move_1 --> Stop
    %% Still --> Move_2
    %% Move_2 --> Still
    %% Move_2 --> Stop    
    Stop --> Still : Is Stopped

```

