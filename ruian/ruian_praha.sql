set search_path to ruian_praha, public;

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
ALTER TABLE katastralniuzemi RENAME COLUMN originalnihranice TO geom;
ALTER TABLE katastralniuzemi RENAME COLUMN generalizovanehranice TO geom_gen;

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
ALTER TABLE obce RENAME COLUMN nutslau TO nuts;
ALTER TABLE obce RENAME COLUMN definicnibod TO geom_def_bod;
ALTER TABLE obce RENAME COLUMN originalnihranice TO geom;
ALTER TABLE obce RENAME COLUMN generalizovanehranice TO geom_gen;

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

-- ### TABLE Adresni mista ###
ALTER TABLE adresnimista RENAME COLUMN ogc_fid TO id;
ALTER TABLE adresnimista DROP COLUMN gml_id;
ALTER TABLE adresnimista DROP COLUMN nespravny;
ALTER TABLE adresnimista RENAME COLUMN stavebniobjektkod TO kod_stavebniobjekt;
ALTER TABLE adresnimista RENAME COLUMN ulicekod TO kod_ulice;
ALTER TABLE adresnimista RENAME COLUMN platiod TO plati_od;
ALTER TABLE adresnimista RENAME COLUMN platido TO plati_do;
ALTER TABLE adresnimista DROP COLUMN idtransakce;
ALTER TABLE adresnimista DROP COLUMN globalniidnavrhuzmeny;
ALTER TABLE adresnimista RENAME COLUMN isknbudovaid TO id_budova_iskn;
ALTER TABLE adresnimista RENAME COLUMN definicnibod TO geom;

-- ### TABLE Parcely ###
ALTER TABLE parcely RENAME COLUMN id TO kod;
ALTER TABLE parcely RENAME COLUMN ogc_fid TO id;
ALTER TABLE parcely DROP COLUMN gml_id;
ALTER TABLE parcely DROP COLUMN nespravny;
ALTER TABLE parcely RENAME COLUMN druhcislovanikod TO kod_druhcislovani;
ALTER TABLE parcely RENAME COLUMN druhpozemkukod TO kod_druhpozemku;
ALTER TABLE parcely RENAME COLUMN katastralniuzemikod TO kod_katastralniuzemi;
ALTER TABLE parcely RENAME COLUMN platiod TO plati_od;
ALTER TABLE parcely RENAME COLUMN platido TO plati_do;
ALTER TABLE parcely DROP COLUMN idtransakce;
ALTER TABLE parcely RENAME COLUMN definicnibod TO geom_def_bod;
ALTER TABLE parcely RENAME COLUMN originalnihranice TO geom;
ALTER TABLE parcely RENAME COLUMN originalnihraniceompv TO geom_ompv;

-- ### TABLE Ulice ###
ALTER TABLE ulice RENAME COLUMN ogc_fid TO id;
ALTER TABLE ulice DROP COLUMN gml_id;
ALTER TABLE ulice DROP COLUMN nespravny;
ALTER TABLE ulice RENAME COLUMN obeckod TO kod_obec;
ALTER TABLE ulice RENAME COLUMN platiod TO plati_od;
ALTER TABLE ulice RENAME COLUMN platido TO plati_do;
ALTER TABLE ulice DROP COLUMN idtransakce;
ALTER TABLE ulice DROP COLUMN globalniidnavrhuzmeny;
ALTER TABLE ulice RENAME COLUMN definicnicara TO geom;

-- ### TABLE Stavebni objekty ###
ALTER TABLE stavebniobjekty RENAME COLUMN ogc_fid TO id;
ALTER TABLE stavebniobjekty DROP COLUMN gml_id;
ALTER TABLE stavebniobjekty DROP COLUMN nespravny;
ALTER TABLE stavebniobjekty RENAME COLUMN typstavebnihoobjektukod TO kod_typstavebnihoobjektu;
ALTER TABLE stavebniobjekty RENAME COLUMN zpusobvyuzitikod TO kod_zpusobvyuziti;
ALTER TABLE stavebniobjekty RENAME COLUMN castobcekod TO kod_castobce;
ALTER TABLE stavebniobjekty RENAME COLUMN momckod TO kod_momc;
ALTER TABLE stavebniobjekty RENAME COLUMN platiod TO plati_od;
ALTER TABLE stavebniobjekty RENAME COLUMN platido TO plati_do;
ALTER TABLE stavebniobjekty DROP COLUMN idtransakce;
ALTER TABLE stavebniobjekty DROP COLUMN globalniidnavrhuzmeny;
ALTER TABLE stavebniobjekty RENAME COLUMN definicnibod TO geom_def_bod;
ALTER TABLE stavebniobjekty RENAME COLUMN originalnihranice TO geom;
ALTER TABLE stavebniobjekty RENAME COLUMN originalnihraniceompv TO geom_ompv;

