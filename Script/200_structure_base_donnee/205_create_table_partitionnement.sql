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
    PAYS_PERSONNE VARCHAR2(30)  NULL,
    VILLE_PERSONNE VARCHAR2(30)  NULL,
    CP_PERSONNE VARCHAR2(8)  NULL,
    RUE_PERSONNE VARCHAR2(30)  NULL,
    NUM_ADRESSE_PERSONNE CHAR(5)  NULL,
    ROLE_PEROSNNE VARCHAR2(20)  NOT NULL,
    USERNAME_PERSONNE VARCHAR2(15)  NOT NULL,
    MDP_PERSONNE VARCHAR2(15)  NOT NULL,
    NUMERO_ENTR NUMBER(2)  NULL,
    DATE_EMBAUCHE_ENTR DATE  NULL,
    SALAIRE_ENTR NUMBER(13,2)  NULL,
    TYPE_PERSONNE CHAR(1)  NULL,
    NOM_NIVEAU VARCHAR2(20)  NULL
   ,   CONSTRAINT PK_PERSONNE PRIMARY KEY (NUMERO_PERSONNE)
   USING INDEX TABLESPACE BD50_IND 
 ) 
   PARTITION BY LIST (TYPE_PERSONNE) 
     (
     PARTITION personne
        VALUES ('P')
        STORAGE (INITIAL 8M) 
     PARTITION entraineur
        VALUES ('E')
     )TABLESPACE BD50_DATA;  
 ALTER TABLE PERSONNE ADD CONSTRAINT username_uique UNIQUE(USERNAME_PERSONNE);
-- -----------------------------------------------------------------------------
--       TABLE : RESERVATION
-- -----------------------------------------------------------------------------

CREATE TABLE RESERVATION
   (
    NUMERO_RESERVATION NUMBER(5)  NOT NULL,
    NUMERO_FACTURE NUMBER(2)  NOT NULL,
    DATE_CRENEAU DATE  NOT NULL,
    HORAIRE_CRENEAU DATE  NOT NULL,
    NOM_TERRAIN VARCHAR2(20)  NOT NULL,
    NUMERO_PERSONNE NUMBER(4)  NOT NULL,
    DATE_RESERVATION DATE  NOT NULL,
    PRIX_RESERVATION NUMBER(13,2)  NOT NULL,
    NOM_PERSONNE VARCHAR2(40)  NULL,
    PRENOM_PERSONNE VARCHAR2(40)  NULL,
    USERNAME_PERSONNE VARCHAR2(15)  NULL
   ,   CONSTRAINT PK_CRENEAU PRIMARY KEY (NOM_TERRAIN, DATE_CRENEAU, HORAIRE_CRENEAU) 
   USING INDEX TABLESPACE BD50_IND 
  ) 
  PARTITION BY RANGE(DATE_CRENEAU)
  (
	  PARTITION y1 VALUES LESS THAN (to_date('01-01-2020','DD-MM-YYYY')) , 
	  PARTITION y2 VALUES LESS THAN (to_date('01-01-2021','DD-MM-YYYY')) ,
	  PARTITION y3 VALUES LESS THAN (to_date('01-01-2022','DD-MM-YYYY')) ,
	  PARTITION y4 VALUES LESS THAN (MAXVALUE) 
  ) TABLESPACE BD50_DATA;
 

  