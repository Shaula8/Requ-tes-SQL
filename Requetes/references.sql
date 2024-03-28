begin transaction;

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