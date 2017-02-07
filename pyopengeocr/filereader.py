import os
import requests
import zipfile
import StringIO
import tempfile
import glob
import shutil

from osgeo import ogr

from base import OpenGeoCRReader
from exception import OpenGeoCRError

class OpenGeoCRFileReader(OpenGeoCRReader):
    def __init__(self, schema, input_file, data_dir=None, force_srs=5514, extension='shp'):
        OpenGeoCRReader.__init__(self, schema, input_file)
        self.force_srs = force_srs
        self.geometry_name = 'geom'
        self.extension = extension
        
        if data_dir:
            self.data_dir = data_dir
            self.remove_dir = False
        else:
            self.data_dir = tempfile.mkdtemp()
            self.remove_dir = True
            print("Data dir: {}".format(self.data_dir))

        os.chdir(self.data_dir)

    def __del__(self):
        if self.remove_dir:
            shutil.rmtree(self.data_dir)
        
    def _download(self, url):
        print("Downloading {}...".format(url))
        r = requests.get(url, stream=True)
        z = zipfile.ZipFile(StringIO.StringIO(r.content))
        z.extractall()

    def importpg(self, connstr):
        ods = ogr.Open(connstr)
        if ods is None:
            raise OpenGeoCRError("Unable to open '{}'".format(connstr))
        
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
        olayer = odsn.CreateLayer(layer.GetName(), layer.GetSpatialRef(),
                                  layer.GetGeomType(), options)

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
            ofeature = ogr.Feature(olayer.GetLayerDefn())
            olayer.CreateFeature(ofeature)
            feature = layer.GetNextFeature()

        olayer.CommitTransaction()

        return olayer
