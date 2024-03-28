begin transaction;

--1 
SELECT DISTINCT NOM, PRENOM FROM (
   SELECT * FROM Accident, Blesse, Vehicule WHERE Accident.DEPT = '75' AND Blesse.GRAVITE = 'Fatale' AND Vehicule.MARQUE = 'BMW'
) AS R1 INNER JOIN Personne ON R1.NPERS = PERSONNE.NPERS;


--2
SELECT * FROM Blesse, Conducteur WHERE Conducteur.NPERS = Blesse.NPERS;


--3
SELECT NOM, PRENOM, AGE FROM (
  SELECT * FROM Blesse, Accident  WHERE GRAVITE = 'Grave' AND DATEACCIDENT = '2023-02-14'
  ) AS r3 INNER JOIN Personne ON r3.NPERS = Personne.NPERS;


-- 4
SELECT Accident.DEPT, COUNT(Accident.NACC) FROM Personne
INNER JOIN Conducteur ON Personne.NPERS = Conducteur.NPERS
INNER JOIN Vehicule ON Conducteur.NVEH = Vehicule.NVEH
INNER JOIN ( SELECT VEHPART.NACC, VEHPART.NVEH FROM VEHPART INNER JOIN (
        SELECT Blesse.NACC FROM Blesse INNER JOIN Accident ON Blesse.NACC = Accident.NACC 
        WHERE Accident.DATEACCIDENT BETWEEN '2022-01-01' AND '2022-12-31' AND Blesse.Gravite = 'Fatale'
    ) AS r1 ON VEHPART.NACC = r1.NACC
) AS r2 ON Vehicule.NVEH = r2.NVEH
INNER JOIN Accident ON r2.NACC = Accident.NACC WHERE Vehicule.Marque = 'Volkswagen' GROUP BY Accident.DEPT;


commit;


--Commentaire pour la question 5 : Dans insertion.sql ligne 58: 
-- INSERT INTO Blesse VALUES ('159753260', '00006', '13012073','Fatale');
-- Cette insertion cause un problème. NACC=’159753260’ n’est pas présent dans la table Accident. Donc il faut soit modifier ou supprimer cette insertion ou l’ajouter dans la table Accident.
