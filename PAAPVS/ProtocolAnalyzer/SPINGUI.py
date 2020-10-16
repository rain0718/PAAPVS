import sqlite3
import subprocess
class SpinHelper():
    def __init__(self,dburl):
        self.conn = sqlite3.connect(dburl)
        self.cursor = self.conn.cursor()
        self.pro = {}
        pass
    def find_protocol(self,pro_name):
        pro_name = pro_name.lower()
        sql = 'select pro_name,filename,pro_content,pml_content,step1,step2,step3,step4,step5,mode,theorem_report from protocol where pro_name = ?'
        one = self.cursor.execute(sql, (pro_name,)).fetchone()
        if not one:
            return False
        names = 'pro_name,filename,pro_content,pml_content,step1,step2,step3,step4,step5,mode,theorem_report'.split(',')
        self.pro = dict(zip(names, one))
        return True


    def write_pro2pml(self):
        if not self.pro['filename'] or not self.pro['pml_content']:
            return
        with open(self.pro['filename'],'w',encoding='utf-8') as f:
            f.write(self.pro['pml_content'])

    def execute_step(self,step):
        status, output = subprocess.getstatusoutput(self.pro[step])
        # print(status, output)
        return self.pro[step],status, output
    def execute_step1(self):
        pass
        status, output = subprocess.getstatusoutput(self.pro['step1'])


    def __del__(self):
        self.cursor.close()
        self.conn.close()

sh = SpinHelper('./protocols.sqlite3')
sh.find_protocol('nscode')
