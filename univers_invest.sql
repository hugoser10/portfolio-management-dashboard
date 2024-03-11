#création de la base
CREATE DATABASE if not exists univers;
#activation
USE univers;
#création table
CREATE TABLE if not exists coursactions (
	datecours text,
	titre text,
    SP numeric,
    CAC numeric,
    STOXX numeric,
    RUSSEL numeric,
    NIKKEI numeric
    );
CREATE TABLE if not exists obligations (
	nb numeric,
    nom numeric,
    mat numeric,
    txcoupon numeric,
    period numeric,
    tsr numeric,
    val numeric,
    dur numeric,
    modifdur numeric
    );

# Chargement des données
# "/usr/local/mysql-8.0.28-macos11-x86_64/tmp/" les données doivent être là
LOAD DATA INFILE '/usr/local/mysql-8.0.28-macos11-x86_64/tmp/Actions.csv' INTO TABLE actions FIELDS terminated by ',' ENCLOSED by '' LINES TERMINATED BY '\r\n' IGNORE 1 lines;

#requête sur deux des titres : le cours du CACMidSmall et du Nikkei225 sur l'année 2010
SELECT datecours, CAC, NIKKEI WHERE str_to_date(datecours) BETWEEN 2010-01-01 AND 2010-12-31;


# "/usr/local/mysql-8.0.28-macos11-x86_64/tmp/" les données doivent être là
Load data infile '/usr/local/mysql-8.0.28-macos11-x86_64/tmp/Obligations.csv' into table obligations fields terminated by ',' ENCLOSED by '' LINES TERMINATED BY '\r\n' IGNORE 1 lines;

# requête sur toutes les obligations : les obligations les plus rentables, avec un taux coupon supérieur à 3% et un montant nominal supérieur à 50000
SELECT nb, nom, mat, txcoupon, period FROM `obligations` WHERE `txcoupon` >= 0.03 AND nom >= 50000;