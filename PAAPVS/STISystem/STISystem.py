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
        self.protocolAnalyzer = QtWidgets.QPushButton(Form)
        self.protocolAnalyzer.setObjectName("protocolAnalyzer")
        self.verticalLayout.addWidget(self.protocolAnalyzer)
        self.PMGsystem = QtWidgets.QPushButton(Form)
        self.PMGsystem.setObjectName("PMGsystem")
        self.verticalLayout.addWidget(self.PMGsystem)
        self.chengdian = QtWidgets.QPushButton(Form)
        self.chengdian.setObjectName("chengdian")
        self.verticalLayout.addWidget(self.chengdian)
        self.other = QtWidgets.QPushButton(Form)
        self.other.setObjectName("other")
        self.verticalLayout.addWidget(self.other)

        self.retranslateUi(Form)
        QtCore.QMetaObject.connectSlotsByName(Form)

    def retranslateUi(self, Form):
        _translate = QtCore.QCoreApplication.translate
        Form.setWindowTitle(_translate("Form", "协议分析与渗透验证软件"))
        self.protocolAnalyzer.setText(_translate("Form", "形式化分析"))
        self.PMGsystem.setText(_translate("Form", "基于知识库的渗透报文生成"))
        self.chengdian.setText(_translate("Form", "模糊测试报文生成"))
        self.other.setText(_translate("Form", "其他"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Form = QtWidgets.QWidget()
    ui = Ui_Form()
    ui.setupUi(Form)
    Form.show()
    sys.exit(app.exec_())
