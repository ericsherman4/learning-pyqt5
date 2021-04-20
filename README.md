# learning-pyqt5
ACTUALLY THIS IS NOT USING PYQT5. THIS IS USING PYSIDE2

## App Notes
Using python version 3.9.4
see requirements.txt for info on the other packages
use pip to install all dependancies from requriements file.

qt creator added lots of packages so updated the requirements.txt file with them

## Documentation
following this
https://www.youtube.com/playlist?list=PLfQ7GQSrl0_v1T4Pe_NW4GLaynBfydFy-

## Qt Creator
Need to have a UI or qml file open in order to not have the design tab greyed out.
ctrl R is the shortcut to run

to edit background of shapes or items, double click on the item. IT IS NOT through the panel on the right.

can do alignment (margins in the layout tab) based on other items, but dropping down the target menu. That item has to be a child of it though.

looks like 1 unit for height != 1 unit for width in terms of spacing size. this was the same for tkinter.

use svg for icons so as not to overload the rendering of the application

can you use a "column" item under the Qt Quick - Positioner section. anything you put in here will stack nicely and auto align I think. useful for like side menus. 
