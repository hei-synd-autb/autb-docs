<h1 align="left">
  <br>
  <img src="./img/hei-en.png" alt="HEI-Vs Logo" width="350">
  <br>
  HEI-Vs Engineering School - Industrial Automation Base
  <br>
</h1>

Cours AutB

Author: [Cédric Lenoir](mailto:cedric.lenoir@hevs.ch)

# Modul 05 Robuste Programmierung *Codierungsregeln*

#CodingRules
Die Lesbarkeit des Codes trägt zu seiner Robustheit bei.

## Codierungsregeln
Wenn ein anderer Techniker Ihren Code liest, sind es die Codierungsregeln, die einen ersten Eindruck vermitteln. Sie haben nur eine Gelegenheit, einen guten ersten Eindruck zu hinterlassen.
Es ist ein bisschen so, als würde man einen Bericht voller Rechtschreibfehler lesen: Man wird immer Zweifel an der Relevanz des Inhalts haben.

Ich gehe davon aus, dass eine Zeile Code etwa 10 Dollar kostet. Bei 10 Bällen kann man davon ausgehen, dass es richtig geschrieben ist.

Im industriellen Computing entwickeln sich Maschinen vielleicht mehr als in anderen Bereichen weiter. Wir werden eine 2-Millionen-Montagemaschine nicht loswerden, so wie wir ein Handy austauschen. Das bedeutet, dass **es mehr als wahrscheinlich ist, dass ein Teil des Codes während der Lebensdauer der Maschine überprüft werden muss, sei es für Wartung oder Modifikation.**

> Die Lesbarkeit des Codes ist unerlässlich.

Eines Tages müssen Sie möglicherweise Code für eine Maschine schreiben, der validiert werden muss. Die Abkürzung GAMP für Good Automated Manufacturing Practice ist kein leeres Wort und beginnt dort.

### Variablennamen
Variablennamen sind in Englisch UND vollständig. Wir schreiben nicht M oder gar Word oder Motor, wir schreiben Motor oder vielmehr stMotor oder fbMotor, je nachdem, ob wir ein Verhalten eingebunden haben oder nicht.

### Kamelbox...
Im Allgemeinen bevorzuge ich den Camel-Fall, außer manchmal bei Variablennamen oder Zahlen.

```iecst
  fbMotor_01  : FB_Motor;
```

### oder ungarische Notation
Dies ist die Art der Notation, bei der der Variablen ihr Typ vorangestellt wird.

```iecst
  iMonIndex : INT;
  reMonPi   : REAL;
```
Ich bin kein starker Befürworter der ungarischen Notation. PLCopen sagt es:

> Wenn die IDE die Anzeige der Variablen zulässt, kann das Präfix weggelassen werden.

Wenn wir zum Beispiel das Dokument **PLCopen for Motion Control** nehmen, stellen wir fest, dass keiner der FBs die ungarische Notation verwendet.

Schließlich informiert Sie ein Compiler wie Codesys jedes Mal, wenn Sie eine implizite Typkonvertierung versuchen.

> In diesem Kurs werden häufig Präfixe verwendet, da Variablen nicht in einer IDE enthalten sind...

### Präfixe
Die von mir vorgeschlagenen Präfixe folgen nicht unbedingt dem PLCopen-Dokument

|POUs	              |Type prefix	| Example	|Instance prefix | Example |
|-------------------|-------------|---------|----------------|---------|
|Structure          |ST_	        |ST_LAMP	|st	             |stLamp01 |
|Enumeration        |EN_	        |EN_Axes	|en	             |enAxisY  |
|Glob. Variable list|             |         |g	             |gNumber  |
|Program            |PRG	        |PRG_Main |--              |__       |
|Function block     |FB_          |FB_Motor	|fb	             |fbMotorOne|
|Function	          |FC_			    |FC_Add   |--              |--|
|Array			        |             |         |ar	             |arMyString|

### Benutzerdefinierte Präfixe
Sie können Ihre eigenen Präfixe definieren. Beispielsweise definiert die PLCopen-Organisation die „MC_“-Präfixe für alle mit Motoren verknüpften FBs.

„MC_Power“, „MC_MoveAbsolute“, „MC_Home“...

Wir können dann entscheiden, mit unseren eigenen internen Präfixen fortzufahren. „MB_Power“, „MB_Move“ usw.

### Präfixe für Variablen
|Schlüsselwort |Präfix |Beispiel|
|---------|---------|-------|
|BOOL|	x|	xMyFlag|
|BYTE|	by|	myRegister|
|WORD|	w|	wAudio|
|DWORD|	dw|	dwHighEnd|
|LWORD|	lw|	lwCrypted|
|SINT|	si|	siSmallCounter|
|USINT|	usi|	usiUnsignedShortInt|
|INT|	i|	iOldStandard|
|UINT|	ui|	uiUnsignedInd|
|DINT|	di|	diActualStandard|
|UDINT|	udi|	udiBigCounter|
|LINT|	li|	liFuturStandard|
|ULINT|	uli|	uliVeryBigCounter|
|REAL|	r|	rEnoughForMostApps|
|LREAL|	lr|	lrHighPrecision|
|STRING|	s|	sMostApplication|
|WSTRING|	ws|	wsInternationalApplication|
|TIME|	tim|	timWatch|
|LTIME|	ltim|	ltimSwissWatch|
|TIME_OF_DAY|	tod|	todDayDate|
|DATE_AND_TIME|	dt|	dtDateAndTime|
|DATE|	date|	dateCalendar|
|ENUM|	e|	eRedBlueWhite|
|POINTER|	p|	pInOut|
|ARRAY|	ar|	aListOfNumber|

Anmerkungen
- Das x für den Booleschen Wert ist freiwillig, um ihn von BYTE in anderen Sprachen zu unterscheiden.
- Auf die Aufzählung wird manchmal als „e“ oder „en“ verwiesen.
- Das ARRAY wird manchmal mit „a“ verwendet. Ich bevorzuge „ar“.

### Suffixe
> Dies ist eine persönliche Notiz.

Es ist wichtig, sich daran zu erinnern, dass es sich bei der Sprache IEC 61131-3 nicht um eine Sprache handelt, die abstrakt funktionieren soll, sondern darauf ausgelegt ist, sich der realen Welt anzunähern oder sie sogar zu modellieren. Variablen sind häufig Darstellungen physikalischer Variablen und es kann hilfreich sein zu wissen, um welche es sich dabei handelt.

Aus diesem Grund verwende ich gerne die Einheit der physikalischen Größe als Suffix.

Beispiel
```iecst
  reM2_Diameter_mm        : REAL;
  iM2_DecelRampSpeed_m_s2 : INT;
```

### Einrückung und Tabulatoren
**4 Leerzeichen**
Ich bevorzuge 3. Die Realität ist, dass der meiste vorhandene Code 4 Leerzeichen verwendet und ich oft Dutzende von Leerzeichenblöcken ersetzt habe. Also 4.

Wenn es möglich ist:
…wir werden die Software so konfigurieren, dass Tabulatoren automatisch durch Leerzeichen ersetzt werden.
Wir machen keine Textverarbeitung, wir schreiben Code.

###	Kommentare
Die Kommentare sind ebenso wie die Variablennamen auf Englisch.
Ein guter Kommentar ist einer, der die Absicht des Programmierers zum Ausdruck bringt.

> Es ist nicht notwendig, jede Zeile zu kommentieren, ein Kommentar für einen Codeblock kann genauso effektiv sein.

Jedes Element, jede Variable und jede POE muss kommentiert werden. In vielen IDEs muss sich der Kommentar über der Zeile befinden, damit er angezeigt wird, wenn Sie mit der Maus über das Element fahren.
 
<figure>
    <img src="./img/Display_Comment_In_Codeysy.png"
         alt="Display Comment In Codeysy">
    <figcaption>Display_Comment_In_Codeysy</figcaption>
</figure>

> Trivialitäten sollten vermieden werden!

„iecst
   iPosition + 10; // Addiere 10 zur Position… schreibe diesen Kommentar nicht…
„

> Verschachtelte Kommentare sollten vermieden werden.

```iecst
(* Multiline comments can be dangerous because matching close comment can be deleted by accident.
b:=a; // commented out code can be activated by accident
// or active code after this block accidentally commented out.
*)
(* (* NESTED COMMENTS *) *)
```	

> Wir vermeiden es, Code in Kommentaren zu hinterlassen

```iecst
  // xTautologie := TRUE OR TRUE;
```

> Oder wenn dies der Fall ist, geben wir ein Schlüsselwort an, um den Code in Kommentaren zu finden, der einen Kompilierungsfehler verursacht, wenn wir den Kommentar löschen.

```iecst
  // xTautologie := TRUE OR TRUE; CleanCode
```

### Die kleinen Regeln von geringer Bedeutung von PLCopen
Diese „unwichtigen“ Regeln sorgen dafür, dass der Code professionell aussieht.
Mit anderen Worten: Wir vermeiden es, wie ein Schwein zu schreiben …

> Setzen Sie zwischen Infix-Operatoren ein Leerzeichen, z. B. +, *.

```iecst
  iMyResult := iOne + iTwo * iFour;
```

> Setzen Sie zwischen unären Operatoren kein Leerzeichen.

```iecst
  iMyResult := iOne + -3; 
```

> Kein Leerzeichen nach dem Öffnen oder vor dem Schließen von Klammern.

```iecst
  iMyResult := (iOne + iTwo) * iFour;
```

> Ein Leerzeichen vor und nach der Klammer in Ausdrücken.

```iecst
  iMyResult := (iOne + iTwo) * (iTree + -iFour) + iFive;
```

> Kein Leerzeichen vor und nach der Klammer in Aufrufen.

```iecst
  iFive := FC_ADD(iOne, iTwo);
```

> Keine Leerzeichen vor Semikolons.

```iecst
  iFive := FC_ADD(iOne, iTwo) ;
```

> kein Leerzeichen vor dem Doppelpunkt, sondern eins danach.

```iecst
  udiMonTruc: UDINT := 0;
```

Aus Gründen der Lesbarkeit kann das Leerzeichen dann durch mehrere ersetzt werden, was jedoch bei einem Gesamtprojekt manchmal kompliziert zu handhaben ist, da die Anzahl der Leerzeichen variiert. Moderne IDEs ermöglichen manchmal eine Tabellenvisualisierung. Das Beste ist letztendlich, die Regel zu respektieren, die darin besteht, **Tabulatoren durch Leerzeichen zu ersetzen**.

```iecst
PROGRAM PlcProg
VAR
   xMonTruc:        BOOL  := FALSE;     // It is complicated to manage multiple tabs
   diMonTruc:       DINT  := 0;         // It is complicated to manage multiple tabs
   diMonTrucDeux:   DINT := 0;      // It is complicated to manage multiple tabs   
   udiMonTruc:    UDINT := 0;      // It is complicated to manage multiple tabs
END_VAR
```


> Keine Leerzeichen am Ende einer Zeile

> Immer ein Leerzeichen nach einem Komma, das eine Zeile nicht beendet.

```iecst
  iFive := FC_ADD(iOne, iTwo, iThree, iFour);
```

> In einer Tabelle steht vor und nach den Klammern kein Leerzeichen

```iecst
  iFive := arOnes[1];
```

> Wenn mehrere Parameter in mehreren Zeilen platziert werden, müssen sie in derselben Spalte beginnen.

```iecst
    mbMoveAbsAxisOne(Position_mm := 2.3,
                     Velocity_mm_s := 100,
                     Acceleration_mm_s2 := 1000);
```

> Wenn möglich, platzieren Sie die Schlüsselwörter „THEN“/„DO“ usw. in derselben Zeile wie „IF“/„WHILE“.

```iecst
   IF iBlob < 17 THEN
   …
   
   WHILE iCounter <> 0 DO
   …
   
   FOR iCounter := 1 TO 5 BY 1 DO
   …
   
   CASE iVar OF
   …
```

> Wenn ein Ausdruck in mehreren Zeilen geschrieben werden muss, beginnen Sie die neue Zeile mit dem Operator.

```iecst
reTheTotalLengthOfTheSystem :=  FC_ThisSpecificFunction(iParameterOne
                                                      + reTheThirdParameter
                                                      + reTheFourthParamete;
```

> Verwenden Sie AND und nicht „&“

```iecst
   xResult := xExpressionOne AND xExpressionTwo;
```

> Verwenden Sie TRUE und FALSE anstelle von 0 und 1 für boolesche Werte.

```iecst
  xMonTruc: BOOL  := FALSE;
```

> Auch wenn das System die Priorität der Vorgänge perfekt steuert, ist es vorzuziehen, das Lesen durch die Verwendung von Klammern zu erleichtern ...

```iecst
   IF (xConditionOne AND xConditonTwo)
   OR (xConditionThree AND xConditonFour) THEN
       xMonTruc := FALSE;
   END_IF;
…
   IF A & B OR C & D THEN xMonTruc := FALSE; END_IF;   //  Works too :)
```

# Nützliches Dokument
[PLCopen Coding Guidelines](./pdf/plcopen_coding_guidelines_v10.pdf)



