-- -----------------------------------------------------------------------------
--       TABLE : FACTURE
-- -----------------------------------------------------------------------------

CREATE TABLE FACTURE
   (
    NUMERO_FACTURE NUMBER(2)  NOT NULL,
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
    PRENOM_PERSONNE VARCHAR2(40)  NULL,
	CONSTRAINT PK_FACTURE PRIMARY KEY (NUMERO_FACTURE)  USING INDEX TABLESPACE BD50_IND 
   ) TABLESPACE BD50_DATA ;
-- -----------------------------------------------------------------------------
--       TABLE : FORFAIT
-- -----------------------------------------------------------------------------

CREATE TABLE FORFAIT
   (
    NUMERO_FORFAIT NUMBER(2)  NOT NULL,
    DESIGNATION_FORFAIT VARCHAR2(40)  NOT NULL,
    PRIX_FORFAIT NUMBER(13,2)  NOT NULL,
    NB_HEUR_FORFAIT NUMBER(3)  NOT NULL,
    DUREE_VAL_FORFAIT NUMBER(3)  NOT NULL,
	 CONSTRAINT PK_FORFAIT PRIMARY KEY (NUMERO_FORFAIT)  USING INDEX TABLESPACE BD50_IND 
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : TERRAIN
-- -----------------------------------------------------------------------------

CREATE TABLE TERRAIN
   (
    NOM_TERRAIN VARCHAR2(20)  NOT NULL,
    NUMERO_TYPE_TERRAIN NUMBER(2)  NOT NULL,
    DESC_TERRAIN VARCHAR2(30)  NOT NULL,
    DESIGNATION_TYPE_TERRAIN VARCHAR2(50)  NULL
	,   CONSTRAINT PK_TERRAIN PRIMARY KEY (NOM_TERRAIN)  USING INDEX TABLESPACE BD50_IND 
   )TABLESPACE BD50_DATA ;

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
    DEBUT_ENTRAINEMENT DATE  NOT NULL,
    FIN_ENTRAINEMENT DATE  NOT NULL
	,   CONSTRAINT PK_TERRAIN PRIMARY KEY (NOM_TERRAIN)  USING INDEX TABLESPACE BD50_IND 
   )TABLESPACE BD50_DATA ;


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
   ,   CONSTRAINT PK_CRENEAU PRIMARY KEY (NOM_TERRAIN, DATE_CRENEAU, HORAIRE_CRENEAU)  USING INDEX TABLESPACE BD50_IND 
  ) TABLESPACE BD50_DATA ;



-- -----------------------------------------------------------------------------
--       TABLE : NIVEAU
-- -----------------------------------------------------------------------------

CREATE TABLE NIVEAU
   (
    NUMERO_NIVEAU NUMBER(4)  NOT NULL,
    NOM_NIVEAU VARCHAR2(20)  NOT NULL
   ,   CONSTRAINT PK_NIVEAU PRIMARY KEY (NUMERO_NIVEAU)  USING INDEX TABLESPACE BD50_IND 
 ) TABLESPACE BD50_DATA ;

-- -----------------------------------------------------------------------------
--       TABLE : TYPE_TERRAIN
-- -----------------------------------------------------------------------------

CREATE TABLE TYPE_TERRAIN
   (
    NUMERO_TYPE_TERRAIN NUMBER(2)  NOT NULL,
    DESIGNATION_TYPE_TERRAIN VARCHAR2(50)  NULL
   ,   CONSTRAINT PK_TYPE_TERRAIN PRIMARY KEY (NUMERO_TYPE_TERRAIN)  USING INDEX TABLESPACE BD50_IND 
 ) TABLESPACE BD50_DATA ;

-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------
   