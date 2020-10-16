# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'ftp_widget.ui'
#
# Created by: PyQt5 UI code generator 5.13.2
#
# WARNING! All changes made in this file will be lost!


from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_Form(object):
    def setupUi(self, Form):
        Form.setObjectName("Form")
        Form.resize(802, 608)
        self.verticalLayout = QtWidgets.QVBoxLayout(Form)
        self.verticalLayout.setObjectName("verticalLayout")
        self.widget = QtWidgets.QWidget(Form)
        self.widget.setObjectName("widget")
        self.horizontalLayout = QtWidgets.QHBoxLayout(self.widget)
        self.horizontalLayout.setObjectName("horizontalLayout")
        self.lab = QtWidgets.QLabel(self.widget)
        self.lab.setMinimumSize(QtCore.QSize(50, 0))
        self.lab.setMaximumSize(QtCore.QSize(50, 16777215))
        self.lab.setObjectName("lab")
        self.horizontalLayout.addWidget(self.lab)
        self.host_edit = QtWidgets.QLineEdit(self.widget)
        self.host_edit.setMinimumSize(QtCore.QSize(100, 0))
        self.host_edit.setMaximumSize(QtCore.QSize(100, 16777215))
        self.host_edit.setObjectName("host_edit")
        self.horizontalLayout.addWidget(self.host_edit)
        self.lab_2 = QtWidgets.QLabel(self.widget)
        self.lab_2.setMinimumSize(QtCore.QSize(50, 0))
        self.lab_2.setMaximumSize(QtCore.QSize(50, 16777215))
        self.lab_2.setObjectName("lab_2")
        self.horizontalLayout.addWidget(self.lab_2)
        self.port_edit = QtWidgets.QLineEdit(self.widget)
        self.port_edit.setMinimumSize(QtCore.QSize(100, 0))
        self.port_edit.setMaximumSize(QtCore.QSize(100, 16777215))
        self.port_edit.setObjectName("port_edit")
        self.horizontalLayout.addWidget(self.port_edit)
        self.lab_3 = QtWidgets.QLabel(self.widget)
        self.lab_3.setMinimumSize(QtCore.QSize(50, 0))
        self.lab_3.setMaximumSize(QtCore.QSize(50, 16777215))
        self.lab_3.setObjectName("lab_3")
        self.horizontalLayout.addWidget(self.lab_3)
        self.pwd_edit = QtWidgets.QLineEdit(self.widget)
        self.pwd_edit.setMinimumSize(QtCore.QSize(100, 0))
        self.pwd_edit.setMaximumSize(QtCore.QSize(100, 16777215))
        self.pwd_edit.setObjectName("pwd_edit")
        self.horizontalLayout.addWidget(self.pwd_edit)
        self.lab_4 = QtWidgets.QLabel(self.widget)
        self.lab_4.setMinimumSize(QtCore.QSize(50, 0))
        self.lab_4.setMaximumSize(QtCore.QSize(50, 16777215))
        self.lab_4.setObjectName("lab_4")
        self.horizontalLayout.addWidget(self.lab_4)
        self.user_edit = QtWidgets.QLineEdit(self.widget)
        self.user_edit.setMinimumSize(QtCore.QSize(100, 0))
        self.user_edit.setMaximumSize(QtCore.QSize(100, 16777215))
        self.user_edit.setObjectName("user_edit")
        self.horizontalLayout.addWidget(self.user_edit)
        self.start = QtWidgets.QPushButton(self.widget)
        self.start.setObjectName("start")
        self.horizontalLayout.addWidget(self.start)
        spacerItem = QtWidgets.QSpacerItem(40, 20, QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Minimum)
        self.horizontalLayout.addItem(spacerItem)
        self.verticalLayout.addWidget(self.widget)
        self.content = QtWidgets.QTextBrowser(Form)
        self.content.setObjectName("content")
        self.verticalLayout.addWidget(self.content)

        self.retranslateUi(Form)
        QtCore.QMetaObject.connectSlotsByName(Form)

    def retranslateUi(self, Form):
        _translate = QtCore.QCoreApplication.translate
        Form.setWindowTitle(_translate("Form", "ftp"))
        self.lab.setText(_translate("Form", "host:"))
        self.lab_2.setText(_translate("Form", "port:"))
        self.lab_3.setText(_translate("Form", "pwd:"))
        self.lab_4.setText(_translate("Form", "user:"))
        self.start.setText(_translate("Form", "启动"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Form = QtWidgets.QWidget()
    ui = Ui_Form()
    ui.setupUi(Form)
    Form.show()
    sys.exit(app.exec_())
