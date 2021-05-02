# This Python file uses the following encoding: utf-8
import sys
import os
import datetime as dt

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QTimer


class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

        # QTimer - Run Timer
        self.timer = QTimer()
        # lambda is basically like an inline function (macros type thing like in C)
        self.timer.timeout.connect(lambda: self.setTime())
        # this will trigger the setTime function call every 1 second.
        self.timer.start(1000)

    # Set Name
    setName = Signal(str)

    # Signal Set Data
    printTime = Signal(str)  # this signal will send that data

    # Signal Rectangle Visibles
    rectangleVisible = Signal(bool)

    # Show / Hide Rectangle, we will recieve data back from QML so need to add a slot
    # the parameter after Slot is the type of data we will recieve back.
    @Slot(bool)
    def showHideRectangle(self, isChecked):
        print("Rectangle Visibility: ", isChecked) # because the state already changed
        self.rectangleVisible.emit(isChecked)

    # Set Timer Function (dont need slot because no data is being sent from qml
    def setTime(self):
        now = dt.datetime.now()
        formatDate = now.strftime("%H:%M:%S %p of %m/%d/%Y")
        print(formatDate)
        # we made the signal but we need to emit the data to the QML
        self.printTime.emit(formatDate)

    # Function Set Name to Label
    # the @ symbol is a decorator, see # (https://www.youtube.com/watch?v=r7Dtus7N4pI this is v useful for understanding)
    # more information on all of this https://wiki.qt.io/Qt_for_Python_Signals_and_Slots

    @Slot(str)
    def welcomeText(self, name):
        self.setName.emit("Welcome, " + name)


if __name__ == "__main__":
    print("Created by Eric Sherman using Youtube Tutorials :)")
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # 2nd line here i think makes the connection between qml and python
    main = MainWindow()
    # https://doc.qt.io/qtforpython/tutorials/qmlintegration/qmlintegration.html
    engine.rootContext().setContextProperty("backend", main)

    # next line must point to the main QML file
    engine.load(os.path.join(os.path.dirname(__file__), "./qml/main.qml"))
    # cant run this by itself cause you need a window
    # engine.load(os.path.join(os.path.dirname(__file__), "./qml/controls/LeftMenuBtn.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
