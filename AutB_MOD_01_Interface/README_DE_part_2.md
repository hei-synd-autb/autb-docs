<h1 align="left">
  <br>
  <img src="./img/hei-en.png" alt="HEI-Vs Logo" width="350">
  <br>
  HEI-Vs Engineering School - Industrial Automation Base
  <br>
</h1>

Cours AutB

Author: [Cédric Lenoir](mailto:cedric.lenoir@hevs.ch)

# MOD 01 Interfaces
## *2. Teil, Eingabe-Ausgabe-Module*

## Ein Kommunikationszentrum.
Eine moderne SPS ist vor allem ein Kommunikationszentrum, das den Einsatz verschiedenster Protokolle und Hardware in einer gegebenen Umgebung ermöglicht.

<figure>
    <img src="img/Internal Block Diagram of a PLC.png"
         alt="Internal Block Diagram of a PLC">
    <figcaption>Internal Block Diagram of a PLC</figcaption>
</figure>

### Ein Automat erlaubt insbesondere:
- Um mit einem Bediener über eine **HMI** Mensch-Maschine-Schnittstelle zu kommunizieren,
- Um mit dem Anwendungsentwickler über eine **IDE** zu kommunizieren,
- Um mit der Maschine zu kommunizieren,
- Zur Kommunikation mit internen oder externen **Cloud**-Datenbanken,
- Zur Verwaltung des Stromnetzes und möglicher **USV-Fehler**.

> Das Konzept der integrierten Entwicklungsumgebung **IDE** wird im Rahmen der praktischen Arbeit entwickelt, die ein integraler Bestandteil ist.

> Eine **USV**, eine unterbrechungsfreie Stromversorgung, muss es einem Controller ermöglichen, bestimmte wesentliche Funktionen im Falle eines Netzwerkstromausfalls zu verwalten. Generell gilt, dass eine SPS in der Lage sein muss, ordnungsgemäß herunterzufahren, aber auch nach Wiederherstellung der Stromversorgung automatisch neu zu starten.

# Der Begriff des Echtzeitprogramms.

Der Begriff des präemptiven Echtzeitbetriebssystems (RTOS) bedeutet vor allem eines:

> Das Betriebssystem ist in der Lage, eine weniger wichtige Aufgabe zu unterbrechen, um die Ausführung einer anderen, wichtigeren Aufgabe unter Einhaltung einer festgelegten Zykluszeit und Präzision zu gewährleisten.

Die gesamte Theorie der digitalen Signalverarbeitung basiert auf der Abtastung. Wenn die Wiederholbarkeit der Abtastqualität nicht gewährleistet ist, ist die Signalverarbeitungsqualität nicht gewährleistet.

> Es sollte beachtet werden, dass eine SPS in der Lage ist, die meisten **Signalverarbeitungs-** und **erweiterten Regelungsalgorithmen** bis zu einer Bandbreite in der Größenordnung von **1 bis 2 [kHz]** auszuführen.

## Über digitale Signale

### Definition
Per Definition ist ein diskretes Signal eine Reihe realer oder komplexer digitaler Werte. Besteht es aus reellen Werten, spricht man von einem reellen Signal, setzt es sich aus komplexen Werten zusammen, spricht man von einem komplexen Signal. Ein digitales Signal ist ein diskretes Signal, dessen Amplitude quantifiziert wird.

### Notation
-   $\ x(k) $
-   $\ x(k  \Delta t) $

Wobei die unabhängige Variable K eine ganze Zahl ist.

### Probenahme
Abtasttheorem
Ein analoges Signal $ x_a(t) $ mit einer auf $ F(Hz) $ begrenzten Bandbreite kann aus seinen Abtastwerten $ x_a(k \delta t) $ nur dann exakt rekonstruiert werden, wenn diese mit einer Periode $ \delta t aufgenommen wurden $ kleiner oder gleich $ 1/(2F)$.

Literatur: Siehe [Murat Kunt, Digitale Signalverarbeitung](https://www.epflpress.org/produit/803/9782889142439/Traitement%20numerique%20des%20signaux%20)

Die mathematischen Aspekte der digitalen Signalverarbeitung werden je nach Branche in unterschiedlichen industriellen Systemmodulen verarbeitet.

> Ziel dieses Kurses ist es zu zeigen, dass viele Algorithmen, die vor einigen Jahren noch spezialisierten Prozessoren wie **DSP**, **Digital Signal Processor**, vorbehalten waren, heute direkt in SPS implementiert werden können.

#Hypervisor
Es ist keineswegs das Ziel dieses Kurses, auf die Einzelheiten des Mechanismus einzugehen, der es einem Echtzeitbetriebssystem, **RTOS**, ermöglicht, den Prozessor und Speicherplatz desselben Systems mit einem Windows- oder Linux-Betriebssystem zu teilen System.

<figure>
    <img src="img/Bare Metal Hypervisor.png"
         alt="Bare Metal Hypervisor">
    <figcaption>PLC et OS de type Windows ou Linux sur le même hardware</figcaption>
</figure>

# Standardschnittstellen
 
Anbieter von SPS-Lösungen bieten Ein-/Ausgabemodule an, die spezifisch für ihre Produktpalette sind und in der Regel nicht mit denen anderer Hersteller kompatibel sind, angefangen bei ihren mechanischen Eigenschaften.

## Beispiel für Eingabemodule
|Herkunft Beckhoff | Herkunft Siemens|
|:-----------------:|:--------------:|
|![](img/IO%20Module%20Beckhoff.jpg) |![](img/IO%20Module%20Siemens.png)|

Es gibt eine Vielzahl technischer Lösungen, die es verschiedenen Modulen ermöglichen, miteinander zu kommunizieren, allerdings mit direkten Auswirkungen auf Entwicklungszeit und Hardwarekosten. Es wird noch notwendig sein, ein zusätzliches Risiko für die Komplexitätssteigerung hinzuzufügen.

Die erste Aufgabe des Automatisierungsingenieurs, die jedoch oft in der Verantwortung des Projektmanagers liegt, der ein Chemie- oder Maschinenbauingenieur sein kann, besteht darin, den Lieferanten auszuwählen, dessen Produktpalette am besten zu seiner Art von Anwendung passt.

> Anbieter von SPS-Lösungen sind häufig auf bestimmte Tätigkeitsbereiche spezialisiert. Ein gutes System zur Verwaltung eines Gebäudes (Heizung, Lüftung und Klimaanlage, HVAC) ist möglicherweise überhaupt nicht für die Verwaltung einer Werkzeugmaschine, einer computergestützten numerischen Steuerung (CNC), geeignet.

# Verfügbarkeit von Sensoren und Aktoren.

Was für die Schnittstellen, die eine Digitalisierung des Signals ermöglichen, gilt, gilt auch für die Sensoren, die den Automaten mit Prozessinformationen versorgen, sowie für die Aktoren, die auf den Prozess einwirken.
 
Sensor- und Aktorlieferanten unterscheiden sich oft von Automatisierungslieferanten. Grund dafür, dass eine Reihe von Signalen über die Norm IEC 61131-2 oder IEC 61131-9 standardisiert werden (siehe Kapitel Intelligente Sensoren / IO-Link, Link muss vervollständigt werden).
Die Norm IEC 61131-2 definiert hauptsächlich die Signalpegel und die Impedanzgrenze für binäre, digitale Eingänge, digitale Ausgänge und analoge Signale, analoge Eingänge und analoge Ausgänge. Für analoge Signale gelten zusätzliche Einschränkungen hinsichtlich Quantifizierung und Störfestigkeit, die parallel zum Instrumentierungskurs berücksichtigt werden müssen.

Dabei geht es nicht darum, detailliert auf die Art der Signale einzugehen, sondern auf die zahlreichen Variationen innerhalb der Norm IEC 61131-2 selbst aufmerksam zu machen.

## Digital Input [Source Siemens 2015](https://cache.industry.siemens.com/dl/files/921/109477921/att_862667/v3/109477921_Compliance_IEC_61131-2_DI_module_de.pdf)
|Signal range     |Type 1|Type 2|Type 3|
|-----------------|------|------|------|
|24 [Vdc]	      |...   |...   |...   |
|120 [Vac]	      |...   |...   |...   |
|230 [Vac]	      |...   |...   |...   |

Meines Wissens ist das Signal 5 [Vdc] nicht Teil der Eingangsspezifikation, aber dieser Spannungspegel ist von einigen Herstellern verfügbar, zum Beispiel [Beckhoff EL1124](https://www.beckhoff.com/en -en/products/ i-o/ethercat-terminals/el1xxx-digital-input/el1124.html).

## Digitaler Ausgang
Es ist keine allgemeine Quelle für IEC 61131-2 verfügbar

## Analog Input
|Signal range     |Input impedance limits|
|-----------------|----------------------|
|± 10 [V]	|≥ 10 [kΩ]|
|0-10 [V]	|≥ 10 [kΩ]|
|1-5 [V]	|≥ 5 [kΩ]|
|4-20 [mA]	|≤ 300 [Ω]|

## Analog Output
|Signal range     |Input impedance limits|
|-----------------|----------------------|
|± 10 [V]	|≥ 1000 [Ω]|
|0-10 [V]	|≥ 1000 [Ω]|
|1-5 [V]	|≥ 500 [Ω]|
|4-20 [mA]	|≤ 600 [Ω]|

## IP-Schutzart
**IP**, **Ingress Protection**, gibt es am häufigsten in IP20 und IP67.
Die Verfügbarkeit variiert stark von Hersteller zu Hersteller.

## ATEX
Geräte für explosionsgefährdete Bereiche (ATEX), Geräte für explosionsgefährdete Bereiche, stammen aus einer europäischen Richtlinie.

> [RICHTLINIE 2014/34/EU DES EUROPÄISCHEN PARLAMENTS UND DES RATES vom 26. Februar 2014 zur Harmonisierung der Rechtsvorschriften der Mitgliedstaaten für Geräte und Schutzsysteme zur bestimmungsgemäßen Verwendung in explosionsgefährdeten Bereichen](https://eur-lex.europa.eu/legal-content/DE/TXT/?uri=CELEX:32014L0034).

Hersteller, die Produkte anbieten, die dieser Richtlinie entsprechen, sind seltener, aber das Thema ist besonders wichtig für die chemische Industrie, die im Wallis stark vertreten ist. **Besonderes Augenmerk muss auf die Wahl der Schnittstellen gelegt werden, wenn der Prozess mit der Chemie oder verwandten Bereichen verknüpft ist.**

## Beispiel für die Spezifikation eines digitalen Eingangs
EL1008 | EtherCAT Terminal, 8-channel digital input, 24 V DC, 3 ms

|Technical data	|EL1008|
|---------------|------|
|Connection technology	|1-wire
|Specification	|EN 61131-2, type 1/3
|Number of inputs	|8
|Nominal voltage	|24 V DC (-15 %/+20 %)
|“0” signal voltage	|-3…+5 V (EN 61131-2, type 3)
|“1” signal voltage	|11…30 V (EN 61131-2, type 3)
|Input current	|typ. 3 mA (EN 61131-2, type 3)
|Input filter	|typ. 3.0 ms
|Distributed clocks	|-
|Current consumption power contacts	|typ. 2 mA + load
|Current consumption E-bus	|typ. 90 mA
|Electrical isolation	|500 V (E-bus/field potential)
|Configuration	|no address or configuration setting
|Special features	|standard input terminal for bouncing signals (filter 3 ms)
|Weight	|approx. 55 g
|Operating/storage temperature	|-25…+60 °C/-40…+85 °C
|Relative humidity	|95 %, no condensation
|Vibration/shock resistance	|conforms to EN 60068-2-6/EN 60068-2-27
|EMC immunity/emission	|conforms to EN 61000-6-2/EN 61000-6-4
|Protect. rating/installation pos.	|IP20/see documentation
|Pluggable wiring	|for all ESxxxx terminals
|Approvals/markings	|CE, UL, ATEX, IECEx, DNV GL, cFMus
|Ex marking	|ATEX:II 3 G Ex nA IIC T4 Gc IECEx: Ex ec IIC T4 Gc cFMus: Class I, Division 2, Groups A, B, C, D Class I, Zone 2, AEx ec IIC T4 Gc

> Hersteller erwähnen nicht immer die IEC 61131-2-Kompatibilität. Vor allem, weil der Sensor nicht in den Geltungsbereich der Norm fällt. Es kann daher nicht für eine bestimmte Spezifikation validiert werden.

### Ein schlechtes Beispiel
Suchen Sie nach einer Karte, mit der Sie Signale mit 1 MHz erfassen können.

# Feldbusse oder Industriebusse

## Was ist ein Feldbus?
Ein Feldbus oder Industriebus ist ein Kommunikationssystem, das einen physischen Träger, das Kabel, einen physischen elektronischen Teil und einen Softwareteil umfasst, der die Kommunikation zwischen Sensoren, Aktoren und Industriesteuerungen ermöglicht.
## Wofür ?
Das Prinzip besteht darin, die digitalen Signale mehrerer Geräte auf einem einzigen Kabel zu multiplexen, um zu vermeiden, dass alle Geräte mit unterschiedlichen Kabeln an die SPS angeschlossen werden müssen.
## Einschränkungen
Diese Busse sind häufig so konzipiert, dass sie den Anforderungen bestmöglich gerecht werden, die je nach Branche unterschiedlich sein können.
Zum Beispiel :
- Profibus-DP, Dezentrale Peripherie, vertrieben ab Ende der 90er Jahre. Der gebräuchlichste Industriebus, der jedoch im Zuge der Modernisierung der Anlagen den Ethernet-basierten Bussen Platz macht.
- Profibus-PA für Prozessautomatisierung, eine Variante von Profibus DP, die für den Einsatz in explosionsgefährdeten Bereichen konzipiert ist. Es ist in der chemischen Industrie sehr präsent.
- Profinet, der Nachfolger von Profibus, basierend auf Ethernet-Unterstützung. Es ersetzt Profibus-PA nicht, da es nicht für explosionsgefährdete Bereiche ausgelegt ist.
- Der Sercos II-Bus (Lichtwellenleiter) und dann Sercos III (Ethernet-Kabel) wurden entwickelt, um von Synchronmotoren angetriebene Achsen zu synchronisieren. Anwendungsgebiet Werkzeugmaschine (CNC).
Neben den technischen Besonderheiten gibt es auch geografische Aspekte: Der europäische Markt wird von Profinet (Siemens) dominiert, während der amerikanische Markt von EtherNet/IP (Allen-Bradley) dominiert wird.
Es gibt geschäftliche Entscheidungen. Wenn ein großes Unternehmen wie Nestlé einen Bustyp standardisiert hat, wird es versuchen, diesen Bus diesen Lieferanten aufzuzwingen, um die Wartung seines Netzwerks zu vereinfachen.

## Neu für 2023-2024
Derzeit befindet sich eine neue Technologie in der Pilottestphase bei verschiedenen Anbietern. [Ethernet-APL](https://www.ethernet-apl.org) Erweiterte physikalische Schicht. Diese Technologie soll Profibus-PA in der sogenannten Prozess-, Chemie- und Biotechnologieindustrie ersetzen. Für Ingenieure, die in dieser Branche tätig sind, lohnt es sich, diesen Bustyp bei jedem neuen Projekt in Betracht zu ziehen. Diese Technologie ist darauf ausgelegt, die physikalischen Medien alter Anlagen nutzen zu können und ist daher auch für Renovierungsprojekte relevant.

<Abbildung>
     <img src="./img/Logo-Ethernet-APL-rectangle-RGB_1.0_white_backgr.png"
          alt="Bild verloren Logo-Ethernet-APL-rectangle-RGB_1.0_white_backgr.png">
     <figcaption>Ethernet-APL</figcaption>
</figure>


## Standards
Im Fall von Feldbussen lösen die Standards, selbst wenn sie in der Reihe IEC 61784 und IEC 61800 existieren, nichts, da für die meisten Haupttypen von Feldbussen Varianten der Standards geschrieben wurden.
Die Situation im Jahr 2023 geht aus einer Veröffentlichung von HMS hervor, einem Unternehmen, das sich auf die Entwicklung von Produkten für Industriebusse spezialisiert hat. Das HMS-Diagramm wird im globalen Maßstab erstellt und geografische Gebiete würden unterschiedliche Realitäten zeigen. Beachten Sie auch das Wachstum drahtloser Netzwerke.
 
<figure>
    <img src="img/Field Bus Market Share www hms networks com 2023.jpg"
         alt="Field Bus Market Share www hms networks com 2023">
    <figcaption>Field Bus Market Share Source: <a href="https://www.hms-networks.com/news-and-insights/news-from-hms/2023/05/05/industrial-network-market-shares-2023">www.hms-networks-com 2023</a></figcaption>
</figure>
 
## Im Idealfall
Unter der Schirmherrschaft der OPC Foundation gründete opcfoundation.org eine Arbeitsgruppe zur Harmonisierung industrieller Netzwerke unter dem Namen OPC UA Field Level Communications (FLC). Im Jahr 2023 werden sich die nach dieser Harmonisierung entwickelten Produkte im Demonstratorstadium befinden.
 
<figure>
    <img src="img/From cloud to sensor Source opcfoundation.org.jpg"
         alt="From cloud to sensor Source opcfoundation.org">
    <figcaption>From cloud to sensor Source: <a href="https://opcfoundation.org">opcfoundation.org</a>
    </figcaption>
</figure>

## Wirklichkeit
Im folgenden Beispiel sehen wir, dass es von derselben SPS aus eine Vielzahl von Feldbussen gibt, die an eine SPS angeschlossen werden können oder nicht. Keiner dieser Feldbusse ist mit den anderen kompatibel. Feldbusse sind fast alle proprietär, das heißt, sie werden von Herstellern entwickelt.
- Profibus *Herkunft Siemens*
- Profinet *Herkunft Siemens)*
- CC-Link *Mitsubishi-Ursprung*
- Ethernet/IP *Allen-Bradley-Ursprung*
- DeviceNet *Allen-Bradley-Ursprung*
- EtherCAT *Origin Beckhoff*

*Es gibt keine Quelle zum Ursprung von IO-Link, aber IO-Link wird von der Organisation [PI International](https://www.profibus.com) wie Profinet und Profibus gepflegt... *

<figure>
    <img src="img/Pyramide IO-Link Source Balluff.jpg"
         alt="Pyramide IO-Link Source Balluff">
    <figcaption>Pyramide IO-Link Source Balluff Source: <a href="https://www.balluff.com">www.balluff.com</a>
    </figcaption>
</figure>

# Abschluss
Es ist sehr wichtig, sich die folgenden Informationen zu merken:
- Vor der Auswahl eines SPS-Systems muss geprüft werden, ob die auf dem Markt erhältlichen Sensor- oder Aktortypen über die erforderlichen Schnittstellen verfügen.
- Manchmal ist es wichtiger, den Feldbus auszuwählen, der den Anforderungen des Projekts entspricht, als anschließend die entsprechende Steuerung auszuwählen.
- Wählen Sie einen möglichst modernen Bustyp, um eine möglichst lange Lebensdauer zu gewährleisten.
- Passen Sie den Feldbustyp an die Umgebung an, in der er installiert wird.
- Berücksichtigen Sie die technischen Aspekte, Zykluszeit, Durchsatz, funktionale Sicherheit und Cybersicherheit, die später im Kurs entwickelt werden.

## Ein schlechtes Beispiel.
Wählen Sie einen Sensor aus, der mit einer **i2c**, *Inter Integrated Circuit Bus*-Schnittstelle ausgestattet ist, und suchen Sie nach der Eingangs-/Ausgangskarte, die die Kommunikation mit einer SPS ermöglicht.

In diesem Fall ist **i2c** ein serieller Bus, der hauptsächlich für die Kommunikation zwischen den verschiedenen auf einer elektronischen Karte integrierten Komponenten konzipiert ist. Der ausgewählte Sensor wird voraussichtlich sehr preiswert sein, jedoch nicht für den Anschluss im industriellen Umfeld ausgelegt. Die endgültigen Kosten für die Integration einer Komponente im Wert von einigen Franken werden wahrscheinlich viel höher ausfallen als für einen Sensor, der in einem Element gekapselt ist, das mit einer IEC 61131-2-kompatiblen Schnittstelle ausgestattet ist.

Suite, [Verknüpfung der Schnittstellenkarten mit dem Programm](./README_DE_part_3.md).