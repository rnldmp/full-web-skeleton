#Dette skriptet kan  kan dere kjøre om dere ikke har en bruker til å logge inn i databasen
#--> kan være greit å endre trym til sitt navn og et eget passord.
CREATE USER 'admin'@'%' IDENTIFIED BY '12345';

#--> dette trenger kun å kjøre om dere ikke har en schema (en database partisjon.)
CREATE DATABASE if not EXISTS otra;
#--> dette må dere kjøre for å gi tilgang til brukeren dere har lagd.
# husk å endre navnet om dere vil ha deres egen.
GRANT ALL PRIVILEGES ON otra.* TO 'trym'@'%';
#denne må dere kjøre for at skript filen skal skjønne at
# <otra> er databasen dere vil lage tables og inserte data i.
USE otra;


#alt under her må kjøres for at eksemplet jeg har lagd skal kunne kjøre.
create table if not EXISTS otra.user
(
    User_id        integer UNIQUE auto_increment,
    User_firstName varchar(255),
    User_lastName  varchar(255),
    User_Email     varchar(255),
    User_password  varchar(255),
    CONSTRAINT U_User_ID_PK PRIMARY KEY (User_id)
);

insert into otra.user (User_firstName,
                       User_lastName,
                       User_Email,
                       User_password)
values (
        'trym',
        'Staurheim',
        'trym@example.com',
        '12345');