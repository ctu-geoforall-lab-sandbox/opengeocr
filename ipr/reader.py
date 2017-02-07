import os
import sys

pydir = os.path.join(os.path.dirname(os.path.realpath(__file__)))
             
sys.path.insert(0, os.path.join(pydir, '..'))

from pyopengeocr.base import OpenGeoCRReader
from iprdownloader.IprPg import IprDownloaderPg

class IprReader(OpenGeoCRReader):
        
    def __init__(self, dbname, host, user, passwd,
                 schema='ipr',
                 input_file=os.path.join(pydir, 'input.txt')):
        OpenGeoCRReader.__init__(self, schema, input_file)
        self._reader = IprDownloaderPg(dbname, host,
                                       dbuser=user, dbpasswd=passwd,
                                       dbschema=schema)
        for item in self.input_list:
            self._reader.filter(item, crs='S-JTSK', file_format='shp')
        
    def download(self):
        self._reader.download(outdir=self.data_dir, only_import=False)

    def importpg(self):
        self._reader.import_data(crs='S-JTSK', overwrite=True)
            
if __name__ == "__main__":
    reader = IprReader(dbname='opengeocr', host='geo102.fsv.cvut.cz',
                       user='XXX', passwd='XXX')
    reader.download()
    reader.importpg()
