--create database frauddb; -- createdb frauddb -e
--\c frauddb

drop table if exists card_holder       cascade;
drop table if exists credit_card       cascade;
drop table if exists merchant_category cascade;
drop table if exists merchant          cascade;
drop table if exists transaction       cascade;

create table card_holder (
  id       int not null,
  name varchar(50),
  primary key (id)
);

create table credit_card (
  card       varchar(20) not null,
  id_card_holder int,
  foreign key (id_card_holder) references card_holder (id),
  primary key (card)
);

create table merchant_category (
  id       int not null,
  name varchar(15),
  primary key (id)
);

create table merchant (
  id                   int not null,
  name             varchar(50),
  id_merchant_category int not null,
  foreign key (id_merchant_category) references merchant_category (id),
  primary key (id)
);

create table transaction (
  id          int not null,
  date  timestamp not null,
  amount    float,
  card    varchar(20),
  id_merchant int,
  foreign key (card)        references credit_card (card),
  foreign key (id_merchant) references merchant (id),
  primary key (id)
);

-- replace `copy` by `\copy` when using psql
-- an absolute path may be required in certain circumstances

\copy card_holder       from 'data/card_holder.csv'       delimiter ',' csv header;
\copy credit_card       from 'data/credit_card.csv'       delimiter ',' csv header;
\copy merchant_category from 'data/merchant_category.csv' delimiter ',' csv header;
\copy merchant          from 'data/merchant.csv'          delimiter ',' csv header;
\copy transaction       from 'data/transaction.csv'       delimiter ',' csv header;
  
-- QUERIES
  
select ch.name,
       cc.card,
        t.date,
        t.amount,
        m.name as merchant,
       mc.name as category
from transaction as t
join credit_card as cc
  on cc.card = t.card
join card_holder as ch
  on ch.id = cc.id_card_holder
join merchant as m
  on m.id = t.id_merchant
join merchant_category as mc
  on mc.id = m.id_merchant_category
order by ch.name
);

select count(t.amount) as "Transactions less than $2.00"
from transaction as t
where t.amount < 2;

select *
from transaction as t
where t.amount < 2
order by t.card, t.amount desc;

select *
from transaction as t
where date_part('hour', t.date) >= 7
  and date_part('hour', t.date) <= 9
order by amount desc
limit 100;

select count(t.amount) as "Transactions less than $2.00 during AM"
from transaction as t
where t.amount < 2
and date_part('hour', t.date) >= 7
and date_part('hour', t.date) <= 9;

select   m.name  as merchant,
        mc.name  as category,
 count(t.amount) as micro_transactions
from transaction as t
join merchant as m
  on m.id = t.id_merchant
join merchant_category as mc
  on mc.id = m.id_merchant_category
where t.amount < 2
group by m.name, mc.name
order by micro_transactions desc
limit 5;

-- VIEWS

create view transaction_per_card_holder as
  select ch.name,
         cc.card,
          t.date,
          t.amount,
          m.name as merchant,
         mc.name as category
  from transaction as t
  join credit_card as cc
    on cc.card = t.card
  join card_holder as ch
    on ch.id = cc.id_card_holder
  join merchant as m
    on m.id = t.id_merchant
  join merchant_category as mc
    on mc.id = m.id_merchant_category
  order by ch.name;
  
create view micro_transactions as
  select *
  from transaction as t
  where t.amount < 2
  order by t.card, t.amount desc;
  
create view count_micro_transactions as
  select count(t.amount) as "Transactions less than $2.00"
  from transaction as t
  where t.amount < 2;
  
create view morning_higher_transactions as
  select *
  from transaction as t
  where date_part('hour', t.date) >= 7
    and date_part('hour', t.date) <= 9
  order by amount desc
  limit 100;
  
create view count_micro_transaction_morning as
  select count(t.amount) as "Transactions less than $2.00 during AM"
  from transaction as t
  where t.amount < 2
  and date_part('hour', t.date) >= 7
  and date_part('hour', t.date) <= 9;
  
create view top_hacked_merchants_micro_transactions as
  select   m.name  as merchant,
          mc.name  as category,
   count(t.amount) as micro_transactions
  from transaction as t
  join merchant as m
    on m.id = t.id_merchant
  join merchant_category as mc
    on mc.id = m.id_merchant_category
  where t.amount < 2
  group by m.name, mc.name
  order by micro_transactions desc
  limit 5;
  
--drop database frauddb; -- dropdb frauddb -e