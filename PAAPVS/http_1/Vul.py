#!/usr/bin/python3
#!/home/rain/pythonTest/env/bin/python
import re
import sqlite3
from PyQt5.Qt import *
from http_1_widget import Ui_Form
import sys
from PyQt5 import QtCore
import dns,subprocess
import subprocess, time, os, signal

class Vul(QWidget,Ui_Form):

    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.start.clicked.connect(self.start_slot)
        self.host_agv = ''
        self.port_agv = ''

        import configparser
        self.config = configparser.ConfigParser()
        self.config.read("../config.ini", encoding='utf-8')
        self.version = self.config.get('http_1', 'version')
        self.sofe_name = self.config.get('http_1', 'name')
        self.setWindowTitle('{} {}'.format(self.sofe_name, self.version))
    def closeEvent(self, event):
        status, output = subprocess.getstatusoutput('netstat -apn | grep 26000 | grep python ')
        pid = re.search(r'\d+(?=/python)', output)
        if pid:
            l, r = pid.span()
            status, output = subprocess.getstatusoutput('kill {}'.format(output[l:r]))
        #self.thread.terminate()
        pass

    def start_slot(self):
        self.host_agv = self.host_edit.text()
        self.port_agv = self.port_edit.text()
        self.http_1_start()

    def http_1_start(self):
        self.thread = QThread()
        def run_http_1():
            shell_cmd = 'python http_1.py {} {}'.format(self.host_agv, self.port_agv)
            # shell_cmd = 'bash ./base.sh'
            # shell_cmd = 'ping www.baidu.com -t'
            # p = subprocess.Popen(shell_cmd.split(' '), shell=False, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            self.process_dns = subprocess.Popen(shell_cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

            idx = 0
            while True:
                line = self.process_dns.stdout.readline()
                line = line.strip()
                idx += 1
                time.sleep(1)
                self.content.append("{}:{}".format(idx, line.decode('utf8')))
                if subprocess.Popen.poll(self.process_dns) == 0:
                    break

        self.thread.run = run_http_1
        self.thread.start()

def main():
    app = QApplication(sys.argv)
    vul = Vul()
    vul.show()
    sys.exit(app.exec_())

if __name__ == '__main__':
    main()

