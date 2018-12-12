# -*- coding: utf-8 -*-
# Form implementation generated from reading ui file 'backup.ui'
#
# Created by: PyQt5 UI code generator 5.11.2
#
# WARNING! All changes made in this file will be lost!
import sys
import os
import shutil
import time
import threading
import datetime
from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QDialog


class Ui_Backup(object):
    Src = "def"
    pre = "def"
    tar = "def"
    C_Flag = False
    H_Flag = False
    Xdm_FLAG = False
    Txt_FLAG = False
    All_FLAG = False
    Date_FLAG = False

    def setupUi(self, Backup):
        Backup.setObjectName("Backup")
        Backup.resize(472, 320)
        font = QtGui.QFont()
        font.setBold(True)
        font.setWeight(75)
        Backup.setFont(font)
        Backup.setAccessibleName("")
        Backup.setAccessibleDescription("")
        Backup.setAutoFillBackground(True)
        Backup.setSizeGripEnabled(False)
        Backup.setModal(False)

        self.label_2 = QtWidgets.QLabel(Backup)
        self.label_2.setGeometry(QtCore.QRect(10, 40, 111, 21))
        font = QtGui.QFont()
        font.setBold(True)
        font.setWeight(75)
        self.label_2.setFont(font)
        self.label_2.setMouseTracking(False)
        self.label_2.setFrameShape(QtWidgets.QFrame.WinPanel)
        self.label_2.setAlignment(QtCore.Qt.AlignCenter)
        self.label_2.setObjectName("label_2")

        self.label_3 = QtWidgets.QLabel(Backup)
        self.label_3.setGeometry(QtCore.QRect(10, 10, 111, 21))
        font = QtGui.QFont()
        font.setBold(True)
        font.setWeight(75)
        font.setStrikeOut(False)
        self.label_3.setFont(font)
        self.label_3.setMouseTracking(True)
        self.label_3.setFrameShape(QtWidgets.QFrame.WinPanel)
        self.label_3.setFrameShadow(QtWidgets.QFrame.Plain)
        self.label_3.setTextFormat(QtCore.Qt.AutoText)
        self.label_3.setScaledContents(False)
        self.label_3.setAlignment(QtCore.Qt.AlignCenter)
        self.label_3.setObjectName("label_3")

        self.checkBox = QtWidgets.QCheckBox(Backup)
        self.checkBox.setGeometry(QtCore.QRect(130, 70, 51, 17))
        font = QtGui.QFont()
        font.setBold(True)
        font.setWeight(75)
        self.checkBox.setFont(font)
        self.checkBox.setObjectName("checkBox")

        self.label_4 = QtWidgets.QLabel(Backup)
        self.label_4.setGeometry(QtCore.QRect(10, 70, 111, 21))
        font = QtGui.QFont()
        font.setBold(True)
        font.setWeight(75)
        self.label_4.setFont(font)
        self.label_4.setMouseTracking(False)
        self.label_4.setFrameShape(QtWidgets.QFrame.WinPanel)
        self.label_4.setAlignment(QtCore.Qt.AlignCenter)
        self.label_4.setObjectName("label_4")

        self.checkBox_2 = QtWidgets.QCheckBox(Backup)
        self.checkBox_2.setGeometry(QtCore.QRect(190, 70, 51, 17))
        font = QtGui.QFont()
        font.setBold(True)
        font.setWeight(75)
        self.checkBox_2.setFont(font)
        self.checkBox_2.setObjectName("checkBox_2")

        self.checkBox_3 = QtWidgets.QCheckBox(Backup)
        self.checkBox_3.setGeometry(QtCore.QRect(250, 70, 71, 17))
        font = QtGui.QFont()
        font.setBold(True)
        font.setWeight(75)
        self.checkBox_3.setFont(font)
        self.checkBox_3.setObjectName("checkBox_3")

        self.checkBox_4 = QtWidgets.QCheckBox(Backup)
        self.checkBox_4.setGeometry(QtCore.QRect(320, 70, 61, 17))
        font = QtGui.QFont()
        font.setBold(True)
        font.setWeight(75)
        self.checkBox_4.setFont(font)
        self.checkBox_4.setObjectName("checkBox_4")

        self.plainTextEdit = QtWidgets.QPlainTextEdit(Backup)
        self.plainTextEdit.setGeometry(QtCore.QRect(130, 10, 321, 25))
        self.plainTextEdit.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.plainTextEdit.setInputMethodHints(QtCore.Qt.ImhNone)
        self.plainTextEdit.setVerticalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)
        self.plainTextEdit.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)
        self.plainTextEdit.setDocumentTitle("")
        self.plainTextEdit.setPlainText("")
        self.plainTextEdit.setOverwriteMode(False)
        self.plainTextEdit.setBackgroundVisible(True)
        self.plainTextEdit.setObjectName("plainTextEdit")

        self.plainTextEdit_2 = QtWidgets.QPlainTextEdit(Backup)
        self.plainTextEdit_2.setGeometry(QtCore.QRect(130, 40, 321, 25))
        self.plainTextEdit_2.setVerticalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)
        self.plainTextEdit_2.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)
        self.plainTextEdit_2.setPlainText("")
        self.plainTextEdit_2.setBackgroundVisible(True)
        self.plainTextEdit_2.setObjectName("plainTextEdit_2")

        self.progressBar = QtWidgets.QProgressBar(Backup)
        self.progressBar.setGeometry(QtCore.QRect(130, 250, 321, 23))
        self.progressBar.setProperty("value", 0)
        self.progressBar.setObjectName("progressBar")

        self.pushButton = QtWidgets.QPushButton(Backup)
        self.pushButton.setGeometry(QtCore.QRect(10, 250, 111, 61))
        font = QtGui.QFont()
        font.setPointSize(9)
        font.setBold(True)
        font.setItalic(False)
        font.setWeight(75)
        self.pushButton.setFont(font)
        self.pushButton.setMouseTracking(False)
        self.pushButton.setFocusPolicy(QtCore.Qt.ClickFocus)
        self.pushButton.setAutoFillBackground(True)
        self.pushButton.setObjectName("pushButton")

        self.pushButton_2 = QtWidgets.QPushButton(Backup)
        self.pushButton_2.setGeometry(QtCore.QRect(420, 280, 31, 27))
        font = QtGui.QFont()
        font.setPointSize(9)
        font.setBold(True)
        font.setItalic(False)
        font.setWeight(75)
        self.pushButton_2.setFont(font)
        self.pushButton_2.setMouseTracking(False)
        self.pushButton_2.setFocusPolicy(QtCore.Qt.ClickFocus)
        self.pushButton_2.setAutoFillBackground(True)
        self.pushButton_2.setObjectName("pushButton_2")

        self.label = QtWidgets.QLabel(Backup)
        self.label.setGeometry(QtCore.QRect(130, 280, 281, 31))
        self.label.setMinimumSize(QtCore.QSize(71, 0))
        self.label.setAutoFillBackground(False)
        self.label.setFrameShape(QtWidgets.QFrame.WinPanel)
        self.label.setTextFormat(QtCore.Qt.RichText)
        self.label.setAlignment(QtCore.Qt.AlignCenter)
        self.label.setWordWrap(False)
        self.label.setObjectName("label")
        self.label_5 = QtWidgets.QLabel(Backup)
        self.label_5.setGeometry(QtCore.QRect(10, 100, 111, 21))
        font = QtGui.QFont()
        font.setBold(True)
        font.setWeight(75)
        self.label_5.setFont(font)
        self.label_5.setMouseTracking(False)
        self.label_5.setFrameShape(QtWidgets.QFrame.WinPanel)
        self.label_5.setAlignment(QtCore.Qt.AlignCenter)
        self.label_5.setObjectName("label_5")
        self.checkBox_5 = QtWidgets.QCheckBox(Backup)
        self.checkBox_5.setGeometry(QtCore.QRect(390, 70, 61, 17))
        font = QtGui.QFont()
        font.setBold(True)
        font.setWeight(75)
        self.checkBox_5.setFont(font)
        self.checkBox_5.setObjectName("checkBox_5")
        self.plainTextEdit_3 = QtWidgets.QPlainTextEdit(Backup)
        self.plainTextEdit_3.setGeometry(QtCore.QRect(130, 100, 241, 25))
        self.plainTextEdit_3.setFocusPolicy(QtCore.Qt.WheelFocus)
        self.plainTextEdit_3.setVerticalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)
        self.plainTextEdit_3.setHorizontalScrollBarPolicy(QtCore.Qt.ScrollBarAlwaysOff)
        self.plainTextEdit_3.setPlainText("")
        self.plainTextEdit_3.setBackgroundVisible(True)
        self.plainTextEdit_3.setObjectName("plainTextEdit_3")
        self.checkBox_6 = QtWidgets.QCheckBox(Backup)
        self.checkBox_6.setGeometry(QtCore.QRect(390, 100, 61, 17))
        font = QtGui.QFont()
        font.setBold(True)
        font.setWeight(75)
        self.checkBox_6.setFont(font)
        self.checkBox_6.setChecked(True)
        self.checkBox_6.setObjectName("checkBox_6")
        self.label_6 = QtWidgets.QLabel(Backup)
        self.label_6.setGeometry(QtCore.QRect(10, 130, 111, 21))
        font = QtGui.QFont()
        font.setBold(True)
        font.setWeight(75)
        self.label_6.setFont(font)
        self.label_6.setMouseTracking(False)
        self.label_6.setFrameShape(QtWidgets.QFrame.WinPanel)
        self.label_6.setAlignment(QtCore.Qt.AlignCenter)
        self.label_6.setObjectName("label_6")
        self.textEdit = QtWidgets.QTextEdit(Backup)
        self.textEdit.setGeometry(QtCore.QRect(10, 160, 441, 81))
        self.textEdit.setDocumentTitle("")
        self.textEdit.setTextInteractionFlags(QtCore.Qt.TextEditorInteraction)
        self.textEdit.setObjectName("textEdit")

        self.retranslateUi(Backup)
        QtCore.QMetaObject.connectSlotsByName(Backup)

    def retranslateUi(self, Backup):
        _translate = QtCore.QCoreApplication.translate
        Backup.setWindowTitle(_translate("Backup", "Save Time"))
        self.label_2.setText(_translate("Backup", "Target Folder"))
        self.label_3.setText(_translate("Backup", "Source Folder"))
        self.label_4.setText(_translate("Backup", "Extension"))
        self.label_5.setText(_translate("Backup", "Task"))
        self.label_6.setText(_translate("Backup", "Comment"))

        self.checkBox.setToolTip(_translate("Backup", "Select C Source Files"))
        self.checkBox.setText(_translate("Backup", "*.c"))

        self.checkBox_2.setToolTip(_translate("Backup", "Select Header Files"))
        self.checkBox_2.setText(_translate("Backup", "*.h"))
        self.checkBox_3.setToolTip(_translate("Backup", "Select XDM Files"))
        self.checkBox_3.setText(_translate("Backup", "*.xdm"))
        self.checkBox_4.setToolTip(_translate("Backup", "Select text files"))
        self.checkBox_4.setText(_translate("Backup", "*.txt"))
        self.checkBox_5.setToolTip(_translate("Backup", "Select Complete Directory"))
        self.checkBox_5.setText(_translate("Backup", "*.all"))
        self.checkBox_6.setToolTip(_translate("Backup", "Select Date to Create a unique Folder name"))
        self.checkBox_6.setText(_translate("Backup", "*.date"))

        self.plainTextEdit.setToolTip(_translate("Backup", "Enter Source Folder Path"))
        self.plainTextEdit_2.setToolTip(_translate("Backup", "Enter Destination Folder Path"))
        self.pushButton.setToolTip(_translate("Backup", "Push To Take Backup"))
        self.pushButton.setText(_translate("Backup", "Backup"))
        self.pushButton.clicked.connect(self.Check_C)
        self.pushButton.clicked.connect(self.Read_Src_Dest_Pre)
        #        self.pushButton.clicked.connect(self.Progress_Bar)
        self.pushButton.clicked.connect(self.Start_Backup)

        self.pushButton_2.setToolTip(_translate("Backup", "Help"))
        self.pushButton_2.setText(_translate("Backup", "?"))
        self.pushButton_2.clicked.connect(self.Help)

        self.plainTextEdit_3.setToolTip(_translate("Backup", "Enter Folder name Task"))
        self.plainTextEdit_3.setWhatsThis(_translate("Backup", "Enter Folder name Task"))
        self.textEdit.setToolTip(_translate("Backup", "Enter Change History"))

        self.textEdit.setHtml(_translate("Backup",
                                         "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
                                         "<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
                                         "p, li { white-space: pre-wrap; }\n"
                                         "</style></head><body style=\" font-family:\'Cantarell\'; font-size:9pt; font-weight:600; font-style:normal;\">\n"
                                         "<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p></body></html>"))
        self.label.setText(_translate("Backup",
                                      "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
                                      "<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
                                      "p, li { white-space: pre-wrap; }\n"
                                      "</style></head><body style=\" font-family:\'MS Shell Dlg 2\'; font-size:8pt; font-weight:400; font-style:normal;\">\n"
                                      "<p style=\" margin-top:12px; margin-bottom:12px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:12pt; font-weight:600; color:#000000;\">Developed By -:</span><span style=\" font-size:12pt; font-weight:600; color:#ff0000;\"> Sahil Vartak</span></p></body></html>"))

    def Help(self):
        showdialog_Help()


    def Save_comment(self):
        try:
            with open(str(self.Target_path) + '/Change History.txt', 'w') as file:
                file.write(str(self.textEdit.toPlainText()))
        except:
            pass

    def Read_Src_Dest_Pre(self):
        self.Src = self.plainTextEdit.toPlainText()
        self.tar = self.plainTextEdit_2.toPlainText()
        self.pre = self.plainTextEdit_3.toPlainText()

    def Progress_Bar(self):
        src_size = self.get_size(self.Source_path)
        self.comp = 0
        while self.comp < 100:
            des_size = self.get_size(self.Target_path)
            self.comp = (des_size / src_size) * 100
            self.progressBar.setValue(self.comp)
            time.sleep(0.5)

    def get_size(self, start_path):
        total_size = 0
        for dirpath, dirnames, filenames in os.walk(start_path):
            for f in filenames:
                fp = os.path.join(dirpath, f)
                total_size += os.path.getsize(fp)
        return total_size

    def Progress_Bar_inc(self, Total, Actu):
        self.comp = (Actu / Total) * 100
        self.progressBar.setValue(self.comp)

    def Check_C(self):
        self.C_Flag = "Null"
        self.H_Flag = "Null"
        self.Xdm_FLAG = "Null"
        self.Txt_FLAG = "Null"
        self.All_FLAG = "Null"
        self.Date_FLAG = "Null"

        if self.checkBox_5.isChecked():
            self.All_FLAG = "All"
            #print("all Checkbox tick")

        if self.checkBox.isChecked():
            self.C_Flag = ".c"
            #print("C Source Checkbox tick")
        if self.checkBox_2.isChecked():
            self.H_Flag = ".h"
            #print("Header Checkbox tick")
        if self.checkBox_3.isChecked():
            self.Xdm_FLAG = ".xdm"
            #print("XDM Checkbox tick")
        if self.checkBox_4.isChecked():
            self.Txt_FLAG = ".txt"
            #print("text Checkbox tick")

        if self.checkBox_6.isChecked():
            self.Date_FLAG = True
            #print("date Checkbox tick")

    def Start_Backup(self):

        if os.path.isdir(self.Src) == False:
            showdialog("Please Provide correct Source Path")

        if os.path.isdir(self.tar) == False:
            showdialog("Please Provide correct Target Path")

        if os.path.isdir(self.Src) == True and os.path.isdir(self.tar) == True:
            if (self.C_Flag != "Null" or self.H_Flag != "Null" or \
                    self.Xdm_FLAG != "Null" or self.Txt_FLAG != "Null" or self.All_FLAG != "Null"):
                self.Source_path = self.Src
                self.Target_path = self.tar

                if self.pre.replace(" ", "") != "":
                    self.Target_path = self.Target_path + "/" + self.pre

                date = str(datetime.datetime.now()).replace("-", "_")
                date = date.replace(":", "_")
                date = date.replace(".", "_")
                date = date.replace(" ", "___")
                self.Target_path = self.Target_path + "/" + date
                print("Target_path = " + self.Target_path)
                print("Source_path = " + self.Source_path)
                print("Start Back Up")
                self.Save_Setting()

                if self.All_FLAG == "All":
                    t1 = threading.Thread(target=self.Progress_Bar)
                    t1.start()
                    try:
                        shutil.copytree(self.Source_path, str(self.Target_path))
                    except:
                        fd_error.write("ERROR copying:--" + self.Source_path + '\n')
                    t1.join()
                    t1._stop()
                else:
                    self.Total_Cnt = 0
                    for root, dirs, files in os.walk(self.Source_path):  # replace the . with your starting directory
                        for sfile in files:
                            if sfile.endswith(self.C_Flag) or sfile.endswith(self.H_Flag) or \
                                    sfile.endswith(self.Xdm_FLAG) or sfile.endswith(self.Txt_FLAG):
                                self.Total_Cnt += 1
                    self.copyFilesWithProgress(self.Source_path, self.Target_path)
                self.Save_comment()
                self.Progress_Bar_inc(self.Total_Cnt, self.Copied_Cnt)
                showdialog("DONE")
            else:
                showdialog("Select file Extension")

    def makedirs(self, dest):
        if not os.path.exists(dest):
            os.makedirs(dest)

    def copyFilesWithProgress(self, src, dest):

        if self.Total_Cnt > 0:
            self.makedirs(dest)
            self.Copied_Cnt = 0
            for path, dirs, filenames in os.walk(src):
                self.Progress_Bar_inc(self.Total_Cnt, self.Copied_Cnt)
                for sfile in filenames:
                    if sfile.endswith(self.C_Flag) or sfile.endswith(self.H_Flag) or sfile.endswith(self.Xdm_FLAG) or \
                            sfile.endswith(self.Txt_FLAG):
                        srcFile = os.path.join(path, sfile)
                        destFile = os.path.join(path.replace(src, dest), sfile)
                        desDir = destFile.replace(sfile, "")
                        self.makedirs(desDir)
                        try:
                            shutil.copy(srcFile, destFile)
                        except:
                            fd_error.write("ERROR copying:--" + srcFile + '\n')
                        self.Copied_Cnt += 1

    def Save_Setting(self):
        fd = open('setting.ini', 'w+')
        fd.write(self.plainTextEdit.toPlainText() + '\n')
        fd.write(self.plainTextEdit_2.toPlainText() + '\n')
        fd.write(self.plainTextEdit_3.toPlainText() + '\n')
        fd.write(str(self.C_Flag) + '\n')
        fd.write(str(self.H_Flag) + '\n')
        fd.write(str(self.Xdm_FLAG) + '\n')
        fd.write(str(self.Txt_FLAG) + '\n')
        fd.write(str(self.All_FLAG) + '\n')
        fd.write(str(self.Date_FLAG) + '\n')
        fd.close()

    def Restore_setting(self, Backup):
        _translate = QtCore.QCoreApplication.translate
        try:
            fd = open('setting.ini', 'r')
            line = str(fd.readline()).replace("\n", "")
            self.plainTextEdit.setPlainText(line)
            line = str(fd.readline()).replace("\n", "")
            self.plainTextEdit_2.setPlainText(line)
            line = str(fd.readline()).replace("\n", "")
            self.plainTextEdit_3.setPlainText(line)

            line = str(fd.readline()).replace("\n", "")
            if line == ".c":
                self.checkBox.setChecked(True)

            line = str(fd.readline()).replace("\n", "")
            if line == ".h":
                self.checkBox_2.setChecked(True)

            line = str(fd.readline()).replace("\n", "")
            if line == ".xdm":
                self.checkBox_3.setChecked(True)

            line = str(fd.readline()).replace("\n", "")
            if line == ".txt":
                self.checkBox_4.setChecked(True)

            line = str(fd.readline()).replace("\n", "")
            if line == "All":
                self.checkBox_5.setChecked(True)

            line = str(fd.readline()).replace("\n", "")
            if line == "True":
                self.checkBox_6.setChecked(True)
            fd.close()
        except:
            pass


#######################################################################################################################
class AppWindow(QDialog):
    def __init__(self):
        super().__init__()
        self.ui = Ui_Backup()
        self.setWindowIcon(QtGui.QIcon('Backup-Folder-Lavender-icon.png'))
        self.ui.setupUi(self)
        self.ui.Restore_setting(self)
        self.show()


########################################################################################################################
def showdialog(str):
    _translate = QtCore.QCoreApplication.translate
    global mes
    d.resize(253, 79)
    d.setWindowTitle("Error")
    mes.close()
    mes = QtWidgets.QLabel(d)
    mes.setGeometry(QtCore.QRect(20, 10, 211, 20))
    mes.setAlignment(QtCore.Qt.AlignCenter)
    mes.setText(_translate(str, str))

    b1 = QtWidgets.QPushButton("ok", d)
    b1.move(50, 50)
    b1.setGeometry(QtCore.QRect(80, 40, 85, 27))
    b1.setText(_translate("Ok", "OK"))
    b1.clicked.connect(o)
    d.exec_()
    return 0


def showdialog_Help():
    _translate = QtCore.QCoreApplication.translate
    global mes
    global d
    d.close()
    d = QDialog()
    mes = QtWidgets.QLabel(d)
    d.resize(304, 304)
    d.setWindowTitle("Help")
    mes.close()
    mes = QtWidgets.QLabel(d)
    mes.setGeometry(QtCore.QRect(20, 20, 271, 231))
    mes.setText(_translate("Backup", '<html><head/><body><p><span style=\" font-weight:600; text-decoration: underline;\">Source Folder </span><span style=\" font-weight:600;\">-</span> Enter Valid Source Folder path</p><p><span style=\" font-weight:600; text-decoration: underline;\">Target Folder</span><span style=\" font-weight:600;\"> - </span>Enter Valid Destination Folder Path</p><p><span style=\" font-weight:600; text-decoration: underline;\">Extension</span> - Select File Extension to copy</p><p><span style=\" font-weight:600; text-decoration: underline;\">Task</span><span style=\" font-weight:600;\"> - </span>Create Task Folder </p><p><span style=\" font-weight:600; text-decoration: underline;\">Comment</span><span style=\" font-weight:600;\"> - </span>Change History</p><p><span style=\" font-weight:600; text-decoration: underline;\">?</span><span style=\" font-weight:600;\"> - </span>Help</p><p><span style=\" font-weight:600; text-decoration: underline;\">Backup</span><span style=\" font-weight:600;\"> - </span>Push To Start Copying</p><p" \
                        "><span style=\" font-weight:600; text-decoration: underline;\">Note</span><span style=\" font-weight:600;\"/><span style=\" font-weight:600;\">-</span> Error log file is generated for excluded files</p></body></html>'))

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


########################################################################################################################
app = QApplication(sys.argv)
fd_error = open("Error_log.txt", "w+")
w = AppWindow()
d = QDialog()
mes = QtWidgets.QLabel(d)
sys.exit(app.exec_())

info = json.loads(js.decode("utf-8"))