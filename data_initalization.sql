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
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('GB', 'United Kingdom');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('IR', 'Ireland');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('SE', 'Sweden');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('IS', 'Iceland');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('MX', 'Mexico');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('PE', 'Peru');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('SK', 'Slovakia');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('RU', 'Russia');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('TR', 'Turkey');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('AD', 'Andorra');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('CN', 'China');
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
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('CH', 'Switzerland');
insert into NATIONALITIES (SHORT_NAME, FULL_NAME) values ('EUS', 'Euskadi');

insert into PASSENGERS (FIRST_NAME, LAST_NAME, ID, AGE, NATIONALITY) values('Sergi', 'Mascaro', 47331569, 22, 'CAT');
insert into PASSENGERS (FIRST_NAME, LAST_NAME, ID, AGE, NATIONALITY) values('Avizzit', 'Karn', 902380, 22, 'NP');
insert into PASSENGERS (FIRST_NAME, LAST_NAME, ID, AGE, NATIONALITY) values('Ruben', 'Oliva', 4411556, 24, 'ES');
insert into PASSENGERS (FIRST_NAME, LAST_NAME, ID, AGE, NATIONALITY) values('Kuba', 'PolskiLastName', 151632, 23, 'PL');
insert into PASSENGERS (FIRST_NAME, LAST_NAME, ID, AGE, NATIONALITY) values('Omehr', 'TurkishLastName', 0033115, 26, 'TR');
insert into PASSENGERS (FIRST_NAME, LAST_NAME, ID, AGE, NATIONALITY) values('Naia', 'Ibinarriaga', 48666411, 21, 'EUS');
insert into PASSENGERS (FIRST_NAME, LAST_NAME, ID, AGE, NATIONALITY) values('Miguel', 'Ruiz', 41155478, 20, 'ES');
insert into PASSENGERS (FIRST_NAME, LAST_NAME, ID, AGE, NATIONALITY) values('Cisco', 'Bates', 445478, 20, 'CAT');
insert into PASSENGERS (FIRST_NAME, LAST_NAME, ID, AGE, NATIONALITY) values('Jony', 'Darko', 3326448, 25, 'ES');
insert into PASSENGERS (FIRST_NAME, LAST_NAME, ID, AGE, NATIONALITY) values('Lucia', 'Guarner', 4225448, 18, 'CAT');
insert into PASSENGERS (FIRST_NAME, LAST_NAME, ID, AGE, NATIONALITY) values('Dummy', 'Test', 321654, 99, 'IR');
insert into PASSENGERS (FIRST_NAME, LAST_NAME, ID, AGE, NATIONALITY) values('Aki', 'Kuressaar', 66599, 35, 'EE');

insert into AIRLINES values('Ryanair', 'GB', 115588761122);
insert into AIRLINES values('Norwegian Air', 'NO', 186834633339);
insert into AIRLINES values('Iberia','ES', 661499777);
insert into AIRLINES values('Lot Polish Airlines','PL', 63322944113);
insert into AIRLINES values('Wizz Air','PL', 110224163);
insert into AIRLINES values('Air France','FR', 22669967);
insert into AIRLINES values('KLM','NL', 118515463);

insert into AIRPORTS values('BCN', 'Barcelona-El Prat', 'Barcelona', 'CAT');
insert into AIRPORTS values('TIA', 'Tribhuban-NP', 'Kathmandu', 'NP');
insert into AIRPORTS values('WAW', 'Warsaw Chopin', 'Warsaw', 'PL');
insert into AIRPORTS values('MDI', 'Warsaw Modlin', 'Warsaw', 'PL');
insert into AIRPORTS values('LCJ', 'Lodz Intl Airport', 'Lodz', 'PL');
insert into AIRPORTS values('SXF', 'Schonefeld Airport', 'Berlin', 'DE');
insert into AIRPORTS values('BIO', 'Aeropuerto de Bilbao', 'Bilbao', 'EUS');
insert into AIRPORTS values('CDT', 'Castellon de la Plana', 'Castellon de la Plana', 'ES');
insert into AIRPORTS values('VXO', 'Vaxjo-Smaland', 'Vaxjo', 'SE');
insert into AIRPORTS values('TOS', 'Tromso-Langnes', 'Tromso', 'NO');
insert into AIRPORTS values('RKV', 'Reykjavik Airport', 'Reykjavik', 'IS');
insert into AIRPORTS values('KEF', 'Keflavik Intl Airport', 'Reykjavik', 'IS');

insert into DISCOUNTS values('STUDENT', 51);
insert into DISCOUNTS values('CHILD', 80);
insert into DISCOUNTS values('BABY', 95);
insert into DISCOUNTS values('W-VETERAN', 60);
insert into DISCOUNTS values('-', 0);

insert into flights values ('ET208', '20.30', 'AMS','WAW', 'Ryanair','BNG 737', '180');
insert into flights values ('AT404', '21.30', 'TIA','MDI', 'Ryanair','BNG 787', '200');
insert into flights values ('RY900', '18.30', 'LCJ','BCN', 'Ryanair','BNG 777', '300');
insert into flights values ('ES922', '23.30', 'SXF','WAW', 'Vueling','AIRB 320', '330');
insert into flights values ('ET340', '05.30', 'BCN','SXF', 'Norwegian Air','BNG 787', '255');
insert into flights values ('WZ877', '10:00', 'LCJ', 'KEF', 'Wizz Air', 'BNG 737', '80');
insert into flights values ('FR210', '12:30', 'BIO', 'RKV', 'Air France', 'BNG 737', '80');
insert into flights values ('KL237', '18:00', 'TOS', 'AMS', 'KLM', 'BNG 787', '200');
insert into flights values ('IB887', '10:00', 'BCN', 'BIO', 'Iberia', 'AIRB 320', '50');


insert into bookings values ('902380', 'AT404','200','22' );
insert into bookings values ('151632', 'ET208','300','26' );
insert into bookings values ('4411556', 'RY900','500','33' );
insert into bookings values ('48666411', 'ES922','400','41' );
insert into bookings values ('0033115', 'ET340','100','11' );



