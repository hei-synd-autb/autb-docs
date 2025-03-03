<h1 align="left">
  <br>
  <img src="./img/hei-en.png" alt="HEI-Vs Logo" width="350">
  <br>
  Industrial Automation Base
  <br>
</h1>

Cours AutB

Author: [Cédric Lenoir](mailto:cedric.lenoir@hevs.ch)

# Module 06 Eléments mechatronics, Use case: ball screws

*Keywords:* **MOTOR ENCODER AXIS**

# Module en cours d'écriture

# Le système mécatronique du laboratoire d'automation
<figure>
    <img src="./img/smart_function_kit_handling_640x360.jpg"
         alt="Smart Function Kit Handling">
    <figcaption>Smart Function Kit Handling</figcaption>
</figure>

Il s'agit d'un *robot* avec 3 axes qui peuvent être synchronisés via un bus Ethernet real-time.

# Vocabulaire
Nous éviterons dans la mesure du possible de parler de drive ou driver en raison du manque de clarté de la définition. Nous parlerons de **commande d'axe**. Si nous allons dans le cadre de ce cours approfondir les commandes d'axes électriques, il existe au minimum deux autres technologies de commandes d'axe.

# Use case
Nous nous limitons ici à la description complète d'un axe équipé d'une pince.
Nous décrivons l'ensemple des éléments nécessaires au pilotage avec leurs implications mécanique.

Contraintes mécaniques
-   Liées au processus, par exemple vitesse nécessaire.
-   Liées à la mécanique, par exemple, la vitesse maximale admissible par la vis à bille.
-   Liée à l'actionneur électromécanique, la vitesse maximale du moteur ou sa charge maximale admissible.

Quelques exemples:
-   Le couple maximal du moteur sera dépendant de l'accélération nécessaire pour exécuter un mouvement, de la charge embarquée et du frottement.
-   Le couple nominal du moteur sera dépendant du taux d'utilisation du moteur, le temps de cycle, mais aussi de la capacité thermique de l'ensemble et des conditions environnementales du laboratoire.
-   La précision de l'ensemble sera dépendant de la résolution du codeur, mais aussi de la rigidité mécanique, puis enfin de la masse de l'ensemble mobile du moteur.

> Même si un régulateur à haute performance  permet en théorie de travailler avec des moteurs de petite taille, en pratique, les différentes limites de précision des mesures et des modèles impliquent d'adapter la masse du rotor du moteur à la masse du système mobile.

> Dans des application à haute performance, un différence de température ambiante de l'ordre de 20°C peuvent avoir une influence non négligeable sur la charge admissible du moteur.

# Système d'entrainement par vis à bille



# Note d'écriture, à lire puis enlever

> Diagramme d'activité ?
-    Axe numérique vis à bille.
-    Limite mécanique module Mecatronic
-    Limite puissance moteur.
-    Limite de dimension machine.
-    Limite du processus 

-    Contraintes de sécurité.

-    Contraintes de temps, argent.
-    Contraintes de vitesse.
-    Contraintes approvisionnement, SAP.

-   Type de moteur

-   Type de codeur.

## Maintenance.
Du point de vue de l'automation, il est nécessaire de prévoir la maitenance du système sur le long terme. Celà passe, entre autre par la pérénité de l'ensemble logiciel.

> Une commande d'axe est composée de nombreus paramètres, il faut être conscient qu'en cas de réparation du système, les paramètres risquent d'être perdus. Il est nécessaire de les archiver.

> Différentes réglementations impliquent que les systèmes numériques soient protégés par des mots de passe. La disponibilité de ces mots de passe sur le long terme doit être garanti.

> Batteries de sauvegarde de la date et de l'heure. Les systèmes de sécurité OT utilisent de plus en plus des systèmes de certificats datés et limités dans le temps. 

### Procédures opérationelles standard
En anglais, SOP : Standard Operating Procedure, c'est une documentation qui indique comment restautrer la partie logicielle ou les paramètres des éléments numériques.

-    Calcul énergie moyenne moteur, drive, couple, vitesse, Precision.

### Disponibilité sur le long terme
Les fournisseurs de matériel industriel garantissent un service sur le matériel livré jusqu'à une durée de 25 ans. C'est une composante non négligeable dont il faut tenir compte au moment du choix du matériel. Les coûts de développement en automation sont souvent largement supérieur au coût du matériel.


-    Calcul vis à bille.
-    Type de bus, synchronisé?
-    Frein?

-    Activité: du point À au point B.

-    Rapport d’inertie.

# Préambule
Il serait trop long, voir contre-productif de passer en revue l'ensemble de la technologies nécessaire au pilotage d'un axe.

Pour ne prendre que l'exemple des types de codeur, certaines variantes des axes que nous utilisons lors de ce cours permettent l'utilisation des codeurs suivants:
- Motor MS2N
- Sin-cos 1Vpp + Hyperface
- Sin-cos avec piste de référence
- Resolver
- EnDat 2.2
- SSI

Selon le degré de détail souhaité, nous pourrions consacrer l'entier des cours du semestre à ce sujet, surtour si l'on décider d'y inclure l'asper **Functional Safety** des codeurs. *Les codeurs SSI ne sont par exemple pas souhaitables pour des fonctions de vitesse de sécurité, alors que le type Sin-cos est acceptable*.

L'objet de ce cours consiste à dire:**prenez garde à ce que la technologie de codeur que vous adopterez soit d'un côté acceptable en terme de précision avec votre application**, mais aussi: **prenez garde à ce que la technologie de codeur que vous adopterez soit acceptable pour le type de commande d'axe que vous aurrez sélectionner**. Enfin: **est-ce que la commande d'axe devra répondre à des contraintes de sécurité particulières.**

# Functional Safety
<figure>
    <img src="./img/ctrlX-AUTOMATION_ctrlX-DRIVE_drive-portfolio Safety On Board.jpg"
         alt="Safety on Board">
    <figcaption>Safety on Board</figcaption>
</figure>

Il n'est pas dans l'objet de ce cours de traiter de la sécurité machine, ce qu'il faut retenir tient en une ligne.
Les systèmes d'axes, comme les codeurs peuvent être utilisés pour des application avec des contraintes de sécurité avec la condition suivante:
> La spécification de sécurité doit être faite **avant** la commande du matériel.

Il sera particulièrement couteux et compliqué d'ajouter des éléments de sécurité à un système qui n'est pas conçu pour le faire.

Les axes du laboratoire d'automation sont équipés de la fonction **STO**, **Safe Torque Off**, ce qui signfie que si le circuit de sécurité constitué d'un arrêt d'urgence, d'un contact de sécurité sur les portes et d'une barrière lumineuse et interrompu, les moteurs ont un couple nul garanti.

# Une commande d'axe moderne comprend

<figure>
    <img src="./img/Axis Overview Device.PNG"
         alt="Device Overview">
    <figcaption>Device Overview</figcaption>
</figure>

## DC Bus connection
Dans le cas du laboratoire, le premier drive reçoit une alimentation triphasée et un convertisseur AC/DC.
La puissance de l'alimentation AC/DC est suffisante pour alimenter le second drive qui lui reçoit directement la tension DC du premier.

> Il est intéressant de voir que la structure du système du labo, Alimentation AC/DC, puis conversion DC/AC, peut être mise en parallèle avec d'autre systèmes énergétiques.

> Le drive Y/Z peut être vu comme un onduleur qui fournit une tension sinusoidale à partir d'une tension continue reçue depuis le drive X.

> Ces notions seront revues en détail en 3ème année entre autre en électronique de puissance.

## STO Axis
Il s'agit de la fonction de sécurité intégrée.
Si une fonction de sécurité supplémentaire, type **SLS**, **Safe Limited Speed**, était nécessaire, il faudrait changer de type de drive.

## Entrées et sorties analogiques et numériques.
Ici, entrée analogique, ce type d'entrée numérique ne sera en général pas utilisable pour piloter l'axe en position en raison de son immunité au brut.

## Engineering port.
Les drives sont souvent doté d'un port dédié à la mise en service et à la maintenance de la commande d'axe.

## Moteur
Quand nous parlons de la connexion du moteur, nous parlons d'un système triphasé.

### Tension de fonctionnement
Problèmes:  Les axes avec des tension exotiques. (Jeny Science, Linmot)
Les moteurs linéaire avec sans fer (tension limitée)

## Codeur
Attention aux codeurs numériques !

Les codeurs numériques du type **ACURO link technology** ou **Hiperface DSL** sont des technlogies de transmission numérique du signal. Elles offre l'avantage de pouvoir transmettre le signal du codeur dans le même câble que la puissance du moteur grace à leur immunité au bruit. Leur grand défaut, **elles ne sont pas compatibles entre elles**.


Le système d'entrainement par vis à bille, sous différentes formes, reste un des types d'entrainement les plus répendus dans l'industrie pour le déplacement de charges.

Nous nous référont à un guide technique d'orginie Bosch Rexroth pour identifier les principaux composants et paramètres qui sont importants du point de vue de l'automatisation du système, par exemple, les valeurs qui sont importantes pour le paramétrage de l'entrainement électrique.

## Exemple: le couple maximal admisible
Le couple maximal admissible se réfère à l'axe du moteur.

La qualité de régulation de l'entrainement dépend en partie du ratio entre le moment d'inertie du moteur et la charge. Le respect de ce ratio implique parfois le choix d'un moteur surdimensionné par rapport au couple maximal admissible par la mécanique. Dans ce cas, il sera très important de limiter le couple maximal du moteur. C'est un paramètre qui existe dans le drive et doit être correctement défini lors de la mise en service.

## Les câbles
Dans beaucoup d'équipements mobiles, un partie des câbles se déplacent avec les éléments mobile. Il existe des câbles spécialement confectionnés pour les équipements mobiles.
<figure>
    <img src="./img/Igus e-chains-weitere-loesung_570.jpg"
         alt="Câbles et  les chaînes porte-câbles">
    <figcaption>Câbles et  les chaînes porte-câbles</figcaption>
</figure>

> **Les câbles sont la principale source de défaut dans les équipements mobiles**. Même si les câbles sont correctement sélectionnés et confectionnés, c'est une bonne pratique de prévoir des connecteurs pour que les câbles mobiles puissent être facilement remplacés.

## Reference switch
> Le **Reference swich** ou interrupteur de référence sert à définir la position de référence de l'axe. Deux cas de figure se présentent.

### Codeur relatif ou absolu *singleturn*
Dans ce cas, la position mécanique de l'axe est inconnue au momment de l'enclenchement de la machine, *sauf si la plage de travail linéaire est inférieure à un tour du moteur*. Il sera nécessaire de programmer une séquence de référence. Dans la plupart des entrainements modernes, la séquence de référence est automatique au démarrage. Elle nécessite à être paramétrée lors de la mise en service.

### Codeur absolu *multiturn*
Dans ce cas, la position absolue de l'axe est connue au démarrage, *sauf si la plage de travail linéaire excède le nombre de tours disponibles, dans ce cas, un codeur absolu est inutile*. La position absolue doit toutefois être paramétrée lors de la mise en service.

### Coût relative vs *singleturn* vs *multiturn*.
Les codeurs absolus *multiturn* sont généralement plus honéreux et plus encombrants que les codeurs relatifs ou *singleturn*. **Dans la pratique, la différence de prix sera souvent largement compensée par la quantité de travail, le prix de l'interrupteur de référence et la facilité d'utilisation**.

> Dans de nombreux cas, une économie initiale sur le codeur produira l'effet inverse.

### Codeur linéaire
Excepté pour quelques cas de figures oû le moteur est utilisé en entrainement direct, il y a une différence entre la mesure sur le moteur et la position finale.

La différence peut venir de la vis à bille.

<figure>
    <img src="./img/Lash-measure-V2.gif"
         alt="Backlash Animation, ball gaps exaggerated for visibility">
    <figcaption>Backlash Animation, ball gaps exaggerated for visibility, Source: https://www.thomsonlinear.com/en/training/ball_screws/backlash</figcaption>
</figure>

Ou d'autres rapports de transmission intemédiaires.

<figure>
    <img src="./img/Source Research Gate Backlash-in-mating-gear-transmissions.png"
         alt="Source Research Gate Backlash-in-mating-gear-transmissions">
    <figcaption>Backlash in mating gear transmissions, Source: Research Gate</figcaption>
</figure>

Certains entrainements électriques permettent de raccorer un deuxième codeur.

1- Le premier est utilisé pour la régulation du moteur.

2- Le deuxième permet de compenser la différence de position sur un régulateur de position.

### Alternative au codeur linéaire
Une alternative au codeur linéaire sera de calibrer le système de base à l'aide d'une mesure externe de haute précision. *Certains entrainements électriques une fonctionnalité qui compense automatiquement la position finale en fonction du signal du codeur*.

<figure>
    <img src="./img/Lead deviation of Ball Screw Assembly for CKK Compact Module.png"
         alt="Lead deviation of Ball Screw Assembly for CKK Compact Module">
    <figcaption>Lead deviation of Ball Screw Assembly for CKK Compact Module</figcaption>
</figure>

## Limit switch ou interrupteurs de fin de course
Le **limit switch**, en général positif et négatif, sert à limiter la course de l'axe grace à un contact qui interrompt le mouvement de l'axe via une entrées sur l'entrainement éléctrique.

> Le gain en sécurité apporté par un **hard switch** est faible pour un codeur absolu *multiturn*. Les signaux des capteurs sont en général paramétrables et n'offrent guère plus de garantie que les **soft switch** qui se basent sur la position du capteur, aussi disponibles et paramétrables sur l'entrainement électrique.

### Contrainte technique
Les interrupteurs de référence mentionnés dans la documentation Bosch Rexroth sont donnés pour une fréquence d'échantillonage de ``2.5 [kHz]`` à une vitesse de ``2 [m/s]`` pour les interrupteurs magnétiques, voir ``3.3 [Hz]`` pour ``1 [m/s]`` pour les interrupteurs mécaniques.

> Si le temps de cycle de l'automate est lent, il y a un réel risque de ne pas détecter les interrupteurs de fin de cours, surtout dans les cas les plus critiques à vitesse maximale.

## Paramètres pour l'entrainement électrique
Dans ce chapitre, nous n'allons pas nous pencher sur le dimensionnement mécanique, premièrement il sort du sujet, deuxièmement des outils de dimensionnement existent et les calculs sont rarement exécutés à la main, finalement, les calculs de dimensionnement qui concernent la durée de vie de la mécanique ne sont pas mesurables.

### Pourquoi ?
Dans la plupart des cas, le système sera correctement dimensioné et fonctionnera en quelques minutes.

## Cependant
> Parfois le système ne répondra pas au cahier des charges et il sera nécessaire de détecter les anomalies ou les points faibles.

> Parfois on cherchera à optimiser le système en fonction du temps de cycle.

> Parfois on cherchera à optimiser le système pour obtenir une précision optimale.

Nous allons exécuter des calculs pour les comparer à ce qui est mesurable avec les outils fournis par l'environnement de l'entrainement électrique quand les données disponibles disponible avec un degré suffisant de certitude.

## Exemple
L'axe X du laboratoire d'automation est équipé avec un moteur ``Bosch Rexroth MS2N04-D0BQN`` est donné pour un couple nominal de ``2.65 [A]``. Pour un moteur synchrone à aimants permanents, le ratio ``Torque constant [Nm/A]`` est relativement constant dans la plage de fonctionnement normale du moteur, ce qui nous permet d'en déduire le couple nominal, calculé directement par l'entrainement électrique.
Ces valeurs sont directement mesurables:
<figure>
    <img src="./img/Measurement of frictional torque of complete system.png"
         alt="Measurement of frictional torque of complete system">
    <figcaption>Measurement of frictional torque of complete system</figcaption>
</figure>

Si lors d'essai l'entrainement électrique génère une alarme du type thermal motor protection, il sera utile de comprendre le fonctionnement du système pour déterminer si:
- La courbe de couple est normale et la mesure de température est en défaut.
- La courbe de couple diminue sensiblement si le temps de cycle diminue.
- Le moteur chauffe anormalement par rapport à la mesure du couple.

# Principes de base
Pour le dimensionnement de l'entraînement, **Drive Train**, la chaîne cinématique peut être divisée en système mécanique, **Mechanical System** et système d'entraînement, **Drive**.

Le système mécanique comprend les composants physiques
-  système de mouvement linéaire, *la vis à bille* **Ballscrew Module**, et éléments de transmission, **Transmission** (entraînement côté courroie, accouplement)
- et la charge, **Load** à transporter.

L'entraînement électrique est une combinaison moteur-contrôleur, **Motor-Controller** avec des données de puissance correspondantes.

Le dimensionnement de l'**entraînement électrique** se fait en prenant l'arbre du moteur comme point de référence.

Pour le dimensionnement de l'entraînement, il faut tenir compte des limites ainsi que des valeurs de base. Les limites ne doivent pas être dépassées afin d'éviter d'endommager les composants mécaniques.

<figure>
    <img src="./img/MotionControDriveTrain.png"
         alt="Entrainement avec vis à bille">
    <figcaption>Entrainement avec vis à bille, schéma de principe</figcaption>
</figure>

## Données techniques et symboles de formule pour le système mécanique
Pour chaque composant (système de mouvement linéaire, accouplement, entraînement latéral par courroie, réducteur), les limites maximales autorisées correspondantes pour le **couple d'entraînement** et la **vitesse** ainsi que les valeurs de base pour le **moment de friction** et le **moment d'inertie** de **masse** doivent être utilisées.

Les données techniques suivantes avec les symboles de formule associés sont utilisées lors de la prise en compte des exigences de base du système mécanique dans les calculs de conception pour le dimensionnement de l'entraînement. Les données répertoriées dans le tableau ci-dessous se trouvent dans la section intitulée « Données techniques » ou sont déterminées à l'aide de formules basées sur les descriptions des pages suivantes.

## Vitesse maximale admissible

## Couple moteur admissible

## Limites, calculer la vitesse et la décélération
Tenir compte des limites réeles
Tenir compte du couple pour l'accélération et la décélération

## Pas de la vis à bille et de l'entrainement (Gear ratio).

## Sens de déplacement

## Quelle est la position de référence ?

## Ecart sur l'engrenage, Basklash, règle linéaire

# Ratio masse *avant* et *après* axe moteur
la Il n'y a pas de calcul théorique précis, en raison, par exemple, de la difficulté de calculer ou mesurer la rigidité de l'ensemble de l'entrainement.

**Bosch Rexroth** donne l'information suivante, *Project planning/calculation R999000499* :
## Prise en compte du rapport des moments d'inertie de masse du système mécanique et du moteur.

Le rapport des moments d'inertie de masse sert d'indicateur pour les performances de contrôle d'une combinaison moteur-contrôleur.
Le moment d’inertie du moteur est directement lié à la taille du moteur.

## Rapport des moments d'inertie de masse
Pour la présélection, l'expérience a montré que les rapports suivants permettent d'obtenir des performances de contrôle élevées.
Il ne s’agit pas de limites rigides, mais les valeurs qui les dépassent nécessiteront un examen plus approfondi de l’application spécifique.

Ratio = moment d'inertie masse pilotée / mass côté moteur

|Domaine d'application  | Ratio |
|-----------------------|-------|
|Handling               | <= 6.0|
|Processing             | <= 1.5|

Par **Handling**, on entend système de manipulation, déplacement d'un objet.
Par **Processing**, on entend suivi précis de trajectoire, comme un machine outil type CNC.

## Pour citer une autre source de référence
**ABB** mentionne la remarque suivante dans un document de dimensionnement des moteurs: *Le rapport idéal entre l'inertie réfléchie et l'inertie du moteur est de **1:1**, un rapport qui permet d'obtenir le meilleur positionnement et la meilleure précision. L'inertie réfléchie ne doit pas dépasser l'inertie du moteur plus de **dix fois**, s'il est important de maintenir les performances de contrôle*.

L'expérience personnelle montre que des rapports d'inertie trop élevés, de l'ordre de 100, peuvent rendre un système même relativement rigide, totalement instable et impossible à piloter voir dangereux. La plupart des outils de configuration de système d'entrainement et de sélection de moteur des différents fabricants incluent en général un rapport type en fonction du type d'application. **Si le ratio est trop important, un réducteur sera proposé**.

# Maintenance mécanique
Les éléments mécanique nécessitent des interventions de maintenance comme la lubrification qui permettent de prolonger leur cycle de vie.
**Si vous pensez à intégrer cet aspect là dans votre système, vous aurez pris une longueur d'avance sur l'immense majorité de vos concurents !**


# Exercices
En utilisant les différentes paramètres d'un moteur et d'une vis à bille, quelques exercices qui consistent pour un ensemble donné, à

Calculer en travaillant sur les paramètres de vitesse et d'accélération, des mouvements avec:
Le minimum d'énergie.
Le minimum de puissance.
Le temps minimum.
(on est dans le domaines de simples équations d'ordre 2, très éventuellement des intégrales basiques).

[Voir aussi d'autres types d'axe](README_OtherAxes.md).

# Use Case, les modules du labo 23N.411

$ S_{max} $, Plage de déplacement maximale.  

u             Nombre de mm par révolution, de l'allemand mm/Umdrehung

CCW vs CW     Counterclockwise vs Clockwise

|Axis |$ S_{max} $ [mm]| u [mm/u] |$V_{max}$ [m/s] | $ a_{max} $ [m/s2]|M1 max [Nm]| d | i|
|-----|----------------|----------|----------------|-------------------|-----------|---|--|
|X    |565             |5.0       |0.30            |15                 |8.2        |CCW|1 |
|Y    |350             |5.0       |0.38            |15                 |6.76       |CCW|1 |
|Z    |320             |5.0       |0.57            |15                 |2.39       |CW |1 |




# Théorie

## Analogie entre oscillateur mécanique et électrique

Système RLC

<figure>
    <img src="./img/Circuit_RLC.gif"
         alt="Lost image ircuit_RLC">
    <figcaption>Circuit RLC, Source https://uel.unisciel.fr/physique/meca/meca_ch09/co/chapitre9_04.html</figcaption>
</figure>

$ L \dfrac{d^2i}{dt^2} + R \dfrac{di}{dt} + \dfrac{i}{C} = 0$

Oscillateur mécanique

<figure>
    <img src="./img/System Amorti.gif"
         alt="System Amorti.gif">
    <figcaption>Oscillation amortie, Source https://uel.unisciel.fr/physique/syst_oscillants/syst_oscillants_ch03/co/apprendre_ch3_05.html</figcaption>
</figure>

$ x'' + \dfrac{\mu}{m}x' + \dfrac{k}{m} = 0 $

Le but ici n'est pas de revenir sur un court d'électricité ou un cours mécanique, mais de rappeler que la réalité correspond à la théorie, mais en beaucoup plus compliqué.

Les phénomènes suivants vont rentrer en ligne de compte à partir d'un certain niveau de cadence ou de précision:

-   La rigidité du robot cartésien. La mesure est effectuée au niveau du moteur, cela peut être relativement éloigné de la position réele de la tête du robot.

-   A partir d'un certain niveau d'accélération, l'ensemble de la structure va commencer à bouger.

-   Le backlash des engrenages, si il est négligeables tant que l'on ne desend pas en dessous du centième de milimètre, il commencera à poser un problème en dessous.

-   Le frottemenet des billes de la vis, si il peut être considéré comme plus ou moins constant à basse vitesse, il augementera de manière quadratique avec la vitesse.

-   La constante de force du moteur, si elle est considérée comme constante à basse température, elle changera lorsque le moteur chauffe, donc souvent, dans les situations où la plage d'utilisation du moteur devient critique.

-   La dissipation thermique d'un moteur se fait principalement par rayonnement, et en partie par contact thermique avec 


