<h1 align="left">
  <br>
  <img src="./img/hei-en.png" alt="HEI-Vs Logo" width="350">
  <br>
  Industrial Automation Base
  <br>
</h1>

Cours AutB

Author: [Cédric Lenoir](mailto:cedric.lenoir@hevs.ch)

# Module 10 OPC Unified Architecture (UA)

*Keywords:* [OPC UA](https://opcfoundation.org/)

# OpcUa_AutB

Ce module est une introduction à OPC UA.
OPC UA sera utilisé sous forme paramétrable afin de comprendre son utilisation dans le cadre de l'automation, et plus généralement pour tout système qui requiert l'échange d'un grand nombre de données complexes dans un contexte sécurisé.
Pour plus de détails sur les fonctions avancées de OPC UA, on se reportera au cours du 6ème semestre P&C.

# OPC UA 
## Livre de référence
OPC Unified Architecture de Mahnke, Leitner et Damm, 2009.
Ce livre reste « LA » base pour toute personne qui veut ou doit se plonger dans le détail de l’implémentation OPC-UA.

Vu son importance croissante dans le domaine de l’automation, la composante « Sécurité » de l’OPC UA est intégrée comme exemple dans un chapitre spécifique lié à la Cyber Sécurité.
Préambule

## Figure

Figure 83 The connected factory is creating a need to provide much higher levels of security than in the past. Source opcfoundation.org
Historique
Il n’est pas possible de parler de l’OPC UA sans aborder en deux mots son ancêtre, renommé dans la littérature récente : OPC Classic.
Qu'est-ce que OPC Classic?

La spécification OPC Classic d'origine est OPC DA (Data Access), qui définit une interface entre les applications client et serveur pour échanger des données de processus et de fabrication. Les autres spécifications importantes d'OPC Classic incluent OPC Alarms & Events (OPC AE) et OPC Historical Data Access (OPC HDA).
Dans la pratique, c’est une technologie permettant le partage de variables sur un réseau TCP/IP entre un PLC : le serveur, et un client : le PC avec Windows.
Pour l’automaticien cela consiste à faire des click pour lier les données à l’OPC du côté de l’IDE du PLC, puis des clicks dans l’environnement de développement du client HMI implémenté sur une plateforme Windows. Y ajouter ensuite des pleurs et des grincements de dents à chaque fois que les données doivent transiter à travers un Firewall….
Qu’est-ce que OPC UA ?
Open Platform Communications / Unified Architecture
Le modèle client/serveur est le modèle de communication traditionnel dans OPC UA. Il est basé sur l'idée qu'il existe un composant serveur passif qui expose des données pour d'autres applications qui agissent en tant que clients. Les applications Client peuvent accéder aux données et informations du Serveur via quelques services standardisés.
 
OPC UA est conçu pour utiliser l'architecture TCP/IP, il occupe les couches 5, 6 et 7 du modèle OSI.
OPC UA Model OSI

## Figure

Figure 84 OPC UA Layers
OPC UA dans le cadre de ce cours
Ce cours se concentre sur la partie application de l’OPC UA avec une très succincte description des couches inférieures. Dans la mesure ou la norme OPC UA comporte un volet sécurité, IEC TR 62541-2, nous en profiterons pour aborder l’aspect cyber sécurité d’un projet d’automation.
OPC UA offre les fonctionnalités suivantes

- Protocole ouvert et indépendant de la plate-forme pour la communication interprocessus et réseau.
- Accès à Internet et communication via des pare-feu (Firewalls).
- Mécanismes intégrés de contrôle d'accès et de sécurité au niveau du protocole et de l'application.
- Options de mappage étendues pour les modèles orientés objet. Les objets peuvent avoir des balises (tags) et des méthodes et déclencher des événements.
- Système de type extensible pour les objets et les types de données complexes.
- Les mécanismes de transport et les règles de modélisation constituent la base d'autres normes.
- Évolutivité des petits systèmes embarqués aux applications d'entreprise et modèles complexes orientés objet.

# Architecture
Le terme Unified Architecture signifie que OPC UA est conçu pour couvrir l’ensemble de l’architecture d’un système d’automation, depuis un ERP, en passant par un MES, les systèmes SCADA et jusqu’au capteur.
En d’autres termes, il est possible depuis une application sur le Cloud d’accéder de manière sécurisée aux informations d’un capteur.
ERP Enterprise resource planning.
Un type de logiciel que les entreprises utilisent pour gérer leurs activités quotidiennes telles que la comptabilité, les achats, la gestion de projets, la gestion des risques et la conformité, ainsi que les opérations de supply chain, une chaîne qui relie le fournisseur du fournisseur au client.
MES Manufacturing Execution System
Un système informatique qui connecte, surveille et contrôle des systèmes de fabrication et flux de données complexes au niveau des ateliers
SCADA Supervisory Control and Data Acquisition
Système de supervision industrielle qui traite en temps réel un grand nombre de mesures et contrôle à distance les installations)

## Figure

Figure 85 The Scope of OPC UA within an enterprise, Source reference.opcfoundation.org
Fonctionnement de base Client Serveur

## Figure

Figure 86 OPC UA Client Serveur
La première chose que le client doit faire est d'ouvrir une connexion au serveur. Il a besoin d'une adresse de connexion, en général IP. Il créera alors une session sur le serveur. La session contient un contexte de sécurité, qui comprend des paramètres de chiffrement et d'authentification facultatifs pour identifier l'application client et l'utilisateur dans le serveur. Le Client peut également identifier le Serveur et décider s'il autorise la communication avec lui.

L’application client peut requérir quelques services standard du serveur. Ils sont :

- Se connecter et créer une session.
- Parcourir l’espace d’adresse - pour découvrir ce qui est disponible sur le serveur
- Lire - des variables ou métadonnées
- Ecrire - des variables – ou des métadonnées

- Appeler des méthodes
- Lire l'historique - pour des variables et des événements
- Fermer la session et se déconnecter

## Metadata 
Les métadonnées sont des données qui décrivent d'autres données, fournissant une référence structurée qui aide à trier et à identifier les attributs de l'information qu'elle décrit.
C’est l’un des points forts de la norme OPC-UA, la capacité à obtenir une information complète et déterminée.

Certains protocoles rudimentaires tels Modbus se contentent de livrer un certains nombre de bytes à une adresse donnée, dans le meilleur des cas, si l’on connait à l’avance l’adresse hexadécimale d’une information, on pourra lire un certain nombre de bytes sans aucune garantie que le nombre de bytes et leur format n’aient pas varié du côté du client au moment de la lecture.

Grâce à l’intégration de la gestion des metadata dans la norme OPC UA, on pourra
Lire le format des données au moment de l’établissement de la session, (voir même recevoir une notification en cas de modification).

Obtenir le type de données (INT, REAL, WORD, etc.) ainsi que des données structurées (STRUCT)

Obtenir si elle est disponible l’unité de l’information, sa tolérance, sa date, son historique ainsi que pratiquement tout ce que le gestionnaire aura décidé de fournir.

## OPC UA Subscription Concept
Contrairement à la lecture permanente d'informations (Read), OPC UA offre une fonctionnalité plus élégante, appelée abonnement, Subscription. Un client UA peut s'abonner à une sélection de nœuds d'intérêt et laisser le serveur surveiller ces éléments. Uniquement en cas de modifications, par ex. à leurs valeurs, le serveur informe le client de ces changements. Ce mécanisme réduit considérablement la quantité de données transférées. Outre la réduction de la bande passante, ce mécanisme présente d'autres avantages et est le mécanisme recommandé pour "lire" les informations d'un serveur UA.
 
Un client peut s'abonner à différents types d'informations fournies par un serveur OPC UA. L'objet d'un Abonnement est de regrouper ces sources d'informations, appelées MonitoredItem, pour former une information appelée Notification. Il est par exemple possible de regrouper les éléments en fonction de l'intervalle de temps que le serveur utilisera pour surveiller les valeurs des différents abonnements, Subscriptions. 
 
Une fois l'abonnement créé, le client envoie l’information Publish sur le serveur et le serveur répondra périodiquement si il y a lieu avec NotificationMessages. Le NotificationMessage peut contenir des DataChanges et des Events, respectivement au type des MonitoredItems.

## Figure

Figure 87 OPC UA Subscription
Les composantes de OPC UA
Les composants fondamentaux de l'architecture unifiée OPC sont les mécanismes de transport et la modélisation des données selon OPC Unified Architecture de Mahnke, Leitner et Damm.

## Figure

Figure 88 [Infrastructure OPC UA, Source](https://opcfoundation.org)
Transport
Le transport définit différents mécanismes optimisés pour différents cas d'utilisation. La première version d'OPC UA définit un protocole TCP binaire optimisé pour la communication intranet haute performance ainsi qu'un mappage aux normes Internet acceptées telles que les services Web, XML et HTTP pour une communication Internet compatible avec les pare-feu. Les deux transports utilisent le même modèle de sécurité basé sur les messages connu des services Web et le modèle de communication abstrait ne dépend pas des mécanismes de transport.



Modélisation, orienté objet
La modélisation des données définit les règles et les blocs de construction de base nécessaires pour exposer un modèle d'information avec OPC UA. Il définit également les points d'entrée dans l'espace d'adressage et les types de base utilisés pour construire une hiérarchie de types. Cette base peut être étendue par des modèles d'information s'appuyant sur les concepts de modélisation abstraite. En outre, il définit certains concepts améliorés tels que la description des machines à états utilisées dans différents modèles d'information.
Les services UA sont l'interface entre les serveurs en tant que fournisseur d'un modèle d'information et les clients en tant que consommateurs de ce modèle d'information. Les Services sont définis de manière abstraite. Ils utilisent les mécanismes de transport pour échanger les données entre le client et le serveur.
Ce concept de base d'OPC UA permet à un client OPC UA d'accéder aux plus petits éléments de données sans avoir besoin de comprendre l'ensemble du modèle exposé par des systèmes complexes. Les clients OPC UA comprenant également des modèles spécifiques peuvent utiliser des fonctionnalités plus avancées définies pour des domaines et des cas d'utilisation spéciaux. La figure 2 montre les différentes couches de modèles d'information définis par OPC, par d'autres organisations ou par des fournisseurs.



« Discovery mechanism »
L’un des aspects particulier et fondateur de l’OPU UA est sa fonction découverte. Cela signifie que l’architecture intègre non seulement l’aspect d’accès aux données, mais aussi l’accès à la modélisation des données, Metadata. Sans connaître à l’avance la structure d’un capteur il sera possible de découvrir l’organisation des données à l’intérieur de ce capteur, de lire ou écrire certaines paramètres, mais encore d’invoquer des méthodes. On pourrait dire qu’il est non seulement possible d’accéder à un objet, mais aussi de découvrir sa classe.

Figure 89 OPC UA, Object Oriented, Source OPC Unified Architecture de Mahnke, Leitner et Damm

Orienté Objet
Cela signifie que pour un client, il sera possible, par exemple, de se connecter à différents appareils héritant du même « parents » pour connaitre par exemple leur nom, sans se soucier de leur model complet.


Malheureusement pour la compréhension de la spécification, la définition OPC UA n’utilise pas l’UML, mais sa propre notation.

Figure 91 Objet and Instance in OPC UA style, Source reference.opcfoundation.org


Figure 92 Object and Instance in OPC UA style converted to SysML
OPC UA, Functional Specification
OPC UA est normalisé selon IEC 62541. La spécification de l’OPC UA est un monstre qui en 2020 compte déjà plus de 15 parties dont certaines comportent plusieurs centaines de pages. Ceci sans compter les normes qui y sont relatives.
Toutefois, cet aspect « monstrueux » si l’on aborde l’OPC UA sous l’angle technique de celui qui doit l’implémenter, ne doit pas effrayer l’utilisateur final qu’est l’automaticien. Ce cours n’est pas destiné à implémenter OPC UA, mais à en comprendre l’intérêt.


Figure 93 Mapping OPC UA notation to SysML



Figure 94 OPC UA / IEC 62541 technical parts overview
A noter IEC 62451-13:2020  Norm number-Part:Year. Au moment de l’écriture de ce cours, la plupart des parties sont en « Pre-Release » c’est-à-dire en cours d’approbation finale.
Concrètement
La plupart des PLC récent et de plus en plus de « devices » intègrent un serveur OPC UA accessible via son adresse IP et un port.

OPC UA, exemple d’application
Travaux pratiques
Dans le cadre des travaux pratiques qui accompagnent ce cours d’automation, nous allons aborder OPC UA en termes de communication entre machines. Les aspects abordés, outre la problématique de l’établissement d’une session sécurisée entre deux machines seront la lecture asynchrone d’informations et l’utilisation de méthodes.
Traditionnellement, au niveau des PLC, OPC UA était présent uniquement en tant que serveur, depuis peu de temps, 2020 par exemple chez Siemens, il est possible d’utiliser un PLC au niveau Client. Dans un cas concret, cela signifie qu’il est possible de « piloter » un PLC équipé d’un serveur OPC UA.

Figure 95 Communication machine to machine, Source: Siemens
OPC UA, PLC Client
Le projet, par exemple Siemens TIA Portal contient les certificats signés pour l’accès au serveur. Première conséquence, afin de garantir l’intégrité de la sécurité du système, le projet doit être protégé.
 

Les différentes étapes

Dans le contexte d’un environnement de développement tel que TIA Portal de Siemens, le processus est avant tout un processus de configuration qui peut s’avérer plus ou moins compliqué selon le degré de maturité de l’environnement de développement et la compatibilité du client et du serveur.
Sécurisation du projet
Comme mentionné plus haut, il ne sera pas possible de développer un OPC Client sans sécuriser le projet.
Création de l’interface client
Dans le contexte TIA Portal, il s’agit d’un pur problème de configuration, un interface client sera créé. Celui-ci contiendra notamment
L’adresse du serveur IP, par exemple 192.168.1.1 et son port (en général 4840 pour OPC UA)
Le mode de sécurité, par exemple Sign & encrypt.
Le certificat client utilisé
Le type d’authentification, par exemple User name and password.
A noter que dans le cadre de TIA Portal, la création de l’interface générera automatiquement deux types de bloques de données, DB, dont le détail sera traité ci-dessous.
Par exemple : Client interface_2_Configuration et Client interface_2_Data
Création du certificat
Il est soit possible d’utiliser un certificat existant, soit de créer un nouveau certificat. A noter, que le certificat est lié à l’application. Une modification de certains paramètres de l’application, telle son identification OPC UA pourra entrainer la perte de validité du certificat.

Figure 96 Exemple de création de certificat sur TIA Portal
Première connexion
Lors de la première connexion avec un nouveau certificat, le certificat sera rejeté. Il sera nécessaire de passer à l’étape suivante.
Validation du certificat client.
La validation du certificat nouvellement créé ne pourra se faire que du côté du serveur. Cela implique un accès au serveur OPC UA qui sera souvent sécurisé via un mot de passe et parfois distant.
Découverte
On l’a vu plus haut, l’une des caractéristiques les plus intéressantes de OPC UA est la fonction découverte, une fois l’accès au serveur garanti, il sera alors possible de parcourir la structure de données mise à disposition par le serveur.

Figure 97 Exemple de structure de donnée. En vert les tags en rose les méthodes.
Alternativement, il sera possible d’obtenir la configuration OPC UA du serveur « offline » sous format XML. Pour autant qu’elle soit disponible.
Génération des structures IEC 61131
Lors de la creation de l’interface, Siemens construit automatiquement deux DB dont le contenu dépend en partie des liens en lecture, écriture et méthodes qui seront créés vers la structure du serveur.

Figure 98 Build Access structure to Server, TIA Portal
Deux structures sont créées, la première supporte la configuration du client.

Figure 99 TIA Portal DB Client Configuration
Une seconde structure sert à supporter les informations échangées avec le serveur.
A noter que pour chaque méthodes, si nécessaire, TIA Portal génère encore une structure de données pour les entrées et les sorties de la méthode.

Figure 100 TIA Portal DB Client Data
Programmation IEC 61131
Finalement, TIA Portal fournit un bibliothèque de bloques fonctionnels dédiés à la communication avec le serveur. On peut les regrouper en quatre catégories.
Connexion

Figure 101 OPC UA Client Connexion, Siemens
Lecture, écriture et méthodes.

Figure 102 OPC UA Client, read, write, method, Siemens
Diagnostic

Figure 103 OPC UA Client diagnostic, Siemens
Déconnexion

Figure 104 OPC UA Client déconnexion, Siemens
Implémentation
Finalement, Siemens fournit un exemple d’implémentation d’un FB utilisant la librairie. On peut le constater, la création d’un client sur un PLC Siemens, même si elle permet des fonctionnalités puissantes, n’est pas une opération triviale.

Figure 105 Siemens fournit un exemple d'application qui doit encore être intégré.
Sessions
La mise en service de la communication peut s’avérer un peu laborieuse, en particulier en raison de l’intégration des services de sécurité tels que les mots de passe (qui sont finalement enregistrés dans une DB dans le cas de Siemens) et la gestion des certificats. Par contre, cette complexité est aussi la garantie d’une sécurité robuste !
Lecture
Quelques essais de lecture avec l’utilisation des blocs fonctionnels Siemens montrent un accès en lecture de l’ordre de 100 ms pour quelques dizaines de bytes. Ce n’est pas un système de communication particulièrement rapide. Cependant, la configuration utilisée ne permettait pas le mode « Subscriptions » à préférer pour la lecture de grandes quantités de données.
Event 
(Variante de la lecture, ne sera pas traité)
OPC UA, PLC Server, methods
Du point de vue de la programmation structurée, les méthodes sont sans doute le moyen le plus élégant de communiquer entre machines. 
Si l’OPC UA Client est nouveau sur les PLC et relativement compliqué à mettre en œuvre, les méthodes ne partagent qu’une seule de ses qualités et heureusement c’est la nouveauté.

Figure 106 Particularité Siemens, le nom des instances est obligatoire
La seule contrainte pour l’implémentation de méthodes au niveau du PLC serveur est, dans le cas de Siemens, le nom des instances, de telle manière à ce que le compilateur soit capable de les reconnaitre dans le code.

Figure 107 Exemple de méthode pour ouvrir une porte.
Le compilateur génère automatiquement le code nécessaire en tenant compte du nom de l’instance dans lesquels les instances OPC Pre et Post on été enregistrées.

Figure 108 Exemple de méthodes générées par le compilateur Siemens
Finalement, les méthodes générées pourront être testées à l’aide d’un outil de type UA Expert Client.
Dans le cas ci-dessous, une porte reçoit une commande avec un temps de fermeture limité à 5600 ms, la méthodes Post retourne le temps nécessaire pour la fermeture et le résultat de l’opération. Ici « Done » et 2439 ms,

Figure 109 Exemple d'appel de méthode avec UA Expert.
Conclusion
Les méthodes sont un moyen de communication élégant pour créer un interface avec une machine. Contrairement à un pilotage par entrées et sorties, il permet une approche orientée objet.

