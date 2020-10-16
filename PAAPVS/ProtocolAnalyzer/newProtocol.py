# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'newProtocol.ui'
#
# Created by: PyQt5 UI code generator 5.13.2
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_Dialog(object):
    def setupUi(self, Dialog):
        Dialog.setObjectName("Dialog")
        Dialog.resize(562, 401)
        self.verticalLayout = QtWidgets.QVBoxLayout(Dialog)
        self.verticalLayout.setObjectName("verticalLayout")
        self.horizontalLayout = QtWidgets.QHBoxLayout()
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.label = QtWidgets.QLabel(Dialog)
        self.label.setStyleSheet("font: 9pt \"Arial\";")
        self.label.setObjectName("label")
        self.horizontalLayout.addWidget(self.label)
        self.proname_edit = QtWidgets.QLineEdit(Dialog)
        self.proname_edit.setInputMask("")
        self.proname_edit.setObjectName("proname_edit")
        self.horizontalLayout.addWidget(self.proname_edit)
        self.save_pro = QtWidgets.QPushButton(Dialog)
        self.save_pro.setObjectName("save_pro")
        self.horizontalLayout.addWidget(self.save_pro)
        self.exit_btn = QtWidgets.QPushButton(Dialog)
        self.exit_btn.setObjectName("exit_btn")
        self.horizontalLayout.addWidget(self.exit_btn)
        self.hint_lab = QtWidgets.QLabel(Dialog)
        self.hint_lab.setMinimumSize(QtCore.QSize(100, 0))
        self.hint_lab.setCursor(QtGui.QCursor(QtCore.Qt.ArrowCursor))
        self.hint_lab.setStyleSheet("color: rgb(255, 0, 0);\n"
"font: 75 9pt \"Arial\";")
        self.hint_lab.setText("")
        self.hint_lab.setObjectName("hint_lab")
        self.horizontalLayout.addWidget(self.hint_lab)
        self.verticalLayout.addLayout(self.horizontalLayout)
        self.content_pro = QtWidgets.QPlainTextEdit(Dialog)
        self.content_pro.setObjectName("content_pro")
        self.verticalLayout.addWidget(self.content_pro)

        self.retranslateUi(Dialog)
        QtCore.QMetaObject.connectSlotsByName(Dialog)

    def retranslateUi(self, Dialog):
        _translate = QtCore.QCoreApplication.translate
        Dialog.setWindowTitle(_translate("Dialog", "新建协议"))
        self.label.setText(_translate("Dialog", "协议名称："))
        self.save_pro.setText(_translate("Dialog", "保存"))
        self.exit_btn.setText(_translate("Dialog", "退出"))
        self.content_pro.setPlaceholderText(_translate("Dialog", "此处输入协议内容"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Dialog = QtWidgets.QDialog()
    ui = Ui_Dialog()
    ui.setupUi(Dialog)
    Dialog.show()
    sys.exit(app.exec_())
