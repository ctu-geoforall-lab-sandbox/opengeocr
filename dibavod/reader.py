import os
import sys

pydir = os.path.join(os.path.dirname(os.path.realpath(__file__)))
             
sys.path.insert(0, os.path.join(pydir, '..'))

from pyopengeocr.filereader import OpenGeoCRFileReader

class DibavodReader(OpenGeoCRFileReader):
        
    def __init__(self, schema='dibavod'):
        OpenGeoCRFileReader.__init__(self, schema)
        self.url_prefix = 'http://www.dibavod.cz/download.php?id_souboru='
        
    def download(self, file_id):
        with open(file_id, 'r') as f:
			ids = [line.strip() for line in f]

        for id_file in ids:
            self._download('{prefix}{id}'.format(prefix=self.url_prefix, id=id_file))
            
if __name__ == "__main__":
    reader = DibavodReader()
    reader.download(os.path.join(pydir, 'file_id.txt'))
    reader.importpg('PG:dbname=opengeocr host=geo102.fsv.cvut.cz user=XXX password=XXX')
