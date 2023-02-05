create table ovg_guest
(guest_id number,
birth_date date not null,
guest_name varchar2(100) not null,
discount_card number,
CONSTRAINT guest_pk PRIMARY KEY (guest_id),
CONSTRAINT discount_card_fk FOREIGN KEY (discount_card) REFERENCES ovg_guest(guest_id)
);
create sequence guest_seq start with 1 increment by 1;

insert into ovg_guest(guest_id, birth_date, guest_name, discount_card) values (guest_seq.nextval, to_date('1990-06-01', 'yyyy-mm-dd'), 'Афанасьев Петр Иванович', guest_seq.nextval);
insert into ovg_guest(guest_id, birth_date, guest_name, discount_card) values (guest_seq.nextval, to_date('1980-06-04', 'yyyy-mm-dd'), 'Смирнова Татьяна Александровна', guest_seq.nextval);
insert into ovg_guest(guest_id, birth_date, guest_name, discount_card) values (guest_seq.nextval, to_date('1975-05-03', 'yyyy-mm-dd'), 'Иванов Илья Владимирович', guest_seq.nextval);
insert into ovg_guest(guest_id, birth_date, guest_name, discount_card) values (guest_seq.nextval, to_date('1989-04-22', 'yyyy-mm-dd'), 'Медведева Марина Ивановна', guest_seq.nextval);
insert into ovg_guest(guest_id, birth_date, guest_name, discount_card) values (guest_seq.nextval, to_date('1999-02-14', 'yyyy-mm-dd'), 'Алиев Тимур', guest_seq.nextval);
insert into ovg_guest(guest_id, birth_date, guest_name, discount_card) values (guest_seq.nextval, to_date('1979-03-14', 'yyyy-mm-dd'), 'Привалова Елена Павловна', guest_seq.nextval);
insert into ovg_guest(guest_id, birth_date, guest_name, discount_card) values (guest_seq.nextval, to_date('1975-01-14', 'yyyy-mm-dd'), 'Некрасов Роман Алексеевич', guest_seq.nextval);
insert into ovg_guest(guest_id, birth_date, guest_name, discount_card) values (guest_seq.nextval, to_date('2000-10-25', 'yyyy-mm-dd'), 'Глушак Павел Алексеевич', guest_seq.nextval);
insert into ovg_guest(guest_id, birth_date, guest_name, discount_card) values (guest_seq.nextval, to_date('1987-10-11', 'yyyy-mm-dd'), 'Тимофеева Юлия Владимировна', guest_seq.nextval);
insert into ovg_guest(guest_id, birth_date, guest_name, discount_card) values (guest_seq.nextval, to_date('1993-12-31', 'yyyy-mm-dd'), 'Тимофеев Антон Александрович', guest_seq.nextval);



create table ovg_step
(step_id number,
step_name varchar2(50) not null,
CONSTRAINT step_pk PRIMARY KEY (step_id));

create sequence step_seq start with 1 increment by 1;

insert into ovg_step(step_id, step_name) values (step_seq.nextval, 'Консультация');
insert into ovg_step(step_id, step_name) values (step_seq.nextval, 'Бронирование');
insert into ovg_step(step_id, step_name) values (step_seq.nextval, 'Оплата');
insert into ovg_step(step_id, step_name) values (step_seq.nextval, 'Поездка');
insert into ovg_step(step_id, step_name) values (step_seq.nextval, 'Отмена');



create table ovg_tour
(tour_id number,
tour_type varchar2(100) not null,
CONSTRAINT tour_pk PRIMARY KEY (tour_id));

create sequence tour_seq start with 1 increment by 1;

insert into ovg_tour(tour_id, tour_type) values (tour_seq.nextval, 'Курорты Краснодарского края');
insert into ovg_tour(tour_id, tour_type) values (tour_seq.nextval, 'Сила Сибири');
insert into ovg_tour(tour_id, tour_type) values (tour_seq.nextval, 'Поволжские закаты');
insert into ovg_tour(tour_id, tour_type) values (tour_seq.nextval, 'Дальневосточная жемчужина');
insert into ovg_tour(tour_id, tour_type) values (tour_seq.nextval, 'Северная Столица');

create table ovg_sber_guest
(sber_guest_id number,
 guest_id number unique,
CONSTRAINT sber_guest_pk PRIMARY KEY (sber_guest_id),
CONSTRAINT sber_guest_fk FOREIGN KEY (guest_id) REFERENCES ovg_guest(guest_id));


create table ovg_sber_guest
(sber_guest_id number,
 guest_id number unique,
CONSTRAINT sber_guest_pk PRIMARY KEY (sber_guest_id),
CONSTRAINT sber_guest_fk FOREIGN KEY (guest_id) REFERENCES ovg_guest(guest_id));

insert into ovg_sber_guest(sber_guest_id, guest_id) values (1, 4);
insert into ovg_sber_guest(sber_guest_id, guest_id) values (2, 5);
insert into ovg_sber_guest(sber_guest_id, guest_id) values (3, 9);

create table ovg_trip
(trip_id number,
trip_name varchar2(100) not null,
price decimal(9, 2),
tour_id number,
CONSTRAINT trip_pk PRIMARY KEY (trip_id),
CONSTRAINT tour_fk FOREIGN KEY (tour_id) REFERENCES ovg_tour(tour_id)
);

create sequence trip_seq start with 1 increment by 1;

insert into ovg_trip(trip_id, trip_name, price, tour_id) values (trip_seq.nextval, 'Адлер', 9770.50 , 1);
insert into ovg_trip(trip_id, trip_name, price, tour_id) values (trip_seq.nextval, 'Хоста', 7800.60 , 1);
insert into ovg_trip(trip_id, trip_name, price, tour_id) values (trip_seq.nextval, 'Новосибирск', 10550.45 , 2);
insert into ovg_trip(trip_id, trip_name, price, tour_id) values (trip_seq.nextval, 'Ухта', 10400.99 , 2);
insert into ovg_trip(trip_id, trip_name, price, tour_id) values (trip_seq.nextval, 'Самара', 8860.20 , 3);
insert into ovg_trip(trip_id, trip_name, price, tour_id) values (trip_seq.nextval, 'Казань', 8900.90 , 3);
insert into ovg_trip(trip_id, trip_name, price, tour_id) values (trip_seq.nextval, 'Хабаровск', 11500.00 , 4);
insert into ovg_trip(trip_id, trip_name, price, tour_id) values (trip_seq.nextval, 'Благовещенск', 12900.32 , 4);
insert into ovg_trip(trip_id, trip_name, price, tour_id) values (trip_seq.nextval, 'Санкт-Петербург', 9876.00 , 5);
insert into ovg_trip(trip_id, trip_name, price, tour_id) values (trip_seq.nextval, 'Выборг', 9555.80 , 5);

create table ovg_booking
(booking_id number,
check_in date,
check_out date,
trip_id number,
guest_id number,
CONSTRAINT booking_pk PRIMARY KEY (booking_id),
CONSTRAINT booking_fk FOREIGN KEY (trip_id) REFERENCES ovg_trip(trip_id),
CONSTRAINT booking_fk FOREIGN KEY (guest_id) REFERENCES ovg_guest(guest_id));

create sequence booking_seq start with 1 increment by 1;

insert into ovg_booking(booking_id, check_in, check_out, trip_id, guest_id) values (booking_seq.nextval, to_date('2023-07-10', 'yyyy-mm-dd'), to_date('2023-07-16', 'yyyy-mm-dd'), 1, 2);



