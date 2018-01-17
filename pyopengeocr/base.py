import os
import shutil
import tempfile
import codecs

class OpenGeoCRReader:
    def __init__(self, schema, input_file, data_dir=None):
        self.schema = schema
        self.input_list = self._filter(input_file)

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

    def _filter(self, input_file):
        data = []
        with codecs.open(input_file, encoding='utf-8') as f:
            for line in f:
                line = line.strip()
                if line.startswith('#'):
                    continue
                data.append(line)

        return data

    def _create_schema(self):
        import psycopg2
        try:
            print 'x', self._connstr.lstrip('PG:')
            conn = psycopg2.connect(self._connstr.lstrip('PG:'))
        except:
            raise OpenGeoCRError("Unabe to connect DB")

        cur = conn.cursor()
        cur.execute("""DROP SCHEMA  IF EXISTS {} CASCADE""".format(self.schema))
        cur.execute("""CREATE SCHEMA {}""".format(self.schema))
        conn.commit()

        cur.close()
        conn.close()

    def download(self):
        pass

    def importpg(self):
        pass
