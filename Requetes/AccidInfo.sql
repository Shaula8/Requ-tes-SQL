begin transaction;

DROP SCHEMA IF EXISTS AccidInfo CASCADE;
CREATE SCHEMA AccidInfo;
SET search_path TO AccidInfo; -- to verify

    CREATE TABLE Personne(
        NPERS INT,
        NOM varchar(50) NOT NULL,
        PRENOM varchar(50) NOT NULL,
        ADRESSE varchar(200) NOT NULL,
        AGE INT,
        PRIMARY KEY (NPERS),
        CHECK (AGE >= 18)
    );


    CREATE TABLE Vehicule(
        NVEH INT,
        MARQUE varchar(40) NOT NULL,
        TYPECLASS char(8),
        primary key (NVEH)
    );

    CREATE TABLE Conducteur(
        NPERS INT,
        NVEH INT,
        NBACC INT,
        PRIMARY KEY (NPERS, NVEH)
    );

    CREATE TABLE Accident(
        NACC INT,
        DATEACCIDENT TIMESTAMP default now(),
        DEPT numeric(2) NOT NULL, -- numero d'un dept
        PRIMARY KEY (NACC),
        CHECK (DEPT BETWEEN 1 AND 80)
    );

    CREATE TABLE VEHPART(
        NACC INT,
        NVEH INT,
        NCOND INT,
        PRIMARY KEY (NACC, NVEH)
    );

    CREATE TABLE Blesse(
        NACC INT,
        NPERS INT,
        NVEH INT,
        GRAVITE varchar(10),
        PRIMARY KEY (NACC, NPERS),
        CHECK (
            GRAVITE = 'Bénigne'
            OR GRAVITE = 'Légère'
            OR GRAVITE = 'Sérieuse'
            OR GRAVITE = 'Grave'
            OR Gravite = 'Fatale' )
    );


commit;