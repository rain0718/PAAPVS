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
        self.protocolAnalyzer.clicked.connect(self.protocolAnalyzer_slot)
        self.PMGsystem.clicked.connect(self.PMGsystem_slot)
        # self.testAttribute().clicked.connect(self.bs64_de_en_slot)
        self.other.clicked.connect(self.other_slot)

        self.config = configparser.ConfigParser()
        self.config.read("../config.ini", encoding='utf-8')
        self.version = self.config.get('STISystem', 'version')
        self.sofe_name = self.config.get('STISystem', 'name')
        self.setWindowTitle('{} {}'.format(self.sofe_name,self.version))

        self.protocolAnalyzer.setText(self.config.get('STISystem', 'btn1'))
        self.PMGsystem.setText(self.config.get('STISystem', 'btn2'))
        # self.md5.setText(self.config.get('STISystem', 'btn3'))
        self.other.setText(self.config.get('STISystem', 'btn4'))

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

    def other_slot(self):
        threading.Thread(
            target=lambda: subprocess.run(
                'cd ../other;python ./Vul.py', shell=True)).start()

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
    
