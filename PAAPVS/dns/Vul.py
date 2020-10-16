#!/usr/bin/python3
#!/home/rain/pythonTest/env/bin/python
import re
import sqlite3
from PyQt5.Qt import *
from dns_widget import Ui_Form
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
        self.version = self.config.get('dns', 'version')
        self.sofe_name = self.config.get('dns', 'name')
        self.setWindowTitle('{} {}'.format(self.sofe_name, self.version))

    def closeEvent(self, event):
        try:
            status, output = subprocess.getstatusoutput('netstat -apn | grep 26000 | grep python ')
            pid = re.search(r'\d+(?=/python)', output)
            if pid:
                l, r = pid.span()
                status, output = subprocess.getstatusoutput('kill {}'.format(output[l:r]))
            self.thread.terminate()
            pass
        except Exception as e:
            print(e)

    def start_slot(self):
        self.host_agv = self.host_edit.text()
        self.port_agv = self.port_edit.text()
        self.dns_start()

    def dns_start(self):
        self.thread = QThread()
        def run_dns():
            shell_cmd = 'python dns.py {} {}'.format(self.host_agv, self.port_agv)
            # shell_cmd = 'bash ./base.sh'
            # shell_cmd = 'ping www.baidu.com -t'
            # p = subprocess.Popen(shell_cmd.split(' '), shell=False, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            self.process_dns = subprocess.Popen(shell_cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            # subprocess.call('python dns.py', shell=True)
            idx = 0
            while True:
                line = self.process_dns.stdout.readline()
                line = line.strip()
                idx += 1
                time.sleep(1)
                self.content.append("{}:{}".format(idx, line.decode('utf8')))
                if subprocess.Popen.poll(self.process_dns) == 0:
                    break

        self.thread.run = run_dns
        self.thread.start()

def main():
    app = QApplication(sys.argv)
    vul = Vul()
    vul.show()
    sys.exit(app.exec_())

if __name__ == '__main__':
    main()

