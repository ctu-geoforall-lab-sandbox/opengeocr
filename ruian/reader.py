import os
import sys
import argparse

pydir = os.path.join(os.path.dirname(os.path.realpath(__file__)))

sys.path.insert(0, os.path.join(pydir, '..'))
from pyopengeocr.base import OpenGeoCRReader
sys.path.insert(0, os.path.join(pydir, 'gdal_vfr'))
from vfr4ogr import VfrPg

class RuianReader(OpenGeoCRReader):

    def __init__(self, dbname, host, user, passwd,
                 schema='ruian',
                 input_file=os.path.join(pydir, 'input.txt')):
        super(RuianReader, self).__init__(
            dbname, host, user, passwd, schema,
            input_file
        )

        self._reader = VfrPg(schema_per_file=True,
                             dsn=self._connstr, overwrite=True)

    def download(self):
        self._reader.download(self.input_list)
         
    def importpg(self):
        # re-create schema
        super(RuianReader, self).importpg()

        self._reader.run()

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--dbname",   type=str, default="opengeocr",
                        help = "DB name (default: opengeocr)")
    parser.add_argument("--dbhost",   type=str, default="geo102.fsv.cvut.cz",
                        help = "DB hostname (default: geo102.fsv.cvut.cz)")
    parser.add_argument("--dbuser",   type=str, default="gmuser",
                        help = "DB username")
    parser.add_argument("--dbpasswd", type=str, default="gmuzpd",
                        help = "DB password")

    args = parser.parse_args()

    reader = RuianReader(dbname=args.dbname, host=args.dbhost,
                         user=args.dbuser, passwd=args.dbpasswd)
    reader.download()
    reader.importpg()

    return 0

if __name__ == "__main__":
    sys.exit(main())
