
from PyQt5.QtWidgets import *
from MD5ui import Ui_Form
import hashlib
import configparser
def MD5ForBigFile(file):
    with open(file, 'rb') as f:
        m = hashlib.md5()
        buffer = 8192

        while True:
            chunk = f.read(buffer)
            if not chunk:
                break
            m.update(chunk)

    return m.hexdigest()

class MD5helper(QWidget,Ui_Form):
    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.selectFile.clicked.connect(self.selectFile_slot)
        self.calcMD5.clicked.connect(self.calcMD5_slot)
        self.clipboard = QApplication.clipboard()
        self.copy2clip.clicked.connect(self.copy2clip_slot)
        self.filename = None
        self.md5value = None

        self.config = configparser.ConfigParser()
        self.config.read("../config.ini", encoding='utf-8')
        self.version = self.config.get('md5Helper', 'version')
        self.sofe_name = self.config.get('md5Helper', 'name')
        self.setWindowTitle('{} {}'.format(self.sofe_name,self.version))
    def copy2clip_slot(self):
        if not self.filename:
            return
        self.clipboard.setText(self.md5value)
        self.disMD5.append('已复制到粘贴板')
    def calcMD5_slot(self):
        if not self.filename:
            return
        self.disMD5.clear()
        self.disMD5.append("正在计算{}中...".format(self.filename))
        QApplication.processEvents()
        self.md5value = MD5ForBigFile(self.filename)
        self.disMD5.clear()
        self.disMD5.append("文件{} MD5为:".format(self.filename))
        self.disMD5.append(self.md5value)
        QApplication.processEvents()

    def selectFile_slot(self):
        filename = self.file_slot()
        if filename:
            self.fileurl.setText(filename)
            self.filename = filename
            self.disMD5.clear()
            self.disMD5.append("选择{} 文件".format(self.filename))

    def file_slot(self):
        filename, filetype = QFileDialog.getOpenFileName(self,
                                                         "选取文件",
                                                         "./",
                                                         "文件(*)")  # 设置文件扩展名过滤,注意用双分号间隔
        return filename

def main():
    import sys
    app = QApplication(sys.argv)
    hd = MD5helper()
    hd.show()
    sys.exit(app.exec_())
if __name__ == '__main__':
    main()