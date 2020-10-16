# coding='utf-8'

from PyQt5.QtWidgets import QApplication, QWidget,\
    QSplitter, QStyleFactory, QFrame, QHBoxLayout
import sys
from PyQt5.QtCore import Qt


class Gui(QWidget):
    def __init__(self):
        super(Gui, self).__init__()
        self.start()

    def start(self):
        # 设置垂直方向的布局
        hbox = QHBoxLayout(self)

        # 设置三个QFrame组件但是没有设置他们各自的大小
        top_left = QFrame(self)
        # 设置QFrame的形状因此我们可以看到QFrame控件之间的边界
        #     QFrame.StyledPanel是一些枚举常量(表示了不同的形状)
        top_left.setFrameShape(QFrame.StyledPanel)

        top_right = QFrame(self)
        top_right.setFrameShape(QFrame.StyledPanel)

        bottom = QFrame(self)
        bottom.setFrameShape(QFrame.StyledPanel)

        # 创建一共两个组件分割器,第一个分割器是水平的,\
        #         意思就是可以将组件在水平方向上分开
        # 而第二个分割器设置的是垂直的,\
        #          意思是将两个组件在垂直方向上分开
        splitters = [QSplitter(Qt.Horizontal),
                     QSplitter(Qt.Vertical)]
        # 因为第一个分割器是水平的,所以添加进来的两个组件也是水平放置分割的
        splitters[0].addWidget(top_left)
        splitters[0].addWidget(top_right)

        # 因为第二个分割器是垂直的,所以添加进来的两个组件也是垂直放置分割的
        splitters[1].addWidget(splitters[0])
        splitters[1].addWidget(bottom)

        # 在垂直布局中添加第二次分割后的结果(已经包含了所有组件)
        hbox.addWidget(splitters[1])
        # 必须要将主窗体的布局设置成hbox才能生效
        self.setLayout(hbox)

        self.setGeometry(300, 300, 300, 200)
        self.setWindowTitle('组件分割器')
        self.show()


app = QApplication(sys.argv)
gui = Gui()
sys.exit(app.exec_())
