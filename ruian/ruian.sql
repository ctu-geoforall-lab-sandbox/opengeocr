set search_path to ruian, public;

-- ### TABLE Stat ###
ALTER TABLE staty RENAME COLUMN ogc_fid TO id;
ALTER TABLE staty DROP COLUMN gml_id;
ALTER TABLE staty DROP COLUMN nespravny;
ALTER TABLE staty RENAME COLUMN platiod TO plati_od;
ALTER TABLE staty RENAME COLUMN platido TO plati_do;
ALTER TABLE staty DROP COLUMN idtransakce;
ALTER TABLE staty DROP COLUMN globalniidnavrhuzmeny;
ALTER TABLE staty RENAME COLUMN nutslau TO nuts;
ALTER TABLE staty RENAME COLUMN definicnibod TO geom_def_bod;
ALTER TABLE staty DROP COLUMN originalnihranice;
ALTER TABLE staty RENAME COLUMN generalizovanehranice TO geom_gen;
ALTER TABLE staty RENAME TO stat;

-- ### TABLE Region soudrznosti ###
ALTER TABLE regionysoudrznosti RENAME COLUMN ogc_fid TO id;
ALTER TABLE regionysoudrznosti DROP COLUMN gml_id;
ALTER TABLE regionysoudrznosti DROP COLUMN nespravny;
ALTER TABLE regionysoudrznosti RENAME COLUMN statkod TO kod_stat;
ALTER TABLE regionysoudrznosti RENAME COLUMN platiod TO plati_od;
ALTER TABLE regionysoudrznosti RENAME COLUMN platido TO plati_do;
ALTER TABLE regionysoudrznosti DROP COLUMN idtransakce;
ALTER TABLE regionysoudrznosti DROP COLUMN globalniidnavrhuzmeny;
ALTER TABLE regionysoudrznosti RENAME COLUMN nutslau TO nuts;
ALTER TABLE regionysoudrznosti RENAME COLUMN definicnibod TO geom_def_bod;
ALTER TABLE regionysoudrznosti DROP COLUMN originalnihranice;
ALTER TABLE regionysoudrznosti RENAME COLUMN generalizovanehranice TO geom_gen;

-- ### TABLE VUSC ###
ALTER TABLE vusc RENAME COLUMN ogc_fid TO id;
ALTER TABLE vusc DROP COLUMN gml_id;
ALTER TABLE vusc DROP COLUMN nespravny;
ALTER TABLE vusc RENAME COLUMN regionsoudrznostikod TO kod_regionsoudrznostikod;
ALTER TABLE vusc RENAME COLUMN platiod TO plati_od;
ALTER TABLE vusc RENAME COLUMN platido TO plati_do;
ALTER TABLE vusc DROP COLUMN idtransakce;
ALTER TABLE vusc DROP COLUMN globalniidnavrhuzmeny;
ALTER TABLE vusc RENAME COLUMN nutslau TO nuts;
ALTER TABLE vusc RENAME COLUMN definicnibod TO geom_def_bod;
ALTER TABLE vusc DROP COLUMN originalnihranice;
ALTER TABLE vusc RENAME COLUMN generalizovanehranice TO geom_gen;

-- ### TABLE Kraje ###
ALTER TABLE kraje RENAME COLUMN ogc_fid TO id;
ALTER TABLE kraje DROP COLUMN gml_id;
ALTER TABLE kraje DROP COLUMN nespravny;
ALTER TABLE kraje RENAME COLUMN statkod TO kod_stat;
ALTER TABLE kraje RENAME COLUMN platiod TO plati_od;
ALTER TABLE kraje RENAME COLUMN platido TO plati_do;
ALTER TABLE kraje DROP COLUMN idtransakce;
ALTER TABLE kraje DROP COLUMN globalniidnavrhuzmeny;
ALTER TABLE kraje RENAME COLUMN nutslau TO nuts;
ALTER TABLE kraje RENAME COLUMN definicnibod TO geom_def_bod;
ALTER TABLE kraje DROP COLUMN originalnihranice;
ALTER TABLE kraje RENAME COLUMN generalizovanehranice TO geom_gen;

-- ### TABLE Okresy ###
ALTER TABLE okresy RENAME COLUMN ogc_fid TO id;
ALTER TABLE okresy DROP COLUMN gml_id;
ALTER TABLE okresy DROP COLUMN nespravny;
ALTER TABLE okresy RENAME COLUMN krajkod TO kod_kraj;
ALTER TABLE okresy RENAME COLUMN vusckod TO kod_vusc;
ALTER TABLE okresy RENAME COLUMN platiod TO plati_od;
ALTER TABLE okresy RENAME COLUMN platido TO plati_do;
ALTER TABLE okresy DROP COLUMN idtransakce;
ALTER TABLE okresy DROP COLUMN globalniidnavrhuzmeny;
ALTER TABLE okresy RENAME COLUMN nutslau TO nuts;
ALTER TABLE okresy RENAME COLUMN definicnibod TO geom_def_bod;
ALTER TABLE okresy DROP COLUMN originalnihranice;
ALTER TABLE okresy RENAME COLUMN generalizovanehranice TO geom_gen;

-- ### TABLE ORP ###
ALTER TABLE orp RENAME COLUMN ogc_fid TO id;
ALTER TABLE orp DROP COLUMN gml_id;
ALTER TABLE orp DROP COLUMN nespravny;
ALTER TABLE orp RENAME COLUMN spravniobeckod TO kod_spravniobec;
ALTER TABLE orp RENAME COLUMN vusckod TO kod_vusc;
ALTER TABLE orp RENAME COLUMN platiod TO plati_od;
ALTER TABLE orp RENAME COLUMN platido TO plati_do;
ALTER TABLE orp DROP COLUMN idtransakce;
ALTER TABLE orp DROP COLUMN globalniidnavrhuzmeny;
ALTER TABLE orp RENAME COLUMN definicnibod TO geom_def_bod;
ALTER TABLE orp DROP COLUMN originalnihranice;
ALTER TABLE orp RENAME COLUMN generalizovanehranice TO geom_gen;

-- ### TABLE MOP ###
ALTER TABLE mop RENAME COLUMN ogc_fid TO id;
ALTER TABLE mop DROP COLUMN gml_id;
ALTER TABLE mop DROP COLUMN nespravny;
ALTER TABLE mop RENAME COLUMN obeckod TO kod_obec;
ALTER TABLE mop RENAME COLUMN platiod TO plati_od;
ALTER TABLE mop RENAME COLUMN platido TO plati_do;
ALTER TABLE mop DROP COLUMN idtransakce;
ALTER TABLE mop DROP COLUMN globalniidnavrhuzmeny;
ALTER TABLE mop RENAME COLUMN definicnibod TO geom_def_bod;
ALTER TABLE mop RENAME COLUMN originalnihranice TO geom;

-- ### TABLE Spravni obvody ###
ALTER TABLE spravniobvody RENAME COLUMN ogc_fid TO id;
ALTER TABLE spravniobvody DROP COLUMN gml_id;
ALTER TABLE spravniobvody DROP COLUMN nespravny;
ALTER TABLE spravniobvody RENAME COLUMN spravnimomckod TO kod_momc;
ALTER TABLE spravniobvody RENAME COLUMN obeckod TO kod_obec;
ALTER TABLE spravniobvody RENAME COLUMN platiod TO plati_od;
ALTER TABLE spravniobvody RENAME COLUMN platido TO plati_do;
ALTER TABLE spravniobvody DROP COLUMN idtransakce;
ALTER TABLE spravniobvody DROP COLUMN globalniidnavrhuzmeny;
ALTER TABLE spravniobvody RENAME COLUMN definicnibod TO geom_def_bod;
ALTER TABLE spravniobvody RENAME COLUMN originalnihranice TO geom;

-- ### TABLE MOMC ###
ALTER TABLE momc RENAME COLUMN ogc_fid TO id;
ALTER TABLE momc DROP COLUMN gml_id;
ALTER TABLE momc DROP COLUMN nespravny;
ALTER TABLE momc RENAME COLUMN mopkod TO kod_mop;
ALTER TABLE momc RENAME COLUMN obeckod TO kod_obec;
ALTER TABLE momc RENAME COLUMN spravniobvodkod TO kod_spravniobvod;
ALTER TABLE momc RENAME COLUMN platiod TO plati_od;
ALTER TABLE momc RENAME COLUMN platido TO plati_do;
ALTER TABLE momc DROP COLUMN idtransakce;
ALTER TABLE momc DROP COLUMN globalniidnavrhuzmeny;
ALTER TABLE momc DROP COLUMN mluvnickecharakteristikypad2;
ALTER TABLE momc DROP COLUMN mluvnickecharakteristikypad3;
ALTER TABLE momc DROP COLUMN mluvnickecharakteristikypad4;
ALTER TABLE momc DROP COLUMN mluvnickecharakteristikypad6;
ALTER TABLE momc DROP COLUMN mluvnickecharakteristikypad7;
ALTER TABLE momc RENAME COLUMN definicnibod TO geom_def_bod;
ALTER TABLE momc RENAME COLUMN originalnihranice TO geom;

-- ### TABLE Casti obci ###
ALTER TABLE castiobci RENAME COLUMN ogc_fid TO id;
ALTER TABLE castiobci DROP COLUMN gml_id;
ALTER TABLE castiobci DROP COLUMN nespravny;
ALTER TABLE castiobci RENAME COLUMN obeckod TO kod_obec;
ALTER TABLE castiobci RENAME COLUMN platiod TO plati_od;
ALTER TABLE castiobci RENAME COLUMN platido TO plati_do;
ALTER TABLE castiobci DROP COLUMN idtransakce;
ALTER TABLE castiobci DROP COLUMN globalniidnavrhuzmeny;
ALTER TABLE castiobci DROP COLUMN mluvnickecharakteristikypad2;
ALTER TABLE castiobci DROP COLUMN mluvnickecharakteristikypad3;
ALTER TABLE castiobci DROP COLUMN mluvnickecharakteristikypad4;
ALTER TABLE castiobci DROP COLUMN mluvnickecharakteristikypad6;
ALTER TABLE castiobci DROP COLUMN mluvnickecharakteristikypad7;
ALTER TABLE castiobci RENAME COLUMN definicnibod TO geom;

-- ### TABLE Katastralni uzemi ###
ALTER TABLE katastralniuzemi RENAME COLUMN ogc_fid TO id;
ALTER TABLE katastralniuzemi DROP COLUMN gml_id;
ALTER TABLE katastralniuzemi DROP COLUMN nespravny;
ALTER TABLE katastralniuzemi RENAME COLUMN existujedigitalnimapa TO digitalni_mapa;
ALTER TABLE katastralniuzemi RENAME COLUMN obeckod TO kod_obec;
ALTER TABLE katastralniuzemi RENAME COLUMN platiod TO plati_od;
ALTER TABLE katastralniuzemi RENAME COLUMN platido TO plati_do;
ALTER TABLE katastralniuzemi DROP COLUMN idtransakce;
ALTER TABLE katastralniuzemi DROP COLUMN globalniidnavrhuzmeny;
ALTER TABLE katastralniuzemi DROP COLUMN mluvnickecharakteristikypad2;
ALTER TABLE katastralniuzemi DROP COLUMN mluvnickecharakteristikypad3;
ALTER TABLE katastralniuzemi DROP COLUMN mluvnickecharakteristikypad4;
ALTER TABLE katastralniuzemi DROP COLUMN mluvnickecharakteristikypad6;
ALTER TABLE katastralniuzemi DROP COLUMN mluvnickecharakteristikypad7;
ALTER TABLE katastralniuzemi RENAME COLUMN definicnibod TO geom_def_bod;
ALTER TABLE katastralniuzemi DROP COLUMN originalnihranice;
ALTER TABLE katastralniuzemi RENAME COLUMN generalizovanehranice TO geom_gen;

-- ### TABLE Obce ###
ALTER TABLE obce RENAME COLUMN ogc_fid TO id;
ALTER TABLE obce DROP COLUMN gml_id;
ALTER TABLE obce DROP COLUMN nespravny;
ALTER TABLE obce RENAME COLUMN statuskod TO status_obce;
ALTER TABLE obce RENAME COLUMN okreskod TO kod_okres;
ALTER TABLE obce RENAME COLUMN poukod TO kod_pou;
ALTER TABLE obce RENAME COLUMN platiod TO plati_od;
ALTER TABLE obce RENAME COLUMN platido TO plati_do;
ALTER TABLE obce DROP COLUMN idtransakce;
ALTER TABLE obce DROP COLUMN globalniidnavrhuzmeny;
ALTER TABLE obce DROP COLUMN mluvnickecharakteristikypad2;
ALTER TABLE obce DROP COLUMN mluvnickecharakteristikypad3;
ALTER TABLE obce DROP COLUMN mluvnickecharakteristikypad4;
ALTER TABLE obce DROP COLUMN mluvnickecharakteristikypad6;
ALTER TABLE obce DROP COLUMN mluvnickecharakteristikypad7;
ALTER TABLE obce RENAME COLUMN nutslau TO nuts;
ALTER TABLE obce RENAME COLUMN definicnibod TO geom_def_bod;
ALTER TABLE obce DROP COLUMN originalnihranice;
ALTER TABLE obce RENAME COLUMN generalizovanehranice TO geom_gen;

-- ### TABLE POU ###
ALTER TABLE pou RENAME COLUMN ogc_fid TO id;
ALTER TABLE pou DROP COLUMN gml_id;
ALTER TABLE pou DROP COLUMN nespravny;
ALTER TABLE pou RENAME COLUMN spravniobeckod TO kod_spravniobec;
ALTER TABLE pou RENAME COLUMN orpkod TO kod_orp;
ALTER TABLE pou RENAME COLUMN platiod TO plati_od;
ALTER TABLE pou RENAME COLUMN platido TO plati_do;
ALTER TABLE pou DROP COLUMN idtransakce;
ALTER TABLE pou DROP COLUMN globalniidnavrhuzmeny;
ALTER TABLE pou RENAME COLUMN definicnibod TO geom_def_bod;
ALTER TABLE pou DROP COLUMN originalnihranice;
ALTER TABLE pou RENAME COLUMN generalizovanehranice TO geom_gen;

-- ### TABLE ZSJ ###
ALTER TABLE zsj RENAME COLUMN ogc_fid TO id;
ALTER TABLE zsj DROP COLUMN gml_id;
ALTER TABLE zsj DROP COLUMN nespravny;
ALTER TABLE zsj RENAME COLUMN katastralniuzemikod TO kod_katastralniuzemi;
ALTER TABLE zsj RENAME COLUMN platiod TO plati_od;
ALTER TABLE zsj RENAME COLUMN platido TO plati_do;
ALTER TABLE zsj DROP COLUMN idtransakce;
ALTER TABLE zsj DROP COLUMN globalniidnavrhuzmeny;
ALTER TABLE zsj DROP COLUMN mluvnickecharakteristikypad2;
ALTER TABLE zsj DROP COLUMN mluvnickecharakteristikypad3;
ALTER TABLE zsj DROP COLUMN mluvnickecharakteristikypad4;
ALTER TABLE zsj DROP COLUMN mluvnickecharakteristikypad6;
ALTER TABLE zsj DROP COLUMN mluvnickecharakteristikypad7;
ALTER TABLE zsj RENAME COLUMN definicnibod TO geom_def_bod;
ALTER TABLE zsj RENAME COLUMN originalnihranice TO geom;

