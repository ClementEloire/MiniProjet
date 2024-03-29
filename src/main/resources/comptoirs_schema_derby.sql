DROP TABLE Ligne;
DROP TABLE Commande;
DROP TABLE Produit;
DROP TABLE Client;
DROP TABLE Categorie;


CREATE TABLE Categorie (
	Code INT NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY ,
	Libelle VARCHAR(25) NOT NULL UNIQUE,
	Description VARCHAR(255)
);



CREATE TABLE Client (
	Code CHAR(5) NOT NULL PRIMARY KEY ,
	Societe VARCHAR(40) NOT NULL UNIQUE,
	Contact VARCHAR(30) default NULL,
	Fonction VARCHAR(30) default NULL,
	Adresse VARCHAR(60) default NULL,
	Ville VARCHAR(15) default NULL,
	Region VARCHAR(15) default NULL,
	Code_postal CHAR(10) default NULL,
	Pays VARCHAR(15) default NULL,
	Telephone VARCHAR(24) default NULL,
	Fax VARCHAR(24) default NULL
);



CREATE TABLE Produit (
	Reference INT NOT NULL PRIMARY KEY GENERATED BY DEFAULT  AS IDENTITY,
	Nom VARCHAR(40) NOT NULL UNIQUE,
	Fournisseur INT NOT NULL default 0,
	Categorie INT NOT NULL REFERENCES Categorie (Code) ON DELETE RESTRICT,
	Quantite_par_unite VARCHAR(30) DEFAULT NULL,
	Prix_unitaire DECIMAL(18,2) NOT NULL DEFAULT 0.00 CHECK (Prix_unitaire >= 0),
	Unites_en_stock SMALLINT NOT NULL DEFAULT 0  CHECK (Unites_en_stock >= 0),
	Unites_commandees SMALLINT NOT NULL DEFAULT 0 CHECK (Unites_commandees >= 0),
	Niveau_de_reappro SMALLINT NOT NULL DEFAULT 0 CHECK (Niveau_de_reappro >= 0),
	Indisponible SMALLINT NOT NULL DEFAULT 0 CHECK (Indisponible = 0 OR Indisponible = 1)
);




CREATE TABLE Commande (
	Numero INT NOT NULL PRIMARY KEY GENERATED BY DEFAULT  AS IDENTITY,
	Client CHAR(5) NOT NULL REFERENCES Client (Code) ON DELETE CASCADE,
	Saisie_le DATE default CURRENT_DATE NOT NULL,
	Envoyee_le DATE default NULL,
	Port DECIMAL(18,2) default NULL,
	Destinataire VARCHAR(40) default NULL,
	Adresse_livraison VARCHAR(60) default NULL,
	Ville_livraison VARCHAR(15) default NULL,
	Region_livraison VARCHAR(15) default NULL,
	Code_Postal_livrais VARCHAR(10) default NULL,
	Pays_Livraison VARCHAR(15) default NULL,
	Remise DECIMAL(10,2) NOT NULL default 0.00  CHECK (REMISE >= 0)
) ;



CREATE TABLE Ligne (
	Commande INT NOT NULL REFERENCES Commande (Numero) ON DELETE CASCADE,
	Produit INT NOT NULL REFERENCES Produit (Reference),
	Quantite  SMALLINT NOT NULL default 1 CHECK (Quantite > 0),
	PRIMARY KEY  (Commande, Produit)
);

