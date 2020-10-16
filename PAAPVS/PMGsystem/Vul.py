# coding=UTF-8
import sqlite3
from PyQt5.Qt import *
from songzifang2 import Ui_MainWindow
import subprocess
import threading
import traceback
import configparser

class Vul(QMainWindow,Ui_MainWindow):

    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.conn = sqlite3.connect("./pmgdb.sqlite3")
        self.conn.row_factory = sqlite3.Row
        self.cursor = self.conn.cursor()

        self.conn2 = sqlite3.connect("./NVD.sqlite3")
        self.conn2.row_factory = sqlite3.Row
        self.cursor2 = self.conn2.cursor()

        # self.protocol_menu.triggered[QAction].connect(self.protocol_menu_slot)
        # self.know_menu.triggered[QAction].connect(self.know_menu_slot)
        # self.xieyi_menu.triggered[QAction].connect(self.protocol_menu_slot)
        # self.help_menu.triggered[QAction].connect(self.help_menu_slot)

        self.protocol_menu.triggered[QAction].connect(self.protocol_menu_slot)
        self.menu_vul.triggered[QAction].connect(self.know_menu_slot)
        self.help_menu.triggered[QAction].connect(self.help_menu_slot)

        self.config = configparser.ConfigParser()
        self.config.read("../config.ini", encoding='utf-8')
        self.version = self.config.get('PMGsystem', 'version')
        self.sofe_name = self.config.get('PMGsystem', 'name')
        self.setWindowTitle('{}'.format(self.sofe_name))

    def help_menu_slot(self):
            QMessageBox.about(self, "关于系统版本",
                              "系统版本：{}".format(self.version))

    def getCmdFromDB(self,name):
        sql = 'select * from name_cmd where name=?'
        one = self.cursor.execute(sql,(name,)).fetchone()
        return one

    def know_menu_slot(self,action):
        try:
            one = self.getCmdFromDB(action.text())
            if one:
                sql = one['sql']
                headers = one['headers'].split(',')
                self.showTable(headers,sql)
        except Exception as e:
            traceback.print_exc()
    def showTable(self, headers, sql):
        results = self.cursor2.execute(sql).fetchall()

        row = len(results)
        col = len(results[0]) if row > 0 else 0
        self.table.setColumnCount(col)
        self.table.setRowCount(row)  # 列数
        self.table.setHorizontalHeaderLabels(headers)  # 横向标题排列，如果使用setVerticalHeaderLabels则是纵向排列标题
        self.table.setEditTriggers(QTableView.NoEditTriggers)
        self.table.setSelectionMode(QAbstractItemView.SingleSelection)  # 设置只能选中一行
        self.table.setSelectionMode(QAbstractItemView.SingleSelection)  # 设置只能选中一行
        for i, it in enumerate(results):
            for j, it2 in enumerate(it):
                it2 = str(it2)
                newItem = QTableWidgetItem(it2)
                self.table.setItem(i, j, newItem)

    def protocol_menu_slot(self,action):
        try:
            one = self.getCmdFromDB(action.text())
            if one:
                cmd = "{};{}".format(one['url'],one['cmd'])
                # print(cmd)
                threading.Thread(target=lambda : subprocess.run(cmd,shell=True)).start()
            else:
                pass
        except Exception as e:
            print(e)


    def __del__(self):
        self.cursor.close()
        self.conn.close()
        self.cursor2.close()
        self.conn2.close()
        pass

def main():
    import sys
    app = QApplication(sys.argv)
    vul = Vul()
    vul.show()
    sys.exit(app.exec_())

if __name__ == '__main__':
    main()