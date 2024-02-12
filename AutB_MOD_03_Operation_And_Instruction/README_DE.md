<h1 align="left">
  <br>
  <img src="./img/hei-en.png" alt="HEI-Vs Logo" width="350">
  <br>
  Industrial Automation Base
  <br>
</h1>

Cours AutB

Author: [Cédric Lenoir](mailto:cedric.lenoir@hevs.ch)

*Keywords:* **IF ELSE FOR WHILE REPEAT CASE**

# Modul 03 Operationen und Anweisungen

# Grundoperationen
|Betrieb          |Symbol              |Prioritätsstufe |
|-----------------|--------------------|--------------------------------|
|Parenthèse       |(*expression*)      |**Maximum**                     |
|Exposant         |EXPT                |                                |
|Négation         |NOT                 |                                |
|Multiplication, Division, Modulo|*, /, MOD|                            |
|Addition, Soustraction|+,-            |                                |
|Comparaison      |<,>,<=,>=           |                                |
|Egal à, non égal à|=,<>               |                                |
|Boolean ET       |AND                 |                                |
|Boolean XOR      |XOR                 |                                |
|Boolean OU       |OR                  |**Minimum**                     |

# Grundlegende Anweisungen
## Anweisung ```IF...ELSIF...ELSE```
Die ``IF`` Anweisung
```iecst
IF <Condition> THEN
   <Instruction>
```
wird verwendet, um eine Bedingung zu testen.

Die ```ELSIF``` v
```iecst
ELSIF <Anoter Condition> THEN
   <Instruction>
```
optional wird ausgeführt, wenn ``IF`` mit einer neuen Bedingung falsch ist.

Die *optionale und bedingungslose* Anweisung ``ELSE``.
```iecst
ELSE
   <Instruction>
```
wird nur ausgeführt, wenn die vorherigen Bedingungen falsch sind.

Die Anweisungen ``IF`` und ``ELSIF`` müssen mit enden
```iecst
END_IF
```

Si cela n'est pas le cas, le compilateur refusera de terminer le travail.

> Le compilateur refuse une instruction ``IF`` ou ``ELSIF`` vide. Mais un simple ```;``` suffira.

```iecst 
IF xMyCondition THEN
    // Erreur de compilation
END_IF

IF xMyCondition THEN
    // Compilation acceptée
    ;
END_IF
```

Mehrere ``ELSIF``-Anweisungen sind möglich, dies ist jedoch im Hinblick auf die Programmierqualität nicht zu empfehlen, in diesem Fall ist es besser, eine ``CASE``-Anweisung zu verwenden.

Die ``ELSE``-Anweisung wird ausgeführt, wenn alle vorherigen Bedingungen falsch sind. Es wird empfohlen, das Fehlen von ``ELSE`` als Versehen des Programmierers zu betrachten, auch wenn dies das Einfügen eines Kommentars bedeutet.
Das Semikolon
 
Beachten Sie unten, dass der Code ohne ``;`` endet., das ist der **Codesys**-Stil, in **SCL Siemens**, das dürfen wir nicht vergessen.
```iecst 
(*
    Example of Instruction IF 
*)
IF xMyCondition THEN
   // The first statement is mandatory
   diToRegister := 7;
ELSIF xMySecondCondition THEN
   // ELSIF is optional
   // A statement after ELSIF is mandatory
   diToRegister := 14;
ELSE
   // The ELSE statement is desirable as a coding rule
   diToRegister := 0;
END_IF
```
### Activity diagram for instruction ```IF...ELSIF...ELSE```
<figure>
    <img src="./puml/IfElseInstructionQuickStart/IfElseInstructionQuickStart.svg"
         alt="If Elsif Else Instruction">
    <figcaption>If Elsif Else Instruction</figcaption>
</figure>

> Die Sprache des strukturierten Texts ermöglicht zwei Arten von Kommentaren. ``//`` *Kommentar* am Zeilenanfang oder ``(* Kommentar *)`` vor und nach dem Kommentar.

```iecst  
//
// Second Example of Instruction IF 
//
IF xMyCondition THEN
   // The first statement is mandatory
   dToRegister := 7;
ELSE
   // Do nothing
   ;
END_IF
``` 
 
> Wir werden das Schreiben vermeiden:
```iecst  
IF xMyCondition = TRUE THEN
...
```

> Aber wir würden es vorziehen
```iecst  
IF xMyCondition THEN
```  
 
> Für den Fall, dass die Bedingung falsch sein muss, schreiben wir
```iecst   
IF NOT xMyCondition THEN
```

## Instruction FOR
Die ``FOR``-Schleife führt eine definierte Anzahl von Wiederholungen aus.
Die ``BY``-Anweisung, die das Inkrement definiert, ist optional. Wenn ``BY`` nicht definiert ist, beträgt der Inkrementwert 1.
Ist der Endwert, hier 5, größer als die maximale Größe des Typs, erhalten wir eine Endlosschleife!

```iecst  
(*
   Example of Instruction FOR 
*)
FOR diCounter := 5 TO 1 BY -1 DO
   // At least on statement is expected, it can be a comment
   diNumber1 := diNumber1 * 2;
END_FOR
``` 
### Aktivitätsdiagramm der Anweisung ```FOR```
<figure>
    <img src="./puml/ForInstructionQuickStart/ForInstructionQuickStart.svg"
         alt="For Loop Instruction">
    <figcaption>For Loop Instruction</figcaption>
</figure>

> **Achtung!**
Zyklische Programme mögen keine Schleifen. Wenn Sie also ein Array mit 2000 Werten initialisieren müssen, fragen Sie sich, ob dies in Ihren Positionszyklus bei 400 Mikrosekunden passt. Im schlimmsten Fall dauert es bei einem Wert pro Zyklus 0,8 Sekunden.
Eine andere Alternative besteht darin, große Schleifen auf langsamere Aufgaben mit niedriger Priorität zu verschieben.

Bei Siemens ist es beispielsweise möglich, einen OB80 zu verwenden, der beim ersten Überschreiten der Zykluszeit automatisch aufgerufen wird, um beispielsweise eine Schleife zu unterbrechen.

### Robustheit und```FOR```
Um die Robustheit einer ``FOR``-Schleife zu gewährleisten, sind einige Regeln zu beachten.
```iecst
PROGRAM PRG_ForLoop
VAR
    rTrucLoop    : REAL := 10;
    iLoopVar     : INT;
    iLastLoopVar : INT;
END_VAR

VAR CONSTANT 
    I_END_OF_LOOP : INT := 32;
END_VAR

rTrucLoop := 10;
FOR iLoopVar := 0 TO I_END_OF_LOOP BY 5 DO
    iLastLoopVar := iLoopVar;
    rTrucLoop := rTrucLoop / 2;
END_FOR
```
>Wenn möglich, wird der Endwert, hier ``I_END_OF_LOOP`` als Konstante definiert.

> Der Compiler **verbietet** die Verwendung einer reellen Zahl für die Schleife.

> Der Compiler erlaubt das Schreiben auf Schleifenvariablen, hier ``iLoopVar``. Die anderen beiden sind Konstanten. **Dies sollte unbedingt vermieden werden!**

> Im obigen Code stellt die Tatsache, dass der Wert ``I_END_OF_LOOP`` nicht genau erreicht wird, für den Compiler kein Problem dar. Es verwendet einen Komparator ``iLoopVar <= I_END_OF_LOOP``, um die Schleife fortzusetzen, was das System robuster macht als ein Unentschieden.

## ``WHILE...DO```-Anweisung
Eine WHILE-Anweisung wird ausgeführt, **bis** eine Bedingung erfüllt ist.

- Wenn die Startbedingung zunächst falsch ist, wird der interne Block nie ausgeführt.
- Wenn die Bedingung immer wahr ist, kommt es zu einer Endlosschleife und der Automat stürzt ab.

```iecst 
PROGRAM PRG_Ex_WHILE
VAR
    diNumber1 : DINT;
    diCounter : DINT;
END_VAR

diCounter := 33;
WHILE diCounter <> 0 DO
    diNumber1 := diNumber1 * 2;
    diCounter := diCounter - 1;
END_WHILE
```

> Das obige Beispiel birgt ein Risiko. Wenn die exakte Bedingung „diCounter = 0“ nie erreicht wird, riskieren wir eine **Endlosschleife**. Wir bevorzugen eine Ungleichung vom Typ ```<=``` oder ```>=```, siehe ```<``` oder ```>```. *Die vorherige Aussage ist für reelle Zahlen noch kritischer*.

### Aktivitätsdiagramm ``WHILE...DO``
<figure>
    <img src="./puml/WhileInstructionQuickStar/WhileInstructionQuickStar.svg"
         alt="Instruction WHILE">
    <figcaption>Activity diagram for WHILE..DO </figcaption>
</figure> 
 
## ``REPEAT...UNTIL```-Anweisung
Die ``REPEAT``-Anweisung wird erneut ausgeführt, solange eine Bedingung wahr ist.
Unabhängig von der Wiederholungsbedingung wird der interne Block mindestens einmal ausgeführt.

```iecst
PROGRAM PRG_Ex_REPEAT
VAR
    diNumber  : DINT;
    diCounter : DINT;
    diResult  : DINT;
END_VAR

diNumber  := 2;
diCounter := 21;
REPEAT
    diNumber := diNumber * 2;
    diCounter := diCounter - 1;
UNTIL
    diCounter = 0
END_REPEAT

diResult := diNumber;
```
> Die Anweisung ``REPEAT...UNTIL`` mit einer Gleichheit ``=`` ist **gefährlich**. Wenn die genaue Bedingung nie erreicht wird, riskieren wir eine **Endlosschleife**. Wir bevorzugen eine Ungleichung vom Typ ```<=``` oder ```>=```, siehe ```<``` oder ```>```.

### Aktivitätsdiagramm ```REPEAT...UNTIL```
<figure>
    <img src="./puml/RepeatInstructionQuickStar/RepeatInstructionQuickStar.svg"
         alt="Instruction REPEAT">
    <figcaption>Activity diagram for REPEAT</figcaption>
</figure> 

## ``RETURN``-Anweisung
Ermöglicht das sofortige Verlassen eines Anweisungsblocks.
**Verwende nicht**. *Ohne Ausnahme*.

### Ausnahme
Die Ausnahme hier trägt ihren Namen zu Recht. Ein typischer Fall könnte der Fall sein, dass es unbedingt erforderlich ist, die Schleife zu verlassen, weil wir eine zu lange Schleife erkennen, die eine Ausnahme verursacht. Diese vom Betriebssystem generierte Ausnahme erfordert ein sofortiges Eingreifen, um ein Herunterfahren des Programms zu verhindern.

## ``JMP``-Anweisung
Ermöglicht einen sofortigen und bedingungslosen Sprung zu einer Programmzeile, die durch ein Label gekennzeichnet ist.
> Nicht verwenden.

#Zustandsmaschine

## ``CASE..OF```-Anweisung
Ich könnte es auch gleich sagen: Die CASE-Anweisung ist die Anweisung, die ich bevorzuge.
Die Anweisung ist hier grundsätzlich definiert, sie wird etwas später mit einer Aufzählung wiederholt

### ``CASE`` wird als Aktivitätsdiagramm betrachtet.

```iecst
//
// Example of Instruction CASE
// 
CASE diCounter OF 
1, 5:   xMyCondition := TRUE; 
        xMyThirdCondition := FALSE; 
2:      xMySecondCondition := FALSE; 
        xMyThirdCondition := TRUE; 
10..20: xMyCondition := TRUE; 
        xMyThirdCondition= TRUE; 
ELSE 
        xMyCondition := NOT xMyCondition; 
        xMySecondCondition := xMyCondition OR xMySecondCondition; 
END_CASE
``` 
 
Der ``CASE`` schlägt vor, einen Befehlsblock, und zwar nur einen von n, in jedem Zyklus auszuführen, abhängig vom Wert von n.
Im obigen Beispiel werden die entsprechenden Blöcke ausgeführt, wenn diCounter ist:
- 1 oder 5,
- 2
- Von 10 bis 20
- Oder andere.
> Die Reihenfolge der Zahlen ist absolut egal.

Wie im Fall von ``IF`` kann ``ELSE`` weggelassen werden, dies wird jedoch als schlechte Programmierung angesehen (es sei denn, alle Fälle werden mithilfe von Aufzählungen behandelt).

### Aktivitätsdiagramm vom Typ ``CASE..OF``.

<figure>
    <img src="./puml/CaseActivityInstruction/CaseActivityInstruction.svg"
         alt="Case comme diagramme d'activité">
    <figcaption>Boxanweisungen als Aktivitätsdiagramm</figcaption>
</figure>


> Die Verwendung eines ``CASE..OF`` **mit Zahlen ist eine schlechte Programmierpraxis**. Wir werden ``ENUM`` verwenden. Im speziellen Fall des Siemens TIA Portals, das keine Aufzählung unterstützt, werden wir Konstanten verwenden.

### ``CASE..OF`` wird als Zustandsmaschine betrachtet.
> Im Rahmen dieses Kurses interessiert uns vor allem dieses Modell.

Wir werden später im Kurs auf die Aufzählung ``TYPE`` zurückkommen. Es ist wichtig, sich daran zu erinnern: ``ELSE`` **ist nicht notwendig, da es im definierten Typ formal keine anderen Werte als die definierten geben sollte.**
 
```iecst 
TYPE EN_DOOR :
(
	CLOSE_DOOR := 99,
	WAIT_DOOR_CLOSED := 10,
	DOOR_CLOSED := 20,
	DOOR_POSITION_UNKNOWN := 30
);
END_TYPE
```

```iecst
VAR
    doorState : EN_DOOR;
END_VAR

(*
   Example of Instruction CASE
*) 
CASE doorState OF 
CLOSE_DOOR:    
      xMyCondition := TRUE; 
      xMyThirdCondition := FALSE; 
WAIT_DOOR_CLOSED:
      xMySecondCondition := FALSE; 
      xMyThirdCondition := TRUE; 
DOOR_CLOSED:
      xMyCondition := TRUE; 
      xMyThirdCondition= TRUE; 
DOOR_POSITION_UNKNOWN:
      xMyCondition := NOT xMyCondition; 
      xMySecondCondition := xMyCondition OR xMySecondCondition; 
END_CASE
```
### Hinweise zu ``CASE..OF``.
- Bei der Zustandsmaschine mit einem „Enum“ gibt es keinen unbestimmten Zustand.
- Das „ELSE“ in einer Zustandsmaschine ist eine schlechte Praxis, es bedeutet, dass wir den Zustand der Maschine nicht kennen.
- Übergänge im Diagramm wurden hinzugefügt, sie sollten in ``CASE..OF`` oben programmiert werden

### Aktivitätsdiagramm von „CASE..OF“.

<figure>
    <img src="./puml/StateMachineQuickStartOpenDoor/StateMachineQuickStartOpenDoor.svg"
         alt="State Machine Close Door">
    <figcaption>In einer Zustandsmaschine gibt es keine ELSE-Bedingung!</figcaption>
</figure>

> Stellen Sie sich vor, Ihre Zustandsmaschine wird für den Autopiloten eines Flugzeugs verwendet. Was tun wir im Falle eines unbestimmten Zustands? **Der Schleudersitz-Aktuator ist auch ein Zustand!**

# Codierungsübungen/-technik
## Übung 1, ```WHILE...DO```
Schreiben Sie einen Code, der zählt, wie oft Sie die Variable ``x := 6`` mit ``a`` multiplizieren müssen, um den ersten Wert zu erhalten, der größer als ```Y := 788``` ist .
- Verwenden Sie nur ```INT```.
- Verwenden Sie eine ``WHILE``-Schleife.
- Zeigen Sie das Ergebnis mit der Variable ``Result`` an

[Lösung Übung 1](#lösung-übung-1-whiledo)

## Übung 2. ```REPEAT...UNTIL```
Was passiert im Fall des im obigen Beispiel angegebenen Codes, wenn wir „diCounter := diCounter - 1;“ durch ein Dekrement von 2, „diCounter := diCounter - 2;“ ersetzen?

> Denken Sie über das Problem nach und testen Sie nicht.

```iecst
PROGRAM PRG_Ex_REPEAT
VAR
    diNumber  : DINT;
    diCounter : DINT;
    diResult  : DINT;
END_VAR

diNumber  := 2;
diCounter := 21;
REPEAT
    diNumber := diNumber * 2;
    diCounter := diCounter - 1;
UNTIL
    diCounter = 0
END_REPEAT;

diResult := diNumber;
```
[Lösung Exercice 2](#lösung-übung-2-repeatuntil)

## Übung 3, ```For``` mit Dekrement
Geben Sie den Wert nach der Variablenschleife an: ``diNumber1``.
```iecst
(*
   Example of Instruction FOR 
*)
diNumber1 := 1;
FOR diCounter := 5 TO 1 BY -1 DO
   // At least on statement is expected, it can be a comment
   diNumber1 := diNumber1 * 2;
END_FOR;
```
[Lösung Übung 3](#lösung-übung-3-for-mit-dekrement)

## Übung 4, ```FOR``` mit Inkrement
Welchen Wert wird die Variable „iLastLoopVar“ am Ende der Ausführung des folgenden Codes haben:
```iecst
PROGRAM PRG_ForLoop
VAR
    rTrucLoop    : REAL := 10;
    iLoopVar     : INT;
    iLastLoopVar : INT;
END_VAR

VAR CONSTANT 
    I_END_OF_LOOP : INT := 32;
END_VAR

rTrucLoop := 10;
FOR iLoopVar := 0 TO I_END_OF_LOOP BY 5 DO
    iLastLoopVar := iLoopVar;
    rTrucLoop := rTrucLoop / 2;
END_FOR
```
[Lösung Exercice 4](#lösung-übung-4-for-mit-inkrement)

## Übung 5 (MOD)
### Schreiben nicht abgeschlossen.
In der Informatik gibt die Modulo-Operation den Rest oder vorzeichenbehafteten Rest einer Division zurück, nachdem eine Zahl durch eine andere dividiert wurde (sogenannter Modulus der Operation).
Schreiben Sie eine ``REPEAT``-Schleife, um zu zählen, wie oft Sie die Variable ``N`` durch die Zahl ``D`` dividieren können. Geben Sie den Wert ``Q`` und den Rest ``R`` zurück. Verwenden Sie keine Division oder Multiplikation.

## Übung 6 MULT
### Schreiben nicht abgeschlossen.
Verwenden Sie eine „FOR“-Schleife, um die Multiplikation von ``Y := A x X`` ohne Multiplikation oder Division durchzuführen.

## Übung 7 SQRT
### Schreiben nicht abgeschlossen.
Berechnen Sie SQRT nur mit Grundoperationen.


Irgendwo will ich dieses Ding
1.7 C Quellcode: Lagrange-Interpolation

https://www.codesansar.com/numerical-methods/lagrange-interpolation-method-using-c-programming.htm

# Lösungen Übungen

## Lösung Übung 1, ```WHILE...DO```
```iecst
PROGRAM PRG_Ex1_Base
VAR
    x      : INT := 6;
    a      : INT;
    Y      : INT := 788;
    Result : INT;
END_VAR

a := 0;
WHILE (a * x) < Y DO
    a := a + 1;
END_WHILE

Result := a;    // Result is 792
```
## Lösung Übung 2. ```REPEAT...UNTIL```
<figure>
    <img src="./img/CrashBlueScreen.jpg"
         alt="Boucle infinie, risque de Crash">
    <figcaption>Endlosschleife, Absturzgefahr:(</figcaption>
</figure> 

## Lösung Übung 3, ```For``` mit Dekrement
> Der Wert von ``diNumber`` ist ``3``.
Die Variable ``diCounter`` nimmt nacheinander die Werte ``5``, ``3`` und ``1`` an

## Lösung Übung 4, ```FOR``` mit Inkrement
> iLastLoopVar = 30.