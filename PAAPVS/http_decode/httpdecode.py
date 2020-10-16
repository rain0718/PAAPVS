import sqlite3
from PyQt5.Qt import *
from http_decode_ui import Ui_Form
import subprocess

class Httpdeocde(QDialog,Ui_Form):

    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.file.clicked.connect(self.file_slot)

        import configparser
        self.config = configparser.ConfigParser()
        self.config.read("../config.ini", encoding='utf-8')
        self.version = self.config.get('http_decode', 'version')
        self.sofe_name = self.config.get('http_decode', 'name')
        self.setWindowTitle('{} {}'.format(self.sofe_name, self.version))

    def file_slot(self):
        filename, filetype = QFileDialog.getOpenFileName(self,
                                                          "选取pcap格式文件",
                                                          "./",
                                                          "pcap 格式文件(*.pcap)")  # 设置文件扩展名过滤,注意用双分号间隔
        if filename:
            tshark_cmd = "tshark -r {} -T fields -e ip.src -e ip.dst -e http.request.method  -e http.request.full_uri -e http.request.version  -e http.request.line -e http.response.version -e http.response.code  -e http.response.line  -Y 'http'  -E aggregator=' ' -E separator=' ' ".format(filename)
            status, output = subprocess.getstatusoutput(tshark_cmd)
            if not status:

                self.content.setText(output)

def main():
    import sys
    app = QApplication(sys.argv)
    hd = Httpdeocde()
    hd.show()
    sys.exit(app.exec_())

if __name__ == '__main__':
    main()