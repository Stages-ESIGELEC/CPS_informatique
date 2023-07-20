--CE CODE CONTIENT TOUTES LES REQUETES NECESSAIRES A L'USAGE DE LA BASE DE DONNÉE , EN FONCTION DES US STORY--

--US13: ajout de produit--
INSERT INTO articles( boutique_id , article_nom ,article_categorie , artcle_sous_categorie , article_prix , article_date_dépôt , article_quantité , photo ) VALUES(values1,values2,values3,values4,values5,values6,values7,values8,) ;

--US10: creation compte gerant et boutique--
INSERT INTO utilisateurs(utilisateur_id , utiilisateur_mail  ,utilisateur_pseudo ,utilisateur_naissance,utilisateur_type) VALUES(values1,values2,values3,'gerant');
INSERT INTO boutiques( utilisateur_id , boutique_nom ,boutique_domaine ,boutique_adresse , boutique_description ,boutique_photo , boutique_type ) VALUES(values1,values2,values3,values4,values5,values6,values7) ;

--US51:consultation de l'historique des commandes:utilisateur--
SELECT commandes.quantite, commandes.prix, commandes.date_commande, utilisateurs.utilisateur_mail FROM commandes INNER JOIN utilisateurs ON commandes.utilisateur_id = utilisateurs.utilisateur_id WHERE utilisateurs.utilisateur_id = ?;
 
--US52: modification du profil membre---
UPDATE membres SET mail = '?', password ='?', autorisations = '?' WHERE id_membre = ?;

--US45:cosulatation de l'historique des commandes:boutiques--
SELECT commandes.quantite, commandes.prix, commandes.date_commande, boutiques.boutique_nom FROM commandes INNER JOIN boutiques ON boutique_id = id_boutique WHERE boutiques.id_boutique = ?;