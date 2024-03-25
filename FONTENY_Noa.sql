-- Devoir 149
-- Nom: FONTENY , Prenom: Noa

-- Feuille SAE2.04 Exploitation d'une base de donn�es
-- 
-- Veillez � bien r�pondre aux emplacements indiqu�s.
-- Seule la premi�re requ�te est prise en compte.

-- +-----------------------+--
-- * Question 149992 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Quelles sont les formations offertes par l'IUT d'Orl�ans en 2023? On veut le num�ro de formation, la fili�re, le nom (fil_lib_voe_acc)

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+----------------------------------------------------------+---------------------+----------+-------------------+
-- | num_form | fil_lib_voe_acc                                          | select_form         | num_fili | fili              |
-- +----------+----------------------------------------------------------+---------------------+----------+-------------------+
-- | etc...
-- = Reponse question 149992.
    select num_form,fil_lib_voe_acc,select_form,num_fili,fili
    from FILIERE NATURAL JOIN FORMATION NATURAL JOIN VOEUX NATURAL JOIN ETABLISSEMENT  NATURAL JOIN  STATS 
    where ville_etab='Orleans' and session=2023 and fili='BUT';


-- +-----------------------+--
-- * Question 150039 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Quels sont les �tablissements de la Creuse qui offrent un BTS? On veut le code uai, le nom de l'�tablissement ( g_ea_lib_vx) et la ville.

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+----------------------------------+------------+------+
-- | cod_uai  | g_ea_lib_vx                      | ville_etab | FILI |
-- +----------+----------------------------------+------------+------+
-- | etc...
-- = Reponse question 150039.
    select cod_uai,g_ea_lib_vx,ville_etab,fili 
    from ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN FORMATION NATURAL JOIN FILIERE NATURAL JOIN DEPARTEMENT
    where fili='BTS' and dep_lib='Creuse';


-- +-----------------------+--
-- * Question 150040 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Combien de candidats ont �t� class�s lors de la phase principale de 2023 par les diff�rents �tablissements qui d�livrent le BUT QLIO? On veut le code uai, le nom et la ville de l'�tablissement et le nombre de class�s lors de la phase principale (nb_cla_pp)

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+-----------------------------------------------------+--------------------+-----------+
-- | cod_uai  | g_ea_lib_vx                                         | ville_etab         | nb_cla_pp |
-- +----------+-----------------------------------------------------+--------------------+-----------+
-- | etc...
-- = Reponse question 150040.
    Select cod_uai,g_ea_lib_vx,ville_etab,nb_cla_pp 
    from ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN STATS NATURAL JOIN FORMATION
    WHERE session=2023 and fil_lib_voe_acc='Qualité, logistique industrielle et organisation';


-- +-----------------------+--
-- * Question 150051 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  La liste des lyc�es publics du Loiret

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+----------------------------------------+-------------------------+
-- | cod_uai  | g_ea_lib_vx                            | ville_etab              |
-- +----------+----------------------------------------+-------------------------+
-- | etc...
-- = Reponse question 150051.
    select cod_uai,g_ea_lib_vx,ville_etab
    from ETABLISSEMENT NATURAL JOIN DEPARTEMENT
    WHERE dep_lib='Loiret' and contrat_etab='Public';


-- +-----------------------+--
-- * Question 150062 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des d�partements dans lesquels il n'y a aucune offre de Licence

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +-----+-------------------------+
-- | dep | dep_lib                 |
-- +-----+-------------------------+
-- | etc...
-- = Reponse question 150062.
    select distinct dep, dep_lib
    from DEPARTEMENT NATURAL JOIN ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN FORMATION NATURAL JOIN FILIERE
    where dep not in(select dep from DEPARTEMENT NATURAL JOIN ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN FORMATION NATURAL JOIN FILIERE where fili='Licence');
    

-- +-----------------------+--
-- * Question 150084 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des �tablissements qui offrent � la fois un BTS Travaux publics et un BTS B�timent

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+-----------------------------------------+--------------------------+
-- | cod_uai  | g_ea_lib_vx                             | ville_etab               |
-- +----------+-----------------------------------------+--------------------------+
-- | etc...
-- = Reponse question 150084.
    select cod_uai,g_ea_lib_vx,ville_etab
    from ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN FORMATION NATURAL JOIN FILIERE
    where num_fili=2 and fil_lib_voe_acc='Travaux publics' and cod_uai in (select cod_uai from ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN FORMATION NATURAL JOIN FILIERE where num_fili=2 and fil_lib_voe_acc='Bâtiment');


-- +-----------------------+--
-- * Question 150129 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des �tablissements de l'acad�mie de Versailles qui n'offrent que des Licences

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+---------------------------------------------------------------------------------+---------------------+
-- | cod_uai  | g_ea_lib_vx                                                                     | ville_etab          |
-- +----------+---------------------------------------------------------------------------------+---------------------+
-- | etc...
-- = Reponse question 150129.
    select distinct cod_uai, g_ea_lib_vx, ville_etab 
    from FILIERE natural JOIN FORMATION NATURAL JOIN VOEUX NATURAL JOIN ETABLISSEMENT NATURAL JOIN DEPARTEMENT NATURAL JOIN ACADEMIE 
    where acad_mies='Versailles' and fili='Licence' and cod_uai not in(select cod_uai 
                                                                       from FILIERE natural JOIN FORMATION NATURAL JOIN VOEUX NATURAL JOIN ETABLISSEMENT NATURAL JOIN DEPARTEMENT NATURAL JOIN ACADEMIE 
                                                                       where acad_mies='Versailles' and fili!='Licence');


-- +-----------------------+--
-- * Question 150130 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner pour chaque r�gion le nombre de lyc�es de cette r�gion

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------------------------+-----------+
-- | region_etab_aff            | nb_lycees |
-- +----------------------------+-----------+
-- | etc...
-- = Reponse question 150130.
    select region_etab_aff, count(*) nb_lycees
    from REGION NATURAL JOIN DEPARTEMENT NATURAL JOIN ETABLISSEMENT
    WHERE g_ea_lib_vx like 'Lycée%' 
    GROUP BY region_etab_aff;


-- +-----------------------+--
-- * Question 150163 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner le nombre total de candidatures en licence en 2023 par r�gion

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------------------------+------------+
-- | region_etab_aff            | nb_voe_but |
-- +----------------------------+------------+
-- | etc...
-- = Reponse question 150163.
    select region_etab_aff, count(*) nb_voe_but
    from REGION NATURAL JOIN DEPARTEMENT NATURAL JOIN ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN FORMATION NATURAL JOIN FILIERE NATURAL JOIN STATS
    WHERE num_fili=6 and session=2023
    group by region_etab_aff;


-- +-----------------------+--
-- * Question 150196 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la ou les formations qui ont re�u le plus de voeux en phase principale en 2022

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+---------------+------------+-------------------+-----------+
-- | cod_uai  | g_ea_lib_vx   | ville_etab | fili              | nb_voe_pp |
-- +----------+---------------+------------+-------------------+-----------+
-- | etc...
-- = Reponse question 150196.
    select cod_uai,g_ea_lib_vx,ville_etab,fili, nb_voe_pp
    from ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN FORMATION NATURAL JOIN FILIERE NATURAL JOIN STATS
    where session=2022 and nb_voe_pp >= ALL (select nb_voe_pp from STATS where session=2022);
    


-- +-----------------------+--
-- * Question 150219 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des acad�mies qui ont offert plus de places en 2023 qu'en 2022

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +------------------+
-- | acad_mies        |
-- +------------------+
-- | etc...
-- = Reponse question 150219.
    CREATE OR REPLACE VIEW voe2022
    AS SELECT voe_tot voetot2022, region_etab_aff FROM REGION NATURAL JOIN DEPARTEMENT NATURAL JOIN ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN STATS WHERE session=2022 GROUP BY region_etab_aff;

    CREATE OR REPLACE VIEW voe2023
    AS SELECT voe_tot voetot2023, region_etab_aff FROM REGION NATURAL JOIN DEPARTEMENT NATURAL JOIN ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN STATS WHERE session=2023 GROUP BY region_etab_aff;

    SELECT region_etab_aff FROM voe2022 NATURAL JOIN voe2023 WHERE voetot2022 > voetot2023;


-- +-----------------------+--
-- * Question 150220 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Requ�te pour le 1er graphique

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +-------------------+---------+
-- | fili              | nb_form |
-- +-------------------+---------+
-- | etc...
-- = Reponse question 150220.
    select fili, count(num_form) nb_form 
    from FILIERE natural JOIN FORMATION NATURAL JOIN VOEUX -- Devoir 149
-- Nom: FONTENY , Prenom: Noa

-- Feuille SAE2.04 Exploitation d'une base de donn�es
-- 
-- Veillez � bien r�pondre aux emplacements indiqu�s.
-- Seule la premi�re requ�te est prise en compte.

-- +-----------------------+--
-- * Question 149992 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Quelles sont les formations offertes par l'IUT d'Orl�ans en 2023? On veut le num�ro de formation, la fili�re, le nom (fil_lib_voe_acc)

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+----------------------------------------------------------+---------------------+----------+-------------------+
-- | num_form | fil_lib_voe_acc                                          | select_form         | num_fili | fili              |
-- +----------+----------------------------------------------------------+---------------------+----------+-------------------+
-- | etc...
-- = Reponse question 149992.
    select num_form,fil_lib_voe_acc,select_form,num_fili,fili
    from FILIERE NATURAL JOIN FORMATION NATURAL JOIN VOEUX NATURAL JOIN ETABLISSEMENT  NATURAL JOIN  STATS 
    where ville_etab='Orleans' and session=2023 and fili='BUT';


-- +-----------------------+--
-- * Question 150039 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Quels sont les �tablissements de la Creuse qui offrent un BTS? On veut le code uai, le nom de l'�tablissement ( g_ea_lib_vx) et la ville.

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+----------------------------------+------------+------+
-- | cod_uai  | g_ea_lib_vx                      | ville_etab | FILI |
-- +----------+----------------------------------+------------+------+
-- | etc...
-- = Reponse question 150039.
    select cod_uai,g_ea_lib_vx,ville_etab,fili 
    from ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN FORMATION NATURAL JOIN FILIERE NATURAL JOIN DEPARTEMENT
    where fili='BTS' and dep_lib='Creuse';


-- +-----------------------+--
-- * Question 150040 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Combien de candidats ont �t� class�s lors de la phase principale de 2023 par les diff�rents �tablissements qui d�livrent le BUT QLIO? On veut le code uai, le nom et la ville de l'�tablissement et le nombre de class�s lors de la phase principale (nb_cla_pp)

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+-----------------------------------------------------+--------------------+-----------+
-- | cod_uai  | g_ea_lib_vx                                         | ville_etab         | nb_cla_pp |
-- +----------+-----------------------------------------------------+--------------------+-----------+
-- | etc...
-- = Reponse question 150040.
    Select cod_uai,g_ea_lib_vx,ville_etab,nb_cla_pp 
    from ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN STATS NATURAL JOIN FORMATION
    WHERE session=2023 and fil_lib_voe_acc='Qualité, logistique industrielle et organisation';


-- +-----------------------+--
-- * Question 150051 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  La liste des lyc�es publics du Loiret

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+----------------------------------------+-------------------------+
-- | cod_uai  | g_ea_lib_vx                            | ville_etab              |
-- +----------+----------------------------------------+-------------------------+
-- | etc...
-- = Reponse question 150051.
    select cod_uai,g_ea_lib_vx,ville_etab
    from ETABLISSEMENT NATURAL JOIN DEPARTEMENT
    WHERE dep_lib='Loiret' and contrat_etab='Public';


-- +-----------------------+--
-- * Question 150062 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des d�partements dans lesquels il n'y a aucune offre de Licence

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +-----+-------------------------+
-- | dep | dep_lib                 |
-- +-----+-------------------------+
-- | etc...
-- = Reponse question 150062.
    select distinct dep, dep_lib
    from DEPARTEMENT NATURAL JOIN ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN FORMATION NATURAL JOIN FILIERE
    where dep not in(select dep from DEPARTEMENT NATURAL JOIN ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN FORMATION NATURAL JOIN FILIERE where fili='Licence');
    

-- +-----------------------+--
-- * Question 150084 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des �tablissements qui offrent � la fois un BTS Travaux publics et un BTS B�timent

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+-----------------------------------------+--------------------------+
-- | cod_uai  | g_ea_lib_vx                             | ville_etab               |
-- +----------+-----------------------------------------+--------------------------+
-- | etc...
-- = Reponse question 150084.
    select cod_uai,g_ea_lib_vx,ville_etab
    from ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN FORMATION NATURAL JOIN FILIERE
    where num_fili=2 and fil_lib_voe_acc='Travaux publics' and cod_uai in (select cod_uai from ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN FORMATION NATURAL JOIN FILIERE where num_fili=2 and fil_lib_voe_acc='Bâtiment');


-- +-----------------------+--
-- * Question 150129 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des �tablissements de l'acad�mie de Versailles qui n'offrent que des Licences

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+---------------------------------------------------------------------------------+---------------------+
-- | cod_uai  | g_ea_lib_vx                                                                     | ville_etab          |
-- +----------+---------------------------------------------------------------------------------+---------------------+
-- | etc...
-- = Reponse question 150129.
    select distinct cod_uai, g_ea_lib_vx, ville_etab 
    from FILIERE natural JOIN FORMATION NATURAL JOIN VOEUX NATURAL JOIN ETABLISSEMENT NATURAL JOIN DEPARTEMENT NATURAL JOIN ACADEMIE 
    where acad_mies='Versailles' and fili='Licence' and cod_uai not in(select cod_uai 
                                                                       from FILIERE natural JOIN FORMATION NATURAL JOIN VOEUX NATURAL JOIN ETABLISSEMENT NATURAL JOIN DEPARTEMENT NATURAL JOIN ACADEMIE 
                                                                       where acad_mies='Versailles' and fili!='Licence');


-- +-----------------------+--
-- * Question 150130 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner pour chaque r�gion le nombre de lyc�es de cette r�gion

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------------------------+-----------+
-- | region_etab_aff            | nb_lycees |
-- +----------------------------+-----------+
-- | etc...
-- = Reponse question 150130.
    select region_etab_aff, count(*) nb_lycees
    from REGION NATURAL JOIN DEPARTEMENT NATURAL JOIN ETABLISSEMENT
    WHERE g_ea_lib_vx like 'Lycée%' 
    GROUP BY region_etab_aff;


-- +-----------------------+--
-- * Question 150163 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner le nombre total de candidatures en licence en 2023 par r�gion

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------------------------+------------+
-- | region_etab_aff            | nb_voe_but |
-- +----------------------------+------------+
-- | etc...
-- = Reponse question 150163.
    select region_etab_aff, count(*) nb_voe_but
    from REGION NATURAL JOIN DEPARTEMENT NATURAL JOIN ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN FORMATION NATURAL JOIN FILIERE NATURAL JOIN STATS
    WHERE num_fili=6 and session=2023
    group by region_etab_aff;


-- +-----------------------+--
-- * Question 150196 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la ou les formations qui ont re�u le plus de voeux en phase principale en 2022

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +----------+---------------+------------+-------------------+-----------+
-- | cod_uai  | g_ea_lib_vx   | ville_etab | fili              | nb_voe_pp |
-- +----------+---------------+------------+-------------------+-----------+
-- | etc...
-- = Reponse question 150196.
    select cod_uai,g_ea_lib_vx,ville_etab,fili, nb_voe_pp
    from ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN FORMATION NATURAL JOIN FILIERE NATURAL JOIN STATS
    where session=2022 and nb_voe_pp >= ALL (select nb_voe_pp from STATS where session=2022);
    


-- +-----------------------+--
-- * Question 150219 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Donner la liste des acad�mies qui ont offert plus de places en 2023 qu'en 2022

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +------------------+
-- | acad_mies        |
-- +------------------+
-- | etc...
-- = Reponse question 150219.
    CREATE OR REPLACE VIEW voe2022
    AS SELECT voe_tot voetot2022, region_etab_aff FROM REGION NATURAL JOIN DEPARTEMENT NATURAL JOIN ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN STATS WHERE session=2022 GROUP BY region_etab_aff;

    CREATE OR REPLACE VIEW voe2023
    AS SELECT voe_tot voetot2023, region_etab_aff FROM REGION NATURAL JOIN DEPARTEMENT NATURAL JOIN ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN STATS WHERE session=2023 GROUP BY region_etab_aff;

    SELECT region_etab_aff FROM voe2022 NATURAL JOIN voe2023 WHERE voetot2022 > voetot2023;


-- +-----------------------+--
-- * Question 150220 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Requ�te pour le 1er graphique

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +-------------------+---------+
-- | fili              | nb_form |
-- +-------------------+---------+
-- | etc...
-- = Reponse question 150220.
    select fili, count(*) nb_form 
    from FILIERE natural JOIN FORMATION NATURAL JOIN VOEUX NATURAL JOIN ETABLISSEMENT NATURAL JOIN DEPARTEMENT NATURAL JOIN ACADEMIE NATURAL JOIN STATS
    where acad_mies='Orléans-Tours' and session=2023 and fili !='PASS'
    group by fili;


-- +-----------------------+--
-- * Question 150253 : 2pts --
-- +-----------------------+--
-- Ecrire une requ�te qui renvoie les informations suivantes:
--  Requ�te pour le 2eme graphique

-- Voici le d�but de ce que vous devez obtenir.
-- ATTENTION � l'ordre des colonnes et leur nom!
-- +-------------------+----------+
-- | filiere           | nb_voeux |
-- +-------------------+----------+
-- | etc...
-- = Reponse question 150253. 
    select fili, sum(capa_fin) nb_voeux
    from FILIERE NATURAL JOIN FORMATION NATURAL JOIN VOEUX NATURAL JOIN STATS
    where session=2023 AND select_form='formation selective'
    group by fili
    order by nb_voeux desc;

insert into ETABLISSEMENT values('0459876L','Lucie Aubrac','Public','45','Orléans');
insert into FORMATION values(572,'BTS Gestion forestière',NULL,2);
insert into VOEUX values (12477,'0459876L',572);
insert into STATS values(2023,15,NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


select region_etab_aff, count(*) nombre
from REGION NATURAL JOIN DEPARTEMENT NATURAL JOIN ETABLISSEMENT NATURAL JOIN VOEUX NATURAL JOIN STATS NATURAL JOIN FORMATION
where session=2022
group by region_etab_aff
order by nombre desc;


