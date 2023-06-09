CREATE DATABASE sgbd;
USE sgbd;
CREATE SCHEMA test;
create table test.client
(
    name                 varchar(120),
    date_of_birth        date,
    date_of_registration date,
    country              varchar(120),
    client_id            int identity
        constraint client_pk
            primary key
);
create table test.brokerages
(
    brokerage_id    int identity
        constraint brokerages_pk
            primary key,
    name            varchar(120),
    nr_of_employees int
);
create table test.brokerage_client
(
    client_id    int not null
        constraint brokerage_client_client_client_id_fk
            references test.client,
    brokerage_id int not null
        constraint brokerage_client_brokerages_brokerage_id_fk
            references test.brokerages,
    constraint brokerage_client_pk
        primary key (client_id, brokerage_id)
);
create table financial_product
(
    product_id             int identity
        constraint financial_product_pk
            primary key,
    name                   varchar(120),
    price                  int,
    brokerage_id           int not null
        constraint financial_product_brokerages_brokerage_id_fk
            references test.brokerages,
    date_of_market_release date
);
create table test.offers
(
    product_id int not null
        constraint offers_financial_product_product_id_fk
            references test.financial_product,
    client_id  int not null
        constraint offers_client_client_id_fk
            references test.client,
    constraint offers_pk
        primary key (client_id, product_id)
);
create table test.city
(
    name    varchar(120),
    country varchar(120),
    city_id int identity
        constraint city_pk
            primary key
);
create table test.brokerage_city
(
    brokerage_id int not null
        constraint brokerage_city_brokerages_brokerage_id_fk
            references test.brokerages,
    city_id      int not null
        constraint brokerage_city_city_city_id_fk
            references test.city,
    constraint brokerage_city_pk
        primary key (city_id, brokerage_id)
);
