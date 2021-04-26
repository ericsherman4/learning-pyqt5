# This Python file uses the following encoding: utf-8
import sys
import os

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    # next line must point to the main QML file
    engine.load(os.path.join(os.path.dirname(__file__), "./qml/main.qml"))
    # engine.load(os.path.join(os.path.dirname(__file__), "./qml/controls/LeftMenuBtn.qml"))
    # cant run this by itself cause you need a window
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
