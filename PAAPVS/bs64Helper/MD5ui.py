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
        self.fileurl.setEnabled(True)
        self.fileurl.setObjectName("fileurl")
        self.horizontalLayout.addWidget(self.fileurl)
        self.bs64encode = QtWidgets.QPushButton(Form)
        self.bs64encode.setObjectName("bs64encode")
        self.horizontalLayout.addWidget(self.bs64encode)
        self.bs64decode = QtWidgets.QPushButton(Form)
        self.bs64decode.setObjectName("bs64decode")
        self.horizontalLayout.addWidget(self.bs64decode)
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
        Form.setWindowTitle(_translate("Form", "bs64计算(v1.0)"))
        self.bs64encode.setText(_translate("Form", "bs64编码"))
        self.bs64decode.setText(_translate("Form", "bs64解码"))
        self.copy2clip.setText(_translate("Form", "复制到粘贴板"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Form = QtWidgets.QWidget()
    ui = Ui_Form()
    ui.setupUi(Form)
    Form.show()
    sys.exit(app.exec_())
