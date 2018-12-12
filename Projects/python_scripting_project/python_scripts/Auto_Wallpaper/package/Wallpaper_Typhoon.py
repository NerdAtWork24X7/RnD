# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'D:\scripting_project\python_scripts\Auto_Wallpaper\Gui.ui'
#
# Created by: PyQt5 UI code generator 5.6
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QDialog
import requests
from bs4 import BeautifulSoup
import os
import threading
import sys

no = 1
size = 0
try:
    size = os.path.getsize("log")
except:
    pass

if size > 2000000:
    os.remove("log")

class Ui_Dialog(object):
    option = "None"
    res = "None"

    def setupUi(self, Dialog):
        Dialog.setObjectName("Wallpaper Typhoon")
        Dialog.resize(378, 332)
        self.radioButton = QtWidgets.QRadioButton(Dialog)
        self.radioButton.setGeometry(QtCore.QRect(10, 60, 82, 17))
        self.radioButton.setObjectName("radioButton")
        self.buttonGroup_2 = QtWidgets.QButtonGroup(Dialog)
        self.buttonGroup_2.setObjectName("buttonGroup_2")
        self.buttonGroup_2.addButton(self.radioButton)
        self.radioButton_2 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_2.setGeometry(QtCore.QRect(10, 80, 82, 17))
        self.radioButton_2.setObjectName("radioButton_2")
        self.buttonGroup_2.addButton(self.radioButton_2)
        self.label = QtWidgets.QLabel(Dialog)
        self.label.setGeometry(QtCore.QRect(0, 10, 371, 31))
        self.label.setObjectName("label")
        self.radioButton_3 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_3.setGeometry(QtCore.QRect(10, 100, 82, 17))
        self.radioButton_3.setObjectName("radioButton_3")
        self.buttonGroup_2.addButton(self.radioButton_3)
        self.label_2 = QtWidgets.QLabel(Dialog)
        self.label_2.setGeometry(QtCore.QRect(90, 290, 281, 31))
        self.label_2.setObjectName("label_2")
        self.pushButton = QtWidgets.QPushButton(Dialog)
        self.pushButton.setGeometry(QtCore.QRect(10, 280, 81, 41))
        font = QtGui.QFont()
        font.setPointSize(10)
        font.setBold(True)
        font.setItalic(False)
        font.setWeight(75)
        self.pushButton.setFont(font)
        self.pushButton.setObjectName("pushButton")
        self.radioButton_4 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_4.setGeometry(QtCore.QRect(10, 120, 82, 17))
        self.radioButton_4.setObjectName("radioButton_4")
        self.buttonGroup_2.addButton(self.radioButton_4)
        self.radioButton_5 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_5.setGeometry(QtCore.QRect(10, 180, 82, 17))
        self.radioButton_5.setObjectName("radioButton_5")
        self.buttonGroup_2.addButton(self.radioButton_5)
        self.radioButton_6 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_6.setGeometry(QtCore.QRect(10, 140, 82, 17))
        self.radioButton_6.setObjectName("radioButton_6")
        self.buttonGroup_2.addButton(self.radioButton_6)
        self.radioButton_7 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_7.setGeometry(QtCore.QRect(10, 160, 82, 17))
        self.radioButton_7.setObjectName("radioButton_7")
        self.buttonGroup_2.addButton(self.radioButton_7)
        self.radioButton_8 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_8.setGeometry(QtCore.QRect(10, 200, 82, 17))
        self.radioButton_8.setObjectName("radioButton_8")
        self.buttonGroup_2.addButton(self.radioButton_8)
        self.radioButton_9 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_9.setGeometry(QtCore.QRect(90, 100, 82, 17))
        self.radioButton_9.setObjectName("radioButton_9")
        self.buttonGroup_2.addButton(self.radioButton_9)
        self.radioButton_10 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_10.setGeometry(QtCore.QRect(90, 60, 82, 17))
        self.radioButton_10.setObjectName("radioButton_10")
        self.buttonGroup_2.addButton(self.radioButton_10)
        self.radioButton_11 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_11.setGeometry(QtCore.QRect(90, 80, 82, 17))
        self.radioButton_11.setObjectName("radioButton_11")
        self.buttonGroup_2.addButton(self.radioButton_11)
        self.radioButton_12 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_12.setGeometry(QtCore.QRect(90, 120, 82, 17))
        self.radioButton_12.setObjectName("radioButton_12")
        self.buttonGroup_2.addButton(self.radioButton_12)
        self.radioButton_13 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_13.setGeometry(QtCore.QRect(90, 180, 82, 17))
        self.radioButton_13.setObjectName("radioButton_13")
        self.buttonGroup_2.addButton(self.radioButton_13)
        self.radioButton_14 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_14.setGeometry(QtCore.QRect(90, 140, 82, 17))
        self.radioButton_14.setObjectName("radioButton_14")
        self.buttonGroup_2.addButton(self.radioButton_14)
        self.radioButton_15 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_15.setGeometry(QtCore.QRect(90, 160, 82, 17))
        self.radioButton_15.setObjectName("radioButton_15")
        self.buttonGroup_2.addButton(self.radioButton_15)
        self.radioButton_16 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_16.setGeometry(QtCore.QRect(90, 200, 82, 17))
        self.radioButton_16.setObjectName("radioButton_16")
        self.buttonGroup_2.addButton(self.radioButton_16)
        self.radioButton_17 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_17.setGeometry(QtCore.QRect(180, 80, 82, 17))
        self.radioButton_17.setObjectName("radioButton_17")
        self.buttonGroup_2.addButton(self.radioButton_17)
        self.radioButton_18 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_18.setGeometry(QtCore.QRect(180, 60, 82, 17))
        self.radioButton_18.setObjectName("radioButton_18")
        self.buttonGroup_2.addButton(self.radioButton_18)
        self.radioButton_19 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_19.setGeometry(QtCore.QRect(180, 200, 82, 17))
        self.radioButton_19.setObjectName("radioButton_19")
        self.buttonGroup_2.addButton(self.radioButton_19)
        self.radioButton_20 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_20.setGeometry(QtCore.QRect(180, 100, 82, 17))
        self.radioButton_20.setObjectName("radioButton_20")
        self.buttonGroup_2.addButton(self.radioButton_20)
        self.radioButton_21 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_21.setGeometry(QtCore.QRect(180, 160, 82, 17))
        self.radioButton_21.setObjectName("radioButton_21")
        self.buttonGroup_2.addButton(self.radioButton_21)
        self.radioButton_22 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_22.setGeometry(QtCore.QRect(180, 120, 82, 17))
        self.radioButton_22.setObjectName("radioButton_22")
        self.buttonGroup_2.addButton(self.radioButton_22)
        self.radioButton_23 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_23.setGeometry(QtCore.QRect(180, 180, 82, 17))
        self.radioButton_23.setObjectName("radioButton_23")
        self.buttonGroup_2.addButton(self.radioButton_23)
        self.radioButton_24 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_24.setGeometry(QtCore.QRect(180, 140, 82, 17))
        self.radioButton_24.setObjectName("radioButton_24")
        self.buttonGroup_2.addButton(self.radioButton_24)
        self.radioButton_25 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_25.setGeometry(QtCore.QRect(280, 80, 82, 17))
        self.radioButton_25.setObjectName("radioButton_25")
        self.buttonGroup_2.addButton(self.radioButton_25)
        self.radioButton_26 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_26.setGeometry(QtCore.QRect(280, 200, 82, 17))
        self.radioButton_26.setObjectName("radioButton_26")
        self.buttonGroup_2.addButton(self.radioButton_26)
        self.radioButton_27 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_27.setGeometry(QtCore.QRect(280, 180, 82, 17))
        self.radioButton_27.setObjectName("radioButton_27")
        self.buttonGroup_2.addButton(self.radioButton_27)
        self.radioButton_28 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_28.setGeometry(QtCore.QRect(280, 100, 82, 17))
        self.radioButton_28.setObjectName("radioButton_28")
        self.buttonGroup_2.addButton(self.radioButton_28)
        self.radioButton_29 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_29.setGeometry(QtCore.QRect(280, 120, 82, 17))
        self.radioButton_29.setObjectName("radioButton_29")
        self.buttonGroup_2.addButton(self.radioButton_29)
        self.radioButton_30 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_30.setGeometry(QtCore.QRect(280, 60, 82, 17))
        self.radioButton_30.setObjectName("radioButton_30")
        self.buttonGroup_2.addButton(self.radioButton_30)
        self.radioButton_31 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_31.setGeometry(QtCore.QRect(280, 160, 82, 17))
        self.radioButton_31.setObjectName("radioButton_31")
        self.buttonGroup_2.addButton(self.radioButton_31)
        self.radioButton_32 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_32.setGeometry(QtCore.QRect(280, 140, 82, 17))
        self.radioButton_32.setObjectName("radioButton_32")
        self.buttonGroup_2.addButton(self.radioButton_32)
        self.label_3 = QtWidgets.QLabel(Dialog)
        self.label_3.setGeometry(QtCore.QRect(10, 230, 81, 16))
        font = QtGui.QFont()
        font.setPointSize(10)
        font.setBold(True)
        font.setUnderline(True)
        font.setWeight(75)
        self.label_3.setFont(font)
        self.label_3.setObjectName("label_3")
        self.label_4 = QtWidgets.QLabel(Dialog)
        self.label_4.setGeometry(QtCore.QRect(10, 40, 81, 16))
        font = QtGui.QFont()
        font.setPointSize(10)
        font.setBold(True)
        font.setUnderline(True)
        font.setWeight(75)
        self.label_4.setFont(font)
        self.label_4.setObjectName("label_4")
        self.radioButton_33 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_33.setGeometry(QtCore.QRect(10, 250, 82, 17))
        self.radioButton_33.setObjectName("radioButton_33")
        self.buttonGroup = QtWidgets.QButtonGroup(Dialog)
        self.buttonGroup.setObjectName("buttonGroup")
        self.buttonGroup.addButton(self.radioButton_33)
        self.radioButton_34 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_34.setGeometry(QtCore.QRect(180, 250, 82, 17))
        self.radioButton_34.setObjectName("radioButton_34")
        self.buttonGroup.addButton(self.radioButton_34)
        self.radioButton_35 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_35.setGeometry(QtCore.QRect(90, 250, 82, 17))
        self.radioButton_35.setObjectName("radioButton_35")
        self.buttonGroup.addButton(self.radioButton_35)
        self.radioButton_36 = QtWidgets.QRadioButton(Dialog)
        self.radioButton_36.setGeometry(QtCore.QRect(280, 250, 82, 17))
        self.radioButton_36.setObjectName("radioButton_36")
        self.buttonGroup.addButton(self.radioButton_36)
        self.pushButton_2 = QtWidgets.QPushButton(Dialog)
        self.pushButton_2.setGeometry(QtCore.QRect(340, 10, 31, 31))
        font = QtGui.QFont()
        font.setPointSize(10)
        font.setBold(True)
        font.setUnderline(True)
        font.setWeight(75)
        self.pushButton_2.setFont(font)
        self.pushButton_2.setObjectName("pushButton_2")

        self.retranslateUi(Dialog)
        QtCore.QMetaObject.connectSlotsByName(Dialog)

    def retranslateUi(self, Dialog):
        _translate = QtCore.QCoreApplication.translate
        Dialog.setWindowTitle(_translate("Dialog", "Wallpaper Typhoon"))
        self.radioButton.setText(_translate("Dialog", "All"))
        self.radioButton_2.setText(_translate("Dialog", "3D"))
        self.label.setText(_translate("Dialog",
                                      "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
                                      "<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
                                      "p, li { white-space: pre-wrap; }\n"
                                      "</style></head><body style=\" font-family:\'MS Shell Dlg 2\'; font-size:8pt; font-weight:400; font-style:normal;\">\n"
                                      "<p align=\"center\" style=\" margin-top:12px; margin-bottom:12px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:22pt; font-weight:600; text-decoration: underline; color:#ff0000; vertical-align:super;\">Wallpaper Typhoon</span></p></body></html>"))
        self.radioButton_3.setText(_translate("Dialog", "Abstarct"))
        self.label_2.setText(_translate("Dialog",
                                        "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n""<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
                                        "p, li { white-space: pre-wrap; }\n""</style></head><body style=\" font-family:'Cantarell'; font-size:8pt; font-weight:400; font-style:normal;\">\n"
                                        "<p align=\"center\" style=\" margin-top:12px; margin-bottom:12px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'MS Shell Dlg 2'; font-size:18pt; font-weight:600; text-decoration: underline; color:#ff0000; vertical-align:super;\">Developed by -: Sahil Vartak</span></p></body></html>"))
        self.pushButton.setText(_translate("Dialog", "Start"))

        self.pushButton.clicked.connect(self.Check_C)
        self.pushButton.clicked.connect(self.Extract_image_fast)

        self.radioButton_4.setText(_translate("Dialog", "Animals"))
        self.radioButton_5.setText(_translate("Dialog", "Brands"))
        self.radioButton_6.setText(_translate("Dialog", "Anime"))
        self.radioButton_7.setText(_translate("Dialog", "Art"))
        self.radioButton_8.setText(_translate("Dialog", "Cars"))
        self.radioButton_9.setText(_translate("Dialog", "Fantasy"))
        self.radioButton_10.setText(_translate("Dialog", "City"))
        self.radioButton_11.setText(_translate("Dialog", "Dark"))
        self.radioButton_12.setText(_translate("Dialog", "Flowers"))
        self.radioButton_13.setText(_translate("Dialog", "Girls"))
        self.radioButton_14.setText(_translate("Dialog", "Food"))
        self.radioButton_15.setText(_translate("Dialog", "Games"))
        self.radioButton_16.setText(_translate("Dialog", "Holiday"))
        self.radioButton_17.setText(_translate("Dialog", "Macro"))
        self.radioButton_18.setText(_translate("Dialog", "Love"))
        self.radioButton_19.setText(_translate("Dialog", "Nature"))
        self.radioButton_20.setText(_translate("Dialog", "Men"))
        self.radioButton_21.setText(_translate("Dialog", "Movies"))
        self.radioButton_22.setText(_translate("Dialog", "Minimalism"))
        self.radioButton_23.setText(_translate("Dialog", "Music"))
        self.radioButton_24.setText(_translate("Dialog", "Motorcycle"))
        self.radioButton_25.setText(_translate("Dialog", "Space"))
        self.radioButton_26.setText(_translate("Dialog", "Words"))
        self.radioButton_27.setText(_translate("Dialog", "Vector"))
        self.radioButton_28.setText(_translate("Dialog", "Sport"))
        self.radioButton_29.setText(_translate("Dialog", "TV Series"))
        self.radioButton_30.setText(_translate("Dialog", "Other"))
        self.radioButton_31.setText(_translate("Dialog", "Textures"))
        self.radioButton_32.setText(_translate("Dialog", "Technology"))
        self.label_3.setText(_translate("Dialog", "Resolution:"))
        self.label_4.setText(_translate("Dialog", "Category:"))
        self.radioButton_33.setText(_translate("Dialog", "800x600"))
        self.radioButton_34.setText(_translate("Dialog", "1280x960"))
        self.radioButton_35.setText(_translate("Dialog", "1280x720"))
        self.radioButton_36.setText(_translate("Dialog", "1366x768"))
        self.pushButton_2.setText(_translate("Dialog", "?"))
        self.pushButton_2.clicked.connect(showdialog_Help)

    def Check_C(self):
        self.option = "None"
        self.res = "None"

        if self.radioButton.isChecked():
            self.option = "all"

        elif self.radioButton_2.isChecked():
            self.option = "3D"

        elif self.radioButton_3.isChecked():
            self.option = "abstract"

        elif self.radioButton_4.isChecked():
            self.option = "animals"

        elif self.radioButton_5.isChecked():
            self.option = "brands"

        elif self.radioButton_6.isChecked():
            self.option = "anime"

        elif self.radioButton_7.isChecked():
            self.option = "art"

        elif self.radioButton_8.isChecked():
            self.option = "cars"

        elif self.radioButton_9.isChecked():
            self.option = "fantasy"

        elif self.radioButton_10.isChecked():
            self.option = "city"

        elif self.radioButton_11.isChecked():
            self.option = "dark"

        elif self.radioButton_12.isChecked():
            self.option = "flowers"

        elif self.radioButton_13.isChecked():
            self.option = "girls"

        elif self.radioButton_14.isChecked():
            self.option = "food"

        elif self.radioButton_15.isChecked():
            self.option = "games"

        elif self.radioButton_16.isChecked():
            self.option = "holiday"

        elif self.radioButton_17.isChecked():
            self.option = "macro"

        elif self.radioButton_18.isChecked():
            self.option = "love"

        elif self.radioButton_19.isChecked():
            self.option = "nature"

        elif self.radioButton_20.isChecked():
            self.option = "men"

        elif self.radioButton_21.isChecked():
            self.option = "movies"

        elif self.radioButton_22.isChecked():
            self.option = "minimalism"

        elif self.radioButton_23.isChecked():
            self.option = "music"

        elif self.radioButton_24.isChecked():
            self.option = "motorcycle"

        elif self.radioButton_25.isChecked():
            self.option = "space"

        elif self.radioButton_26.isChecked():
            self.option = "words"

        elif self.radioButton_27.isChecked():
            self.option = "vector"

        elif self.radioButton_28.isChecked():
            self.option = "sport"

        elif self.radioButton_29.isChecked():
            self.option = "tv-series"

        elif self.radioButton_30.isChecked():
            self.option = "other"

        elif self.radioButton_31.isChecked():
            self.option = "textures"

        elif self.radioButton_32.isChecked():
            self.option = "technology"

        else:
            showdialog("Please Select Category","Error")

        if self.radioButton_33.isChecked():
            self.res = "800x600"

        elif self.radioButton_34.isChecked():
            self.res = "1280x960"

        elif self.radioButton_35.isChecked():
            self.res = "1280x720"

        elif self.radioButton_36.isChecked():
            self.res = "1366x768"

        else:
            showdialog("Please Select Resolution","Error")


    def Save_Setting(self):
        fd = open('setting.ini', 'w+')
        fd.write(self.option + '\n')
        fd.write(self.res + '\n')
        fd.close()

    def Restore_setting(self, Backup):
        _translate = QtCore.QCoreApplication.translate
        try:
            fd = open('setting.ini', 'r')
            line = str(fd.readline()).replace("\n", "")
            opt = line
            line = str(fd.readline()).replace("\n", "")
            res = line

            if opt == "all":
                self.radioButton.setChecked(True)

            elif opt == "3D":
                self.radioButton_2.setChecked(True)

            elif opt == "abstract":
                self.radioButton_3.setChecked(True)

            elif opt == "animals":
                self.radioButton_4.setChecked(True)

            elif opt == "brands":
                self.radioButton_5.setChecked(True)

            elif opt == "anime":
                self.radioButton_6.setChecked(True)

            elif opt == "art":
                self.radioButton_7.setChecked(True)

            elif opt == "cars":
                self.radioButton_8.setChecked(True)

            elif opt == "fantasy":
                self.radioButton_9.setChecked(True)

            elif opt == "city":
                self.radioButton_10.setChecked(True)

            elif opt == "dark":
                self.radioButton_11.setChecked(True)

            elif opt == "flowers":
                self.radioButton_12.setChecked(True)

            elif opt == "girls":
                self.radioButton_13.setChecked(True)

            elif opt == "food":
                self.radioButton_14.setChecked(True)

            elif opt == "games":
                self.radioButton_15.setChecked(True)

            elif opt == "holiday":
                self.radioButton_16.setChecked(True)

            elif opt == "macro":
                self.radioButton_17.setChecked(True)

            elif opt == "love":
                self.radioButton_18.setChecked(True)

            elif opt == "nature":
                self.radioButton_19.setChecked(True)

            elif opt == "men":
                self.radioButton_20.setChecked(True)

            elif opt == "movies":
                self.radioButton_21.setChecked(True)

            elif opt == "minimalism":
                self.radioButton_22.setChecked(True)

            elif opt == "music":
                self.radioButton_23.setChecked(True)

            elif opt == "motorcycle":
                self.radioButton_24.setChecked(True)

            elif opt == "Space":
                self.radioButton_25.setChecked(True)

            elif opt == "words":
                self.radioButton_26.setChecked(True)

            elif opt == "vector":
                self.radioButton_27.setChecked(True)

            elif opt == "sport":
                self.radioButton_28.setChecked(True)

            elif opt == "tv-series":
                self.radioButton_29.setChecked(True)

            elif opt == "other":
                self.radioButton_30.setChecked(True)

            elif opt == "textures":
                self.radioButton_31.setChecked(True)

            elif opt == "technology":
                self.radioButton_31.setChecked(True)

            if res == "800x600":
                self.radioButton_33.setChecked(True)

            if res == "1280x960":
                self.radioButton_34.setChecked(True)

            if res == "1280x720":
                self.radioButton_35.setChecked(True)

            if res == "1366x768":
                self.radioButton_36.setChecked(True)

            fd.close()
        except:
            pass

    def Extract_image_fast(self):
        global no
        global res
        if self.option == "None" or self.res == "None":
            return
        if self.option == "all":
            website = "https://wallpaperscraft.com/all/downloads"
        else:
            website = "https://wallpaperscraft.com/catalog/" + self.option + "/downloads"
        showdialog("Downloading " + self.option + "  images at " + self.res + " resolution", "Status")
        try:
            while True:
                if no > 1:
                    page = "/page" + str(no)
                else:
                    page = ""
                re = requests.get(website + page)
                webpage = BeautifulSoup(re.content, features="html.parser")
                cnt = 1
                Return_Flag = 0
                for a_tag in webpage.find_all('a', class_='wallpapers__link', href=True):
                    image_link = str(a_tag['href']).replace("/wallpaper/", "")
                    image_down_link = "https://images.wallpaperscraft.com/image/" + image_link + "_" + self.res + ".jpg"
                    try:
                        fd_log_w = open("log", "a")
                    except:
                        fd_log_w = open("log", "w")
                    if (image_link in open("log").read()) == False:
                        print(image_link)
                        fd_log_w.write(image_link)
                        fd_log_w.close()
                        t1 = threading.Thread(target=self.Save_image(image_down_link, str(cnt)))
                        t1.start()
                        t1.join()
                        t1._stop()
                        #self.Save_image(image_down_link, str(cnt))
                        Return_Flag = 1
                    cnt += 1
                no += 1

                if Return_Flag == 1:
                    showdialog("Successfully Downloaded " + self.option + " images","Progress")
                    self.Save_Setting()
                    return 0
        except:
            showdialog("ERROR:- Page not Found / No Internet connection ","Error")
            # quit()

    def Save_image(self, url, name):
        with open(name + '.jpg', 'wb') as handle:
            response = requests.get(url, stream=True)
            if not response.ok:
                print(response)
            for block in response.iter_content(1024):
                if not block:
                    break
                handle.write(block)

    '''def set_wallpaper():
        SPI_SETDESKWALLPAPER = 20
        ctypes.windll.user32.SystemParametersInfoW(SPI_SETDESKWALLPAPER, 0, 'D:\scripting_project\python_scripts\Auto_Wallpaper\desktop_wallpaper.jpg', 0)'''


########################################################################################################################
def showdialog(str,title):
    _translate = QtCore.QCoreApplication.translate
    global mes
    d.resize(330, 79)
    d.setWindowTitle(title)
    mes.close()
    mes = QtWidgets.QLabel(d)
    mes.setGeometry(QtCore.QRect(20, 10, 300, 20))
    mes.setAlignment(QtCore.Qt.AlignCenter)
    mes.setText(_translate(str, str))

    b1 = QtWidgets.QPushButton("ok", d)
    b1.move(50, 50)
    b1.setGeometry(QtCore.QRect(122, 40, 85, 27))
    b1.setText(_translate("Ok", "OK"))
    b1.clicked.connect(o)
    d.exec_()
    return 0


#################################################################################################################

def showdialog_Help():
    _translate = QtCore.QCoreApplication.translate
    global d
    d.close()
    d = QDialog()
    mes = QtWidgets.QTextBrowser(d)
    d.resize(564, 188)
    d.setWindowTitle("Help")
    mes.close()
    mes.setObjectName("textBrowser")
    mes = QtWidgets.QTextBrowser(d)
    mes.setFrameStyle(QtWidgets.QFrame.NoFrame)
    mes.setGeometry(QtCore.QRect(10, 20, 541, 121))
    mes.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)
    mes.setVerticalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)
    mes.setHtml(_translate("Backup", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n""<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n""</style></head><body style=\" font-family:'Cantarell'; font-size:9pt; font-weight:400; font-style:normal;\">\n"
"<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:20pt;\">Help</span></p>\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:12pt;\">1)https://www.windowscentral.com/enable-windows10-slideshow-and-battery</span></p>\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:12pt;\">2)Select Source path where Wallpaper_Typhoon.exe is present</span><span style=\" color:#ffffff;\"><br /"
"></span></p></body></html>"))

    b1 = QtWidgets.QPushButton("ok", d)
    b1.move(50, 50)
    b1.setGeometry(QtCore.QRect(100, 260, 85, 27))
    b1.setText(_translate("Ok", "OK"))
    b1.clicked.connect(o)
    d.exec_()
    return 0


def o(self):
    d.close()
    return 0


class AppWindow(QDialog):
    def __init__(self):
        super().__init__()
        self.ui = Ui_Dialog()
        self.setWindowIcon(QtGui.QIcon('Backup-Folder-Lavender-icon.png'))
        self.ui.setupUi(self)
        self.ui.Restore_setting(self)
        self.show()


if __name__ == "__main__":

    app = QtWidgets.QApplication(sys.argv)
    w = AppWindow()
    d = QDialog()
    mes = QtWidgets.QLabel(d)
    sys.exit(app.exec_())
    info = json.loads(js.decode("utf-8"))