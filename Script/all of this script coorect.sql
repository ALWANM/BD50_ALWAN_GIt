-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                      Oracle Version 10g
--                        (23/5/2019 23:34:04)
-- -----------------------------------------------------------------------------
--      Nom de la base : MLRopt
--      Projet : G11_Reservation_Tennis
--      Auteur : alwan
--      Date de dernière modification : 21/5/2019 22:30:54
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
--      DROP INDEX
-- -----------------------------------------------------------------------------
DROP INDEX I_PK_PERSONNE;
DROP INDEX I_USERNAME_PWD;
DROP INDEX I_FK_PERSONNE_NIVEAU;
DROP INDEX I_PK_FACTURE;
DROP INDEX I_FK_FACTURE_PERSONNE;
DROP INDEX I_FK_FACTURE_FORFAIT;
DROP INDEX I_PK_FORFAIT;
DROP INDEX I_PK_TERRAIN;
DROP INDEX I_FK_TERRAIN_TYPE_TERRAIN;
DROP INDEX I_PK_ENTRAINEMENT;
DROP INDEX I_FK_ENTRAINEMENT_TERRAIN;
DROP INDEX I_FK_ENTRAINEMENT_PERSONNE;
DROP INDEX I_PK_CRENEAU;
DROP INDEX I_FK_CRENEAU_TERRAIN;
DROP INDEX I_FK_CRENEAU_ENTRAINEMENT;
DROP INDEX I_PK_RESERVATION;
DROP INDEX I_FK_RESERVATION_FACTURE;
DROP INDEX I_FK_RESERVATION_CRENEAU;
DROP INDEX I_FK_RESERVATION_PERSONNE;
DROP INDEX I_PK_NIVEAU;
DROP INDEX I_PK_TYPE_TERRAIN;
DROP INDEX I_PK_PARTICIPER;
DROP INDEX I_FK_PARTICIPER_RESERVATION;
DROP INDEX I_FK_PARTICIPER_PERSONNE;
DROP INDEX I_PK_ENTRAINER;
DROP INDEX I_FK_ENTRAINER_NIVEAU;
DROP INDEX I_FK_ENTRAINER_PERSONNE;
DROP INDEX I_PK_SOUSCRIRE;
DROP INDEX I_FK_SOUSCRIRE_PERSONNE;
DROP INDEX I_FK_SOUSCRIRE_FORFAIT;
DROP INDEX I_PK_ASSISTER;
DROP INDEX I_FK_ASSISTER_ENTRAINEMENT;
DROP INDEX I_FK_ASSISTER_PERSONNE;

-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

CREATE DATABASE MLRopt;


drop tablespace BD50_DATA including contents cascade constraints
drop tablespace BD50_IND including contents cascade constraints
CREATE TABLESPACE BD50_DATA
    MINIMUM EXTENT 64K
  ;

CREATE TABLESPACE BD50_IND
    MINIMUM EXTENT 64K
  ;

-- -----------------------------------------------------------------------------
--       TABLE : PERSONNE
-- -----------------------------------------------------------------------------
-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                      Oracle Version 10g
--                        (23/5/2019 23:34:04)
-- -----------------------------------------------------------------------------
--      Nom de la base : MLRopt
--      Projet : G11_Reservation_Tennis
--      Auteur : alwan
--      Date de dernière modification : 21/5/2019 22:30:54
-- -----------------------------------------------------------------------------

DROP TABLE PERSONNE CASCADE CONSTRAINTS;

DROP TABLE FACTURE CASCADE CONSTRAINTS;

DROP TABLE FORFAIT CASCADE CONSTRAINTS;

DROP TABLE TERRAIN CASCADE CONSTRAINTS;

DROP TABLE ENTRAINEMENT CASCADE CONSTRAINTS;

DROP TABLE CRENEAU CASCADE CONSTRAINTS;

DROP TABLE RESERVATION CASCADE CONSTRAINTS;

DROP TABLE NIVEAU CASCADE CONSTRAINTS;

DROP TABLE TYPE_TERRAIN CASCADE CONSTRAINTS;

DROP TABLE PARTICIPER CASCADE CONSTRAINTS;

DROP TABLE ENTRAINER CASCADE CONSTRAINTS;

DROP TABLE SOUSCRIRE CASCADE CONSTRAINTS;

DROP TABLE ASSISTER CASCADE CONSTRAINTS;

-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
--       TABLE : PERSONNE
-- -----------------------------------------------------------------------------

CREATE TABLE PERSONNE
   (
    NUMERO_PERSONNE NUMBER(4)  NOT NULL,
    NUMERO_NIVEAU NUMBER(4)  NOT NULL,
    NOM_PERSONNE VARCHAR2(40)  NOT NULL,
    PRENOM_PERSONNE VARCHAR2(40)  NOT NULL,
    NAISSANCE_PERSONNE DATE  NOT NULL,
	TELEPHONE_PERSONNE VARCHAR2(15)  NOT NULL,
    PAYS_PERSONNE VARCHAR2(30)  NULL,
    VILLE_PERSONNE VARCHAR2(30)  NULL,
    CP_PERSONNE VARCHAR2(8)  NULL,
    RUE_PERSONNE VARCHAR2(30)  NULL,
    NUM_ADRESSE_PERSONNE NUMBER(5)  NULL,
    USERNAME_PERSONNE VARCHAR2(15)  NOT NULL,
    MDP_PERSONNE VARCHAR2(15)  NOT NULL,
    NUMERO_ENTR NUMBER(2)  NULL,
    DATE_EMBAUCHE_ENTR DATE  NULL,
    SALAIRE_ENTR NUMBER(13,2)  NULL,
    TYPE_PERSONNE CHAR(1)  NULL,
    NOM_NIVEAU VARCHAR2(20)  NULL
,   CONSTRAINT PK_PERSONNE PRIMARY KEY (NUMERO_PERSONNE)    
   )PARTITION BY LIST (TYPE_PERSONNE) 
     (
     PARTITION personne
        VALUES ('J')
        STORAGE (INITIAL 8 M), 
     PARTITION entraineur
        VALUES ('E')
     )TABLESPACE BD50_DATA;  
 ALTER TABLE PERSONNE ADD CONSTRAINT username_uique UNIQUE(USERNAME_PERSONNE);

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE PERSONNE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_PERSONNE_NIVEAU
     ON PERSONNE (NUMERO_NIVEAU ASC)
      TABLESPACE BD50_IND ;

CREATE  INDEX I_USERNAME_PWD
     ON PERSONNE (USERNAME_PERSONNE,MDP_PERSONNE )
   TABLESPACE BD50_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : FACTURE
-- -----------------------------------------------------------------------------

CREATE TABLE FACTURE
   (
    NUMERO_FACTURE NUMBER(4)  NOT NULL,
    NUMERO_PERSONNE NUMBER(4)  NOT NULL,
    NUMERO_FORFAIT NUMBER(2)  NULL,
    DATE_FACTURE DATE  NOT NULL,
    MTT_FACTURE NUMBER(13,2)  NOT NULL,
    DATE_SOUSCRIPTION DATE  NULL,
    PAYS_PERSONNE VARCHAR2(30)  NULL,
    VILLE_PERSONNE VARCHAR2(30)  NULL,
    CP_PERSONNE VARCHAR2(8)  NULL,
    RUE_PERSONNE VARCHAR2(30)  NULL,
    NUM_ADRESSE_PERSONNE VARCHAR2(5)  NULL,
    NOM_PERSONNE VARCHAR2(40)  NULL,
    PRENOM_PERSONNE VARCHAR2(40)  NULL
,   CONSTRAINT PK_FACTURE PRIMARY KEY (NUMERO_FACTURE)   
   )
   TABLESPACE BD50_DATA ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE FACTURE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_FACTURE_PERSONNE
     ON FACTURE (NUMERO_PERSONNE ASC)
   TABLESPACE BD50_IND ;

CREATE  INDEX I_FK_FACTURE_FORFAIT
     ON FACTURE (NUMERO_FORFAIT ASC)   
   TABLESPACE BD50_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : FORFAIT
-- -----------------------------------------------------------------------------

CREATE TABLE FORFAIT
   (
    NUMERO_FORFAIT NUMBER(2)  NOT NULL,
    DESIGNATION_FORFAIT VARCHAR2(40)  NOT NULL,
    PRIX_FORFAIT NUMBER(13,2)  NOT NULL,
    NB_HEUR_FORFAIT NUMBER(3)  NOT NULL,
    DUREE_VAL_FORFAIT NUMBER(3)  NOT NULL
,   CONSTRAINT PK_FORFAIT PRIMARY KEY (NUMERO_FORFAIT)  
   )
   TABLESPACE BD50_DATA ;

-- -----------------------------------------------------------------------------
--       TABLE : TERRAIN
-- -----------------------------------------------------------------------------

CREATE TABLE TERRAIN
   (
    NOM_TERRAIN VARCHAR2(20)  NOT NULL,
    NUMERO_TYPE_TERRAIN NUMBER(2)  NOT NULL,
    DESC_TERRAIN VARCHAR2(30)  NOT NULL,
    DESIGNATION_TYPE_TERRAIN VARCHAR2(50)  NULL
,   CONSTRAINT PK_TERRAIN PRIMARY KEY (NOM_TERRAIN)   
   )
   TABLESPACE BD50_DATA ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE TERRAIN
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_TERRAIN_TYPE_TERRAIN
     ON TERRAIN (NUMERO_TYPE_TERRAIN ASC)  
   TABLESPACE BD50_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : ENTRAINEMENT
-- -----------------------------------------------------------------------------

CREATE TABLE ENTRAINEMENT
   (
    NUMERO_ENTRAINEMENT NUMBER(4)  NOT NULL,
    NOM_TERRAIN VARCHAR2(20)  NOT NULL,
    NUMERO_PERSONNE NUMBER(4)  NOT NULL,
    TYPE_ENTRAINEMENT VARCHAR2(30)  NOT NULL,
    FREQ_ENTRAINEMENT CHAR(5)  NOT NULL,
	NBR_MAX_PARTICIPANTS NUMBER(2)  NOT NULL,
    DEBUT_ENTRAINEMENT DATE  NOT NULL,
    FIN_ENTRAINEMENT DATE  NOT NULL
,   CONSTRAINT PK_ENTRAINEMENT PRIMARY KEY (NUMERO_ENTRAINEMENT)   
   )
   TABLESPACE BD50_DATA ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ENTRAINEMENT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ENTRAINEMENT_TERRAIN
     ON ENTRAINEMENT (NOM_TERRAIN ASC)
   TABLESPACE BD50_IND ;

CREATE  INDEX I_FK_ENTRAINEMENT_PERSONNE
     ON ENTRAINEMENT (NUMERO_PERSONNE ASC)   
   TABLESPACE BD50_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : CRENEAU
-- -----------------------------------------------------------------------------

CREATE TABLE CRENEAU
   (
    NOM_TERRAIN VARCHAR2(20)  NOT NULL,
    DATE_CRENEAU DATE  NOT NULL,
    HORAIRE_CRENEAU DATE  NOT NULL,
    NUMERO_ENTRAINEMENT NUMBER(4)  NULL,
    DUREE_CRENEAU NUMBER(2)  NOT NULL
,   CONSTRAINT PK_CRENEAU PRIMARY KEY (NOM_TERRAIN, DATE_CRENEAU, HORAIRE_CRENEAU)  
   )
   TABLESPACE BD50_DATA ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CRENEAU
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CRENEAU_TERRAIN
     ON CRENEAU (NOM_TERRAIN ASC)
   TABLESPACE BD50_IND ;

CREATE  INDEX I_FK_CRENEAU_ENTRAINEMENT
     ON CRENEAU (NUMERO_ENTRAINEMENT ASC)   
   TABLESPACE BD50_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : RESERVATION
-- -----------------------------------------------------------------------------

CREATE TABLE RESERVATION
   (
    NUMERO_RESERVATION NUMBER(5)  NOT NULL,
    NUMERO_FACTURE NUMBER(4)  NOT NULL,
    DATE_CRENEAU DATE  NOT NULL,
    HORAIRE_CRENEAU DATE  NOT NULL,
    NOM_TERRAIN VARCHAR2(20)  NOT NULL,
    NUMERO_PERSONNE NUMBER(4)  NOT NULL,
    DATE_RESERVATION DATE  NOT NULL,
    PRIX_RESERVATION NUMBER(13,2)  NOT NULL,
    NOM_PERSONNE VARCHAR2(40)  NULL,
    PRENOM_PERSONNE VARCHAR2(40)  NULL,
    USERNAME_PERSONNE VARCHAR2(15)  NULL
,   CONSTRAINT PK_RESERVATION PRIMARY KEY (NUMERO_RESERVATION)   
   ) PARTITION BY RANGE(DATE_CRENEAU)
  (
	  PARTITION y1 VALUES LESS THAN (to_date('01-01-2020','DD-MM-YYYY')) , 
	  PARTITION y2 VALUES LESS THAN (to_date('01-01-2021','DD-MM-YYYY')) ,
	  PARTITION y3 VALUES LESS THAN (to_date('01-01-2022','DD-MM-YYYY')) ,
	  PARTITION y4 VALUES LESS THAN (MAXVALUE) 
  ) TABLESPACE BD50_DATA;
-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE RESERVATION
-- -----------------------------------------------------------------------------

CREATE UNIQUE INDEX I_FK_RESERVATION_FACTURE
     ON RESERVATION (NUMERO_FACTURE ASC)
   TABLESPACE BD50_IND ;

CREATE UNIQUE INDEX I_FK_RESERVATION_CRENEAU
     ON RESERVATION (NOM_TERRAIN ASC, DATE_CRENEAU ASC, HORAIRE_CRENEAU ASC)   
   TABLESPACE BD50_IND ;

CREATE  INDEX I_FK_RESERVATION_PERSONNE
     ON RESERVATION (NUMERO_PERSONNE ASC)   
   TABLESPACE BD50_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : NIVEAU
-- -----------------------------------------------------------------------------

CREATE TABLE NIVEAU
   (
    NUMERO_NIVEAU NUMBER(4)  NOT NULL,
    NOM_NIVEAU VARCHAR2(20)  NOT NULL
,   CONSTRAINT PK_NIVEAU PRIMARY KEY (NUMERO_NIVEAU)   
   )
   TABLESPACE BD50_DATA ;

-- -----------------------------------------------------------------------------
--       TABLE : TYPE_TERRAIN
-- -----------------------------------------------------------------------------

CREATE TABLE TYPE_TERRAIN
   (
    NUMERO_TYPE_TERRAIN NUMBER(2)  NOT NULL,
    DESIGNATION_TYPE_TERRAIN VARCHAR2(50)  NULL
,   CONSTRAINT PK_TYPE_TERRAIN PRIMARY KEY (NUMERO_TYPE_TERRAIN)  
   )
   TABLESPACE BD50_DATA ;

-- -----------------------------------------------------------------------------
--       TABLE : PARTICIPER
-- -----------------------------------------------------------------------------

CREATE TABLE PARTICIPER
   (
    NUMERO_RESERVATION NUMBER(5)  NOT NULL,
    NUMERO_PERSONNE NUMBER(4)  NOT NULL
,   CONSTRAINT PK_PARTICIPER PRIMARY KEY (NUMERO_RESERVATION, NUMERO_PERSONNE)   
   )
   ORGANIZATION INDEX  ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE PARTICIPER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_PARTICIPER_RESERVATION
     ON PARTICIPER (NUMERO_RESERVATION ASC)
   TABLESPACE BD50_IND ;

CREATE  INDEX I_FK_PARTICIPER_PERSONNE
     ON PARTICIPER (NUMERO_PERSONNE ASC)   
   TABLESPACE BD50_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : ENTRAINER
-- -----------------------------------------------------------------------------

CREATE TABLE ENTRAINER
   (
    NUMERO_NIVEAU NUMBER(4)  NOT NULL,
    NUMERO_PERSONNE NUMBER(4)  NOT NULL
,   CONSTRAINT PK_ENTRAINER PRIMARY KEY (NUMERO_NIVEAU, NUMERO_PERSONNE)   
   )
   ORGANIZATION INDEX  ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ENTRAINER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ENTRAINER_NIVEAU
     ON ENTRAINER (NUMERO_NIVEAU ASC)
   TABLESPACE BD50_IND ;

CREATE  INDEX I_FK_ENTRAINER_PERSONNE
     ON ENTRAINER (NUMERO_PERSONNE ASC)   
   TABLESPACE BD50_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : SOUSCRIRE
-- -----------------------------------------------------------------------------

CREATE TABLE SOUSCRIRE
   (
    NUMERO_PERSONNE NUMBER(4)  NOT NULL,
    NUMERO_FORFAIT NUMBER(2)  NOT NULL
,   CONSTRAINT PK_SOUSCRIRE PRIMARY KEY (NUMERO_PERSONNE, NUMERO_FORFAIT)  
   )
   ORGANIZATION INDEX  ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE SOUSCRIRE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_SOUSCRIRE_PERSONNE
     ON SOUSCRIRE (NUMERO_PERSONNE ASC)   
   TABLESPACE BD50_IND ;

CREATE  INDEX I_FK_SOUSCRIRE_FORFAIT
     ON SOUSCRIRE (NUMERO_FORFAIT ASC)   
   TABLESPACE BD50_IND ;

-- -----------------------------------------------------------------------------
--       TABLE : ASSISTER
-- -----------------------------------------------------------------------------

CREATE TABLE ASSISTER
   (
    NUMERO_ENTRAINEMENT NUMBER(4)  NOT NULL,
    NUMERO_PERSONNE NUMBER(4)  NOT NULL
,   CONSTRAINT PK_ASSISTER PRIMARY KEY (NUMERO_ENTRAINEMENT, NUMERO_PERSONNE)   
   )
   ORGANIZATION INDEX  ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE ASSISTER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ASSISTER_ENTRAINEMENT
     ON ASSISTER (NUMERO_ENTRAINEMENT ASC)   
   TABLESPACE BD50_IND ;

CREATE  INDEX I_FK_ASSISTER_PERSONNE
     ON ASSISTER (NUMERO_PERSONNE ASC)   
   TABLESPACE BD50_IND ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE PERSONNE ADD (
     CONSTRAINT FK_PERSONNE_NIVEAU
          FOREIGN KEY (NUMERO_NIVEAU)
               REFERENCES NIVEAU (NUMERO_NIVEAU))    ;

ALTER TABLE FACTURE ADD (
     CONSTRAINT FK_FACTURE_PERSONNE
          FOREIGN KEY (NUMERO_PERSONNE)
               REFERENCES PERSONNE (NUMERO_PERSONNE))    ;

ALTER TABLE FACTURE ADD (
     CONSTRAINT FK_FACTURE_FORFAIT
          FOREIGN KEY (NUMERO_FORFAIT)
               REFERENCES FORFAIT (NUMERO_FORFAIT))     ;

ALTER TABLE TERRAIN ADD (
     CONSTRAINT FK_TERRAIN_TYPE_TERRAIN
          FOREIGN KEY (NUMERO_TYPE_TERRAIN)
               REFERENCES TYPE_TERRAIN (NUMERO_TYPE_TERRAIN))     ;

ALTER TABLE ENTRAINEMENT ADD (
     CONSTRAINT FK_ENTRAINEMENT_TERRAIN
          FOREIGN KEY (NOM_TERRAIN)
               REFERENCES TERRAIN (NOM_TERRAIN))     ;

ALTER TABLE ENTRAINEMENT ADD (
     CONSTRAINT FK_ENTRAINEMENT_PERSONNE
          FOREIGN KEY (NUMERO_PERSONNE)
               REFERENCES PERSONNE (NUMERO_PERSONNE))     ;

ALTER TABLE CRENEAU ADD (
     CONSTRAINT FK_CRENEAU_TERRAIN
          FOREIGN KEY (NOM_TERRAIN)
               REFERENCES TERRAIN (NOM_TERRAIN))     ;

ALTER TABLE CRENEAU ADD (
     CONSTRAINT FK_CRENEAU_ENTRAINEMENT
          FOREIGN KEY (NUMERO_ENTRAINEMENT)
               REFERENCES ENTRAINEMENT (NUMERO_ENTRAINEMENT))     ;

ALTER TABLE RESERVATION ADD (
     CONSTRAINT FK_RESERVATION_FACTURE
          FOREIGN KEY (NUMERO_FACTURE)
               REFERENCES FACTURE (NUMERO_FACTURE))     ;

ALTER TABLE RESERVATION ADD (
     CONSTRAINT FK_RESERVATION_CRENEAU
          FOREIGN KEY (NOM_TERRAIN, DATE_CRENEAU, HORAIRE_CRENEAU)
               REFERENCES CRENEAU (NOM_TERRAIN, DATE_CRENEAU, HORAIRE_CRENEAU))     ;

ALTER TABLE RESERVATION ADD (
     CONSTRAINT FK_RESERVATION_PERSONNE
          FOREIGN KEY (NUMERO_PERSONNE)
               REFERENCES PERSONNE (NUMERO_PERSONNE))     ;

ALTER TABLE PARTICIPER ADD (
     CONSTRAINT FK_PARTICIPER_RESERVATION
          FOREIGN KEY (NUMERO_RESERVATION)
               REFERENCES RESERVATION (NUMERO_RESERVATION))     ;

ALTER TABLE PARTICIPER ADD (
     CONSTRAINT FK_PARTICIPER_PERSONNE
          FOREIGN KEY (NUMERO_PERSONNE)
               REFERENCES PERSONNE (NUMERO_PERSONNE))     ;

ALTER TABLE ENTRAINER ADD (
     CONSTRAINT FK_ENTRAINER_NIVEAU
          FOREIGN KEY (NUMERO_NIVEAU)
               REFERENCES NIVEAU (NUMERO_NIVEAU))     ;

ALTER TABLE ENTRAINER ADD (
     CONSTRAINT FK_ENTRAINER_PERSONNE
          FOREIGN KEY (NUMERO_PERSONNE)
               REFERENCES PERSONNE (NUMERO_PERSONNE))     ;

ALTER TABLE SOUSCRIRE ADD (
     CONSTRAINT FK_SOUSCRIRE_PERSONNE
          FOREIGN KEY (NUMERO_PERSONNE)
               REFERENCES PERSONNE (NUMERO_PERSONNE))     ;

ALTER TABLE SOUSCRIRE ADD (
     CONSTRAINT FK_SOUSCRIRE_FORFAIT
          FOREIGN KEY (NUMERO_FORFAIT)
               REFERENCES FORFAIT (NUMERO_FORFAIT))     ;

ALTER TABLE ASSISTER ADD (
     CONSTRAINT FK_ASSISTER_ENTRAINEMENT
          FOREIGN KEY (NUMERO_ENTRAINEMENT)
               REFERENCES ENTRAINEMENT (NUMERO_ENTRAINEMENT))     ;

ALTER TABLE ASSISTER ADD (
     CONSTRAINT FK_ASSISTER_PERSONNE
          FOREIGN KEY (NUMERO_PERSONNE)
               REFERENCES PERSONNE (NUMERO_PERSONNE))     ;

PURGE RECYCLEBIN;
-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------

-- ------------------------------------------------------------------------------- 
--   TABLE : PERSONNE
-- ------------------------------------------------------------------------------- 
-- TRIGGER DE MODIFICATION ----------------------------------------------
create or replace
TRIGGER TAU_PERSONNE
AFTER UPDATE ON PERSONNE
FOR EACH ROW
BEGIN
 UPDATE RESERVATION RES
  SET RES.NOM_PERSONNE=:NEW.NOM_PERSONNE
	,RES.PRENOM_PERSONNE=:NEW.PRENOM_PERSONNE
	,RES.USERNAME_PERSONNE=:NEW.USERNAME_PERSONNE
  WHERE RES.NUMERO_PERSONNE=:NEW.NUMERO_PERSONNE;
 UPDATE FACTURE FAC
  SET FAC.PAYS_PERSONNE=:NEW.PAYS_PERSONNE
	,FAC.VILLE_PERSONNE=:NEW.VILLE_PERSONNE
	,FAC.CP_PERSONNE=:NEW.CP_PERSONNE
	,FAC.RUE_PERSONNE=:NEW.RUE_PERSONNE
	,FAC.NUM_ADRESSE_PERSONNE=:NEW.NUM_ADRESSE_PERSONNE
	,FAC.NOM_PERSONNE=:NEW.NOM_PERSONNE
	,FAC.PRENOM_PERSONNE=:NEW.PRENOM_PERSONNE
  WHERE FAC.NUMERO_PERSONNE=:NEW.NUMERO_PERSONNE;
END;
/
-- TRIGGER DE insertion ----------------------------------------------

CREATE OR REPLACE TRIGGER TBI_PERSONNE BEFORE INSERT ON PERSONNE
FOR EACH ROW 
DECLARE
	errno number := -20001;
	errmsg varchar2(200) := 'Erreur dans la clé étrangère.';
BEGIN
SELECT 
	NIV.NOM_NIVEAU
INTO
	:NEW.NOM_NIVEAU FROM NIVEAU NIV  
WHERE NIV.NUMERO_NIVEAU=:NEW.NUMERO_NIVEAU;
EXCEPTION
	WHEN NO_DATA_FOUND
	then
		raise_application_error(errno,errmsg);
END;
/

-- ------------------------------------------------------------------------------- 
--   TABLE : NIVEAU
-- ------------------------------------------------------------------------------- 
-- TRIGGER DE MODIFICATION ----------------------------------------------
CREATE OR REPLACE TRIGGER TAU_NIVEAU
AFTER UPDATE ON NIVEAU FOR EACH ROW 
BEGIN
 UPDATE PERSONNE PER
  SET PER.NOM_NIVEAU=:NEW.NOM_NIVEAU
  WHERE PER.NUMERO_NIVEAU=:NEW.NUMERO_NIVEAU;
END;
/
-- ------------------------------------------------------------------------------- 
--   TABLE : TYPE_TERRAIN
-- ------------------------------------------------------------------------------- 
-- TRIGGER DE MODIFICATION ----------------------------------------------
CREATE OR REPLACE TRIGGER TAU_TYPE_TERRAIN
AFTER UPDATE ON TYPE_TERRAIN FOR EACH ROW 
BEGIN
 UPDATE TERRAIN TER
  SET TER.DESIGNATION_TYPE_TERRAIN=:NEW.DESIGNATION_TYPE_TERRAIN
  WHERE TER.NUMERO_TYPE_TERRAIN=:NEW.NUMERO_TYPE_TERRAIN;
END;
/
-- ------------------------------------------------------------------------------- 
--   TABLE :  TERRAIN
-- ------------------------------------------------------------------------------- 
-- TRIGGER DE insertion ----------------------------------------------

CREATE OR REPLACE TRIGGER TBI_TERRAIN BEFORE INSERT ON TERRAIN
FOR EACH ROW 
DECLARE
	errno number := -20001;
	errmsg varchar2(200) := 'Erreur dans la clé étrangère.';
BEGIN
SELECT 
	TTER.DESIGNATION_TYPE_TERRAIN
INTO
	:NEW.DESIGNATION_TYPE_TERRAIN FROM TYPE_TERRAIN TTER  
WHERE TTER.NUMERO_TYPE_TERRAIN=:NEW.NUMERO_TYPE_TERRAIN;
EXCEPTION
	WHEN NO_DATA_FOUND
	then
		raise_application_error(errno,errmsg);
END;
/

-- ------------------------------------------------------------------------------- 
--   TABLE : RESERVATION
-- ------------------------------------------------------------------------------- 
-- TRIGGER DE insertion ----------------------------------------------

CREATE OR REPLACE TRIGGER TBI_RESERVATION BEFORE INSERT ON RESERVATION
FOR EACH ROW 
DECLARE
	errno number := -20001;
	errmsg varchar2(200) := 'Erreur dans la clé étrangère.';
BEGIN
SELECT 
	 PER.NOM_PERSONNE
	,PER.PRENOM_PERSONNE
	,PER.USERNAME_PERSONNE
INTO
	:NEW.NOM_PERSONNE
	,:NEW.PRENOM_PERSONNE
	,:NEW.USERNAME_PERSONNE FROM PERSONNE PER  
WHERE PER.NUMERO_PERSONNE=:NEW.NUMERO_PERSONNE;
EXCEPTION
	WHEN NO_DATA_FOUND
	then
		raise_application_error(errno,errmsg);
END;
/
-- ------------------------------------------------------------------------------- 
--   TABLE : FACTURE
-- ------------------------------------------------------------------------------- 
-- TRIGGER DE insertion ----------------------------------------------
CREATE OR REPLACE TRIGGER TBI_FACTURE BEFORE INSERT ON FACTURE
FOR EACH ROW 
DECLARE
	errno number := -20001;
	errmsg varchar2(200) := 'Erreur dans la clé étrangère.';
BEGIN
SELECT 
	 PER.PAYS_PERSONNE
	,PER.VILLE_PERSONNE
	,PER.CP_PERSONNE
	,PER.RUE_PERSONNE
	,PER.NUM_ADRESSE_PERSONNE
	,PER.NOM_PERSONNE
	,PER.PRENOM_PERSONNE
INTO
	:NEW.PAYS_PERSONNE
	,:NEW.VILLE_PERSONNE
	,:NEW.CP_PERSONNE
	,:NEW.RUE_PERSONNE
	,:NEW.NUM_ADRESSE_PERSONNE
	,:NEW.NOM_PERSONNE
	,:NEW.PRENOM_PERSONNE	FROM PERSONNE PER   
WHERE PER.NUMERO_PERSONNE =:NEW.NUMERO_PERSONNE;
EXCEPTION
	WHEN NO_DATA_FOUND
	then
		raise_application_error(errno,errmsg);
END;
/

 

PURGE RECYCLEBIN;