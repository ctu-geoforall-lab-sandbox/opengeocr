import os
import sys
import argparse

pydir = os.path.join(os.path.dirname(os.path.realpath(__file__)))
             
sys.path.insert(0, os.path.join(pydir, '..'))

from pyopengeocr.filereader import OpenGeoCRFileReader

class DibavodReader(OpenGeoCRFileReader):
        
    def __init__(self, dbname, host, user, passwd,
                 schema='dibavod',
                 input_file=os.path.join(pydir, 'input.txt')):
        OpenGeoCRFileReader.__init__(self, dbname, host, user, passwd, schema,
                                     input_file)
        self.url_prefix = 'http://www.dibavod.cz/download.php?id_souboru='
        
    def download(self):
        for id_file in self.input_list:
            self._download('{prefix}{id}'.format(prefix=self.url_prefix, id=id_file))

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--dbname",   type=str, default="opengeocr",
                        help = "DB name (default: opengeocr)")
    parser.add_argument("--dbhost",   type=str, default="geo102.fsv.cvut.cz",
                        help = "DB hostname (default: geo102.fsv.cvut.cz)")
    parser.add_argument("--dbuser",   type=str, required=True,
                        help = "DB username")
    parser.add_argument("--dbpasswd", type=str, required=True,
                        help = "DB password")

    args = parser.parse_args()

    reader = DibavodReader(dbname=args.dbname, host=args.dbhost,
                           user=args.dbuser, passwd=args.dbpasswd)
    reader.download()
    reader.importpg()

    return 0

if __name__ == "__main__":
    sys.exit(main())
