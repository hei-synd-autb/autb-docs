<h1 align="left">
  <br>
  <img src="./img/hei-en.png" alt="HEI-Vs Logo" width="350">
  <br>
  HEI-Vs Engineering School - Industrial Automation Base
  <br>
</h1>

Cours AutB

# Module 03 Interfaces
## *2ème partie, les modules d'entrée sortie*

Author: [Cédric Lenoir](mailto:cedric.lenoir@hevs.ch)

## Un centre de communication.
Un automate moderne est avant tout un centre de communication qui permet dans un environnement donné d’utiliser une large gamme de protocoles et de matériel.

<figure>
    <img src="img/Internal Block Diagram of a PLC.png"
         alt="Internal Block Diagram of a PLC">
    <figcaption>Internal Block Diagram of a PLC</figcaption>
</figure>

### Un automate permet en particulier:
- De communiquer avec un opérateur via un **HMI** Human Machine Interface,
- De communiquer avec le développeur de l'application via un **IDE**,
- De communiquer avec la machine,
- De communiquer avec des bases de données internes ou externes **Cloud**,
- De gérer le système d'alimentation électrique et les défauts éventuels **UPS**.

> La notion de **IDE** Integrated Development Environment sera développée dans le cadre des travaux pratiques qui font partie intégrante.

> Un **UPS**, Uninterruptible Power Supply doit permettre à un automate de gérer certaines fonctions essentielles en cas de coupure électrique du réseau. De manière générale, un PLC doit pouvoir s'arrêter proprement, mais aussi redémarrer automtiquement après rétablissement de l'alimentation électrique.

# La notion de programme temps réel.

La notion de Système d’exploitation préemptif en temps réel, *preemptive* **real-time operating system** (RTOS) signifie principalement une chose:

> Le système d'expoitation est capable d'interrompre une tâche moins importante afin de pouvoir garantir l'exécution d'une autre tâche plus importante en respectant un temps de cycle et une précision déterminés.

Toute la théorie de traitement numérique du signal est basée sur l’échantillonnage. Si la répétabilité de la qualité de l’échantillonnage n’est pas garantie la qualité de traitement du signal.

> Il faut retenir qu'un PLC est capable d'exécuter la majorité des **algorithmes de traitement du signal** et de **régulation avancée** jusqu'à une bande passante de l'ordre de **1 à 2 [kHz]**.

## A propos des signaux numériques

### Définition
Par définition, un signal discret est une suite de valeurs numériques réeles ou complexes. S'il est formé par des valeurs réelles, il est appelé signal réel, alors que s'il est composé de valeurs complexes, on l'appelle signal complexe. Un signal numérique est un signal discret dont l'amplitude est qunatifiée.

### Notation
-   $\ x(k) $
-   $\ x(k  \Delta t) $

Où la variable idépendante K est un nombre entier.

### Echantillonnage
Théorème d'échantillonage
Un signal analogique $\ x_a(t)$ ayant une largeur de bande limitée à $\ F_s(Hz)$ ne peut être reconstitué exactement à partir de ses échantillons $\ x_a(k \delta t)$ que si ceux-ci ont été prélevés avec une période $\ \delta t$ inférieure ou égale à $\ 1/(2F_s)$.

Littérature: Voir [Murat Kunt, Traitement numérique des signaux](https://www.epflpress.org/produit/803/9782889142439/Traitement%20numerique%20des%20signaux%20) 

Les aspects mathématiques de traitement numériques des signaux seront traitées, selon les filière, dans différentes modules de systèmes industriel.

> L'objet de ce cours est de montrer que de nombreuses algorithmes qui étaient encore réservées il y a quelques années à des processeurs spécialisés de type **DSP**, **Digital Signal Processor**, peuvent être aujourd'hui être implémentés directement dans des PLC.

# Hypervisor
Il n'est pas du tout dans l'objectif de ce cours de rentrer dans les détails du mécanisme qui permet à un système d'exploitation temps réels, **RTOS** de partager le processeur et l'espace mémoire d'un même système avec un système d'exploitation de type Windows ou Linux.

<figure>
    <img src="img/Bare Metal Hypervisor.png"
         alt="Bare Metal Hypervisor">
    <figcaption>PLC et OS de type Windows ou Linux sur le même hardware</figcaption>
</figure>

# Des interfaces standards
 
Les fournisseurs de solutions PLC proposent des modules d’entrées sorties qui sont spécifiques à leur gamme de produits et ne sont généralement pas compatibles avec celles des autres fabricants, à commencer par leurs caractéristiques mécaniques.

## Exemple de modules d’entrées
|Origine Beckhoff   | Origine Siemens|
|:-----------------:|:--------------:|
|![](img/IO%20Module%20Beckhoff.jpg) |![](img/IO%20Module%20Siemens.png)|

Il existe une multitude de solutions techniques qui permettent à des modules de fabricants différents de communiquer entre eux, mais avec des conséquences directes sur le temps de développement et le coût du matériel. Il faudra encore y ajouter un risque supplémentaire pour l’augmentation de la complexité.

La première tâche de l’ingénieur en automation, mais souvent sous la responsabilité du chef de projet qui pourra être un ingénieur en chimie ou en mécanique, sera de sélectionner le fournisseur dont la gamme de produit correspond au mieux à son type d’application.

> Les fournisseurs de solutions PLC sont souvent spécialisés dans certains domaines d'activités. Un bon système pour la gestion d'un bâtiment, Chauffage, Ventilation et Climatisation, CVC, ne sera peut-etre pas du tout adapté pour la gestion d'une machine outil, Computerized Numerical Control, CNC.

# La disponibilité des capteurs et actionneurs.

Ce qui est valable pour les interfaces qui permettent de numériser le signal est aussi vrai pour les capteurs qui fournissent à l’automate l’information du processus ainsi que pour les actionneurs qui agissent sur le processus.
 
Les fournisseur de capteurs et actionneurs sont souvent différents des fournisseurs d’automate. Raison pour laquelle une gamme de signaux sont normalisés via la norme IEC 61131-2 ou IEC 61131-9 (Voir chapitre capteurs intelligents / IO-link, lien à compléter).
La norme IEC 61131-2 définit principalement les niveaux des signaux et la limite d’impédance pour signaux binaire, Digital Input, Digital Output et analogiques, Analog Input, Analog Output. Pour les signaux analogiques s’ajoutent des contraintes en termes de quantification et de résistance aux perturbations qui sont à mettre en parallèle avec le cours d’instrumentation.

Il ne s'agit pas ici de rentrer dans le détail des types de signaux, mais d'attirer l'attention sur les nombreuses variantes existantes au sein même de la norme IEC 61131-2.

## Digital Input [Source Siemens 2015](https://cache.industry.siemens.com/dl/files/921/109477921/att_862667/v3/109477921_Compliance_IEC_61131-2_DI_module_de.pdf)
|Signal range     |Type 1|Type 2|Type 3|
|-----------------|------|------|------|
|24 [Vdc]	      |...   |...   |...   |
|120 [Vac]	      |...   |...   |...   |
|230 [Vac]	      |...   |...   |...   |

A ma connaissance, le signal 5 [Vdc] ne fait pas partie de la spécification en entrée, mais on trouve ce niveau de tension disponible chez certains fabricants, par exemple [Beckhoff EL1124](https://www.beckhoff.com/en-en/products/i-o/ethercat-terminals/el1xxx-digital-input/el1124.html).

## Digital Output
Pas de source générale disponible liée à IEC 61131-2

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

## Indice de protection IP
**IP**, **Ingress Protection**, existe le plus souvent en IP20 et IP67.
La disponibilié varie beacoup d'un fabricant à l'autre. 

## ATEX
Equipment for potentially explosive atmospheres (ATEX), Équipement pour atmosphères potentiellement explosives, dérive d'une directive européenne.

> [DIRECTIVE 2014/34/UE DU PARLEMENT EUROPÉEN ET DU CONSEIL du 26 février 2014 relative à l’harmonisation des législations des États membres concernant les appareils et les systèmes de protection destinés à être utilisés en atmosphères explosibles](https://eur-lex.europa.eu/legal-content/FR/TXT/?uri=uriserv:OJ.L_.2014.096.01.0309.01.FRA).

Les fabricants qui proposent des poduits répondant à cette directive sont plus rares, mais le sujet est particulièrement important pour les industries chimiques très présentes en Valais. **Il faut  être particulièrement attentif au choix des interfaces si le processus est lié à la chimie ou à des domaines proches.**

## Exemple de spécification d’entrée digitale
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

> Les fabricants ne mentionnent pas toujours la compatibilité IEC 61131-2. Principalement par ce que le capteur n’entre pas dans le cadre de la norme. Il ne peut donc pas être validé pour une spécification donnée.

### Un mauvais exemple
Chercher une carte permettant de faire l’acquisition de signaux à 1MHz.

# Les bus de terrain, ou bus industriels

## Qu’est ce qu’un bus de terrain ?
Un bus de terrain, ou bus industriel est un système de communication qui implique un support physique, le câble, une partie électronique physique et une partie logicielle qui permet la communication entre des capteurs, actuateurs et automates industriels.
## Pourquoi ?
Le principe est de multiplexer les signaux numériques de plusieurs appareils sur un seul câble afin d’éviter de devoir connecter tous les appareils sur le PLC avec des câbles différents.
## Contraintes
Ces bus sont souvent conçus pour répondre au mieux à des contraintes qui peuvent être variables selon le type d’industrie.
Par exemple :
- Profibus-DP, Decentralised Peripheral, périphérie décentralisée, diffusé à partir de la fin des années nonantes. Le bus industriel le plus répandu, mais qui cède sa place à des bus basés sur Ethernet au fur et à mesure de la modernisation des installations.
- Profibus-PA, pour Process Automation, une variante du Profibus DP conçu pour être déployé dans les zones avec risque d’explosion. Il est très présent dans l’industrie chimique.
- Profinet, le successeur du Profibus, basé sur un support Ethernet. Il ne remplace pas le Profibus-PA car il n’est pas conçu pour les zones avec risque d’explosion.
- Le bus Sercos II (fibre optique) puis Sercos III (câble Ethernet) ont été développés pour synchroniser des axes pilotés par des moteur synchrone. Domaine d’application, la machine-outil (CNC).

En dehors des caractéristiques techniques, il existe des aspect géographiques Le marché européen est dominé par Profinet (Siemens), alors que le marché américain est dominé par EtherNet /IP (Allen-Bradley).
Il existe des choix d’entreprise. Si une grosse entreprise, telle Nestlé a normalisé un type de bus, elle cherchera à imposer ce bus à ces fournisseurs afin de simplifier la maintenance de son réseau.

## Nouveauté 2023-2024
Actuellement une nouvelle technologie est en phase d'essais pilote par différents fournisseurs. [Ethernet-APL](https://www.ethernet-apl.org) Advanced Physical Layer. Cette technologie est destinée à remplacer les Profibus-PA dans l'industrie dite du Process, chimie, biotechnologies. Pour les ingénieurs actifs dans ce type d'industrie, il vaudra la peine d'envisager ce type de bus pour tout nouveau projet. Cette technologie est prévue pour pouvoir utiliser les supports physiques des anciennes installations, elle est donc aussi pertinente pour des projets de rénovation.

<figure>
    <img src="./img/Logo-Ethernet-APL-rectangle-RGB_1.0_white_backgr.png"
         alt="Image lost Logo-Ethernet-APL-rectangle-RGB_1.0_white_backgr.png">
    <figcaption>Ethernet-APL</figcaption>
</figure>


## Les normes
Dans le cas des bus de terrain, même si des normes existent, série IEC 61784 et IEC 61800, elles ne résolvent rien, car des variantes des normes ont été écrites pour la majorité des principaux type de bus de terrain.
La situation en 2023 selon une publication de HMS une entreprise spécialisée dans le développement de produits pour les bus industriels. Le graphique de HMS est réalisé à l’échelle mondiale et les zones géographiques montreraient des réalités différentes. Noter aussi la croissance des réseaux sans fil, wireless.
 
<figure>
    <img src="img/Field Bus Market Share www hms networks com 2023.jpg"
         alt="Field Bus Market Share www hms networks com 2023">
    <figcaption>Field Bus Market Share Source: <a href="https://www.hms-networks.com/news-and-insights/news-from-hms/2023/05/05/industrial-network-market-shares-2023">www.hms-networks-com 2023</a></figcaption>
</figure>
 
Idéalement
Sous l’égide de la fondation OPC, opcfoundation.org, un groupe de travail à l’harmonisation des réseaux industriels sous la dénomination OPC UA Field Level Communications (FLC). En 2023 les produits développés selon cette harmonisation en sont au stade de démonstrateurs.
 
<figure>
    <img src="img/From cloud to sensor Source opcfoundation.org.jpg"
         alt="From cloud to sensor Source opcfoundation.org">
    <figcaption>From cloud to sensor Source: <a href="https://opcfoundation.org">opcfoundation.org</a>
    </figcaption>
</figure>

# La réalité
Dans l’exemple ci-dessous, on peut voir que, à partir du même automate il existe une multitude de bus de terrain qui peuvent, ou ne peuvent pas, être connecté à un automate. Aucun de ces bus de terrain n’est compatible avec les autres. Les bus de terrain sont presque tous propriétaires, c’est-à-dire qu’ils sont développés par des fabricants.
- Profibus *Origine Siemens*
- Profinet *Origine Siemens)*
- CC-Link  *Origine  Mitsubishi*
- Ethernet/IP *Origne Allen-Bradley*
- DeviceNet *Origne Allen-Bradley*
- EtherCAT *Origine Beckhoff*

*Il n'y a aucune source sur l'origine d'IO-Link, mais IO-Link est maintenu par l'organisation [PI International](https://www.profibus.com) comme Profinet et Profibus...*

<figure>
    <img src="img/Pyramide IO-Link Source Balluff.jpg"
         alt="Pyramide IO-Link Source Balluff">
    <figcaption>Pyramide IO-Link Source Balluff Source: <a href="https://www.balluff.com">www.balluff.com</a>
    </figcaption>
</figure>

# Conclusion
Il est très important de retenir les informations suivantes :
- Avant de choisir un système d’automate il faudra vérifier que les types de capteurs ou actuateurs disponibles sur le marché disposent des interfaces nécessaires.
- Il est parfois plus important de choisir le bus de terrain qui correspond au besoin du projet, puis de sélectionner ensuite l’automate qui convient.
- Sélectionner le type de bus le plus moderne possible afin de maintenir le plus longtemps possible sa durée opérationnelle.
- Adapter le type de bus de terrain à l’environnement dans lequel il sera installé.
- Tenir compte des aspects techniques, temps de cycle, débit, sécurité fonctionnelle et cybersécurité qui seront développés dans la suite du cours.

## Un mauvais exemple.
Sélectionner un capteur muni d’une interface **i2c**, *Inter Integrated Circuit Bus*, et chercher la carte d’entrées sortie qui permettra de communiquer avec un automate.

Dans ce cas, **i2c** est un bus série conçu avant tout pour de la communication entre les différents composants intégrés sur une carte électronique. Le capteur sélectionné sera sans doute très bon marché, mais pas conçu pour un connexion dans un environnement industriel. Le coût final de l'intégration d'un composant qui vaut quelques francs s'avérera probablement bien plus élevé qu'un capteur encapsulé dans un élément équipé d'une interface compatible IEC 61131-2.

Suite, [liaison du des cartes d'interface avec le programme](./README_part_3.md).