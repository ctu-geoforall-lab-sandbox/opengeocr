import os
import sys
import argparse

pydir = os.path.join(os.path.dirname(os.path.realpath(__file__)))

sys.path.insert(0, os.path.join(pydir, '..'))
from pyopengeocr.base import OpenGeoCRReader
sys.path.insert(0, os.path.join(pydir, 'iprdownloader'))
from IprPg import IprDownloaderPg

class IprReader(OpenGeoCRReader):

    def __init__(self, dbname, host, user, passwd,
                 schema='ipr',
                 input_file=os.path.join(pydir, 'input.txt')):
        OpenGeoCRReader.__init__(self, schema, input_file)

        # TODO: must be solved in base class!
        self._connstr = "PG:dbname={}".format(dbname)
        if host:
            self._connstr += " host={}".format(host)
        if user:
            self._connstr += " user={}".format(user)
        if passwd:
            self._connstr += " password={}".format(passwd)

        self._reader = IprDownloaderPg(dbname, host,
                                       dbuser=user, dbpasswd=passwd,
                                       dbschema=schema)
        for item in self.input_list:
            self._reader.filter(item, crs='S-JTSK', file_format='shp')

    def download(self):
        self._reader.download(outdir=self.data_dir, only_import=False)

    def importpg(self):
        # re-create schema from scratch
        self._create_schema()

        self._reader.import_data(crs='S-JTSK', overwrite=True)

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

    reader = IprReader(dbname=args.dbname, host=args.dbhost,
                       user=args.dbuser, passwd=args.dbpasswd)
    reader.download()
    reader.importpg()

    return 0

if __name__ == "__main__":
    sys.exit(main())
