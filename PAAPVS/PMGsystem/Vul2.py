import sqlite3
from PyQt5.Qt import *
from songzifang import Ui_Form
import subprocess
import os,threading
class Vul(QDialog,Ui_Form):

    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.conn = sqlite3.connect("./NVD.sqlite3")
        self.cursor = self.conn.cursor()
        self.all.activated[str].connect(self.all_activated_slot)
        self.rule.activated[str].connect(self.rule_activated_slot)
        self.cwe_info.clicked.connect(self.cwe_info_slot)

        self.dns.clicked.connect(self.dns_slot)
        self.snmp.clicked.connect(self.snmp_slot)
        self.http.clicked.connect(self.http_slot)
        self.ftp.clicked.connect(self.ftp_slot)

    def ftp_slot(self):
        # subprocess.getstatusoutput('cd ../ftp;python Vul.py')
        # subprocess.call('cd ../ftp;python Vul.py', shell=True)
        # os.system('cd ../ftp;python Vul.py')
        threading.Thread(target=lambda: subprocess.call('cd ../ftp;python Vul.py', shell=True)).start()
    def http_slot(self):
        # subprocess.getstatusoutput('cd ../http_1;python Vul.py')
        # subprocess.call('cd ../http_1;python Vul.py', shell=True)
        # os.system('cd ../http_1;python Vul.py')
        threading.Thread(target=lambda :subprocess.call('cd ../http_1;python Vul.py', shell=True)).start()
        pass

    def snmp_slot(self):
        # subprocess.getstatusoutput('cd ../snmp;python Vul.py')
        # subprocess.call('cd ../snmp;python Vul.py', shell=True)
        threading.Thread(target=lambda: subprocess.call('cd ../snmp;python Vul.py', shell=True)).start()
    def dns_slot(self):
        # subprocess.getstatusoutput('cd ../dns;python Vul.py')
        # subprocess.call('cd ../dns;python Vul.py', shell=True)
        # os.system('cd ../dns;python Vul.py')
        threading.Thread(target=lambda: subprocess.call('cd ../dns  ;python Vul.py', shell=True)).start()
        pass

    def cwe_info_slot(self):
        header = ['CWE编号', '简述', '名称', '子编号', 'url', '描述', '适用平台', '找出影响', '缓解措施',
                  '已发现实例', '利用可能性', '示范案例']
        sql = 'select cwe_id,bref,name,childs,url,desc,platforms,consequences,mitigations,obs_exam,exploit,dem_exam from cwe_info'

        self.showTable(header,sql)

    # 显示所有厂商漏洞
    def rule_activated_slot(self,text):
        table = ''
        if text == '网络设备关联规则':
            table = 'all_cwe2_csv'
            header = ['规则', '置信度', '支持度', '提升度']
            sql = 'select str,confidence,support,lift from {}'.format(table)
        elif text == '漏洞类别关联规则':
            table = 'all_cpe4_dis_csv'
            header = ['规则', '置信度', '支持度', '提升度']
            sql = 'select str_zn,confidence,support,lift from {}'.format(table)
        if not table:
            return

        self.showTable(header, sql)

    # 显示所有厂商漏洞
    def all_activated_slot(self, text):
        table = ''
        if text == 'dlink漏洞':
            table = 'dlink'
        elif text == 'tplink漏洞':
            table = 'tplink'
        elif text == 'huawei漏洞':
            table = 'huawei'
        elif text == 'tenda漏洞':
            table = 'tenda'
        elif text == '所有漏洞':
            table = 'all_vendor'
        if not table:
            return
        header = ['CVE编号', '描述', '日期', 'score3', 'vector3', 'score2', 'vector2', 'CWE编号', 'CVE名称', '实体']
        sql = 'select cve_id,desc,date,score3,vector3,score2,vector2,cwe_id,cwe_name,cpe from {}'.format(table)
        self.showTable(header, sql)

    def showTable(self, header, sql):
        results = self.cursor.execute(sql).fetchall()
        row = len(results)
        col = len(results[0]) if row > 0 else 0
        self.table.setColumnCount(col)
        self.table.setRowCount(row)  # 列数
        self.table.setHorizontalHeaderLabels(header)  # 横向标题排列，如果使用setVerticalHeaderLabels则是纵向排列标题
        self.table.setEditTriggers(QTableView.NoEditTriggers)
        self.table.setSelectionMode(QAbstractItemView.SingleSelection)  # 设置只能选中一行
        self.table.setSelectionMode(QAbstractItemView.SingleSelection)  # 设置只能选中一行
        for i, it in enumerate(results):
            for j, it2 in enumerate(it):
                it2 = str(it2)
                newItem = QTableWidgetItem(it2)
                self.table.setItem(i, j, newItem)

    def __del__(self):
        self.cursor.close()
        self.conn.close()
        pass

def main():
    import sys
    app = QApplication(sys.argv)
    vul = Vul()
    vul.show()
    sys.exit(app.exec_())

if __name__ == '__main__':
    main()