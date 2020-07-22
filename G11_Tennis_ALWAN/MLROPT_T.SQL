-- ------------------------------------------------------------------------------- 
--   Génération des triggers de la base 
--   de données : MEA_fina
--   (30/5/2019 18:28:30)
-- ------------------------------------------------------------------------------- 

-- ------------------------------------------------------------------------------- 
--   Table : PERSONNE
-- ------------------------------------------------------------------------------- 

-- Trigger d'insertion ----------------------------------------------
create trigger TI_PERSONNE
after insert on PERSONNE for each row
declare numrows INTEGER;
begin

     -- Sauf valeur nulle autorisée, interdire la création d'une occurrence de PERSONNE 
     -- s'il n'existe pas d'occurrence correspondante dans la table NIVEAU.

     select count(*) into numrows
     from NIVEAU
     where
          :new.NUMERO_NIVEAU = NIVEAU.NUMERO_NIVEAU;
     if 
          (
          numrows = 0 
          )
     then
          raise_application_error(
               -20002,
               'Impossible d''ajouter "PERSONNE" car "NIVEAU" n''existe pas.');
     end if;

end;
/



