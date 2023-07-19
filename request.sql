--CE CODE CONTIENT TOUTES LES REQUETES NECESSAIRES A L'USAGE DE LA BASE DE DONNÉE , EN FONCTION DES US STORY--

--US13: ajout de produit--
INSERT INTO articles( boutique_id , article_nom ,article_categorie , artcle_sous_categorie , article_prix , article_date_dépôt , article_quantité , photo ) VALUES(values1,values2,values3,values4,values5,values6,values7,values8,) ;

--US10: creation compte gerant et boutique--
INSERT INTO utilisateurs(utilisateur_id , utiilisateur_mail  ,utilisateur_pseudo ,utilisateur_naissance,utilisateur_type) VALUES(values1,values2,values3,'gerant');
INSERT INTO boutiques( utilisateur_id , boutique_nom ,boutique_domaine ,boutique_adresse , boutique_description ,boutique_photo , boutique_type ) VALUES(values1,values2,values3,values4,values5,values6,values7) ;
