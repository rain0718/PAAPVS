#!/usr/bin/python3
#!/home/rain/pythonTest/env/bin/python
import re
import sqlite3
from PyQt5.Qt import *
from ftp_widget import Ui_Form
import sys
from PyQt5 import QtCore
import dns,subprocess
import subprocess, time, os, signal
import re
class Vul(QWidget,Ui_Form):

    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.start.clicked.connect(self.start_slot)
        self.host_agv = ''
        self.port_agv = ''
        self.pwd_agv = ''
        self.user_agv = ''
        self.ipFormat = ('^(\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])\.'
                  '(\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])\.'
                  '(\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])\.'
                  '(\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])'
                  '$')

        import configparser
        self.config = configparser.ConfigParser()
        self.config.read("../config.ini", encoding='utf-8')
        self.version = self.config.get('ftp', 'version')
        self.sofe_name = self.config.get('ftp', 'name')
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
        self.pwd_agv = self.pwd_edit.text()
        self.user_agv = self.user_edit.text()
        if not re.match(self.ipFormat, self.host_agv):
            QMessageBox.about(self, "提示","ip格式错误")
            return
        if not re.match(r"^\d+$", self.port_agv) or ( int(self.port_agv) <= 0 or int(self.port_agv) > 65535 ):
            QMessageBox.about(self, "提示", "端口格式错误")
            return
        # if not self.user_agv:
        #     QMessageBox.about(self, "提示", "用户名不能为空")
        #     return
        # if not self.pwd_agv:
        #     QMessageBox.about(self, "提示", "密码不能为空")
        #     return

        self.ftp_start()

    def ftp_start(self):
        self.thread = QThread()
        def run_ftp():
            shell_cmd = 'python ftp.py {} {} {} {}'.format(self.host_agv, self.port_agv, self.pwd_agv, self.user_agv )
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

        self.thread.run = run_ftp
        self.thread.start()

def main():
    app = QApplication(sys.argv)
    vul = Vul()
    vul.show()
    sys.exit(app.exec_())

if __name__ == '__main__':
    main()

