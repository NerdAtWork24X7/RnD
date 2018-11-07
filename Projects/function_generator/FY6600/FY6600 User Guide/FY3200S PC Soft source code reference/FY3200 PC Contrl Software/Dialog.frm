VERSION 5.00
Begin VB.Form Dialog 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   2865
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   4995
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2865
   ScaleWidth      =   4995
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "ËÎÌו"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Text            =   "1"
      Top             =   1320
      Width           =   4575
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "NO"
      Height          =   375
      Left            =   3000
      TabIndex        =   1
      Top             =   2160
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "YES"
      Height          =   375
      Left            =   600
      TabIndex        =   0
      Top             =   2160
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Label"
      BeginProperty Font 
         Name            =   "ËÎÌו"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   360
      TabIndex        =   3
      Top             =   360
      Width           =   4335
   End
End
Attribute VB_Name = "Dialog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub OKButton_Click()

End Sub
