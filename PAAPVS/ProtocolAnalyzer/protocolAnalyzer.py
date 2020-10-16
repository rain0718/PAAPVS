import sqlite3
from PyQt5.Qt import *
from PyQt5 import QtCore, QtGui, QtWidgets
from spin import Ui_MainWindow
from SPINGUI import SpinHelper
import configparser
class protocolAnalyzer(QtWidgets.QMainWindow,Ui_MainWindow):
    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.conn = sqlite3.connect("./NVD.sqlite3")
        self.cursor = self.conn.cursor()
        self.menu_protocol.triggered[QAction].connect(self.protocol_action_solt)
        self.spinHelper = SpinHelper("./protocols.sqlite3")
        self.toolBar.actionTriggered[QAction].connect(self.step_action_solt)

        self.menu_help.triggered[QAction].connect(self.menu_help_slot)

        self.config = configparser.ConfigParser()
        self.config.read("../config.ini", encoding='utf-8')
        self.version = self.config.get('ProtocolAnalyzer', 'version')
        self.sofe_name = self.config.get('ProtocolAnalyzer', 'name')
        self.setWindowTitle('{}'.format(self.sofe_name))

    def menu_help_slot(self,action):
        if action.text() == '版本':
            QMessageBox.about(self, "关于系统版本",
                              "版本：{}".format(self.version))
            
    def new_protocol_slot(self):
        from newProtocol2 import NewProtocol2
        np = NewProtocol2()
        np.exec_()
    def protocol_action_solt(self,action):
        if not self.spinHelper.find_protocol(action.text()):
            return
        self.source_edit.clear()
        self.pml_edit.clear()
        self.report_edit.clear()
        if self.spinHelper.pro['mode'] == 'normal':
            self.spinHelper.write_pro2pml()
            self.source_edit.appendPlainText(self.spinHelper.pro['pro_content'])
        elif self.spinHelper.pro['mode'] == 'theorem':
            self.source_edit.appendPlainText(self.spinHelper.pro['pro_content'])
            pass
        elif self.spinHelper.pro['mode'] == 'other':
            self.spinHelper.write_pro2pml()
            self.pml_edit.appendPlainText(self.spinHelper.pro['pml_content'])

    def step_action_solt(self,action):
        if action.text() == '转换':
            if self.spinHelper.pro['mode'] == 'normal':
                cmd, status, output = self.spinHelper.execute_step('step1')
                #self.report_edit.appendPlainText(cmd)
                cmd, status, output = self.spinHelper.execute_step('step2')
                #self.report_edit.appendPlainText(cmd)
                self.pml_edit.appendPlainText(self.spinHelper.pro['pml_content'])
            elif self.spinHelper.pro['mode'] == 'theorem':
                self.pml_edit.appendPlainText(self.spinHelper.pro['pml_content'])
            elif self.spinHelper.pro['mode'] == 'other':
                pass
        elif action.text() == '运行':
            if self.spinHelper.pro['mode'] == 'normal':
                cmd, status, output = self.spinHelper.execute_step('step3')
                #self.report_edit.appendPlainText(cmd)
                self.report_edit.appendPlainText(output)
            elif self.spinHelper.pro['mode'] == 'theorem':
                self.report_edit.appendPlainText(self.spinHelper.pro['theorem_report'])
            elif self.spinHelper.pro['mode'] == 'other':
                cmd, status, output = self.spinHelper.execute_step('step1')
                self.report_edit.appendPlainText(cmd)
                cmd, status, output = self.spinHelper.execute_step('step2')
                self.report_edit.appendPlainText(cmd)
                cmd, status, output = self.spinHelper.execute_step('step3')
                self.report_edit.appendPlainText(cmd)
                self.report_edit.appendPlainText(output)
        elif action.text() == '报告':
            if self.spinHelper.pro['mode'] == 'normal':
                cmd, status, output  = self.spinHelper.execute_step('step4')
                self.report_edit.appendPlainText(cmd)
                self.report_edit.appendPlainText(output)
            elif self.spinHelper.pro['mode'] == 'theorem':
                pass
            elif self.spinHelper.pro['mode'] == 'other':
                cmd, status, output = self.spinHelper.execute_step('step4')
                self.report_edit.appendPlainText(cmd)
                self.report_edit.appendPlainText(output)
        elif action.text() == '报告图':
            if self.spinHelper.pro['mode'] == 'normal':
                cmd, status, output = self.spinHelper.execute_step('step5')
                self.report_edit.appendPlainText(cmd)
                self.report_edit.appendPlainText(output)
            elif self.spinHelper.pro['mode'] == 'theorem':
                pass
            elif self.spinHelper.pro['mode'] == 'other':
                cmd, status, output = self.spinHelper.execute_step('step5')
                self.report_edit.appendPlainText(cmd)
                self.report_edit.appendPlainText(output)

    def __del__(self):
        self.cursor.close()
        self.conn.close()
        pass

def main():
    import sys
    app = QApplication(sys.argv)
    vul = protocolAnalyzer()
    vul.show()
    sys.exit(app.exec_())


if __name__ == '__main__':
    main()