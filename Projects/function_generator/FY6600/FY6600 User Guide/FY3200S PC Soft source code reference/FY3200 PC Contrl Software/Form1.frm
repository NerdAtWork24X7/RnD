VERSION 5.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3360
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   13635
   FillStyle       =   0  'Solid
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3360
   ScaleWidth      =   13635
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'ÆÁÄ»ÖÐÐÄ
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      Height          =   3345
      Left            =   0
      Picture         =   "Form1.frx":0000
      ScaleHeight     =   3285
      ScaleWidth      =   13620
      TabIndex        =   0
      Top             =   0
      Width           =   13680
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

'Private Sub Form_Load()
'    Image1.Picture = LoadPicture("C:\Documents and Settings\Administrator\×ÀÃæ\QQ½ØÍ¼20130316122348.gif")
'    Image1.Stretch = True
'
'End Sub
'
Private Sub Form_Resize()
   Picture1.Move 0, 0, Form1.Width, Form1.Height
End Sub



Private Sub Picture1_Click()
ShellExecute Picture1.hwnd, "open", "http://www.feeltech.cn/", "", "", 5
End Sub
