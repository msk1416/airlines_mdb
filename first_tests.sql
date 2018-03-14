select * from PASSENGERS;
select * from nationalities;

insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('CAT', 'Catalunya');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('ES', 'Spain');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('PL', 'Poland');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('FR', 'France');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('US', 'United States');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('NO', 'Norway');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('EE', 'Estonia');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('LV', 'Latvia');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('DK', 'Denmark');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('FI', 'Finland');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('DE', 'Germany');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('UK', 'United Kingdom');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('IR', 'Ireland');

insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('SE', 'Sweden');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('IS', 'Iceland');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('MX', 'Mexico');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('PE', 'Peru');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('SK', 'Slovakia');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('RU', 'Russia');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('TK', 'Turkey');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('AD', 'Andorra');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('CH', 'China');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('JP', 'Japan');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('CA', 'Canada');

insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('LT', 'Lithuania');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('BE', 'Belgium');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('AR', 'Argentina');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('AU', 'Australia');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('BG', 'Bulgaria');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('CO', 'Colombia');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('GR', 'Greece');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('MA', 'Morocco');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('NP', 'Nepal');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('ZA', 'South Africa');

update NATIONALITIES set SHORT_NAME='TR' where SHORT_NAME='TK';
update NATIONALITIES set SHORT_NAME='GB' where SHORT_NAME='UK';
update NATIONALITIES set SHORT_NAME='CN' where SHORT_NAME='CH';
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('CH', 'Switzerland');

insert into PASSENGERS values('Avizzit', 'Karn', 902380, 22, 'NP');
insert into PASSENGERS values('Ruben', 'Oliva', 4411556, 24, 'ES');
insert into PASSENGERS values('Kuba', 'PolskiLastName', 151632, 23, 'PL');
insert into PASSENGERS values('Omehr', 'TurkishLastName', 0033115, 26, 'TR');
insert into PASSENGERS values('Naia', 'Ibinarriaga', 48666411, 21, 'EUS');

insert into PASSENGERS values('Cisco', 'Bates', 445478, 20, 'CAT');

insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('EUS', 'Euskadi');
insert into PASSENGERS values('Lucia', 'Guarner', 4225448, 18, 'CAT');


insert into AIRLINES values('Ryanair', 'GB', 115588761122);
insert into AIRLINES values('Norwegian Air', 'NO', 186834633339);

insert into AIRPORTS values('BCN', 'Barcelona-El Prat', 'Barcelona', 'CAT');
insert into AIRPORTS values('TIA', 'Tribhuban-NP', 'Kathmandu', 'NP');
insert into AIRPORTS values('WAW', 'Warsaw Chopin', 'Warsaw', 'PL');
insert into AIRPORTS values('MDI', 'Warsaw Modlin', 'Warsaw', 'PL');
insert into AIRPORTS values('LCJ', 'Lodz Intl Airport', 'Lodz', 'PL');
insert into AIRPORTS values('SXF', 'Schonefeld Airport', 'Berlin', 'DE');


insert into DISCOUNTS values('STUDENT', 51);
insert into DISCOUNTS values('CHILD', 80);
insert into DISCOUNTS values('BABY', 95);
insert into DISCOUNTS values('W-VETERAN', 60);


