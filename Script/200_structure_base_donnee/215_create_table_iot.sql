-- -----------------------------------------------------------------------------
--       TABLE : PARTICIPER
-- -----------------------------------------------------------------------------

CREATE TABLE PARTICIPER
   (
    NUMERO_RESERVATION NUMBER(5)  NOT NULL,
    NUMERO_PERSONNE NUMBER(4)  NOT NULL
   ,   CONSTRAINT PK_PARTICIPER PRIMARY KEY (NUMERO_RESERVATION, NUMERO_PERSONNE) 
   USING INDEX TABLESPACE BD50_IND 
 )
   ORGANIZATION INDEX  ;
 

-- -----------------------------------------------------------------------------
--       TABLE : ENTRAINER
-- -----------------------------------------------------------------------------

CREATE TABLE ENTRAINER
   (
    NUMERO_NIVEAU NUMBER(4)  NOT NULL,
    NUMERO_PERSONNE NUMBER(4)  NOT NULL
   ,   CONSTRAINT PK_ENTRAINER PRIMARY KEY (NUMERO_NIVEAU, NUMERO_PERSONNE)  
   USING INDEX TABLESPACE BD50_IND 
 )
   ORGANIZATION INDEX ;
 
-- -----------------------------------------------------------------------------
--       TABLE : SOUSCRIRE
-- -----------------------------------------------------------------------------

CREATE TABLE SOUSCRIRE
   (
    NUMERO_PERSONNE NUMBER(4)  NOT NULL,
    NUMERO_FORFAIT NUMBER(2)  NOT NULL
   ,   CONSTRAINT PK_SOUSCRIRE PRIMARY KEY (NUMERO_PERSONNE, NUMERO_FORFAIT)  
   USING INDEX TABLESPACE BD50_IND 
 )
   ORGANIZATION INDEX  ;

-- -----------------------------------------------------------------------------
--       TABLE : ASSISTER
-- -----------------------------------------------------------------------------

CREATE TABLE ASSISTER
   (
    NUMERO_ENTRAINEMENT NUMBER(4)  NOT NULL,
    NUMERO_PERSONNE NUMBER(4)  NOT NULL
   ,   CONSTRAINT PK_ASSISTER PRIMARY KEY (NUMERO_ENTRAINEMENT, NUMERO_PERSONNE)  
   USING INDEX TABLESPACE BD50_IND 
 )
   ORGANIZATION INDEX  ;

-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------