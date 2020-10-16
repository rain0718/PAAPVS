# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'MD5ui.ui'
#
# Created by: PyQt5 UI code generator 5.13.2
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_Form(object):
    def setupUi(self, Form):
        Form.setObjectName("Form")
        Form.resize(596, 308)
        self.verticalLayout = QtWidgets.QVBoxLayout(Form)
        self.verticalLayout.setObjectName("verticalLayout")
        self.horizontalLayout = QtWidgets.QHBoxLayout()
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.fileurl = QtWidgets.QLineEdit(Form)
        self.fileurl.setEnabled(False)
        self.fileurl.setObjectName("fileurl")
        self.horizontalLayout.addWidget(self.fileurl)
        self.selectFile = QtWidgets.QPushButton(Form)
        self.selectFile.setObjectName("selectFile")
        self.horizontalLayout.addWidget(self.selectFile)
        self.calcMD5 = QtWidgets.QPushButton(Form)
        self.calcMD5.setObjectName("calcMD5")
        self.horizontalLayout.addWidget(self.calcMD5)
        self.copy2clip = QtWidgets.QPushButton(Form)
        self.copy2clip.setObjectName("copy2clip")
        self.horizontalLayout.addWidget(self.copy2clip)
        self.verticalLayout.addLayout(self.horizontalLayout)
        self.disMD5 = QtWidgets.QTextBrowser(Form)
        self.disMD5.setEnabled(False)
        self.disMD5.setStyleSheet("background-color: rgb(255, 255, 255);\n"
"color: rgb(12, 12, 12);")
        self.disMD5.setObjectName("disMD5")
        self.verticalLayout.addWidget(self.disMD5)

        self.retranslateUi(Form)
        QtCore.QMetaObject.connectSlotsByName(Form)

    def retranslateUi(self, Form):
        _translate = QtCore.QCoreApplication.translate
        Form.setWindowTitle(_translate("Form", "MD5计算(v1.0)"))
        self.selectFile.setText(_translate("Form", "选择文件"))
        self.calcMD5.setText(_translate("Form", "计算MD5"))
        self.copy2clip.setText(_translate("Form", "复制到粘贴板"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Form = QtWidgets.QWidget()
    ui = Ui_Form()
    ui.setupUi(Form)
    Form.show()
    sys.exit(app.exec_())
