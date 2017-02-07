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
        with codecs.open(input_file, encoding='utf-8') as f:
            data = [line.strip() for line in f]

        return data

    def download(self):
        pass

    def importpg(self):
        pass
