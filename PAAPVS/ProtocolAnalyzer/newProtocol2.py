import sqlite3
from PyQt5.Qt import *
from PyQt5 import QtCore, QtGui, QtWidgets
from newProtocol import Ui_Dialog
class NewProtocol2(QDialog,Ui_Dialog):
    def __init__(self,):
        super().__init__()
        self.setupUi(self)
        self.conn = sqlite3.connect('./protocols.sqlite3')
        self.cursor = self.conn.cursor()
        self.save_pro.clicked.connect(self.save_pro_slot)
        self.exit_btn.clicked.connect(self.close)

    def save_pro_slot(self):

        pro_name = self.proname_edit.text().lower()
        content = self.content_pro.toPlainText()
        if not pro_name:
            self.hint_lab.setText('协议不能为空')
            return
        if not content:
            self.hint_lab.setText('内容不能为空')
            return
        sql = 'select pro_name from protocol where pro_name = ?'
        one = self.cursor.execute(sql, (pro_name,)).fetchone()

        if one:
            self.hint_lab.setText('协议已经存在')
            pass
        else:
            self.hint_lab.setText('协议新建成功')


    def __del__(self):
        self.cursor.close()
        self.conn.close()
        pass

if __name__ == '__main__':
    import sys
    app = QApplication(sys.argv)
    vul = NewProtocol2()
    vul.show()
    sys.exit(app.exec_())