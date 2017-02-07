class OpenGeoCRReader:
    def __init__(self, schema, input_file):
        self.schema = schema
        self.input_list = self._filter(input_file)

    def _filter(self, input_file):
        with open(input_file, 'r') as f:
            data = [line.strip() for line in f]

        return data

    def download(self):
        pass

    def importpg(self):
        pass
