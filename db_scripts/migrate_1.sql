-- Créer la table Band et insérer les données
CREATE TABLE IF NOT EXISTS Band (
    bandName VARCHAR(50) PRIMARY KEY,
    creation YEAR,
    genre VARCHAR(50)
);

INSERT INTO Band (bandName, creation, genre)
SELECT 'Crazy Duo', 2015, 'rock'
WHERE NOT EXISTS (SELECT * FROM Band WHERE bandName = 'Crazy Duo');

INSERT INTO Band (bandName, creation, genre)
SELECT 'Luna', 2009, 'classical'
WHERE NOT EXISTS (SELECT * FROM Band WHERE bandName = 'Luna');

INSERT INTO Band (bandName, creation, genre)
SELECT 'Mysterio', 2019, 'pop'
WHERE NOT EXISTS (SELECT * FROM Band WHERE bandName = 'Mysterio');

-- Renommer la table singer en musician
ALTER TABLE singer RENAME TO musician;

-- Renommer la colonne singerName en musicianName
ALTER TABLE musician CHANGE COLUMN singerName musicianName VARCHAR(50);


-- Ajouter les nouvelles colonnes role et bandName
ALTER TABLE musician
ADD COLUMN role VARCHAR(50),
ADD COLUMN bandName VARCHAR(50);

-- Ajouter une contrainte de clé étrangère pour bandName
ALTER TABLE musician ADD CONSTRAINT fk_bandName
    FOREIGN KEY (bandName)
    REFERENCES Band(bandName);

-- Mettre à jour les entrées de la table Musician
UPDATE musician SET role = 'vocals', bandName = 'Crazy Duo' WHERE musicianName = 'Alina';
UPDATE musician SET role = 'guitar', bandName = 'Mysterio' WHERE musicianName = 'Mysterio';
UPDATE musician SET role = 'percussion', bandName = 'Crazy Duo' WHERE musicianName = 'Rainbow';
UPDATE musician SET role = 'piano', bandName = 'Luna' WHERE musicianName = 'Luna';

-- Supprimer la contrainte de clé étrangère FK_A_singerName
ALTER TABLE album DROP FOREIGN KEY FK_A_singerName;

-- Ajouter une contrainte de clé étrangère pour musicianName
ALTER TABLE album ADD CONSTRAINT FK_A_musicianName
    FOREIGN KEY (singerName)
    REFERENCES musician(musicianName);
