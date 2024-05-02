<h1 align="left">
  <br>
  <img src="./img/hei-en.png" alt="HEI-Vs Logo" width="350">
  <br>
  Industrial Automation Base
  <br>
</h1>

Cours AutB

Author: [Cédric Lenoir](mailto:cedric.lenoir@hevs.ch)

# Module 07 le drive, software.

# Cette partie est actuellement traitée directement dans le cadre du laboratoire: Voir: [LAB 05 Mise en service d'un axe électrique avec une vis à bille](https://github.com/hei-synd-autb/autb-lab-05)

# Régulateur PI
La théorie sur les régulateurs PI repose sur certains principes de linéarité des signaux. Dans la réalité, comme nous pouvons le voir dans le cadre du laboratoire, de nombreuses composantes ne sont absolument pas linéaires.

Ci-dessous, un aperçu des roulements de la vis à bille dans un axe CKK tel que dans le laboratoire d'automation.

<figure align="center">
    <img src="./SpeedRegulation/ExampleOfCkkAxisInHevsLab_1.png"
         alt="Image Lost ExampleOfCkkAxisInHevsLab_1">
    <figcaption>CKK Internal View</figcaption>
</figure>

Selon un figure d'origine SFK, fournisseur de roulement à bille, on peut observer un exemple de variation du frottement des roulements à bille en fonction de la température.

<figure align="center">
    <img src="./SpeedRegulation/SourceSFKFrictionAsFunctionOfSpeed.png"
         alt="Image Lost SourceSFKFrictionAsFunctionOfSpeed">
    <figcaption>Source SFK, friction as a function of speed</figcaption>
</figure>

Une vue externe d'un module SFK montre que nous avons en sus, des lamelles en caoutchouc protègent la mécanique interne de la poussière.

<figure align="center">
    <img src="./SpeedRegulation/ExampleOfCkkAxisInHevsLab_2.png"
         alt="Image Lost ExampleOfCkkAxisInHevsLab_2">
    <figcaption>CKK External View</figcaption>
</figure>

Nous obtenons, selon documention Bosch Rexroth, un exemple de la variation du frottement en fonction du temps sur un mouvement aller et retour sur l'ensemble de la course d'un système.

<figure align="center">
    <img src="./SpeedRegulation/ExampleOfCkkAxisInHevsLabFriction.png"
         alt="Image Lost ExampleOfCkkAxisInHevsLabFriction">
    <figcaption>Measurement of frictional torque of complete system</figcaption>
</figure>

Finalement, il conviendra de tenir compte de l'ensemble de la structure en mouvement, qui inclu des câbles dont le comportement est compliqué à estimer ainsi que de la rigidité de l'ensemble qui en plus des contraintes de masses, moments d'inertie et frottement ajoutera une composante élastique.

<figure align="center">
    <img src="./SpeedRegulation/ExampleOfCkkAxisInHevsLabOberview.jpg"
         alt="Image Lost ExampleOfCkkAxisInHevsLabOberview">
    <figcaption>HEVS Lab, system overview</figcaption>
</figure>

# Un pas plus loin