import requests
import zipfile
import StringIO
import glob

from osgeo import ogr

from base import OpenGeoCRReader
from exception import OpenGeoCRError

class OpenGeoCRFileReader(OpenGeoCRReader):
    def __init__(self, dbname, host, user, passwd, schema,
                 input_file,
                 data_dir=None, force_srs=5514, extension='shp'):
        OpenGeoCRReader.__init__(self, schema, input_file, data_dir=data_dir)
        self.force_srs = force_srs
        self.geometry_name = 'geom'
        self.extension = extension
        self._connstr = "PG:dbname={}".format(dbname)
        if host:
            self._connstr += " host={}".format(host)
        if user:
            self._connstr += " user={}".format(user)
        if passwd:
            self._connstr += " password={}".format(passwd)

    def _download(self, url):
        print("Downloading {}...".format(url))
        r = requests.get(url, stream=True)
        z = zipfile.ZipFile(StringIO.StringIO(r.content))
        z.extractall()

    def importpg(self):
        ods = ogr.Open(self._connstr)
        if ods is None:
            raise OpenGeoCRError("Unable to open '{}'".format(self._connstr))
        
        for shp in glob.glob("*.{}".format(self.extension)):
            self._importpg(shp, ods)

    def _importpg(self, ifile, ods):
        print("Importing {}...".format(ifile))
        ids = ogr.Open(ifile)
        if ids is None:
            raise OpenGeoCRError("Unable to open '{}'".format(ifile))

        layer = ids.GetLayer()
        if self.force_srs:
            # fix SRS
            spatialRef = layer.GetSpatialRef()
            spatialRef.ImportFromEPSG(self.force_srs)

        options = ['OVERWRITE=YES',
                   'GEOMETRY_NAME={}'.format(self.geometry_name),
                   'SCHEMA={}'.format(self.schema)]

        # can fail with Geometry type (MultiPolygon) does not match
        # column type (Polygon)
        # ods.CopyLayer(layer, layer.GetName(),
        # )
        self._copy_layer(layer, options, ods)
        
    def _copy_layer(self, layer, options, odsn):
        ### olayer = odsn.CopyLayer(layer, layer.GetName(), options)
        geom_type = layer.GetGeomType()
        # force multifeatures
        force_geom = None
        if geom_type == ogr.wkbPoint:
            geom_type = ogr.wkbMultiPoint
            force_geom = ogr.ForceToMultiPoint
        elif geom_type == ogr.wkbLineString:
            geom_type = ogr.wkbMultiLineString
            force_geom = ogr.ForceToMultiLineString
        elif geom_type == ogr.wkbPolygon:
            geom_type = ogr.wkbMultiPolygon
            force_geom = ogr.ForceToMultiPolygon

        olayer = odsn.CreateLayer(layer.GetName(), layer.GetSpatialRef(),
                                  geom_type, options)

        # copy attributes
        feat_defn = layer.GetLayerDefn()
        for i in range(feat_defn.GetFieldCount()):
            ifield = feat_defn.GetFieldDefn(i)
            ofield = ogr.FieldDefn(ifield.GetNameRef(), ifield.GetType())
            olayer.CreateField(ofield)

        # copy features
        olayer.StartTransaction()
        feature = layer.GetNextFeature()
        while feature:
            ofeature = feature.Clone()
            if force_geom:
                geom = force_geom(feature.GetGeometryRef())
                ofeature.SetGeometry(geom)
            olayer.CreateFeature(ofeature)
            feature = layer.GetNextFeature()

        olayer.CommitTransaction()

        return olayer
