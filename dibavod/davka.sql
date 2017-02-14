set search_path to dibavod, public;


-- koupaliste
drop table if exists koupaliste;
create table koupaliste as select ogc_fid as id, koup_naz as nazev, tok_naz, geom from c03_koupalistevevolneprirode;
insert into koupaliste(id, nazev, tok_naz, geom) select ogc_fid + (select count(*) from c03_koupalistevevolneprirode), koup_naz, tok_naz, geom from c02_koupaci_oblasti;
alter table koupaliste add primary key (id);

-- vodni toky
drop table if exists vodni_toky;
create table vodni_toky as select ogc_fid as id, naz_tok as nazev, tok_id, geom from a02_vodni_tok_ju;
alter table vodni_toky add primary key (id);

-- melioracni kanaly
drop table if exists melioracni_kanaly;
create table melioracni_kanaly as select ogc_fid as id, geom from a04zvm_melioracni_kanaly;
alter table melioracni_kanaly add primary key (id);

-- vodni nadrze
drop table if exists vodni_nadrze;
create table vodni_nadrze as select ogc_fid as id, naz_na as nazev, kota_hladi as nadm_vyska, hloubka, objem, geom from a05_vodni_nadrze;
alter table vodni_nadrze add primary key (id);

-- mocaly
drop table if exists mocaly;
create table mocaly as select ogc_fid as id, geom from a06_bazina_mocal;
alter table mocaly add primary key (id);

-- povodi
drop table if exists povodi;
create table povodi as select oblasti_po as id, nazev, geom from b01_oblasti_povodi;
alter table povodi add primary key (id);

-- povoden 5
drop table if exists povoden_5;
create table povoden_5 as select ogc_fid as id, naz_tok as tok, tok_id, geom from d01_zapluzemi5vody;
alter table povoden_5 add primary key (id);

-- povoden 20
drop table if exists povoden_20;
create table povoden_20 as select ogc_fid as id, naz_tok as tok, tok_id, geom from d02_zapluzemi20vody;
alter table povoden_20 add primary key (id);

-- povoden 100
drop table if exists povoden_100;
create table povoden_100 as select ogc_fid as id, naz_tok as tok, tok_id, geom from d03_zapluzemi100vody;
alter table povoden_100 add primary key (id);

-- jezy
drop table if exists jezy;
create table jezy as select j.ogc_fid as id,  v.naz_tok as tok, j.tok_id, j.geom from i01zvm_jezy as j left join (select distinct tok_id, naz_tok from a02_vodni_tok_ju) as v on j.tok_id=v.tok_id;
alter table jezy add primary key (id);

-- erase imported layers
drop table a02_vodni_tok_ju, a04zvm_melioracni_kanaly, a05_vodni_nadrze, a06_bazina_mocal, b01_oblasti_povodi, c02_koupaci_oblasti, c03_koupalistevevolneprirode, d01_zapluzemi5vody, d02_zapluzemi20vody, d03_zapluzemi100vody, i01zvm_jezy;
