# Born2beRoot

| Final grade: | 86/100 |
|--------------|--------|
## Description:

Ce projet a pour but de vous faire découvrir le merveilleux monde de la virtualisation.

## Skills

+ Rigor
+ Network & system administration 

## Instructions:

- Un service SSH sera actif sur le port 4242 uniquement. L'utilisateur "root" ne devra pas pouvoir se connecter par SSH.
- Mettre en place le pare-feu UFW et ainsi ne laisser ouvert que le port 4242. Il devra être actif au lancement de la machine virtuelle.
- La machine aura pour hostname `<login>` suivi de `42` (exemple : `wil42`).
- Il faudra mettre en place une politique de mot de passe fort.
- Il faut installer et configurer `sudo` selon une pratique stricte.
- Un utilisateur sera présent avec pour nom `<login>` en plus de l’utilisateur root. Cet utilisateur appartiendra aux groupes `user42` et `sudo`.


## Conditions de politique du mot de passe fort :

- Votre mot de passe devra expirer tous les 30 jours.
- Le nombre minimum de jours avant de pouvoir modifier un mot de passe seraconfiguré à 2.
- L’utilisateur devra recevoir un avertissement 7 jours avant que son mot de passe n’expire.
- Votre mot de passe sera de 10 caractères minimums dont une majuscule et unchiffre, et ne devra pas comporter plus de 3 caractères identiques consécutifs.
- Le mot de passe ne devra pas comporter le nom de l’utilisateur.
- Le mot de passe devra comporter au moins 7 caractères différent du précedent.
- Bien entendu votre mot de passe root devra suivre la même politique.
- Après avoir mis en place vos fichiers de configuration, il faudra changer tous les mots de passe des comptes présents sur la machine virtuelle, root inclus.

## Condition de groupe sudo:

- L’authentification en utilisant sudo sera limitée à 3 essais en cas de mot de passe érroné.
- Un message de votre choix s’affichera en cas d’erreur suite à un mauvais mot depasse lors de l’utilisation desudo.
- Chaque action utilisant sudo sera archivée, aussi bien les inputs que les outputs. Le journal se trouvera dans le dossier/var/log/sudo/.
- Le modeTTYsera activé pour des questions de sécurité.
- Les paths utilisables par sudo seront restreints, là encore pour des questions de sécurité.`:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin`

## To install :

- `apt install ufw sudo vim libpam-cracklib liboam-pwquality`
