-- ------------------------------------------------------------------------------- 
--   TABLE : PERSONNE
-- ------------------------------------------------------------------------------- 
-- TRIGGER DE MODIFICATION ----------------------------------------------
CREATE TRIGGER OR REPLACE TAU_PERSONNE
AFTER UPDATE ON PERSONNE
FOR EACH ROW
BEGIN
 UPDATE RESERVATION RES
  SET RES.NOM_PERSONNE=:NEW.NOM_PERSONNE
	,RES.PRENOM_PERSONNE=:NEW.PRENOM_PERSONNE
	,RES.USERNAME_PERSONNE=:NEW.USERNAME_PERSONNE
  WHERE RES.NUMERO_PERSONNE=:NEW.NUMERO_PERSONNE
  
 UPDATE FACTURE FACT
  SET FACT.PAYS_PERSONNE=:NEW.PAYS_PERSONNE
	,FACT.VILLE_PERSONNE=:NEW.VILLE_PERSONNE
	,FACT.CP_PERSONNE=:NEW.CP_PERSONNE
	,FACT.RUE_PERSONNE=:NEW.RUE_PERSONNE
	,FACT.NUM_ADRESSE_PERSONNE=:NEW.NUM_ADRESSE_PERSONNE
	,FACT.NOM_PERSONNE=:NEW.NOM_PERSONNE
	,FACT.PRENOM_PERSONN=:NEW.PRENOM_PERSONN
  WHERE RES.NUMERO_PERSONNE=:NEW.NUMERO_PERSONNE
END;
/

-- TRIGGER DE insertion ----------------------------------------------

CREATE OR REPLACE TRIGGER TBI_RESERVATION BEFORE INSERT ON PERSONNE
FOR EACH ROW 
DECLARE
	errno number := -20001;
	errmsg varchar2(200) := 'Erreur dans la clé étrangère.';
BEGIN
SELECT 
	NIV.NOM_NIVEAU
INTO
	:NEW.NOM_NIVEAU 
FROM 
	NIVEAU NIV  
WHERE NIV.NUMERO_NIVEAU=:NEW.NUMERO_NIVEAU

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
CREATE TRIGGER TAU_NIVEAU
AFTER UPDATE ON NIVEAU FOR EACH ROW 
BEGIN
 UPDATE PERSONNE PER
  SET PER.NOM_NIVEAU=:NEW.NOM_NIVEAU
  WHERE PER.NUMERO_NIVEAU=:NEW.NUMERO_NIVEAU
END;
/
-- ------------------------------------------------------------------------------- 
--   TABLE : TYPE_TERRAIN
-- ------------------------------------------------------------------------------- 
-- TRIGGER DE MODIFICATION ----------------------------------------------
CREATE TRIGGER TAU_TYPE_TERRAIN
AFTER UPDATE ON TYPE_TERRAIN FOR EACH ROW 
BEGIN
 UPDATE TERRAIN TER
  SET TER.DESIGNATION_TYPE_TERRAIN=:NEW.DESIGNATION_TYPE_TERRAIN
  WHERE TER.NUMERO_TYPE_TERRAIN=:NEW.NUMERO_TYPE_TERRAIN
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
	:NEW.NOM_NIVEAU 
FROM 
	TYPE_TERRAIN TTER  
WHERE TTER.NUMERO_TYPE_TERRAIN=:NEW.NUMERO_TYPE_TERRAIN

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
	,:NEW.USERNAME_PERSONNE 
FROM 
	PERSONNE PER  
WHERE PER.NUMERO_PERSONNE=:NEW.NUMERO_PERSONNE

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
	,PER.PRENOM_PERSONN
INTO
	:NEW.PAYS_PERSONNE
	,:NEW.VILLE_PERSONNE
	,:NEW.CP_PERSONNE
	,:NEW.RUE_PERSONNE
	,:NEW.NUM_ADRESSE_PERSONNE
	,:NEW.NOM_PERSONNE
	,:NEW.PRENOM_PERSONN
	,:NEW.NUMERO_PERSONNE 	
FROM 
	PERSONNE PER   
WHERE PER.NUMERO_PERSONNE =:NEW.NUMERO_PERSONNE
EXCEPTION
	WHEN NO_DATA_FOUND
	then
		raise_application_error(errno,errmsg);
END;
/

