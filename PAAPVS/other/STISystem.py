# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'STISystem.ui'
#
# Created by: PyQt5 UI code generator 5.13.2
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_Form(object):
    def setupUi(self, Form):
        Form.setObjectName("Form")
        Form.resize(396, 256)
        self.verticalLayout = QtWidgets.QVBoxLayout(Form)
        self.verticalLayout.setObjectName("verticalLayout")
        self.md5 = QtWidgets.QPushButton(Form)
        self.md5.setObjectName("md5")
        self.verticalLayout.addWidget(self.md5)
        self.bs64_de_en = QtWidgets.QPushButton(Form)
        self.bs64_de_en.setObjectName("bs64_de_en")
        self.verticalLayout.addWidget(self.bs64_de_en)

        self.retranslateUi(Form)
        QtCore.QMetaObject.connectSlotsByName(Form)

    def retranslateUi(self, Form):
        _translate = QtCore.QCoreApplication.translate
        Form.setWindowTitle(_translate("Form", "扩展工具"))
        self.md5.setText(_translate("Form", "MD5校验"))
        self.bs64_de_en.setText(_translate("Form", "base64编解码"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Form = QtWidgets.QWidget()
    ui = Ui_Form()
    ui.setupUi(Form)
    Form.show()
    sys.exit(app.exec_())
