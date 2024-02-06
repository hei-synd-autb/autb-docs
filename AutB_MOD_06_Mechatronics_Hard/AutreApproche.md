# Autres approches

Afin de ne pas me perdre dans les détais

# De manière générique:

## Capteur
Pour un moteur, un capteur, linéaire ou angulaire qui par dérivation retourne:
Une vitesse (ou vitesse angulaire)
Une force, ou un couple

Une jerk (dérivée de l'accélération).

Une vitesse nulle qui doit être déterminée par un seuil.

Pour un vérin : une position de fin et une position de départ.

## Actuateur
Un moteur, qui peut être électrique ou pneumatique.

Il y aura un état "Disabled", par exemple coupure de la puissance pneumatique.
Il y aura un "PowerOn"

Il y aura une séquence de "Homing"
Comment savoir sinon, à quel positin de situe le vérin

## Derrière un actuateur, il y aura *souvent* un système mécanique.
Combien de temps pour parler de la vis à bille.

Les différents types de motion control

## Les paramètres.

## Quel mode ?
Position / Vitesse / Force ?


Je vais commencer par travailler sur ma vis à bille, puis si il me reste du temps sur 2 x 45 minutes, j'ajouterai des détais.
Les caractéristiques de la vis à bille.
Purement mécatronique
Nombre de millimètres par tour du moteur.
Précision en fonction du type de codeur.
- Limite de couple acceptable sur la vis (En fonction du couple du moteur)
- Limite de force sur l'axe linéaire de la vis.
- Limite de force pour le processus.

-   Quelle

Purement mécanique
Les contraintes sur la mécanique.

Electrique
Quel est le courant acceptable sur le moteur ?

Comment choisir le moment d'inertie du moteur en fonction de la masse en mouvement.

Quel est le frottement ? Comment peut-on estimer le frottement, linéaire en fonction de la vitesse (linéaire ?).

Les problèmes de vibration




