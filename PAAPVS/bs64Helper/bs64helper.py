
from PyQt5.QtWidgets import *
from MD5ui import Ui_Form
import hashlib
import base64
import configparser
class Bs64helper(QWidget,Ui_Form):
    def __init__(self):
        super().__init__()
        self.setupUi(self)
        self.bs64encode.clicked.connect(self.encode_slot)
        self.bs64decode.clicked.connect(self.decode_slot)
        self.clipboard = QApplication.clipboard()
        self.copy2clip.clicked.connect(self.copy2clip_slot)

        self.url = None
        self.bsurl = None

        self.config = configparser.ConfigParser()
        self.config.read("../config.ini", encoding='utf-8')
        self.version = self.config.get('bs64Helper', 'version')
        self.sofe_name = self.config.get('bs64Helper', 'name')
        self.setWindowTitle('{} {}'.format(self.sofe_name,self.version))

    def copy2clip_slot(self):
        if self.url:
            self.clipboard.setText(self.url)
            self.disMD5.append('已复制到粘贴板')
        elif self.bsurl:
            self.clipboard.setText(self.bsurl)
            self.disMD5.append('已复制到粘贴板')
    def encode_slot(self):
        url = self.fileurl.text()
        self.url = url

        bytes_url = url.encode("utf-8")
        str_url = base64.b64encode(bytes_url)  # 被编码的参数必须是二进制数据
        self.bsurl = str_url.decode('utf8')
        self.disMD5.append('{} base64编码为：{}'.format(url,self.bsurl))

        self.url = None

    def decode_slot(self):
        bsurl = self.fileurl.text()
        self.url = base64.b64decode(bsurl).decode("utf-8")
        self.disMD5.append('{} base64解码为：{}'.format(bsurl,self.url))
        self.bsurl = None


def main():
    import sys
    app = QApplication(sys.argv)
    hd = Bs64helper()
    hd.show()
    sys.exit(app.exec_())
if __name__ == '__main__':
    main()