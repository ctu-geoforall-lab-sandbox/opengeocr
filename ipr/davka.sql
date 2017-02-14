-- okrsky mestske policie
ALTER TABLE okrsky_mestske_policie RENAME COLUMN ogc_fid TO id;
ALTER TABLE okrsky_mestske_policie RENAME COLUMN okrsek TO okrsek_cislo;
ALTER TABLE okrsky_mestske_policie RENAME COLUMN mc_praha TO mestskacast_praha;
ALTER TABLE okrsky_mestske_policie RENAME COLUMN shape_area TO vymera_okrsku;
ALTER TABLE okrsky_mestske_policie RENAME COLUMN geom TO geometrie;
ALTER TABLE okrsky_mestske_policie DROP COLUMN shape_leng;
ALTER TABLE okrsky_mestske_policie ADD primary key (id);

-- parkovaci automaty
ALTER TABLE parkovaci_automaty RENAME COLUMN ogc_fid TO id;
ALTER TABLE parkovaci_automaty RENAME COLUMN typ TO typ;
ALTER TABLE parkovaci_automaty RENAME COLUMN poskyt TO poskytovatel;
ALTER TABLE parkovaci_automaty RENAME COLUMN geom TO geometry;
ALTER TABLE parkovaci_automaty ADD primary key (id);

-- parkovaci automaty 2016
ALTER TABLE parkovaci_automaty_2016 RENAME COLUMN ogc_fid TO id;
ALTER TABLE parkovaci_automaty_2016 RENAME COLUMN poskyt TO poskytovatel;
ALTER TABLE parkovaci_automaty_2016 RENAME COLUMN geom TO geometrie;
ALTER TABLE parkovaci_automaty_2016 ADD primary key (id);

-- verejna wc
ALTER TABLE verejnawc RENAME COLUMN ogc_fid to id;
ALTER TABLE verejnawc RENAME COLUMN adresa TO adresa;
ALTER TABLE verejnawc RENAME COLUMN geom TO geometrie;
ALTER TABLE verejnawc ADD primary key (id);

-- protihlukove bariery
ALTER TABLE protihlukove_bariery RENAME COLUMN ogc_fid TO id;
ALTER TABLE protihlukove_bariery DROP COLUMN id;
ALTER TABLE protihlukove_bariery RENAME COLUMN ulice TO adresa;
ALTER TABLE protihlukove_bariery RENAME COLUMN kat_uzemi TO katastralni_uzemi;
ALTER TABLE protihlukove_bariery DROP COLUMN shape_leng;
ALTER TABLE protihlukove_bariery RENAME COLUMN geom TO geometrie;
ALTER TABLE protihlukove_bariery ADD primary key (id);

-- protihlukove valy
ALTER TABLE protihlukove_valy RENAME COLUMN ogc_fid TO id;
ALTER TABLE protihlukove_valy DROP COLUMN id;
ALTER TABLE protihlukove_valy RENAME COLUMN ulice TO adresa;
ALTER TABLE protihlukove_valy RENAME COLUMN kat_uzemi TO katastralni_uzemi;
ALTER TABLE protihlukove_valy DROP COLUMN shape_leng;
ALTER TABLE protihlukove_valy RENAME COLUMN shape_area TO vymera_valu;
ALTER TABLE protihlukove_valy RENAME COLUMN geom TO geometrie;
ALTER TABLE protihlukove_valy ADD primary key (id);

-- prirodni parky
ALTER TABLE prirodni_parky RENAME COLUMN ogc_fid to id;
ALTER TABLE prirodni_parky RENAME COLUMN nazev to nazev_parku;
ALTER TABLE prirodni_parky DROP COLUMN shape_leng;
ALTER TABLE prirodni_parky RENAME COLUMN shape_area to vymera_parku;
ALTER TABLE prirodni_parky RENAME COLUMN geom to geometrie;
ALTER TABLE prirodni_parky ADD primary key (id);

-- praha
ALTER TABLE praha RENAME COLUMN ogc_fid to id;
ALTER TABLE praha DROP COLUMN shape_leng;
ALTER TABLE praha RENAME COLUMN shape_area to vymera_prahy;
ALTER TABLE praha RENAME COLUMN geom to geometrie;
ALTER TABLE praha ADD primary key (id);

-- mestske casti
ALTER TABLE mestske_Casti RENAME COLUMN id TO id_mestkecasti;
ALTER TABLE mestske_casti RENAME COLUMN ogc_fid to id;
ALTER TABLE mestske_casti RENAME COLUMN dat_vznik to datum_vzniku;
ALTER TABLE mestske_casti DROP COLUMN dat_zmena;
ALTER TABLE mestske_casti RENAME COLUMN plocha TO vymera;
ALTER TABLE mestske_Casti RENAME COLUMN kod_mc TO kod;
ALTER TABLE mestske_Casti RENAME COLUMN nazev_mc TO nazev;
ALTER TABLE mestske_Casti RENAME COLUMN poskyt TO poskytovatel;
ALTER TABLE mestske_Casti RENAME COLUMN id_poskyt TO id_poskytovatele;
ALTER TABLE mestske_Casti RENAME COLUMN shape_area TO vymera;
ALTER TABLE mestske_Casti DROP COLUMN shape_leng;
ALTER TABLE mestske_Casti RENAME COLUMN geom TO geometrie;
ALTER TABLE mestske_Casti DROP COLUMN stav_zmena;
ALTER TABLE mestske_Casti DROP COLUMN parent_id;
ALTER TABLE mestske_Casti DROP COLUMN child_id;
ALTER TABLE mestske_Casti DROP COLUMN kod_mo;
ALTER TABLE mestske_Casti DROP COLUMN kod_so;
ALTER TABLE mestske_Casti DROP COLUMN tid_tmmest;
ALTER TABLE mestske_casti ADD primary key (id);

-- svoz odpadu
ALTER TABLE svoz_odpadu RENAME COLUMN ogc_fid to id;
ALTER TABLE svoz_odpadu RENAME COLUMN svoz_spol to spolecnost;
ALTER TABLE svoz_odpadu RENAME COLUMN spad_obl to spadajici_oblasti;
ALTER TABLE svoz_odpadu DROP COLUMN shape_leng;
ALTER TABLE svoz_odpadu RENAME COLUMN shape_area to vymera;
ALTER TABLE svoz_odpadu RENAME COLUMN geom to geometrie;
ALTER TABLE svoz_odpadu ADD primary key (id);

-- pamatkove stromy
ALTER TABLE pamatkove_stromy RENAME COLUMN ogc_fid TO id;
ALTER TABLE pamatkove_stromy DROP COLUMN ozp;
ALTER TABLE pamatkove_stromy DROP COLUMN typ_op;
ALTER TABLE pamatkove_stromy RENAME COLUMN polomer_m TO polomer;
ALTER TABLE pamatkove_stromy RENAME COLUMN poskyt TO poskytovatel;
ALTER TABLE pamatkove_stromy RENAME COLUMN id_poskyt TO id_poskytovatele;
ALTER TABLE pamatkove_stromy DROP COLUMN tid_opk_pa;
ALTER TABLE pamatkove_stromy DROP COLUMN shape_leng;
ALTER TABLE pamatkove_stromy RENAME COLUMN shape_area to vymera;
ALTER TABLE pamatkove_stromy RENAME COLUMN geom to geometrie;