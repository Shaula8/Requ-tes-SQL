begin transaction;


ALTER TABLE Personne
    ALTER COLUMN NPERS SET DATA TYPE varchar(100),
    ALTER COLUMN ADRESSE DROP NOT NULL; -- remove not null constraint from adress


ALTER TABLE Vehicule
    ALTER COLUMN NVEH SET DATA TYPE varchar(100);


ALTER TABLE Conducteur
    ALTER COLUMN NPERS SET DATA TYPE varchar(100),
    ALTER COLUMN NVEH SET DATA TYPE varchar(100);


ALTER TABLE Accident
    ALTER COLUMN NACC SET DATA TYPE varchar(100);


ALTER TABLE VEHPART
    ALTER COLUMN NVEH SET DATA TYPE varchar(100),
    ALTER COLUMN NACC SET DATA TYPE varchar(100),
    ALTER COLUMN NCOND SET DATA TYPE varchar(100);


ALTER TABLE Blesse
    ALTER COLUMN NPERS SET DATA TYPE varchar(100),
    ALTER COLUMN NVEH SET DATA TYPE varchar(100),
    ALTER COLUMN NACC SET DATA TYPE varchar(100);


ALTER TABLE Conducteur
    ADD constraint npersfk FOREIGN KEY (NPERS) REFERENCES Personne (NPERS),
    ADD constraint nvehfk FOREIGN KEY (NVEH) REFERENCES Vehicule (NVEH);


ALTER TABLE VEHPART
    ADD constraint naccfk FOREIGN KEY (NACC) REFERENCES Accident (NACC),
    ADD constraint nvehfk FOREIGN KEY (NVEH) REFERENCES Vehicule (NVEH);


ALTER TABLE Blesse 
    ADD constraint naccfk FOREIGN KEY (NACC) REFERENCES Accident (NACC),
    ADD constraint npersfk FOREIGN KEY (NPERS) REFERENCES Personne (NPERS),
    ADD constraint nvehfk FOREIGN KEY (NVEH) REFERENCES Vehicule (NVEH);


commit;