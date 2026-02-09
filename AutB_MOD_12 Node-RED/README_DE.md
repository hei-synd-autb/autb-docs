<h1 align="left">
  <br>
  <img src="./img/hei-en.png" alt="HEI-Vs Logo" width="350">
  <br>
  Grundlagen der Industrieautomation
  <br>
</h1>

Kurs AutB

# Modul 12 Node-RED
*2. Teil Flussbasierte Programmierung*

*Stichwörter:* **Fluss / Knoten / Funktion / Kontextdaten / Nachricht / Nutzlast**

<figure>
    <img src="./img/openjs_foundation-logo.svg"
         alt="openjs_foundation-logo"
         width="400">
  <figcaption>OpenJS Foundation: <a href="https://openjsf.org/">OpenJS</a></figcaption>
</figure>



# Einführung
:no_bell: *Im weiteren Verlauf dieses Kurses sind einige Absätze mit diesem Symbol markiert. Dies bedeutet nicht unbedingt, dass das Thema unwichtig ist, sondern eher, dass es nicht im Detail behandelt wird.*

## Java Script
JavaScript ist eine hochwertige, interpretierte Programmiersprache, die hauptsächlich zur Erstellung interaktiver Effekte in Webbrowsern verwendet wird. Es ermöglicht dynamische Inhalte, Steuerung von Multimedia, animierte Bilder und vieles mehr auf Webseiten. JavaScript ist eine Kerntechnologie des World Wide Web, neben HTML und CSS.

Ursprünglich für die clientseitige Skripterstellung in Browsern entwickelt, wird JavaScript jetzt auch häufig auf der Serverseite verwendet (besonders mit Node.js). Es ist bekannt für seine Flexibilität, sein ereignisgesteuertes Programmiermodell und die Unterstützung objektorientierter, zwingender und funktionaler Programmierkonzepte.

**Hauptmerkmale:**
- Läuft in allen modernen Webbrowsern
- Dynamisch typisiert und prototypbasiert
- Unterstützt asynchrone Programmierung, Callbacks, Promises, async/await.
- Ermöglicht DOM-Manipulation und Ereignisbehandlung

**Beispiel:**
```javascript
console.log("Hallo, Welt!");
```

## Die V8-Engine
Die **V8-Engine** ist eine quelloffene JavaScript-Engine, die von Google entwickelt wurde. Sie ist in C++ geschrieben und wird in Google Chrome und anderen Chromium-basierten Browsern verwendet, um JavaScript-Code auszuführen. V8 kompiliert JavaScript direkt in nativen Maschinencode, bevor er ihn ausführt, was ihn extrem schnell macht.

**Wichtige Punkte zu V8:**
- Von Google für Chrome entwickelt, wird aber auch in Node.js verwendet.
- Übersetzt JavaScript in effizienten Maschinencode mit Just-In-Time (JIT)-Kompilierung.
- Bietet hohe Leistung für die clientseitige Ausführung in Browsern und die serverseitige Ausführung in Node.js-JavaScript.
- Kontinuierlich optimiert für Geschwindigkeit und Speichereffizienz.

**Warum ist V8 wichtig?**
V8s Leistung und Effizienz sind ein Hauptgrund dafür, dass JavaScript für großflächige, hochperformante Anwendungen verwendet werden kann, sowohl in Browsern als auch auf Servern über Node.js.

<div align="center">
<figure>
    <img src="./img/Node_js_architecture.jpg"
         alt="Node_js_architecture.jpg"
         width="400">
  <figcaption>Node.js-Architektur, Quelle: <a href="https://www.techanicinfotech.com//">Technic Infotech</a></figcaption>
</figure>
</div>

## Node JS
> Wir werden uns in diesem Kurs nicht eingehend mit Node.js befassen, aber wir halten es für hilfreich, das zugrunde liegende Framework der Umgebung zu verstehen, die wir nutzen werden. Dies kann Ihnen manchmal helfen, sein Verhalten zu verstehen, von seinen Vorteilen zu profitieren und seine Mängel zu vermeiden.

> Wir gehen etwas weiter, denn im vorherigen Modul haben wir die **zyklische Programmierung** behandelt, und jetzt die **asynchrone Architektur** und die **ereignisgesteuerte Programmierung**. Dies unterscheidet sich sehr von dem, was Sie durch einfaches Ausführen von Python für die Datenanalyse tun könnten.

> In Python könnten Sie einige asynchrone Aufgaben mit asyncio ausführen. Da ich kein Python-Experte bin, möchte ich mich nicht in diese Debatte einmischen.

Node.js ist eine quelloffene, plattformübergreifende, einthread-basierte **Laufzeitumgebung**, die für die Entwicklung schneller, skalierbarer Server- und Netzwerkanwendungen konzipiert ist. Sie wird auf der V8-JavaScript-Engine ausgeführt und nutzt eine nicht blockierende, ereignisgesteuerte I/O-Architektur, was sie effizient und für Echtzeitanwendungen geeignet macht.

> Eine **Laufzeitumgebung** ist die zugrunde liegende Plattform oder das System, das die erforderlichen Ressourcen und Dienste für die Programmausführung bereitstellt. Im Kontext von Node.js umfasst die Laufzeitumgebung die V8-JavaScript-Engine, Bibliotheken und APIs, die es JavaScript-Code ermöglichen, außerhalb eines Webbrowsers auszuführen und mit dem Dateisystem, dem Netzwerk und anderen Systemressourcen zu interagieren.

Traditionell funktionierte JavaScript nur im Front-End, da die Laufzeitumgebung nur in Webbrowsern wie Google Chrome verfügbar war. Die Programmiersprache könnte daher verwendet werden, um eine clientseitige Anwendung zu erstellen, ähnlich einer dynamischen Website.

Ryan Dahl erstellte 2009 Node.js als leichte, reaktionsschnelle Laufzeitumgebung für JavaScript. Diese Software ermöglicht es Entwicklern, die Skriptsprache als serverseitigen Code zu verwenden.

Die Verwendung von JavaScript auf der Serverseite ermöglicht es Entwicklern, sowohl das Front-End als auch das Back-End in derselben Sprache zu schreiben. Dies rationalisiert Entwicklung und Wartung, da sie denselben Code wiederverwenden können.

Darüber hinaus ermöglicht die Back-End-Entwicklung in JavaScript der Anwendung, von Node.js' asynchronem Programmiermodell zu profitieren. Diese Architektur ermöglicht es dem Webservice im Kern, effizienter auf mehrere Benutzeranfragen zu reagieren.

### Was bedeutet Einthread-Umgebung?
Eine **Einthread-Umgebung** bedeutet, dass alle Code-Ausführungen auf einem Haupt-Thread der CPU stattfinden, anstatt mehrere Threads zu verwenden, um Aufgaben parallel auszuführen.

In Node.js bedeutet dies:

- Immer nur eine Operation kann JavaScript-Code gleichzeitig ausführen.
- Node.js verwendet eine Event-Loop zur Verwaltung vieler Aufgaben, wie E/A-Operationen, asynchron, sodass es mehrere Verbindungen effizient verwalten kann, ohne für jede einen neuen Thread zu erstellen.
- CPU-intensive Aufgaben können die Event-Loop blockieren, daher ist Node.js am besten für E/A-gebundene Anwendungen geeignet.

💡 **Analogie:**  
Denken Sie an ein Einthread-System wie an einen Chef, den Thread, in einer Küche. Der Chef kann immer nur ein Gericht zubereiten, kann aber ein Gericht starten, es in den Ofen schieben, E/A, und während es backt, mit der Zubereitung eines anderen Gerichts beginnen. Der Chef dupliziert sich nie selbst, verwaltet aber viele Aufgaben, indem er effizient zwischen ihnen wechselt.

⚠️ **Fallstrick**
Wenn Sie lange laufenden, CPU-intensiven Code in Node.js ausführen, blockiert er die Event-Loop und verlangsamt alle anderen Operationen. Für solche Aufgaben erwägen Sie die Verwendung von Worker-Threads oder verschieben Sie die Arbeit außerhalb von Node.js.

> Um zu verstehen, wie Node.js funktioniert, müssen Sie die folgenden wichtigen Begriffe verstehen.
> - Blockierungsfreies E/A-Modell
> - Asynchrone Architektur
> - Ereignisgesteuert

## Blockierungsfreies E/A-Modell

Um eine Benutzeranfrage zu verarbeiten, verwenden traditionelle Server wie Apache und Tomcat einen einzelnen Thread, der jeweils einen Client bedienen kann. Wenn die maximale Anzahl von Threads erreicht ist, muss eine neue Anfrage warten, bis bestehende Threads ihre Aufgaben abschließen.

Threads, die noch Benutzeranfragen verarbeiten, blockieren Eingaben von neuen Clients und leiten Ausgaben nicht an externe Dienste wie APIs oder Datenbanken weiter. Dies kann während Verkehrsspitzen mit vielen gleichzeitigen Verbindungen zu Engpässen führen.

Blockierungsfreie Paradigmen bedeuten, dass ein einzelner Node.js-Thread eine neue Anfrage empfangen und übertragen kann, ohne auf die Fertigstellung der aktuellen Anfrage zu warten. Dieses System wird asynchrone Architektur genannt.

## Asynchrone Architektur

Eine synchrone Architektur verarbeitet Clientanfragen der Reihe nach, was bedeutet, dass der Webserver die aktuelle Operation abschließt, bevor er eine neue startet.

Im Gegensatz dazu wird **eine Anwendung mit asynchroner Architektur eine neue Operation starten, während sie auf die Ergebnisse anderer Operationen wartet**. Sobald sie eine Antwort erhält, gibt der Webserver die Daten an den Client zurück.

Asynchrone Architektur eignet sich für Anwendungen, die Daten aus anderen Diensten abrufen müssen, wie z.B. Anwendungsprogrammierschnittstellen. **APIs** oder **Datenbanken**. Anstatt untätig zu bleiben, kann der Webserver neue Anfragen verarbeiten, während er auf Antworten wartet.

Während ausgezeichnet für Ein-/Ausgabe, **E/A-Aufgaben**, **macht diese Architektur Node.js CPU-intensiver**, da sie nur einen einzelnen Thread zur Verarbeitung mehrerer Anfragen verwendet.

## Ereignisgesteuert

In Node.js sind Ereignisse Signale, die angeben, dass eine bestimmte Aktion stattgefunden hat. Sie können beispielsweise eine **neue Operation** oder den **Abschluss** einer Aufgabe auslösen.

**Ereignisse sind ein wesentlicher Bestandteil des asynchronen Modells**. Sie arbeiten in einer Schleife und teilen Node.js mit, wie es den Anfragenstrom bewältigen soll.

Wenn eine neue Anfrage von einem Client empfangen wird, startet die Event-Loop. Node.js leitet die Anfrage dann an den entsprechenden externen Dienst wie eine API weiter. Sobald der Server die Daten erhält, löst ein neues Ereignis eine Callback-Funktion aus.

Eine Callback-Funktion führt eine andere Funktion aus, wenn eine bestimmte Bedingung oder eine asynchrone Operation abgeschlossen ist. Es ermöglicht dem Webserver, Anfragen zu verarbeiten und Antworten an den Client zu senden.

## Vorteile der Verwendung von Node.js

Nun, da wir die Mechanik von Node.js verstehen, schauen wir uns an, wie dieses Modell Ihre Webentwicklung zugute kommen kann.

- **Geschwindigkeit**. Die asynchrone Architektur von Node.js verarbeitet mehrere E/A-Operationen effizienter, was zu einer responsiveren Anwendung führt. Es ermöglicht auch die Echtzeit-Datenausführung.
- **Fehlerbehandlungsmechanismus**. Integrierte Fehlerobjekte bieten Benutzern größere Flexibilität bei der Behandlung vieler Probleme. Sie ermöglichen es Entwicklern, detailliertere Informationen zum Fehler zu erhalten, um eine effizientere Fehlerbehebung und Verarbeitung zu ermöglichen.
- **Entwicklungseffizienz**. Node.js ermöglicht Entwicklern, überall JavaScript für eine umfassende Entwicklung zu verwenden. Es erleichtert die Entwicklung, da der Code nahtlos zwischen Backend und Frontend läuft.
- **Ein reichhaltiges Ökosystem**. Benutzer können verschiedene Module über den Node Package Manager (NPM) installieren, um problemlos neue Funktionen zu ihren Node.js-Anwendungen hinzuzufügen, ohne sie von Grund auf neu zu schreiben.
- **Flexibilität und Skalierbarkeit**. Entwickler können Node.js mit anderen Frameworks und Betriebssystemen verwenden. Sie können auch die Laufzeitumgebung unter Verwendung verschiedener Ansätze weiterentwickeln, z.B. durch Installation eines Last-Balancers oder Implementierung von Microservices.
- **Open Source**. Der Node.js-Quellcode ist für alle Benutzer zugänglich, und seine Ersteller befürworten Transparenz, Innovation und Anpassung. Diese Laufzeitumgebung profitiert auch von erheblicher Community-Unterstützung.

### Woraus ist Node.js entwickelt?

Node.js wird in C, C++ und JavaScript entwickelt.

Laut Wikipedia ist Node.js "eine verpackte Kompilation von Googles V8-JavaScript-Engine, der libuv-Plattform-Abstraktionsschicht und einer Kernbibliothek, hauptsächlich in JavaScript geschrieben."

Die Laufzeitumgebung nutzt intern Chrome V8, die JavaScript-Laufzeitumgebung, selbst in C++ geschrieben. Dies ermöglicht Node.js den Zugriff auf interne Systemfunktionen wie Netzwerkverwaltung.

### Node.js-Architektur und -Betrieb

Node.js basiert auf einer Architektur namens **Single-Thread-Event-Loop**, um mehrere Clients gleichzeitig zu verwalten. Im Gegensatz zu anderen Umgebungen wie Java, die ein Multi-Thread-Modell verwenden, bei dem jede Client-Anfrage von einem separaten Thread aus einem Thread-Pool verarbeitet wird, verarbeitet Node.js alle Anfragen auf einem einzelnen Thread über eine Event-Loop. Dies ermöglicht eine effiziente Verarbeitung mehrerer gleichzeitiger Verbindungen ohne Erstellung eines separaten Threads für jeden Client, verbesserte Leistung und Ressourcennutzung.

<div align="center">
<figure>
    <img src="./img/How node.js process incoming requests using the event loop.png"
         alt="Wie node.js eingehende Anfragen mit der Event-Loop verarbeitet"
         width="400">
  <figcaption>Wie node.js eingehende Anfragen mit der Event-Loop verarbeitet, Quelle: <a href="https://kinsta.com/knowledgebase/what-is-node-js/">Kinsta</a></figcaption>
</figure>
</div>


# Node-RED
<figure>
    <img src="./img/LogoNode-RED.png"
         alt="LogoNode-RED"
         width="100">
  <figcaption>Low-Code-Programmierung für ereignisgesteuerte Anwendungen <a href="https://nodered.org/">nodered.org</a></figcaption>
</figure>


## Eine kurze Einführung in Node-RED

Node-RED ist ein Werkzeug zum Erstellen von Internet-of-Things-(IoT-)Anwendungen mit Fokus auf die Vereinfachung der **Verdrahtung** von Codeblöcken zur Ausführung von Aufgaben. Es nutzt einen visuellen Programmieransatz, der es Entwicklern ermöglicht, vordefinierte Codeblöcke zu verbinden, die als **Knoten** bekannt sind, um eine Aufgabe auszuführen. Die verbundenen Knoten, normalerweise eine Kombination aus Eingabeknoten, Verarbeitungsknoten und Ausgabeknoten, bilden zusammen einen **Fluss**.

Ursprünglich als Open-Source-Projekt bei IBM Ende 2013 entwickelt, um ihre Anforderung zu erfüllen, Hardware und Geräte schnell mit Webdiensten und anderer Software zu verbinden - eine Art Klebstoff für das IoT - hat es sich schnell zu einem universellen IoT-Programmierwerkzeug entwickelt. Wichtig ist, dass Node-RED schnell eine umfangreiche und wachsende Benutzerbasis und eine aktive Entwickler-Community etabliert hat, die neue Knoten beitragen, die es Programmierern ermöglichen, Node-RED-Code für eine Vielzahl von Aufgaben wiederzuverwenden.

Obwohl Node-RED ursprünglich für die Arbeit mit dem Internet der Dinge konzipiert war, ist es mittlerweile für eine Reihe von Anwendungen nützlich geworden und wird jetzt als eines der führenden Low-Code-/No-Code-Visualentwicklungswerkzeuge betrachtet.

> Hier bei HEVS verwenden wir Node-RED nach Tests und Validierung als Benutzeroberfläche für einen Prototyp zur Wasserfiltration und setzen es als Benutzeroberfläche für alle Labore in der Automatisierung ein.

## Die Node-RED-Oberfläche

Node-RED ist ein Softwareprogramm zur Verwaltung von Event-Flows, Abfolgen von Verarbeitungen, die nach dem Empfang von Nachrichten oder Ereignissen ausgeführt werden. Es enthält eine Reihe von Grundfunktionen, aber die meisten nützlichen Funktionen in unserem Fall müssen später installiert werden.

In Node-RED wird eine "Funktion" als Knoten dargestellt, ein Element, das in Ihrem Fluss platziert werden kann und mit anderen Knoten als Ein- oder Ausgaben verbunden ist. Der Fluss stellt alle Knoten dar. Er ist nicht linear, und ein Knoten, der mit keinem anderen verbunden ist, kann immer noch aktiviert werden, wenn die Bedingungen erfüllt sind.

<div align="center">
<figure>
    <img src="./img/NodeRedInABrowser.png"
         alt="Bild verloren: NodeRedInABrowser.png"
         width="500">
  <figcaption>Node-RED läuft in einem Browser</figcaption>
</figure>
</div>

Die Node-RED-Oberfläche besteht aus vier Teilen:

### 🔹 Links
Die Liste verfügbarer Knoten. Um sie im Fluss zu platzieren, wählen Sie den gewünschten aus und ziehen ihn an die gewünschte Stelle.

### 🔹 In der Mitte
Die **Flüsse**. Sie können so viele öffnen, wie Sie möchten; jeder Fluss ist unabhängig und kann andere nicht beeinflussen. Konkret ist ein **Fluss** eine Registerkarte, die als ein Unterprogramm mit seinen eigenen Variablen angesehen werden kann.

### 🔹 Auf der rechten Seite
Nützliche Registerkarten.
- Die Registerkarte i bietet detaillierte Informationen zu ausgewählten Knoten.
- Die Debug-Registerkarte, Lupe-Symbol, erscheint, sobald ein Debug-Knoten platziert wird und
ermöglicht es Ihnen, Debug-Nachrichten anzuzeigen.
- Die Dashboard-Registerkarte, Graph-Symbol, erscheint, sobald ein Dashboard-Knoten
erscheint und ermöglicht den Zugriff darauf.
- Weitere Registerkarten können je nach installierten und platzierten Knoten erscheinen.

### 🔹 Oben
Die Schaltfläche Bereitstellen ermöglicht es Ihnen, Ihren Fluss zu **bereitstellen** und ihn aktiv zu machen. Die
Menüschaltfläche, parallel Linien-Symbol, öffnet ein Menü mit folgenden Optionen:
- Ansicht: Verwalten Sie die Ansicht, blenden Sie die Seitenmenüs ein oder aus. Es ermöglicht auch
Zugriff auf das Debug- oder Dashboard, falls aktiv.
- Importieren: Einen gespeicherten Fluss laden
- Exportieren: Offene Flüsse speichern
- Palette verwalten: Installierte Knoten verwalten und neue installieren
- Flüsse / Unterflüsse: Einen neuen Fluss oder Unterfluss erstellen.

---


## Häufige Knoten

Beginnen wir mit den grundlegenden Knoten, die häufig verwendet werden.
Hier ist eine Liste von Notizen mit einem Reminder in meinen eigenen Worten, was sie tun.

### Beispiele
Es gibt viele integrierte Beispiele für jeden Knoten. Das Betrachten der Beispiele ist wahrscheinlich der beste Weg, um Node-RED zu lernen und zu verstehen.

<div style="text-align: center;">
<figure>
  <img src="./img/Lot_of_examples.png"
     alt="Bild verloren: Lot_of_examples"
     width = "400">
  <figcaption>Laden Sie ein Beispiel, um einen Knoten zu verstehen!</figcaption>
</figure>
</div>

### Wie man ein Beispiel lädt
Node-RED ist letztlich nur eine große JSON-Datei.

Unten ein erstes Beispiel.

:bulb: Sie müssen den folgenden JSON-Code nicht verstehen!

```json
[
    {
        "id": "c4abe2be0fc6d270",
        "type": "group",
        "z": "3f31cf57430bd5cb",
        "name": "",
        "style": {
            "label": true
        },
        "nodes": [
            "d2b330ed93df35a0",
            "81e48eeb776da060",
            "4d5a8d75274a52cb"
        ],
        "env": [
            {
                "name": "This_Group",
                "value": "4",
                "type": "num"
            }
        ],
        "x": 94,
        "y": 99,
        "w": 372,
        "h": 162
    },
    {
        "id": "d2b330ed93df35a0",
        "type": "inject",
        "z": "3f31cf57430bd5cb",
        "g": "c4abe2be0fc6d270",
        "name": "",
        "props": [
            {
                "p": "payload"
            },
            {
                "p": "topic",
                "vt": "str"
            }
        ],
        "repeat": "",
        "crontab": "",
        "once": false,
        "onceDelay": 0.1,
        "topic": "",
        "payload": "Hallo!",
        "payloadType": "str",
        "x": 190,
        "y": 140,
        "wires": [
            [
                "81e48eeb776da060"
            ]
        ]
    },
    {
        "id": "81e48eeb776da060",
        "type": "debug",
        "z": "3f31cf57430bd5cb",
        "g": "c4abe2be0fc6d270",
        "name": "debug 4",
        "active": true,
        "tosidebar": true,
        "console": false,
        "tostatus": false,
        "complete": "false",
        "statusVal": "",
        "statusType": "auto",
        "x": 360,
        "y": 140,
        "wires": []
    },
    {
        "id": "4d5a8d75274a52cb",
        "type": "comment",
        "z": "3f31cf57430bd5cb",
        "g": "c4abe2be0fc6d270",
        "name": "Node-RED sagt Hallo!",
        "info": "# Einige Dokumentation\n\nHier sollten Sie erklären, was Sie tun.\n\n|Eine Tabelle|Etikett|\n|-------|-----|\n|N°1    |Beispiel|\n\n```mermaid\nflowchart LR\n    Start --> Stop\n\n```",
        "x": 220,
        "y": 220,
        "wires": []
    }
]
```

Sie könnten diesen Text in eine JSON-Datei exportieren, aber Sie können ihn einfach so einfügen.

<div align="center">
<figure>
    <img src="./img/Insert_Import_Node.png"
         alt="Insert_Import_Node"
         width="400">
  <figcaption>Rechtsklick, Einfügen Importieren</figcaption>
</figure>
</div>

<div align="center">
<figure>
    <img src="./img/Insert_Import_Code.png"
         alt="Insert_Import_Code"
         width="400">
  <figcaption>JSON-Text kopieren und einfügen, aktueller Fluss, Importieren</figcaption>
</figure>
</div>

**Bereitstellen!**

> Beachten Sie, dass Sie, wenn Sie auf den Kommentar klicken: Node-RED sagt Hallo!, die Block-Dokumentation durch Klick auf die Schaltfläche :information_source: in der oberen rechten Ecke des Fensters lesen können.
---



### Einfügen
Hauptsächlich zum Debuggen, wird verwendet, um eine Nachricht manuell zu senden.

<div style="text-align: left;">
<figure>
  <img src="./img/Node_inject.png"
     alt="Bild verloren: Node_inject"
     width = "200">
  <figcaption>Knoten Einfügen</figcaption>
</figure>
</div>

<div style="text-align: center;">
<figure>
  <img src="./img/Node_inject_Hello_World.png"
     alt="Bild verloren: Node_inject_Hello_World"
     width = "400">
  <figcaption>Hallo Welt einfügen!</figcaption>
</figure>
</div>

:bulb: Kann auch verwendet werden, um eine Nachricht mit einer bestimmten Verzögerung oder einem wählbaren Zeitintervall einzufügen.


### Debuggen
Ermöglicht es Ihnen, eine Teilnachricht oder eine vollständige Nachricht im Debug-Fenster anzuzeigen.

<div style="text-align: center;">
<figure>
  <img src="./img/Hello_World_Debug.png"
     alt="Bild verloren Hello_World_Debug"
     width = "400">
  <figcaption>Hallo Welt debuggen!</figcaption>
</figure>
</div>

<div style="text-align: center;">
<figure>
  <img src="./img/Debug_Icon.png"
     alt="Bild verloren Debug_Icon: Node_inject_Hello_World"
     width = "400">
  <figcaption>Klicken Sie auf dieses Symbol zum Debuggen.</figcaption>
</figure>
</div>

<div style="text-align: center;">
<figure>
  <img src="./img/Debug_Hello.png"
     alt="Bild verloren Debug_Hello"
     width = "400">
  <figcaption>Debug-Fenster</figcaption>
</figure>
</div>

### vollständig
:no_bell: *nur zur Information*

<div style="text-align: left;">
<figure>
  <img src="./img/Node_complete.png"
     alt="Bild verloren Node_complete"
     width = "200">
  <figcaption>Knoten vollständig</figcaption>
</figure>
</div>

Ich habe es bisher sehr wenig verwendet.
Weitere Informationen: [Was ist der Complete-Knoten?](https://flowfuse.com/node-red/core-nodes/complete/)


### Fangen
:no_bell: *nur zur Information*

<div style="text-align: left;">
<figure>
  <img src="./img/Node_catch.png"
     alt="Bild verloren Node_catch"
     width = "200">
  <figcaption>Knoten fangen</figcaption>
</figure>
</div>

Ich habe es bisher sehr wenig verwendet.
Weitere Informationen:: [Was ist der Catch-Knoten?](https://flowfuse.com/node-red/core-nodes/catch/)

<div style="text-align: center;">
<figure>
  <img src="./img/Node-RED catch.png"
     alt="Bild verloren Node-RED catch"
     width = "500">
  <figcaption>Fehlermeldung abfangen</figcaption>
</figure>
</div>

Im obigen Beispiel wird eine Textnachricht, `Ungültige Eingabe gesendet`, an eine JavaScript-Funktion gesendet, die Text verarbeiten soll.

Der Catch-Knoten fängt alle Arten von Fehlern im Fluss ab. Wir schreiben dann einen Text in die Nutzlast für `debug 2`.

:memo: In der SPS-Welt gibt es das Konzept des Fehlers häufig nicht. Deshalb bemühen wir uns, Code mit absoluter Robustheit zu schreiben.

:warning: In der SPS-Welt finden wir das Konzept eines Alarms. **Dies ist grundlegend anders**. Wenn es einen Alarm gibt, ist dies ein Fehler; ganz im Gegenteil; es bedeutet, dass der Ingenieur das Problem antizipiert hat und die Reaktion der Maschine auf einen bestimmten Fall programmiert hat.

### Status
:no_bell: *nur zur Information*

<div style="text-align: left ;">
<figure>
  <img src="./img/Node_status.png"
     alt="Bild verloren Node_status"
     width = "200">
  <figcaption>Knoten Status</figcaption>
</figure>
</div>

[Wofür wird der Status-Knoten in Node-RED verwendet?](https://flowfuse.com/node-red/core-nodes/status/)

<div style="text-align: center;">
<figure>
  <img src="./img/Status_Example.png"
     alt="Bild verloren Status_Example"
     width = "500">
  <figcaption>Status-Beispiel</figcaption>
</figure>
</div>

In diesem Fall werden zwei Debug-Knoten konfiguriert, um einen Status direkt an den Status-Knoten zu senden und nicht zum Debug-Fenster

<div style="text-align: center;">
<figure>
  <img src="./img/Node_Status_Only.png"
     alt="Bild verloren Node_Status_Only"
     width = "300">
  <figcaption>Nur Status-Knoten</figcaption>
</figure>
</div>

### Link-Knoten
Link-Knoten ermöglichen es Ihnen, einen Fluss zu erstellen, der zwischen den Registerkarten im Editor springen kann - sie fügen einen virtuellen Draht vom Ende eines Flusses zum Anfang eines anderen hinzu.

#### Link-Ausgang

<div style="text-align: left;">
<figure>
  <img src="./img/Node_link_out.png"
     alt="Bild verloren Node_link_out"
     width = "200">
  <figcaption>Knoten Link-Ausgang</figcaption>
</figure>
</div>

Sie können beispielsweise eine Nachricht an einen anderen Fluss senden. Oder vermeiden Sie, zu viele Links im aktuellen Fluss zu haben.

<div style="text-align: center;">
<figure>
  <img src="./img/Hello_to_flow_2.png"
     alt="Bild verloren Hello_to_flow_2"
     width = "400">
  <figcaption>Link-Ausgang zu einem anderen Fluss</figcaption>
</figure>
</div>

#### Link-Eingang

<div style="text-align: left;">
<figure>
  <img src="./img/Node_link_in.png"
     alt="Bild verloren Node_link_in"
     width = "200">
  <figcaption>Knoten Link-Eingang</figcaption>
</figure>
</div>

In einem Link-Eingang können Sie Nachrichten von anderen Links auswählen, die Nachrichten senden.

<div style="text-align: center;">
<figure>
  <img src="./img/Hello_from_link_1.png"
     alt="Bild verloren Hello_from_link_1"
     width = "400">
  <figcaption>Wert aus einem anderen Fluss abrufen</figcaption>
</figure>
</div>


#### Link-Aufruf

Ruft einen Fluss auf, der mit einem Link-Eingabe-Knoten beginnt und gibt die Antwort weiter.

<div style="text-align: left;">
<figure>
  <img src="./img/Node_call.png"
     alt="Bild verloren Node_call"
     width = "200">
  <figcaption>Knoten Link-Aufruf</figcaption>
</figure>
</div>

Dieser Knoten sollte eher als Prüfbox für Link-Überprüfung als für einen Link angesehen werden.
Unten ein Beispiel mit einigen Illustrationen.

Hier empfängt der Knoten **Link-Aufruf mit Name Test In** einen Zeitstempel, dieser Zeitstempel wird an **Link-Ausgang** an die **Test-Funktion** gesendet, dann **Link-Eingang** - **gestrichelte Linie** - **Link-Ausgang** zum **grünen Debug Test-Funktion**.

<div style="text-align: center;">
<figure>
  <img src="./img/Link_call_fails.png"
     alt="Bild verloren Link_call_fails"
     width = "600">
  <figcaption>Test In mit dem Eingang der Test-Funktion verknüpft</figcaption>
</figure>
</div>

:warning: Dies verursacht ein Timeout, das vom roten Knoten nach **3 Sekunden** abgefangen wird. Warum?

<div style="text-align: center;">
<figure>
  <img src="./img/Link_call_time_out.png"
  <img src="./img/Link_call_time_out.png"
     alt="Bild verloren Link_call_fails"
     width = "400">
  <figcaption>Timeout nach 3 Sekunden, Link-Aufruf schlägt fehl</figcaption>
</figure>
</div>

:bulb: weil der **Link-Aufruf**-Knoten auf eine Kommunikationsrückmeldung wartet. Dazu müssen wir den **Link-Eingang** nach der **Funktion** bearbeiten, um im Modus zu sein: **Zurück zum aufrufenden Link-Knoten**.

<div style="text-align: center;">
<figure>
  <img src="./img/Return_to_calling_link_node.png"
  <img src="./img/Link_call_time_out.png"
     alt="Bild verloren Link_call_fails"
     width = "400">
  <figcaption>Timeout nach 3 Sekunden</figcaption>
</figure>
</div>

Infolgedessen ändert sich das Link-Ausgangs-Symbol wie folgt:

<div style="text-align: center;">
<figure>
  <img src="./img/Link_call_success.png"
     alt="Bild verloren Link_call_success"
     width = "600">
  <figcaption>Link-Aufruf erfolgreich</figcaption>
</figure>
</div>

Was passiert, wenn wir auf den Zeitstempel drücken?

<div style="text-align: center;">
<figure>
  <img src="./img/Link_call_success_path.png"
     alt="Bild verloren Link_call_success_path"
     width = "600">
  <figcaption>Link-Aufruf erfolgreich mit Pfad</figcaption>
</figure>
</div>

1.  Wir senden einen Zeitstempel an **Test In**.
2.  Der Link-Aufruf ist konfiguriert, um die Nachricht über **Link-Ausgang** an die Test-Funktion zu senden.
3.  Der konfigurierte Link sendet die Nachricht an **Test In** zurück.
4.  Wenn die Nachricht innerhalb der konfigurierten Verzögerung empfangen wird, wird die Nachricht an Debug Call Three weitergeleitet.

<div style="text-align: center;">
<figure>
  <img src="./img/Link_call_some_test.png"
     alt="Bild verloren Link_call_some_test"
     width = "600">
  <figcaption>Einige Tests zum Verständnis der Nachricht</figcaption>
</figure>
</div>

Im letzten Bild fügen wir nach der Test-Funktion eine **Verzögerung von 5 Sekunden** hinzu. Durch Hinzufügen dieser Verzögerung können wir überprüfen, ob die Verzögerung zu lang ist und der Catch-Knoten eine Nachricht an das **Timeout überprüfen** sendet.

Sie können einen Debug-Knoten mit dem Namen **Zu überprüfende ID** hinzufügen und ihn mit Ausgabe konfigurieren: vollständiges Nachrichtenobjekt, wie für **Debug Call Three**.

Im Debug-Panel:

**Zu überprüfende ID**, prüfen Sie _msgid.

```js
{"_msgid":"45c782272fbc0a1b",
 "payload":1760443662079,
 "topic":""}
```

**Debug Call Three**, prüfen Sie _msgid.

```js
{"_msgid":"45c782272fbc0a1b",
 "payload":"Nutzlast der Test-Funktion",
 "topic":"",
 "_event":"node:8d2380bd9fd72ee5"}
```

Wir können sehen, dass die Nutzlast durch die Funktion geändert wurde, aber die **_msgid ist von Anfang bis Ende gleich**.

:bulb: Wenn Sie das letzte Bild vollständig verstehen können, haben Sie einen großen Schritt zum Verständnis des Node-RED-Prinzips gemacht.

### Kommentar

<div style="text-align: left;">
<figure>
  <img src="./img/Node_comment.png"
     alt="Bild verloren Node_comment"
     width = "200">
  <figcaption>Kommentar-Knoten</figcaption>
</figure>
</div>

Sie können detaillierte Informationen in Markdown-Format hinzufügen und sie auf der Registerkarte Information anzeigen.

<div style="text-align: center;">
<figure>
  <img src="./img/My_nice_comment_markdown_like.png"
     alt="Bild verloren My_nice_comment_markdown_like"
     width = "400">
  <figcaption>Mein schöner Kommentar auf der Info-Registerkarte</figcaption>
</figure>
</div>

### Anlage


> Zur Nachrichtenkennung wird sie auf 8 Bytes codiert. Hier ist ein Beispiel, um den 64-Bit-Unsigned-Wert von **_msgid** abzurufen.

```js
// var myHex = "d05a3b7f70b3e37f";
var myHex = msg._msgid;

// Genaue Umwandlung in BigInt (unsigned)
var asBigInt = BigInt("0x" + myHex);
msg.payload = asBigInt
return msg;
```

---

## Nächstes
Im Lernpfad von Node-RED wäre es logisch, mit der Funktion fortzufahren. Aber wir wollen ein Verständnis der Schnittstellen für die nächsten praktischen Arbeiten, Labore, haben. Deshalb präsentieren wir einen kurzen Überblick über einige Funktionen unten.

Die Funktionen im Detail werden nach der Oberfläche, / UI Benutzeroberfläche präsentiert.

---

## Funktions-Knoten

### Funktion
Knoten, mit denen Sie auf Nachrichten wirken, deren Inhalte ändern, Verarbeitung auf sie anwenden und die Art, wie sie geliefert werden, leicht beeinflussen können.

<figure>
    <img src="./img/node_function.png"
         alt="Bild verloren: node_function.png"
         width="200">
  <figcaption>Funktions-Knoten <a href="https://nodered.org">nodered.org</a></figcaption>
</figure>
Ermöglicht es Ihnen, eine Funktion in JavaScript zu erstellen. Nützlich für die Verarbeitung einer empfangenen Nachricht, um sie von einem Ausgabe-Knoten nutzbar zu machen.


> Die Funktion wird [im Detail in einem nachfolgenden Modul](../ADP_Module_05_Functions_Sub_Flows/README.md#function) entwickelt.

### Ändern

<figure>
    <img src="./img/node_change.png"
         alt="Bild verloren: node_change.png"
         width="200">
  <figcaption>Änderungs-Knoten <a href="https://nodered.org">nodered.org</a></figcaption>
</figure>

Der Änderungs-Knoten kann verwendet werden, um die Eigenschaften einer Nachricht zu ändern und Kontexteigenschaften zu setzen, ohne auf einen Funktions-Knoten zurückgreifen zu müssen.

Jeder Knoten kann mit mehreren Operationen konfiguriert werden, die der Reihe nach angewendet werden. Die verfügbaren Operationen sind:

- **Setzen** - eine Eigenschaft setzen. Der Wert kann verschiedene Typen haben oder von einer bestehenden Nachrichts- oder Kontexteigenschaft übernommen werden.
- **Ändern** - Teile einer Nachrichteneigenschaft suchen und ersetzen.
- **Verschieben** - eine Eigenschaft verschieben oder umbenennen.
- **Löschen** - eine Eigenschaft löschen.

<div align="center">
<figure>
    <img src="./img/Change_message_to_information.png"
         alt="Bild verloren: Change_message_to_information.png"
         width="500">
  <figcaption>Nachricht ändern, um Nutzlast zu formatieren</figcaption>
</figure>
</div>

<div align="center">
<figure>
    <img src="./img/Change_Set_Message.png"
         alt="Bild verloren: Node_SelectAMessage.png"
         width="400">
  <figcaption>Setzen in einer Änderung verwenden.</figcaption>
</figure>
</div>

<div align="center">
<figure>
    <img src="./img/Change_Change_Message.png"
         alt="Bild verloren: Node_SelectAMessage.png"
         width="400">
  <figcaption>Ändern in einer Änderung verwenden.</figcaption>
</figure>
</div>

Als Debug-Ausgabe:

```json
"Information von Node-RED."
```

### Schalter

<figure>
    <img src="./img/node_switch.png"
         alt="Bild verloren: node_switch.png"
         width="200">
  <figcaption>Schalter-Knoten <a href="https://nodered.org">nodered.org</a></figcaption>
</figure>

Der Schalter-Knoten ermöglicht es, Nachrichten zu verschiedenen Fluss-Zweigen weiterzuleiten, indem eine Reihe von Regeln für jede Nachricht ausgewertet wird.

<div align="center">
<figure>
    <img src="./img/Node_SelectAMessage.png"
         alt="Bild verloren: Node_SelectAMessage.png"
         width="500">
  <figcaption>Node-RED wählen Sie eine Nachricht</figcaption>
</figure>
</div>

Der Name **Schalter** kommt von der **Switch-Anweisung**, die vielen Programmiersprachen gemeinsam ist. Es ist keine Referenz zu einem physischen Schalter.

Der Knoten wird mit der zu überprüfenden Eigenschaft konfiguriert - dies kann entweder eine Nachrichteneigenschaft oder eine Kontexteigenschaft sein.


Es gibt vier Arten von Regeln:

- **Wert**-Regeln werden gegen die konfigurierte Eigenschaft ausgewertet
- **Sequenz**-Regeln können auf Nachrichtensequenzen verwendet werden, z.B. diejenigen, die vom Split-Knoten generiert werden
- Ein **Ausdruck** **JSONata** kann bereitgestellt werden, der gegen die gesamte Nachricht ausgewertet wird und übereinstimmt, wenn der Ausdruck einen True-Wert zurückgibt.
- Eine **Ansonsten**-Regel kann verwendet werden, um zu entsprechen, wenn keine der vorherigen Regeln übereinstimmten.

<div align="center">
<figure>
    <img src="./img/Node_Edit_Switch_Node.png"
         alt="Bild verloren: Node_Edit_Switch_Node.png"
         width="400">
  <figcaption>Node-RED Bearbeiten Sie den Schalter-Knoten</figcaption>
</figure>
</div>

Im obigen Beispiel wird der `Schalter` abhängig vom Wert von `Nutzlast` eine `Nachricht` in einen der `Debug-Knoten` senden.

Der Knoten leitet eine Nachricht an alle Ausgaben weiter, die den Regeln entsprechen. Er kann aber auch so konfiguriert werden, dass er die Regelauswertung stoppt, wenn er eine Übereinstimmung findet.

## Sequenz-Knoten
:no_bell: *nur zur Information*

Knoten, mit denen Sie auf die Sequenz übertragener Nachrichten wirken und so den Fluss beeinflussen können.

### Split-Knoten

<figure>
    <img src="./img/Node-split.png"
         alt="Bild verloren: Node-split.png"
         width="200">
  <figcaption>Split-Knoten</figcaption>
</figure>

### Join-Knoten

<figure>
    <img src="./img/Node-join.png"
         alt="Bild verloren: Node-join.png"
         width="200">
  <figcaption>Join-Knoten</figcaption>
</figure>

### Sort-Knoten

<figure>
    <img src="./img/Node-sort.png"
         alt="Bild verloren: Node-sort.png"
         width="200">
  <figcaption>Sort-Knoten</figcaption>
</figure>

### Batch-Knoten

<figure>
    <img src="./img/Node-batch.png"
         alt="Bild verloren: Node-batch.png"
         width="200">
  <figcaption>Batch-Knoten</figcaption>
</figure>


 Beispiele:

Ermöglicht das Aufteilen einer eingehenden Nachricht in mehrere ausgehende Nachrichten.

Ermöglicht das Gruppieren mehrerer eingehender Nachrichten in eine einzelne ausgehende Nachricht.

## Netzwerk-Knoten
:no_bell: *nur zur Information*

Knoten zur Verwaltung des Netzwerkaspekts des Flusses durch Konfiguration von HTTP-Anfragen, Websockets und TCP- oder UDP-Nachrichten. Diese Kategorie umfasst auch MQTT-Knoten (Mosquitto), falls Sie diese installieren.

## Parser
Knoten zur Verarbeitung formatierter Daten und Extraktion von JavaScript-Objekten, die von anderen Knoten verwendet werden können, oder zur Formatierung eines JavaScript-Objekts in ein gewünschtes Format. Diese Knoten können HTML-, CSV-, JSON-, XML- oder YAML-Formatierung verarbeiten.

> Wird in einem nachfolgenden Modul entwickelt

## Speicherung
Knoten zum Speichern von Nachrichtendaten in Dateien. Sie ermöglichen auch die Überwachung von Dateien auf Änderungen.
Diese Kategorie umfasst auch Influxdb- und PostgreSQL-Knoten, falls Sie diese installieren.

Das i-Menü bietet detaillierte Erklärungen für jeden dieser Knoten.
> Wird in einem nachfolgenden Modul entwickelt

---

## Arbeiten mit Nachrichten
Ein Node-RED-Fluss funktioniert durch Weitergabe von Nachrichten zwischen Knoten. Die Nachrichten sind einfache JavaScript-Objekte, die beliebige Eigenschaften haben können.

Nachrichten haben normalerweise eine Payload-Eigenschaft - dies ist die Standard-Eigenschaft, mit der die meisten Knoten arbeiten.

Node-RED fügt auch eine Eigenschaft namens _msgid hinzu - dies ist ein Identifikator für die Nachricht, der verwendet werden kann, um ihren Fortschritt durch einen Fluss zu verfolgen.

```json
{
    "_msgid": "12345",
    "payload": "..."
}
```

Der Wert einer Eigenschaft kann ein beliebiger gültiger JavaScript-Typ sein, wie:

- Boolescher Wert - true, false
- Zahl - z.B. 0, 123.4
- Zeichenkette - "hallo"
- Array - [1,2,3,4]
- Objekt - { "a": 1, "b": 2}
- Null

[Weitere Informationen zu JavaScript-Typen](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Data_structures)

### Das Verständnis der Nachrichtenstruktur

Die einfachste Möglichkeit, die Struktur einer Nachricht zu verstehen, besteht darin, sie an einen Debug-Knoten zu übergeben und in der Debug-Seitenleiste anzuzeigen.

Standardmäßig zeigt der Debug-Knoten die msg.payload-Eigenschaft an, kann aber so konfiguriert werden, dass any Eigenschaft oder die gesamte Nachricht angezeigt wird.

Beim Anzeigen eines Arrays oder Objekts bietet die Seitenleiste eine strukturierte Ansicht, die zum Erkunden der Nachricht verwendet werden kann.

<div align="center">
<figure>
    <img src="./img/MessageInDebug.png"
         alt="Bild verloren: MessageInDebug.png"
         width="500">
  <figcaption>Node-RED-Nachricht im Debug-Fenster</figcaption>
</figure>
</div>

Die Nachricht ist ein Objekt.
- **topic** ist der Pfad zur SPS-Variablen: `plc/app/Application/sym/PackTag/Command/Parameter_Lreal`
- **payload** ist die tatsächliche zu übertragende Nachricht. Dies ist ein Objekt, und der Wert dieses Objekts ist ein Array von 8 Objekten mit `ID`, `Name`, `Unit` und `Value`.
- **type** der Nutzlast ist ein `Objekt`.
- und **timestamp**, **timestampFiletime** und schließlich: **_msgid**.

<div align="center">
<figure>
    <img src="./img/MessageInDebugOverButton.png"
         alt="Bild verloren: MessageInDebugOverButton.png"
         width="500">
  <figcaption>Node-RED-Tools im Debug-Fenster</figcaption>
</figure>
</div>

<figure>
    <img src="./img/Node-RED_copy_path.png"
         alt="Bild verloren: Node-RED_copy_path.png"
         width="50">
  <figcaption>Pfad kopieren</figcaption>
</figure>

Kopiert den Pfad zum ausgewählten Element in die Zwischenablage. Dies ermöglicht es Ihnen, schnell zu bestimmen, wie Sie auf eine Eigenschaft in einem Änderungs- oder Funktions-Knoten zugreifen können

<figure>
    <img src="./img/Node-RED_copy_value.png"
         alt="Bild verloren: Node-RED_copy_value.png"
         width="50">
  <figcaption>Wert kopieren</figcaption>
</figure>

Kopiert den Wert des Elements als JSON-Zeichenkette in die Zwischenablage. Beachten Sie, dass die Seitenleiste Arrays und Puffer über einer bestimmten Länge abschneidet. Das Kopieren des Wertes einer solchen Eigenschaft kopiert die abgeschnittene Version.

<figure>
    <img src="./img/Node-RED_Pins.png"
         alt="Bild verloren: Node-RED_Pins.png"
         width="50">
  <figcaption>Stecknadeln</figcaption>
</figure>

Heftet das ausgewählte Element fest, damit es immer angezeigt wird. Wenn eine andere Nachricht vom selben Debug-Knoten empfangen wird, wird sie automatisch erweitert, um alle angehefteten Elemente anzuzeigen.

### Arbeiten mit JSON

**JSON**, JavaScript Object Notation, ist eine standardisierte Methode zur Darstellung eines JavaScript-Objekts als Zeichenkette. Es wird häufig von Web-APIs verwendet, um Daten zurückzugeben.

Wenn eine Nachrichteneigenschaft eine JSON-Zeichenkette enthält, muss diese zunächst in ihr entsprechendes JavaScript-Objekt analysiert werden, bevor die darin enthaltenen Eigenschaften aufgerufen werden können. Um zu bestimmen, ob eine Eigenschaft eine Zeichenkette oder ein Objekt enthält, kann der Debug-Knoten verwendet werden.

Node-RED stellt einen JSON-Knoten zur Verfügung, um diese Konvertierung durchzuführen.

:bulb: Falls Sie aus der Python-Welt kommen...

#### JSON und Python: Ähnlich, aber nicht identisch

| Konzept        | JSON                          | Python                   |
| -------------- | ----------------------------- | ------------------------ |
| Typ            | Textformat (Zeichenkette)     | In-Memory-Datenstruktur |
| Hauptcontainer | Objekt `{}`                   | Wörterbuch `dict`        |
| Arrays         | `[ ... ]`                     | Listen `[ ... ]`          |
| Zeichenketten  | `"text"`                      | `'text'` oder `"text"`     |
| Zahlen         | Keine Unterscheidung (nur numerisch) | `int`, `float`, etc.     |
| Booleans       | `true` / `false`              | `True` / `False`         |
| Null           | `null`                        | `None`                   |

So:

#### Ein JSON-Objekt wie

```json
{"name": "Alice", "age": 30}
```

#### ist äquivalent zu diesem Python-Wörterbuch:

```python
{"name": "Alice", "age": 30}
```

### Ändern von Nachrichteneigenschaften

Eine häufige Aufgabe in einem Fluss ist es, die Eigenschaften einer Nachricht zu ändern, wenn sie zwischen Knoten übertragen wird. Beispielsweise kann das Ergebnis einer HTTP-Anfrage ein Objekt mit vielen Eigenschaften sein, von denen nur einige benötigt werden.

Es gibt zwei Hauptknoten zum Ändern einer Nachricht: den Funktions-Knoten und den Änderungs-Knoten.

Der Funktions-Knoten ermöglicht es Ihnen, beliebigen JavaScript-Code für die Nachricht auszuführen. Dies gibt Ihnen vollständige Flexibilität, was Sie mit der Nachricht tun, erfordert aber Vertrautheit mit JavaScript und ist für viele einfache Fälle unnötig. Weitere Informationen zum Erstellen von Funktionen finden Sie hier.

Der Änderungs-Knoten bietet viele Funktionen ohne Code-Schreiben in JavaScript. Er kann nicht nur Nachrichteneigenschaften ändern, sondern auch auf Fluss- und Global-Kontext zugreifen.

Er bietet vier grundlegende Operationen:

    Eine Eigenschaft auf einen Wert setzen,
    Eine Zeichenketten-Eigenschaft durch Suchen und Ersetzen ändern,
    Eine Eigenschaft löschen,
    Eine Eigenschaft verschieben.

Für die Set-Operation identifizieren Sie zunächst die Eigenschaft, die Sie setzen möchten, und dann den Wert, den sie haben soll. Dieser Wert kann entweder ein fest codierter Wert, wie eine Zeichenkette oder Zahl, oder einer anderen Nachrichts- oder Fluss-/Global-Kontext-Eigenschaft sein. Es unterstützt auch die Verwendung der JSONata-Ausdruckssprache zur Berechnung eines neuen Wertes.

Sie können zum Beispiel die Fähigkeit des Debug-Knoten nutzen, den Pfad des Elements einer Nachricht zu ermitteln, und den Pfad direkt in das Feld 'to' einfügen, wobei msg. aus der Liste ausgewählt ist. Dadurch wird dann msg.payload auf den Wert von msg.payload.Phone[2].type gesetzt.


Ein weiteres Beispiel, die Verwendung eines JSONata-Ausdrucks, besteht darin, eine Temperatur aus msg.payload.temperature von Fahrenheit nach Celsius umzuwandeln und das Ergebnis in einer neuen Nachrichteneigenschaft msg.payload.temperature_c zu speichern.

### Nachrichtensequenzen

Eine Nachrichtensequenz ist eine geordnete Reihe von Nachrichten, die irgendwie miteinander verbunden sind. Beispielsweise kann der Split-Knoten eine einzelne Nachricht, deren Nutzlast ein Array ist, in eine Nachrichtensequenz umwandeln, wobei jede Nachricht eine Nutzlast hat, die einem Element des Arrays entspricht.

Verstehen msg.parts

Jede Nachricht in einer Sequenz hat eine Eigenschaft namens msg.parts. Dies ist ein Objekt, das Informationen darüber enthält, wie die Nachricht in die Sequenz passt. Es besitzt die folgenden Eigenschaften:

msg.parts.id
    ein eindeutiger Identifikator für die Sequenz
msg.parts.index
    die Position der Nachricht in der Sequenz
msg.parts.count
    falls bekannt, die Gesamtzahl der Nachrichten in der Sequenz

Hinweis: Das Parts-Array kann zusätzliche Metadaten zur Sequenz enthalten. Beispielsweise fügt der Split-Knoten auch Informationen an, die vom Join-Knoten zum Wiederzusammensetzen der Sequenz verwendet werden können. Siehe die Dokumentation des Split-Knotens.

### Arbeiten mit Sequenzen

<figure>
    <img src="./img/NodeRedSequence.png"
         alt="Bild verloren: NodeRedSequence.png"
         width="150">
  <figcaption>Sequenzen</figcaption>
</figure>

Es gibt eine Reihe von Kern-Knoten, die über Nachrichtensequenzen hinweg arbeiten können:

#### Split

Wandelt eine einzelne Nachricht in eine Nachrichtensequenz um.

Das genaue Verhalten des Knotens hängt vom Typ von msg.payload ab:

Zeichenkette/Puffer
    die Nachricht wird mit dem angegebenen Zeichen (Standard: `\n`), der Puffersequenz oder mit festen Längen aufgeteilt.
Array
    die Nachricht wird in einzelne Array-Elemente oder Arrays mit fester Länge aufgeteilt.
Objekt
    eine Nachricht wird für jedes Schlüssel-Wert-Paar des Objekts gesendet.

#### Join

Wandelt eine Nachrichtensequenz in eine einzelne Nachricht um.

Der Knoten bietet drei Betriebsmodi:

Automatisch
    versucht, die Aktion eines vorherigen Split-Knotens umzukehren
Manuell
    ermöglicht eine bessere Kontrolle über die Zusammenführung der Sequenz
Reduzieren
    Neu in 0.18 - ermöglicht, dass ein JSONata-Ausdruck für jede Nachricht in der Sequenz ausgeführt wird und das Ergebnis kumuliert wird, um eine einzelne Nachricht zu erzeugen.

#### Sort

Neu in 0.18

Sortiert die Sequenz basierend auf einem Eigenschaftswert oder JSONata-Ausdrucksergebnis.

#### Batch

Erstellt neue Sequenzen von Nachrichten aus empfangenen.

Der Knoten bietet drei Betriebsmodi:

Anzahl der Nachrichten
    gruppiert Nachrichten in Sequenzen einer bestimmten Länge. Die Überlap-Option gibt an, wie viele Nachrichten am Ende einer Sequenz am Anfang der nächsten Sequenz wiederholt werden sollen.
Zeitintervall
    gruppiert Nachrichten, die in dem angegebenen Intervall ankommen. Wenn keine Nachrichten in dem Intervall ankommen, kann der Knoten optional eine leere Nachricht senden.
Sequenzen zusammenführen
    erstellt eine Nachrichtensequenz durch Zusammenführung eingehender Sequenzen. Jede Sequenz muss eine msg.topic-Eigenschaft haben, um sie zu identifizieren. Der Knoten wird mit einer Themen-Wertliste konfiguriert, um die Reihenfolge zusammengeführter Sequenzen anzugeben.

## JSONata-Ausdruck?

## Ihre Aufgabe
Installieren Sie Node-RED auf Ihrem Laptop. Verwenden Sie diesen Link für die Anleitung zum Verfahren: [Ausführen von Node-RED lokal](https://nodered.org/docs/getting-started/local)

### Über die Werkzeuge
<figure>
    <img src="./img/Node_logo.png"
         alt="Node_logo"
         width="100">
  <figcaption>node js <a href="https://nodejs.org/en/">nodejs.org</a></figcaption>
</figure>

## Welche Node.js-Version?
[Überprüfen Sie hier die zugelassene Node.js-Version für Node-RED](https://nodered.org/docs/faq/node-versions).

[Download für Node js](https://nodejs.org/en/download).

### Über die Werkzeuge
<figure>
    <img src="./img/npm.png"
         alt="npm"
         width="100">
  <figcaption>npm Docs <a href="https://docs.npmjs.com/">npm</a></figcaption>
</figure>



## Was ist npm?
Node Package Manager, **NPM**, ist ein Werkzeug zur Installation von Software, wie Module oder Abhängigkeiten, für JavaScript-Anwendungen. Es trägt zur Verbesserung der Effizienz der Node.js-Entwicklung bei, indem Benutzer Zugriff auf zusätzliche Komponenten von einem zentral Ort erhalten.

**Wichtig!** NPM kann sich entweder auf das Dienstprogramm beziehen, das Entwickler zum Herunterladen von Paketen verwenden, oder auf das Repository, in dem Benutzer ihre Module teilen.

Das NPM-Repository enthält derzeit Millionen von Paketen und Modulen.

Das Herunterladen und Verwalten von Paketen von NPM erfolgt über die Befehlszeile Ihres Systems. Standardmäßig wird dieses Dienstprogramm nach der Installation von Node.js automatisch konfiguriert.

---

# [Dashboard 2.0 Benutzeroberfläche](UserInferface_DE.md)



<!-- Ende von README_DE.md -->
