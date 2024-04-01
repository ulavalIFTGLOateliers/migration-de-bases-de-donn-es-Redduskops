-- Rétablir l'état précédent de la table musician
ALTER TABLE musician DROP FOREIGN KEY fk_bandName;
ALTER TABLE musician DROP COLUMN role;
ALTER TABLE musician DROP COLUMN bandName;
ALTER TABLE musician CHANGE COLUMN musicianName singerName VARCHAR(50);
ALTER TABLE musician DROP PRIMARY KEY, ADD PRIMARY KEY (singerName);
ALTER TABLE musician RENAME TO singer;

-- Supprimer la contrainte de clé étrangère FK_A_singerName
ALTER TABLE album DROP FOREIGN KEY FK_A_musicianName;
-- Ajouter une contrainte de clé étrangère pour musicianName
ALTER TABLE album ADD CONSTRAINT FK_A_singerName
    FOREIGN KEY (singerName)
    REFERENCES singer(singerName);

-- Supprimer la table band
DROP TABLE IF EXISTS band;

