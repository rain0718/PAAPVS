#!/usr/bin/python3
#!/home/rain/pythonTest/env/bin/python

import sqlite3
from PyQt5.Qt import *
from STISystem import Ui_Form

import subprocess

import sys
import threading
import configparser
class Vul(QWidget,Ui_Form):

    def __init__(self):
        super().__init__()
        self.setupUi(self)
        # self.conn = sqlite3.connect("./NVD.sqlite3")
        # self.cursor = self.conn.cursor()
        self.bs64_de_en.clicked.connect(self.bs64_de_en_slot)
        self.md5.clicked.connect(self.md5_slot)

        self.config = configparser.ConfigParser()
        self.config.read("../config.ini", encoding='utf-8')
        self.version = self.config.get('other', 'version')
        self.sofe_name = self.config.get('other', 'name')
        self.setWindowTitle('{} {}'.format(self.sofe_name,self.version))

        self.md5.setText(self.config.get('other', 'btn1'))
        self.bs64_de_en.setText(self.config.get('other', 'btn2'))

    def protocolAnalyzer_slot(self):
        # status, output = subprocess.getstatusoutput('cd ../ProtocolAnalyzer;python ./protocolAnalyzer.py')

        threading.Thread(
            target=lambda : subprocess.run(
                'cd ../ProtocolAnalyzer;python ./protocolAnalyzer.py',shell=True)).start()

        pass
    def PMGsystem_slot(self):
        # status, output = subprocess.getstatusoutput('cd ../PMGsystem;python ./Vul.py')
        threading.Thread(
            target=lambda: subprocess.run(
                'cd ../PMGsystem;python ./Vul.py', shell=True)).start()
        pass

    def md5_slot(self):
        threading.Thread(
            target=lambda: subprocess.run(
                'cd ../md5Helper;python ./md5helper.py', shell=True)).start()

    def bs64_de_en_slot(self):
        threading.Thread(
            target=lambda: subprocess.run(
                'cd ../bs64Helper;python ./bs64helper.py', shell=True)).start()
        pass

    def __del__(self):
        # self.conn.close()
        # self.cursor.close()
        pass

def main():

    
    app = QApplication(sys.argv)
    vul = Vul()
    vul.show()
    sys.exit(app.exec_())

if __name__ == '__main__':
    main()
    
