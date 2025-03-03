<h1 align="left">
  <br>
  <img src="./img/hei-en.png" alt="HEI-Vs Logo" width="350">
  <br>
  Industrial Automation Base
  <br>
</h1>

Cours AutB

Author: [Cédric Lenoir](mailto:cedric.lenoir@hevs.ch)

# Module 04 Structures de données.

*Keywords:* **DUT Type Conversion ARRAY STRUCT**

## Table des matières.

- [Module 04 Structures de données.](#module-04-structures-de-données)
  - [Table des matières.](#table-des-matières)
- [Préambule](#préambule)
  - [Typage](#typage)
    - [Quelques rappels concernant les types.](#quelques-rappels-concernant-les-types)
    - [Quelques exemples :](#quelques-exemples-)
    - [Pour résumer:](#pour-résumer)
  - [Data User Type](#data-user-type)
- [Type conversion](#type-conversion)
- [ARRAY, les tableaux de données](#array-les-tableaux-de-données)
    - [Définir les constantes dans: ```GVL_ARRAY_SIZE```.](#définir-les-constantes-dans-gvl_array_size)
    - [Définir les tableaux à l'aide des constantes.](#définir-les-tableaux-à-laide-des-constantes)
    - [Utilser les boucles avec les constantes.](#utilser-les-boucles-avec-les-constantes)
  - [Dans la pratique](#dans-la-pratique)
    - [Définir un tableau sous forme de type utilisateur.](#définir-un-tableau-sous-forme-de-type-utilisateur)
    - [Définir un tableau de types](#définir-un-tableau-de-types)
    - [Utiliser un tableau de types](#utiliser-un-tableau-de-types)
- [OOP, Object Oriented Programming](#oop-object-oriented-programming)
- [Data User Type, DUT](#data-user-type-dut)
- [Structure](#structure)
  - [Forme simple d'une structure pour un axe.](#forme-simple-dune-structure-pour-un-axe)
    - [Définition de la structure](#définition-de-la-structure)
    - [Valeur initiale](#valeur-initiale)
    - [Instanciation](#instanciation)
    - [Codage](#codage)
    - [Structure dans une structure](#structure-dans-une-structure)
    - [Codage](#codage-1)
  - [Structure Extends](#structure-extends)
    - [Définition de la structure](#définition-de-la-structure-1)
    - [Codage de structures avec Extends](#codage-de-structures-avec-extends)
    - [Avantage principal de la notion de *Extends*](#avantage-principal-de-la-notion-de-extends)
  - [FB avec ```VAR_IN_OUT```](#fb-avec-var_in_out)
    - [Déclaration d'un FB avec ```VAR_IN_OUT```](#déclaration-dun-fb-avec-var_in_out)
    - [Instanciation d'un FB avec ```VAR_IN_OUT```](#instanciation-dun-fb-avec-var_in_out)
    - [Codage d'un FB avec une structure en ```IN_OUT```](#codage-dun-fb-avec-une-structure-en-in_out)
  - [Structure ```EXTENDS``` avec ```VAR_IN_OUT```](#structure-extends-avec-var_in_out)
    - [Un peu d'abstraction avec ```EXTENDS```](#un-peu-dabstraction-avec-extends)
    - [Si Extends n'est pas disponible](#si-extends-nest-pas-disponible)
- [Enumeration](#enumeration)
  - [Premier exemple](#premier-exemple)
    - [Intérêt principal de l'énumération](#intérêt-principal-de-lénumération)
    - [Codage d'un ```CASE_OF```](#codage-dun-case_of)
    - [TextList support](#textlist-support)
    - [Extends Enum](#extends-enum)
  - [Deuxième exemple](#deuxième-exemple)
- [Alias](#alias)
- [Union](#union)
  - [Déclaration d'une structure de bits.](#déclaration-dune-structure-de-bits)
    - [Déclaration d'une union de 3 bytes.](#déclaration-dune-union-de-3-bytes)
    - [Instanciation de l'union](#instanciation-de-lunion)
    - [Utilisation dans le code](#utilisation-dans-le-code)
    - [Un type pour une conversion two Modbus Word 2 Float](#un-type-pour-une-conversion-two-modbus-word-2-float)
  - [Big Endian vs Little Endian](#big-endian-vs-little-endian)
    - [Endianness](#endianness)
- [Exercices](#exercices)
  - [Exercice 1, Min/Max/RMS of ioBuffer](#exercice-1-minmaxrms-of-iobuffer)
  - [Exercice 2, State Machine](#exercice-2-state-machine)
    - [Contraintes:](#contraintes)
  - [Exercice 3, Modbus avec ```Endianess```](#exercice-3-modbus-avec-endianess)
  - [Exercice 4, VAR\_IN\_OUT with Extends](#exercice-4-var_in_out-with-extends)
- [Solution des exercices](#solution-des-exercices)
  - [Solution Exercice 1, Min/Max/RMS of ioBuffer](#solution-exercice-1-minmaxrms-of-iobuffer)
    - [Codage](#codage-2)
    - [Test](#test)
  - [Solution Exercice 2, State Machine](#solution-exercice-2-state-machine)
    - [Codage](#codage-3)
  - [Solution Exercice 3, Modbus avec ```Endianess```](#solution-exercice-3-modbus-avec-endianess)
    - [Liste des constantes dans le fichier ```GVL_Modbus```](#liste-des-constantes-dans-le-fichier-gvl_modbus)
    - [Définition de l'union ```U_SolveModbus```](#définition-de-lunion-u_solvemodbus)
    - [Définition de la structure générale](#définition-de-la-structure-générale)
    - [Program](#program)
  - [Solution Exerice 4, VAR\_IN\_OUT with Extends](#solution-exerice-4-var_in_out-with-extends)

# Préambule
## Typage
Le langage de programmation IEC 61131-3 Structured Text est un langage fortement typé, cela signifie que le compilateur peut détecter les erreurs de type lors de la compilation.

> Le langage IEC 61131-3 est un langage **typé statiquement**, ce qui signifie que le type des variables doit être défini par l’utilisateur **avant** son utilisation.

> Le langage **IEC61131-3 est un langage compilé**, cela signifie qu’il est converti en format binaire exécutable avant son utilisation.

> Ces différentes caractéristiques le rendent très différents d’un langage comme Python, mais sur son principe, proche d’un langage comme C++.

### Quelques rappels concernant les types.
Le type permet de définir le codage binaire d’une variable. Pour un **PLC** *Programmable Logic System* ou **ICS**, *Industrial Control System* dont la vocation est de communiquer entre différents types d’appareils, c’est particulièrement important.

### Quelques exemples :
- Pour communiquer avec le monde réel analogique, les systèmes va utiliser des convertisseurs A/D, analogique/digital ou D/A, digital/analogique qui sont souvent dans des formats entre 10 et 16 bits. L’écriture directe sur un convertisseur D/A d’un nombre réel codé selon le format IEEE-754 n’aura aucun sens et produira une erreur.

- Un autre type de communication est celle utilisée par Modbus TCP, ce protocole rudimentaire mais encore très utilisé sur des réseaux Ethernet, par exemple pour le diagnostic de contacteurs électrique utiliser des registres de 16 bits. Un nombre réel de 64 bits selon IEEE-754 sera découpé en 4 portions de 16 bits.
Pris morceau par morceau, aucun de ces 16 bits n’aura de signification et leur mauvaise interprétation causera une erreur, voir potentiellement un crash s’il est interprété comme un nombre inconnu.

Un **ICS** Industrial Control System est souvent utilisé dans des infrastructures critiques, un auteur canadien utilise le terme de **Boomable** industry qui exprime bien le problème que l’on peut retrouver par exemple dans l’industrie chimique en Valais.

### Pour résumer:
Un programme, un bloque fonctionnel ou une fonction écrite en langage structuré de type IEC-61131-3 commencera toujours par un en-tête ou **header** qui contient l’ensemble des variables qui seront utilisées dans la suite du programme.

Le caractère **statique** des variables dans un programme rédigé en IEC-61131-3 n’est pas qu’une caractéristique vieillotte du langage, c’est aussi et surtout une caractéristique qui améliore la **robustesse du code.**
 
## Data User Type
Dans certains langages comme Matlab, un type n’est qu’une classe parmi d’autres. En langage IEC 61131-3, nous avons des types de base, par exemple INT, REAL, BOOL. Mais aussi la possibilité de définir des types composés qui correspondent aux besoins de l’utilisateur.

En mathématiques, on utilise aussi des types d’une certaines manière. Si l’on veut utiliser des nombres complexes pour travailler, par exemple, avec un oscillateur RLC on pourra définir un type utilisateur particulier.

```ìecst
(*
    Define data type
*)
TYPE Cplx_typ :
STRUCT
   re        : REAL;
   im        : REAL;
END_STRUCT
END_TYPE
```
```ìecst
(*
    Declare variable of type Cplx_typ in a header
*)
VAR
   myCplx      : Cplx_typ;
   myMagnitude : REAL;
END_VAR
```

```ìecst
(*
    Use this new type
*)
myMagnitude := SQRT(myCplx.re^2 + myCplx.im^2);
```

De manière plus générale dans la suite de ce cours, on utilisera principalement les DUT Data User Type pour structurer l’information d’un système d’automation.



# Type conversion
Le Structured Text (du moins son compilateur) est exigeant et contraignant en terme de conversion de types. **A raison !**

Exemple
```iecst
   iSignal_2  : INT := 0;
   iSignal_3  : INT := 0;
   uiSignal   : UINT := 65535;
```
```iecst
   iSignal_2 := uiSignal;
   iSignal_3 := UINT_TO_INT(uiSignal);
```
<figure>
    <img src="img/Implicit conversion from unsigned Type.png"
         alt="Implicit conversion from unsigned Type">
    <figcaption>Implicit conversion from unsigned Type 'UINT' to signed Type 'INT' : possible change of sign</figcaption>
</figure>

> Dans les deux cas, le résultat sera ```-1```. Dans le premier cas, le compilateur met en garde contre le risque. Dans le deuxième cas, le résultat sera le même, mais on peut supposer que le programmeur en implémentant explicitement la fonction de conversion aura pris conscience du risque d'un résultat qui pourrait être non désiré.

L'environnement de développement propose des fonctions de conversion pour presque toutes les figures de conversion de données. C'est une bonne pratique de les utiliser systématiquement afin d'éviter une mulitplications des **Warning**.

> Il n'est pas rare, et même très courant de constater que certains programmes génèrent beaucoup de **Warning**. Dans la plupart des cas, aucun ne sera critique. Le risque est toutefois de laisser passer **celui qui provoquera un crash**.

# ARRAY, les tableaux de données
On peut utiliser des données de 1, 2 voir 3 dimensions.
> Les trois dimensions sont valables pour le compilateur Codesys. Pour d'autres types de compilateurs, ceci demande à être vérifié.

```iecst
VAR
    i_Array     : ARRAY [1..10] OF DINT;
    ij_Array    : ARRAY [1..10, 1..5] OF DINT;
    ijk_Array   : ARRAY [1..5, 1..10, 1..10] OF DINT;
END_VAR
```

Une manière classique d'utiliser les tableaux est dans une boucle ```for```
```iecst
VAR
    iMyLoop     : DINT := 0;
    i_Array     : ARRAY [1..10] OF DINT;
END_VAR

FOR iMyLoop := 1 TO 10 BY 1 DO
    i_Array[iMyLoop] := iMyLoop;
END_FOR
```
> Le code ci-dessus, si il est parfaitement correct, ne devrait pas être utilisé, il n'est pas robuste ! Une bonne pratique consiste à utiliser des ```VAR GLOBAL CONSTANT``` pour les dimensions des tableaux, celles-ci seront réutilisées dans les boucles.

> Remarquez que, même pour une tâche autant simple qu'une boucle, on évite un variable du type **i**. Il s'agit ici d'une bonne pratique, et non d'une obligation. Raison: un variable i est compliquée à identifier dans le code.

### Définir les constantes dans: ```GVL_ARRAY_SIZE```.
```iecst
VAR_GLOBAL CONSTANT
    I_MAX_SIZE	:	UDINT := 10;
    J_MAX_SIZE	: 	UDINT := 20;
    K_MAX_SIZE	:	UDINT := 5;
END_VAR
```
### Définir les tableaux à l'aide des constantes.
```iecst
VAR
    iMyLoop     : DINT := 0;
    jMyLoop     : DINT := 0;
    kMyLoop     : DINT := 0;

    i_Array     : ARRAY [1..GVL_ARRAY_SIZE.I_MAX_SIZE] OF DINT;
    ij_Array    : ARRAY [1..GVL_ARRAY_SIZE.I_MAX_SIZE, 1..GVL_ARRAY_SIZE.J_MAX_SIZE] OF DINT;
    ijk_Array   : ARRAY [1..GVL_ARRAY_SIZE.I_MAX_SIZE, 1..GVL_ARRAY_SIZE.J_MAX_SIZE, 1..GVL_ARRAY_SIZE.K_MAX_SIZE] OF DINT;
```
> Les constantes sont définies dans un fichier séparé ```GVL_ARRAY_SIZE``` et demandent un accès sous la forme ```GVL_ARRAY_SIZE.MY_CONSTANT```. C'est un peu plus long à écrire, mais cela améliore la robustesse et la structure du programme.

### Utilser les boucles avec les constantes.
```iecst
FOR iMyLoop := 1 TO GVL_ARRAY_SIZE.I_MAX_SIZE BY 1 DO
    i_Array[iMyLoop] := iMyLoop;
END_FOR

FOR iMyLoop := 1 TO GVL_ARRAY_SIZE.I_MAX_SIZE BY 1 DO
    FOR jMyLoop := 1 TO GVL_ARRAY_SIZE.J_MAX_SIZE BY 1 DO
        ij_Array[iMyLoop,jMyLoop] := iMyLoop * jMyLoop;
    END_FOR
END_FOR

FOR iMyLoop := 1 TO GVL_ARRAY_SIZE.I_MAX_SIZE BY 1 DO
    FOR jMyLoop := 1 TO GVL_ARRAY_SIZE.J_MAX_SIZE BY 1 DO
        FOR kMyLoop := 1 TO GVL_ARRAY_SIZE.K_MAX_SIZE BY 1 DO
        ijk_Array[iMyLoop,jMyLoop,kMyLoop] := iMyLoop * jMyLoop * kMyLoop;
        END_FOR
    END_FOR
END_FOR
```
> Attention au **temps de cylce** ! Une boucle **trop longue** peut provoque le **crash** du PLC. Si la marge est relativement élévé pour un processeur puissant, la limite peut être rapidement atteinte sur un PLC d'entrée de gamme.

## Dans la pratique
Je n'utiliser presque jamais de tableaux à plusieurs dimensions, je privilégie les ```STRUCT``` qui sont développés un peu plus loin dans le cours.

### Définir un tableau sous forme de type utilisateur.

```iecst
TYPE stArrayOfDint :
STRUCT
    jArray : ARRAY[1..GVL_ARRAY_SIZE.J_MAX_SIZE] OF DINT;
END_STRUCT
END_TYPE
```
### Définir un tableau de types
```iecst
VAR
    ijStArray   : ARRAY [1..GVL_ARRAY_SIZE.I_MAX_SIZE] OF stArrayOfDint;
END_VAR
```

### Utiliser un tableau de types
```iecst
FOR iMyLoop := 1 TO GVL_ARRAY_SIZE.I_MAX_SIZE BY 1 DO
    FOR jMyLoop := 1 TO GVL_ARRAY_SIZE.J_MAX_SIZE BY 1 DO
        ijStArray[iMyLoop].jArray[jMyLoop] := iMyLoop * jMyLoop;
    END_FOR
END_FOR
```
> Ce type de construction rend le nombre de dimensions du tableau théoriquement **infinie**. Le nombre de boucles encapsulée les unes dans les autres est probablement limitée.

# OOP, Object Oriented Programming
Il fallait le rappeler quelque part dans ce cours, j'ai décidé de le mettre ici:

Le **DUT**, **Data User Type**, en particulier la structure **[STRUCT](#structure)** que nous verrons ci-dessous, tout comme le bloque fonctionnel, ou **[Function Block](/AutB_MOD_06_Program_Organisation_Unit/README.md#function-block)** que nous aborderons dans un prochain module peuvent être considérés comme des objets au sens OOP du terme.

> La méthode de programmation orientée objet offre de nombreux avantages.

> En divisant le logiciel en objets, il est possible de développer une application **claire** et **bien structurée**. Ainsi, l'application et les éléments individuels sont facilement **compréhensibles** et faciles à **étendre**. La **réutilisabilité** des objets de programmation permet de gagner **du temps** et de réduire **les coûts** de développement et de maintenance des applications.

> L'usage principalement des **structures**, puis des **blocs fonctionnels** nous permettrons de travailler de manière partiellement orientée objet, voir complètement orientée objet, puisque les notions d'héritage, de polymorphisme et d'abstraction qui ne seront pas abordées dans ce cours ne sont pas vraiment nécessaires pour coder les applications simples visées dans notre contexte.

> Un autre outil fondamental de la programmation orientée objet et l'utilisation du language **UML**, dans notre cas nous disposons du diagramme de classe éditable facilement avec **Mermaid Class Diagram**, voir un [exemple ci-dessous](#instanciation).

# Data User Type, DUT
Quel que soit l'environnement dans lequel est intégré un compilateur Codesys, on a la posibilité de sélection un **Add DUT**
- Structure
- Enumeration
- Alias
- Union

<figure>
    <img src="img/Create a new data unit type.png"
         alt="Create a new data unit type">
    <figcaption>Create a new data unit type</figcaption>
</figure>

# Structure
Une structure permet d'organiser les variables par sujet de manière hiérarchiques.
Contrairement à un **ARRAY** qui est une liste d'objets identiques, un structure peut contenir des variables différentes.

## Forme simple d'une structure pour un axe.
### Définition de la structure
```iecst
TYPE ST_AxisInfo :
STRUCT
   AxisId          : UDINT;
   AxisName        : STRING;
   SetVelocity     : REAL;
   SetDeceleration : REAL;
   ActualPosition  : REAL;
   ActualVelocity  : REAL;
   bAxisStopped    : BOOL;
   DigitalInput_1  : BOOL;
END_STRUCT
END_TYPE
```

### Valeur initiale

> Si la grandeur est pertinente il est conseillé de donner une grandeur intiale. Une information du type **'Axe de base'** sera préférable à **' '**.

```iecst
TYPE ST_AxisInfo :
STRUCT
   AxisId          : UDINT;
   AxisName        : STRING := 'Axe de base';
   SetVelocity     : REAL;
   SetDeceleration : REAL;
   ActualPosition  : REAL;
   ActualVelocity  : REAL := 0;
   bAxisStopped    : BOOL;
   DigitalInput_1  : BOOL;
END_STRUCT
END_TYPE
```
### Instanciation
```iecst
VAR
   getVelocity : REAL;
   stAxisInfo  : ST_AxisInfo;
   stAxisInfoInit : ST_AxisInfo_Initialized
END_VAR
```

```mermaid
classDiagram
    class ST_AxisInfo {
        UDINT AxisId
        STRING AxisName
        REAL SetVelocity
        REAL SetDeceleration
        REAL ActualPosition
        REAL ActualVelocity
        BOOL bAxisStopped
        BOOL DigitalInput_1
    }

    class ST_AxisInfo_Initialized {
        UDINT AxisId
        STRING AxisName = 'Axe de base'
        REAL SetVelocity
        REAL SetDeceleration
        REAL ActualPosition
        REAL ActualVelocity = 0
        BOOL bAxisStopped
        BOOL DigitalInput_1
    }

    class Variables {
        REAL getVelocity
        ST_AxisInfo stAxisInfo
        ST_AxisInfo_Initialized stAxisInfoInit
    }

    Variables *-- ST_AxisInfo
    Variables *-- ST_AxisInfo_Initialized    
```

### Codage
```iecst
getVelocity := stAxisInfo.ActualVelocity;
```

> L'aide à la saisie, IntelliSense, combiné à une structure facilite grandement l'écriture de code complexe sans qu'il soit constamment nécessaire de se référer à la liste des variables. L'IDE affiche automatiquement la liste des variables de la structure après l'écriture du point.

<figure>
    <img src="img/AxisLimit IntelliSense.png"
         alt="AxisLimit IntelliSense">
    <figcaption>ST_AxisInfo combiné à IntelliSense</figcaption>
</figure>

### Structure dans une structure
On peut placer des variables simples dans une structure, mais aussi d'autres variables composées telles que ```STRUCT``` ou ```ARRAY```.
```iecst
TYPE ST_AxisLimits :
STRUCT
   Positive_mm     : REAL := 100; 
   Negative_mm     : REAL := -100;
   MaxVelocity_m_s : REAL := 1000; 
END_STRUCT
END_TYPE
```

```iecst
TYPE ST_AxisInfo :
STRUCT
	AxisId          : UDINT;
	AxisName        : STRING := 'Axe de base';
	SetVelocity     : REAL;
	SetDeceleration : REAL;
	ActualPosition  : REAL;
	ActualVelocity  : REAL := 0;
	bAxisStopped    : BOOL;
	DigitalInput_1  : BOOL;
	stAxisLimit     : ST_AxisLimits;
END_STRUCT
END_TYPE
```
Ci dessous, la représentation UML de ```ST_AxisInfo``` **composé** avec ```ST_AxisLimits```.

```mermaid
classDiagram
    class ST_AxisLimits {
        REAL Positive_mm = 100
        REAL Negative_mm = -100
        REAL MaxVelocity_m_s = 1000
    }

    class ST_AxisInfo {
        UDINT AxisId
        STRING AxisName = 'Axe de base'
        REAL SetVelocity
        REAL SetDeceleration
        REAL ActualPosition
        REAL ActualVelocity = 0
        BOOL bAxisStopped
        BOOL DigitalInput_1
        ST_AxisLimits stAxisLimit
    }

    ST_AxisInfo *-- ST_AxisLimits
```

### Codage
```iecst
    stAxisInfo.stAxisLimit.Positive_mm := 500;
```

<figure>
    <img src="img/AxisStatus PositiveLimit IntelliSense.png"
         alt="AxisStatus PositiveLimit IntelliSense">
    <figcaption>ST_AxisInfo.stAxisLimit.PositiveLimit IntelliSense</figcaption>
</figure>

> La définition des structures doit être une des premières étapes de tout programme PLC.
- Cela permet de fixer rapidement la structure du programme. *Phase de spécification*
- Cela accélére la phase de codage *Gain en productivité*
- Cela simplifie la lisibilité du programme *Phase de maintenance*.

## Structure Extends
La notion de Structure Extends appartient à la spécification Object-Oriented Programming **OOP** du IEC 61131-3. *Certaines plateformes importantes comme Siemens ne la supportent pas en 2023*.


```mermaid
---
title: ST_AxisInfo_Base MoreInputs Extends ST_AxisInfo   
---
classDiagram
    class ST_AxisInfo_MoreInputs {
        BOOL DigitalInput_2;
        BOOL DigitalInput_3;
        BOOL DigitalInput_4;
    }

    class ST_AxisInfo {
        UDINT AxisId
        STRING AxisName = 'Axe de base'
        REAL SetVelocity
        REAL SetDeceleration
        REAL ActualPosition
        REAL ActualVelocity = 0
        BOOL bAxisStopped
        BOOL DigitalInput_1
        ST_AxisLimits stAxisLimit
    }

    ST_AxisInfo <|-- ST_AxisInfo_MoreInputs
```

La notion de Structure Extends permet de créer une structure existante à partir d'une nouvelle. En termes de programmation Orientée Objet, **OOP**, on parle d'héritage.

Le but de cours n'est pas de rentrer dans les subtilités de l'approche orientée objet, mais d'en mentionner certaines caractéristiques quand elle facilite un programmation **Classique**.

### Définition de la structure
Dans l'exemple ci-dessous, le programmeur veut utiliser la structure ```ST_AxisInfo```, mais il veut simplement plus d'entrées à disposition et les ajoute à une nouvelle structure ```ST_AxisInfo_MoreInputs```.

```iecst
TYPE ST_AxisInfo_MoreInputs EXTENDS ST_AxisInfo :
STRUCT
    DigitalInput_2 : BOOL;
    DigitalInput_3 : BOOL;
    DigitalInput_4 : BOOL;
END_STRUCT
END_TYPE
```


### Codage de structures avec Extends
L'utilisation de Extends ne change strictement rien en termes de codage.

```iecst
VAR
   lrActualPosition     : LREAL;
   stAxisInfoMoreInputs : ST_AxisInfo_MoreInputs;
END_VAR

lrActualPosition := stAxisInfoMoreInputs.ActualPosition;
```

### Avantage principal de la notion de *Extends*
Dans les exemples ci-dessus, nous avons 3 structures différentes, ```ST_AxisInfo``` et ```ST_AxisInfo_MoreInputs```. Supponsons qu'il soit nécessaire d'ajouter une information générale pour chaque type.

```iecst
   AxisStopped : BOOL;
```
En programmation classique, *sans extends*, il sera nécessaire d'ajouter la variable à **deux endroit dans le code**.

Avec l'utilisation de ```EXTENDS```, il suffira d'ajouter la variable dans la structure de base, soit à **un seul endroit dans le code**.

> En général, même si c'est possible, on ne passe pas les ```STRUCT``` par ```VAR_IN``` ou ```VAR_OUT```. d'une ```Function``` ou d'un ```Function Block``` Ceci afin d'éviter le temps perdu à faire des copies de variables de la structure vers le block et vice versa.

De préférence on utilise ```VAR_IN_OUT```, qui passe l'adresse de la structure, on travaillera donc sur les valeurs d'origine

## FB avec ```VAR_IN_OUT```

<h2 style="color:red">BAD code with AI</h2>

[2025 Utiliser un pointeur à la place d'un IN_OUT](./VAR_IN_OUT_BAD_AI_CODE.md)

### Déclaration d'un FB avec ```VAR_IN_OUT```
```iecst
FUNCTION_BLOCK FB_StopAxis
VAR_IN_OUT
   ioAxisInfo : ST_AxisInfo;	
END_VAR
```

### Instanciation d'un FB avec ```VAR_IN_OUT```

```mermaid
---
title: ST_AxisInfo with FB_StopAxis
---
classDiagram
    class ST_AxisInfo
    class FB_StopAxis
    FB_StopAxis o-- ST_AxisInfo

```

Ce qu'il est **très important de comprendre** dans cette construction, c'est que ```stAxisInfo``` et ```fbStopAxis_X``` sont deux entités qui sont déclarées séparément. Une structure pour un axes complet contient parfois plusieurs dizaines de variables, il serait au niveau codage et à lors de l'exécution du code, absolument contre-productif de copier chaque valeur de ```stAxisInfo``` dans ```fbStopAxis_X```.

```iecst
VAR
   stAxisInfo   : ST_AxisInfo;
   fbStopAxis_X : FB_StopAxis;
END_VAR
```
> La structure ```ST_AxisInfo``` doit être instanciée: ```stAxisInfo``` et ```FB_StopAxis``` travaillera avec les valeurs mémorisées dans ```stAxisInfo```.

### Codage d'un FB avec une structure en ```IN_OUT```
```iecst
 (* With ST_AxisInfo *)
 fbStopAxis_X(ioAxisInfo := stAxisInfo);
```

## Structure ```EXTENDS``` avec ```VAR_IN_OUT```

### Un peu d'abstraction avec ```EXTENDS```
> Ceci dépasse un peu le cadre *basic* de ce cours, mais cela permet d'illustrer l'intérêt de l'extension **OOP**.

Dans l'exemple ci-dessous, nous avons créé une structure d'axe **spéciale** avec **deux codeurs**.

```mermaid
---
title: VAR_IN_OUT with Extends
---
classDiagram
    class ST_AxisInfo
    class FB_StopAxis
    class ST_AxisTwoEncoder
    FB_StopAxis o-- ST_AxisTwoEncoder
    ST_AxisInfo <|-- ST_AxisTwoEncoder

```

Cependant, nous avons le droite de passer la nouvelle structure ```ST_AxisTwoEncoder``` en ```VAR_IN_OUT``` même si elle est de type différent, car elle possède exactement par héritage les variables attendues par ```fbAxisInfo```.

```iecst
VAR
   stAxisTwoEncoder : ST_AxisTwoEncoder;    // Build with Inheritance
   fbStopAxis_X     : FB_StopAxis;
END_VAR

fbStopAxis_X(ioAxisInfo := stAxisTwoEncoder;
```

> Avantage, il n'est pas nécessaire de réécrire un FB ```FB_StopAxis``` pour cette nouvelle structure.

### Si Extends n'est pas disponible
Il est possible en version **classique non OOP** d'obtenir le même résultat, mais c'est moins élégant:

```mermaid
---
title: VAR_IN_OUT with Extends
---
classDiagram
    class ST_AxisInfo
    class FB_StopAxis
    class ST_AxisTwoEncoder
    class ST_SecondEncoder
    FB_StopAxis o-- ST_AxisTwoEncoder
    ST_AxisTwoEncoder *-- ST_AxisInfo
    ST_AxisTwoEncoder *-- ST_SecondEncoder

```

Dans ce cas, on passera une partie de la structure seulement en ```VAR_IN_OUT```
```iecst
VAR
   stAxisTwoEncoder : ST_AxisTwoEncoder;    // Build with Composition
   fbStopAxis_X     : FB_StopAxis;
END_VAR

fbStopAxis_X(ioAxisInfo := stAxisTwoEncoder.stAxisInfo);
```

# Enumeration
L'énumération est mon type préféré, principalement pour la construction de ```CASE <state> OF```.

## Premier exemple
```iecst
TYPE EN_MotionStateMachineNoDefType :
(
    Idle             := 99,
    MoveOne          := 10,
    MoveOneCheckDone := 20,
    MoveTwo          := 30,
    MoveTwoCheckDone := 40,
    ErrorStop        := 50,
    Stopped          := 60   
) := Idle;
END_TYPE
```

### Intérêt principal de l'énumération
Le principal intérêt de l'énumération est la description d'une machine d'état. Dans la figure ci-dessous, les transitions sont à titre d'exemple uniquement.

```mermaid
stateDiagram-v2
    direction LR

    [*] --> Idle
    Idle --> MoveOne
    MoveOne --> MoveOneCheckDone
    MoveOneCheckDone --> MoveTwo
    MoveTwo --> MoveTwoCheckDone
    MoveTwoCheckDone --> ErrorStop
    ErrorStop --> Stopped
    Stopped --> [*]
```

### Codage d'un ```CASE_OF```
```iecst
VAR
    stateMotion : EN_MotionStateMachineNoDefType := EN_MotionStateMachineNoDefType.Idle;
END_VAR

CASE stateMotion OF
    EN_MotionStateMachine.Idle:
        stateMotion := EN_MotionStateMachine.MoveOne;
    EN_MotionStateMachineNoDefType.MoveOne:
        stateMotion := EN_MotionStateMachine.MoveOneCheckDone;
    EN_MotionStateMachineNoDefType.MoveOneCheckDone:
        stateMotion := EN_MotionStateMachine.MoveTwo;
    EN_MotionStateMachineNoDefType.MoveTwo:
        stateMotion := EN_MotionStateMachine.MoveTwoCheckDone;
    EN_MotionStateMachineNoDefType.MoveTwoCheckDone:
        stateMotion := EN_MotionStateMachine.ErrorStop;
    EN_MotionStateMachineNoDefType.ErrorStop:
        stateMotion := EN_MotionStateMachine.Stopped;
    EN_MotionStateMachineNoDefType.Stopped:
    ; 
END_CASE
```

> Dans certains environnements, par exemple Siemens, les Enums n'existent pas, dans ce cas on pourra utiliser des constantes. Dans tous les cas, l'écriture d'une machine d'état sans caractères littéraux est une mauvaise pratique

### TextList support
> Text list support enables localization of the enumeration component identifiers and a representation of the symbolic component value in a text output in the visualization.
Personnellement jamais utilisé.

### Extends Enum
**Impossible**. Il n'est pas possible d'étendre un Enum comme il est possible de le faire avec une structure.

## Deuxième exemple
```iecst
TYPE EN_TrafficLight_typ :
(
    Idle   := 99,
    Rouge  := 1,
    Orange := 2,
    Vert   := 3
) WORD := Rouge;
END_TYPE
```

> Noter Idle à 99, c'est que si l'Enum n'est pas initalisé, il ne fonctionnera pas.

> Noter ) ``WORD`` := Rouge; **WORD** permet ici de forcer le type de base à utiliser pour l'Enum, par exemple pour un traitement numérique ou logique.

> Noter qu'il est possible de fixer une valeur d'initilisation pour l'Enum. Ici: **Rouge**.

# Alias
Un alias est un type de données défini par l'utilisateur qui peut être utilisé pour créer un nom alternatif pour un type de données ou un bloc fonctionnel.

Example:
*On délare une chaine de 50 caractères *ascii**

```iecst
TYPE T_Message : STRING[50];
END_TYPE
```

Déclaration

```iecst
sMessageA : T_Message;
```

Utilisation

```iecst
sMessageA := 'This is a message';
```

> Ceci est intéressant si on utilise souvent une certaine construction, ici la chaine de caractères.

# Union
Une UNION est une structure de données qui contient généralement différents types de données. Dans une union, tous les composants ont le même décalage, ce qui signifie qu'ils occupent le même espace mémoire.

> L'intérêt d'une union réside principalement dans la programmation de bas niveau. Dans l'exemple ci-dessous tirée d'un capteur IO-Link [Baumer O300.DL](https://www.baumer.com/fr/en/product-overview/distance-measurement/laser-distance-sensors/standard-laser-distance-sensors/o300-dl-gm1j-72n/p/38517). Le capteur retourne les données dans une trame de 24 bits. Pour accéder à certaines données, on devra le faire soit sous forme de bits, ou de bytes.

<figure>
    <img src="img/IO-Link Process Data 3 bytes.png"
         alt="IO-Link Process Data 3 bytes">
    <figcaption>IO-Link Process Data for Baumer O300.DL</figcaption>
</figure>

- MDC1: 2 bytes de données pour la grandeur du signal (16 bits)
- Q: le bit de qualité qui indique que le signal est utilisable
- BDC1: un seuil programmable qui fait que le capteur peut être utilisé simplement comme détecteur de proximité sans se soucier de la valeur MDC1.
- A: un bit d'alarme qui indique un problème dans le capteur.

## Déclaration d'une structure de bits.
```iecst
TYPE ST_Bits :
STRUCT
    bBit7  : BIT;
    bBit6  : BIT;
    bBit5  : BIT;
    bBit4  : BIT;
    bBit3  : BIT;
    bBit2  : BIT;
    bBit1  : BIT;
    bBit0  : BIT;   
END_STRUCT
END_TYPE
```
### Déclaration d'une union de 3 bytes.
```iecst
TYPE U_3Byte :
UNION
    a3Byte : ARRAY[1..3] OF BYTE;    
    aBits  : ARRAY[1..3] OF ST_Bits;
END_UNION
END_TYPE
```
### Instanciation de l'union
```iecst
VAR
    bAlarme    : BOOL;
    iSignal    : INT := 0;
    u3Byte     : U_3Byte;
END_VAR
```
### Utilisation dans le code
```iecst
bAlarme := u3Byte.aBits[3].bBit3;
iSignal := WORD_TO_INT(u3Byte.a3Byte[1] * 256 + u3Byte.a3Byte[2]);
```
> On pourra vérifier facilement quel devrait être le résulat si le Byte 1 vaut ```0E``` et le Byte 2 ```E6```

> On pourra vérifier ensuite quel devrait être le résulat si le Byte 1 vaut ```FF``` et le Byte 2 ```FF```

### Un type pour une conversion two Modbus Word 2 Float
```ìecst
TYPE U_2_RegToFloat :
UNION
	mdbFloat_32	: REAL;
	mdbReg_16	: ARRAY[1..2] OF WORD;
END_UNION
END_TYPE
```

```iecst
VAR
    reMyFloat   : REAL;¨
    wReg_2      : WORD;
    wReg_1      : WORD;

    uRegToFloat : U_2_RegToFloat
END_VAR
// Code
    uRegToFloat.mdbReg_16[1] := wReg_2;
    uRegToFloat.mdbReg_16[2] := wReg_1;

    reMyFloat := uRegToFloat.mdbFloat_32;
```


## Big Endian vs Little Endian
Une application d'une union pourra aider à la résolution de problèmes liés à l'```Endianness ```.

### Endianness
Spécifie l'ordre dans lequel les séquences de **bytes** sont enregistrée en mémoire.
|Little Endian     |Big Endian      |
|-----------------------------------|---------------|
|Intel             |Motorola        |
|Byte with the smallest value first |Byte with the largest value first|
|decimal 41394     |decimal 41394  |
|0xA1B2            |0xA1B2         |
|```0xB2```, ```0xA1``` |```0xA1```, ```0xB2``` | 

Concrètement pour une représentation ```Little-Endian``` sur un processeur **Intel**.
```
VAR
   myBytes  : ARRAY[1..4] OF BYTE;
END_VAR

// For  myByte[1] - myByte[2] - myByte[3] - myByte[4]
    myByte[1] := 16#B2;
    myByte[2] := 16#A1;
    myByte[3] := 16#0;
    myByte[4] := 16#0;
```

# Exercices

## Exercice 1, Min/Max/RMS of ioBuffer
Nous avons en variable globale un buffer de 50 valeurs venant d'un convertisseur 16 bits, valeurs positives ou négatives.
La taille du buffer est fixée par une constante.
A chaque cycle, le système fait l'aquisition de 50 valeurs, sampling rate 50 [kHz] avec un bus temps réel à 1 [kHz].
A chaque cycle, nous voulons obetenir:
-   ```iMinSampleValue```, la grandeur minimum.
-   ```iMaxSampleValue```, la grandeur maximum.
-   ```iRMSSampleValue```, la grandeur RMS.

[Solution Exercice 1](#solution-exercice-1-minmaxrms-of-iobuffer)

## Exercice 2, State Machine
Ecrire l'```Enum``` et la structure ```CASE_OF```, c'est à dire uniquement les états sans les transitions de la machine d'état ci-dessous.

```mermaid
---
title: Write CSV File
---
stateDiagram-v2
    [*] --> WAIT_RISING_EDGE
    WAIT_RISING_EDGE --> GENERATE_FILENAME
    GENERATE_FILENAME --> OPEN_SOURCE_FILE
    OPEN_SOURCE_FILE --> WAIT_OPEN_NOT_BUSY
    WAIT_OPEN_NOT_BUSY --> CONVERT_ONE_CSV_RECORD
    CONVERT_ONE_CSV_RECORD --> WRITE_RECORD_TO_FILE
    WRITE_RECORD_TO_FILE --> WAIT_UNTIL_WRITE_NOT_BUSY
    WAIT_UNTIL_WRITE_NOT_BUSY --> CLOSE_SOURCE_FILE
    CLOSE_SOURCE_FILE --> WAIT_UNTIL_CLOSE_NOT_BUSY
    WAIT_UNTIL_CLOSE_NOT_BUSY --> ERROR_OR_READY_STEP
    ERROR_OR_READY_STEP --> [*]

```

### Contraintes:
- le premier état à la valeur 999.
- les autres états ont une valeur fixe.
- l'énumération est de type ```UDINT```
- l'état initial est forcé à ```WAIT_RISING_EDGE```
- la variable d'état du ```CASE_OF``` est ```stateCsv```.

[Solution Exercice 2](#solution-exercice-2-state-machine)

## Exercice 3, Modbus avec ```Endianess```
Une série de registres Modbus sont donnés avec les informations suivantes.
Format ```Big-Endian```.
|Register      |Type      |Unit      |Description      |
|--------------|----------|----------|-----------------|
|0-3           |INT(32)     |Wh        |Total active energy|
|4-7           |INT(32)     |VARh      |Total reactive energy|
|8-11          |INT(32)     |VAh       |Total apparent energy|
Une trame ```Modbus``` arrive dans le registre suivant:

> Warning, this examples comes from a datasheet for Modbus. Do not forget about the integer defintion of IEC 61131-3 for 32 bits integer. That is: **DINT** !
```
    modBusFrame : ARRAY[0..11] OF BYTE := [0, 8, 143, 237, 0, 41, 3, 189, 255, 254, 21, 231];
```
Nous devons lire la trame ci-dessus avec un processeur Intel ```Little-Endian``` pour afficher les valeurs dans des ```DINT```.

[Solution Exercice 3](#solution-exercice-3-modbus-avec-endianess) 

## Exercice 4, VAR_IN_OUT with Extends
Déclarer, instancier et coder l'exemple ci-dessus avec ```ST_AxisTwoEncoder```.

```mermaid
---
title: VAR_IN_OUT with Extends
---
classDiagram
    class ST_AxisInfo
    class FB_StopAxis
    class ST_AxisTwoEncoder
    FB_StopAxis o-- ST_AxisTwoEncoder
    ST_AxisInfo <|-- ST_AxisTwoEncoder

```

```ST_SecondEncoder``` est composé de:
```iecst
	ActualPosition  : REAL;
	ActualVelocity  : REAL := 0;
	bAxisStopped    : BOOL;
```
``FB_StopAxis`` est instancié sous le nom de ``fbStopAxisTwoEncoder``.

La structure de données ``ST_AxisTwoEncoder`` est instanciée sous nom de ```stAxisTwoEncoder```

L'axe X était instancié sous la forme suivante:
```iecst
 (* With ST_AxisInfo *)
 fbStopAxis_X(ioAxisInfo := stAxisInfo);
```

[Solution Exerice 4](#solution-exerice-4-var_in_out-with-extends)

# Solution des exercices

## Solution Exercice 1, Min/Max/RMS of ioBuffer
Fichier ```GVL_IO_BUFFER``` de déclaration des variables globales.
```iecst
VAR_GLOBAL
    ioBuffer        : ARRAY[1..IO_BUFFER_SIZE] OF INT;
END_VAR

VAR_GLOBAL CONSTANT
    IO_BUFFER_SIZE  : UDINT := 50;
END_VAR
```
### Codage
```iecst
PROGRAM PRG_MinMaxMean
VAR
    iBufferLoop   : UDINT;
    iMinValue     : INT;
    iMaxValue     : INT;
    iRMSValue     : INT;
    iSumRMSValue  : LINT;
END_VAR

// Init values before computation
iMinValue := GVL_IO_BUFFER.MAX_16_BITS;
iMaxValue := GVL_IO_BUFFER.MIN_16_BITS;
iSumRMSValue := 0;

FOR iBufferLoop := 1 TO GVL_IO_BUFFER.IO_BUFFER_SIZE BY 1 DO
    // Get min value
    IF GVL_IO_BUFFER.ioBuffer[iBufferLoop] < iMinValue THEN
        iMinValue := GVL_IO_BUFFER.ioBuffer[iBufferLoop];
	END_IF
    // Get max value
    IF GVL_IO_BUFFER.ioBuffer[iBufferLoop] > iMaxValue THEN
        iMaxValue := GVL_IO_BUFFER.ioBuffer[iBufferLoop];
	END_IF
    // Accumulate values (need a variable bigger as min/max INT)
    iSumRMSValue := iSumRMSValue + (GVL_IO_BUFFER.ioBuffer[iBufferLoop] * GVL_IO_BUFFER.ioBuffer[iBufferLoop]);
END_FOR

// Values with 16 bits suppose no informatino lost
iRMSValue := LREAL_TO_INT(SQRT(LINT_TO_LREAL(iSumRMSValue/GVL_IO_BUFFER.IO_BUFFER_SIZE)));
```
### Test
Avec tous les échantillons à 0, sauf:
- un échantillon à 50
- un échantillon à -50

iMinValue := -50
iMaxValue := 50
iRMSValue := 10

## Solution Exercice 2, State Machine
```iecst
### Enum
TYPE EN_CSV_WriteSteps :
(
	WAIT_RISING_EDGE := 0,
	GENERATE_FILENAME := 21,
	OPEN_SOURCE_FILE := 1,
	WAIT_OPEN_NOT_BUSY := 2,
	CONVERT_ONE_CSV_RECORD := 3,
	WRITE_RECORD_TO_FILE := 4,
	WAIT_UNTIL_WRITE_NOT_BUSY := 5,
	CLOSE_SOURCE_FILE := 10,
	WAIT_UNTIL_CLOSE_NOT_BUSY := 11,
	ERROR_OR_READY_STEP := 100
) UDINT := WAIT_RISING_EDGE;
END_TYPE
```
### Codage
```iecst
VAR
    stateCsv    : EN_CSV_WriteSteps; 
END_VAR

CASE stateCsv OF
    EN_CSV_WriteSteps.WAIT_RISING_EDGE:
        ;
    EN_CSV_WriteSteps.GENERATE_FILENAME:
        ;
    EN_CSV_WriteSteps.OPEN_SOURCE_FILE:
        ;
    EN_CSV_WriteSteps.WAIT_OPEN_NOT_BUSY:
        ;
    EN_CSV_WriteSteps.CONVERT_ONE_CSV_RECORD:
        ;
    EN_CSV_WriteSteps.WRITE_RECORD_TO_FILE:
	;
    EN_CSV_WriteSteps.WAIT_UNTIL_WRITE_NOT_BUSY:
	;
    EN_CSV_WriteSteps.CLOSE_SOURCE_FILE:
	;    
    EN_CSV_WriteSteps.WAIT_UNTIL_CLOSE_NOT_BUSY:
	;
    EN_CSV_WriteSteps.ERROR_OR_READY_STEP:
        ;
END_CASE
```

## Solution Exercice 3, Modbus avec ```Endianess```
### Liste des constantes dans le fichier ```GVL_Modbus```
```iecst
VAR_GLOBAL CONSTANT
    MB_FRAME_SIZE     : INT := 12;
    NUMBER_OF_INT32   : INT := 3;  
    TYPE_SIZE_IN_BYTE : INT := 4;
END_VAR
```
### Définition de l'union ```U_SolveModbus```
```iecst
TYPE U_SolveModbus :
UNION
    myBytes   : ARRAY[1..GVL_Modbus.TYPE_SIZE_IN_BYTE] OF BYTE;
    diMyResult : DINT;
END_UNION
END_TYPE
```
### Définition de la structure générale
```iecst
TYPE ST_SolveModbus :
STRUCT
    arMyRegisters            : ARRAY[1..GVL_Modbus.NUMBER_OF_INT32] OF U_SolveModbus;
    TotalActiveEnergy_Wh     : DINT;
    TotalReactiveEnergy_VARh : DINT;
    TotalApparentEnergy_VAh  : DINT;
END_STRUCT
END_TYPE
```
### Program
```iecst
VAR
    modBusFrame : ARRAY[1..GVL_Modbus.MB_FRAME_SIZE] OF BYTE := [0, 8, 143, 237, 0, 41, 3, 189, 255, 254, 21, 231];
    stResult    : ST_SolveModbus;
    // Number of INT (32 bits - 4 bytes) in the frame
    int32Loop   : INT;
    // Number of Byte in INT
    iRegInt32   : INT;
    
    iCheck      : INT;
    iCheckLoop  : INT;
END_VAT

// Only used to check if the program runs (not needed for algorithms
iCheck := iCheck + 1;
iCheckLoop := 0;

// Dispatch registers from Frame to Struct
FOR int32Loop := 1 TO GVL_Modbus.NUMBER_OF_INT32 BY 1 DO
    FOR iRegInt32 := 1 TO GVL_Modbus.TYPE_SIZE_IN_BYTE BY 1 DO
        // Next line is not usefull, write it to help debug if needed
        iCheckLoop := (int32Loop-1) * GVL_Modbus.TYPE_SIZE_IN_BYTE + iRegInt32;
        stResult.arMyRegisters[int32Loop].myBytes[(GVL_Modbus.TYPE_SIZE_IN_BYTE+1)-iRegInt32] := modBusFrame[(int32Loop-1) * GVL_Modbus.TYPE_SIZE_IN_BYTE + iRegInt32];
    END_FOR
END_FOR

// Total active energy, should be 561133
stResult.TotalActiveEnergy_Wh := stResult.arMyRegisters[1].diMyResult;

// Total reactive energy, should be 2687933
stResult.TotalReactiveEnergy_VARh := stResult.arMyRegisters[2].diMyResult;

// Total apparent energy, sould be -125465
stResult.TotalApparentEnergy_VAh := stResult.arMyRegisters[3].diMyResult;
```

## Solution Exerice 4, VAR_IN_OUT with Extends

Déclaration des structures

```iecst
TYPE ST_SecondEncoder
STRUCT
	ActualPosition  : REAL;
	ActualVelocity  : REAL := 0;
	bAxisStopped    : BOOL;
END_STRUCT
END_TYPE
```

```iecst
TYPE ST_AxisTwoEncoder EXTENDS ST_AxisInfo :
STRUCT
    stSecondEncoder : ST_SecondEncoder;
END_STRUCT
END_TYPE
```
Instanciation des variables
```iecst
VAR
   fbStopAxisTwoEncoder : FB_StopAxis;
   stAxisTwoEncoder     : ST_AxisTwoEncoder;
END_VAR
```

Appel du FB
```iecst
 (* With ST_AxisTwoEncoder *)
 fbStopAxisTwoEncoder(ioAxisInfo := stAxisTwoEncoder);
```

<!-- end of file -->