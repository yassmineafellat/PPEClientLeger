DROP DATABASE IF EXISTS Bricool;
CREATE DATABASE Bricool;
USE Bricool;

CREATE TABLE prestataire (
    idprestataire INT(10) NOT NULL AUTO_INCREMENT,
    image_prestataire VARCHAR(100),
    nomprestataire VARCHAR(100),
    adresse VARCHAR(100),
    numero_telephone VARCHAR(20),
    email VARCHAR(50),
    mdp VARCHAR(50),
    competences TEXT,
    experience TEXT,
    tarifs int(5),
    disponibilite TEXT,
    zone_couverture TEXT,
    evaluations TEXT,
    certifications TEXT,
    idservice INT(10) NOT NULL,
    PRIMARY KEY (idprestataire),
    FOREIGN KEY (idservice) REFERENCES services(idservice)
);




CREATE TABLE services (
    idservice INT(10) NOT NULL AUTO_INCREMENT,
    libelleservice VARCHAR(100),
    nom_image VARCHAR(255), 
    PRIMARY KEY (idservice)
);

CREATE TABLE prestations (
    idprestation INT(10) NOT NULL AUTO_INCREMENT,
    libelleprestation VARCHAR(100),
    idservice INT(10),
    PRIMARY KEY (idprestation),
    FOREIGN KEY (idservice) REFERENCES services(idservice)
);

CREATE TABLE client (
    idclient INT(3) NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    email VARCHAR(50),
    mdp VARCHAR(50),
    PRIMARY KEY (idclient)
);

CREATE TABLE user (
    iduser INT(3) NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    email VARCHAR(50),
    mdp VARCHAR(255),
    role ENUM('user', 'admin'),
    PRIMARY KEY (iduser)
);

CREATE TABLE reservation (
    idreservation INT(10) NOT NULL AUTO_INCREMENT,
    idclient INT(3) NOT NULL,
    idprestataire INT(10) NOT NULL,
    idprestation INT(10) NOT NULL,
    date_reservation DATE,
    heure_reservation TIME,
    nbr_heure INT(1),
    tarif_total FLOAT,
    etat ENUM('en_attente', 'confirme', 'annule'),
    commentaire TEXT,
    PRIMARY KEY (idreservation),
    FOREIGN KEY (idclient) REFERENCES client(idclient),
    FOREIGN KEY (idprestataire) REFERENCES prestataire(idprestataire),
    FOREIGN KEY (idprestation) REFERENCES prestations(idprestation)
);


INSERT INTO user VALUES 
    (null, 'Adam', 'Anes', 'a@gmail.com', '123', 'user'), 
    (null, 'Christina', 'Ibtissam', 'b@gmail.com', '456', 'admin');







DELIMITER //

CREATE TRIGGER verifReservation BEFORE INSERT ON reservation
FOR EACH ROW
BEGIN
    DECLARE nb INT;
    SELECT COUNT(*) INTO nb FROM reservation WHERE idclient = NEW.idclient AND date_reservation = NEW.date_reservation;
    IF nb > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le client a déjà une réservation pour cette date.';
    END IF;
END;
//

DELIMITER ;

DELIMITER //

CREATE TRIGGER check_email_duplicate BEFORE INSERT ON client
FOR EACH ROW
BEGIN
    DECLARE email_count INT;

    SELECT COUNT(*) INTO email_count FROM client WHERE email = NEW.email;

    IF email_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Vous avez déjà un compte avec cet email';
    END IF;
END//

DELIMITER ;



DELIMITER //

CREATE TRIGGER check_password_complexity BEFORE INSERT ON client
FOR EACH ROW
BEGIN
    DECLARE contains_digit BOOLEAN;
    DECLARE contains_symbol BOOLEAN;

    -- Vérifie si le mot de passe contient au moins un chiffre
    SET contains_digit = FALSE;
    SET contains_symbol = FALSE;

    IF NEW.mdp REGEXP '[0-9]' THEN
        SET contains_digit = TRUE;
    END IF;

    -- Vérifie si le mot de passe contient au moins un symbole
    IF NEW.mdp REGEXP '[^a-zA-Z0-9]' THEN
        SET contains_symbol = TRUE;
    END IF;

    -- Si le mot de passe ne contient ni chiffre ni symbole, génère une erreur
    IF NOT contains_digit OR NOT contains_symbol THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Le mot de passe doit contenir au moins un chiffre et un symbole';
    END IF;
END//

DELIMITER ;



