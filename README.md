Contexte
Lecoincoin est une société familiale qui existe depuis 1940, elle est gérée par Mr Gerard Lecoincoin et Mme Mathilde Lecoincoin.\n
Lecoincoin est une entreprise de dépôt vente touchant à tout ce qui peut se vendre ou s’acheter.
Lecoincoin a raté le tournant du numérique, il y a quelques décennies et aimerait vraiment pouvoir avoir une présence en ligne pour diffuser ses annonces.

Acteurs
Le projet sera exploité par Mr Gérard Lecoincoin qui aura la lourde tâche d’administrer les annonces sur la plateforme qui sera créée.
Mme Mathilde Lecoincoin n’était pas à l’aise avec l’outil informatique, n’aura qu’un rôle de modérateur pour ne pas risquer de causer trop de dégâts.

Objectifs
Réaliser une plateforme complète avec plusieurs modes de consultation :
● Un backend devra être réalisé pour permettre à Mr Lecoincoin d’administrer les annonces, les modifier, les supprimer et même en créer !
● Un frontend devra être réalisé pour permettre à monsieur tout le monde de profiter de ces annonces exceptionnelles

Expression détaillée du besoin

Besoins fonctionnels

Backend
● Une couche de sécurité sera ajoutée afin d’empêcher l’accès à la partie backend sans identifiants
● Les comptes utilisateurs pourront avoir 3 rôles différents : ADMIN, MODERATOR et CLIENT
● L’administrateur et le modérateur pourront tous deux accéder au backend
● Le rôle CLIENT sera réservé aux utilisateurs de la partie API qui sera développée plus tard
● Au delà des utilisateurs (User) qui seront liés à des rôles (Role) pour la sécurité, votre modèle de donnée permettra de gérer des annonces (SaleAd) et leurs illustrations (Illustration)
● Toutes les opérations de CRUD seront disponible sur les entités représentant : les utilisateurs, les annonces et les illustrations n’auront pas de gestion indépendante, elles seront simplement modifiable dans les annonces
Pour résumer, les actions réalisable pour la partie backend sont les suivantes :
● S’identifier / Se déconnecter
● Créer / Visualiser / Mettre à jour / Supprimer : une annonce et un utilisateur

Besoins non fonctionnels
Pour le design, vous pouvez vous inspirer de tout ce que vous pourrez trouver en ligne mais Mr Lecoincoin adore le design de ce site : https://leboncoin.fr
Pour le design du backend, pas de fioriture, on fait simple et efficace, un menu pour naviguer entre les entités et un affichage de l’utilisateur identifié sera amplement suffisant, vous pourrez vous appuyer sur n’importe quelle base pertinente pour une interface d’administration comme ceci par exemple
