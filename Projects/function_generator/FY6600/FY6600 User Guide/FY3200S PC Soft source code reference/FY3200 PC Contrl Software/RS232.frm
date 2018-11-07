VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "mscomm32.ocx"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "tabctl32.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{6FBA474E-43AC-11CE-9A0E-00AA0062BB4C}#1.0#0"; "SYSINFO.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "mscomctl.ocx"
Begin VB.Form COMForm 
   ClientHeight    =   9048
   ClientLeft      =   60
   ClientTop       =   756
   ClientWidth     =   14772
   FillStyle       =   0  'Solid
   Icon            =   "RS232.frx":0000
   LinkTopic       =   "Form1"
   MouseIcon       =   "RS232.frx":0CCA
   ScaleHeight     =   9048
   ScaleWidth      =   14772
   StartUpPosition =   2  '屏幕中心
   Begin VB.TextBox Text34 
      BackColor       =   &H00FFFF00&
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   7.8
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFF00&
      Height          =   460
      Left            =   4080
      TabIndex        =   154
      Top             =   8520
      Width           =   3252
   End
   Begin VB.TextBox Text37 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   13.8
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   460
      Left            =   12120
      Locked          =   -1  'True
      TabIndex        =   153
      Text            =   "PORT:No Connected"
      Top             =   8520
      Width           =   2532
   End
   Begin VB.TextBox Text36 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   13.8
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   460
      Left            =   10080
      Locked          =   -1  'True
      TabIndex        =   152
      Text            =   "MODEL:"
      Top             =   8520
      Width           =   2052
   End
   Begin VB.TextBox Text33 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   13.8
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   460
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   151
      Top             =   8520
      Width           =   3972
   End
   Begin VB.TextBox Text2 
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   13.8
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   460
      Left            =   7320
      TabIndex        =   150
      Text            =   "Data write area:1"
      Top             =   8520
      Width           =   2772
   End
   Begin SysInfoLib.SysInfo SysInfo1 
      Left            =   10200
      Top             =   120
      _ExtentX        =   995
      _ExtentY        =   995
      _Version        =   393216
   End
   Begin MSComctlLib.StatusBar StatusBar2 
      Align           =   2  'Align Bottom
      Height          =   36
      Left            =   0
      TabIndex        =   9
      Top             =   9012
      Width           =   14772
      _ExtentX        =   26056
      _ExtentY        =   64
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   10800
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   7932
      Left            =   120
      TabIndex        =   0
      Top             =   480
      Width           =   14532
      _ExtentX        =   25633
      _ExtentY        =   13991
      _Version        =   393216
      Tabs            =   4
      Tab             =   2
      TabsPerRow      =   4
      TabHeight       =   520
      ForeColor       =   16711680
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "宋体"
         Size            =   10.8
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TabCaption(0)   =   "Waveform Window"
      TabPicture(0)   =   "RS232.frx":0FD4
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "Label17(5)"
      Tab(0).Control(1)=   "Label17(4)"
      Tab(0).Control(2)=   "Label17(3)"
      Tab(0).Control(3)=   "Label17(2)"
      Tab(0).Control(4)=   "Label17(0)"
      Tab(0).Control(5)=   "Label24(0)"
      Tab(0).Control(6)=   "Label22(2)"
      Tab(0).Control(7)=   "Label20(4)"
      Tab(0).Control(8)=   "Label26(6)"
      Tab(0).Control(9)=   "Label28(8)"
      Tab(0).Control(10)=   "Label16(7)"
      Tab(0).Control(11)=   "Label16(6)"
      Tab(0).Control(12)=   "Label16(5)"
      Tab(0).Control(13)=   "Label16(4)"
      Tab(0).Control(14)=   "Label16(3)"
      Tab(0).Control(15)=   "Label16(2)"
      Tab(0).Control(16)=   "Label16(1)"
      Tab(0).Control(17)=   "Label16(0)"
      Tab(0).Control(18)=   "Label2(10)"
      Tab(0).Control(19)=   "Label4(12)"
      Tab(0).Control(20)=   "Label6(14)"
      Tab(0).Control(21)=   "Label8(16)"
      Tab(0).Control(22)=   "Label10(18)"
      Tab(0).Control(23)=   "Label12(20)"
      Tab(0).Control(24)=   "Label14(22)"
      Tab(0).Control(25)=   "Label16(24)"
      Tab(0).Control(26)=   "Picture1"
      Tab(0).Control(27)=   "Text3"
      Tab(0).Control(28)=   "Command4"
      Tab(0).Control(29)=   "Command2"
      Tab(0).ControlCount=   30
      TabCaption(1)   =   "Text Window"
      TabPicture(1)   =   "RS232.frx":0FF0
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "Frame2"
      Tab(1).Control(1)=   "Picture2"
      Tab(1).Control(2)=   "Command1"
      Tab(1).Control(3)=   "Command3"
      Tab(1).Control(4)=   "Cmdsend"
      Tab(1).Control(5)=   "Textsend"
      Tab(1).ControlCount=   6
      TabCaption(2)   =   "Contrl Window"
      TabPicture(2)   =   "RS232.frx":100C
      Tab(2).ControlEnabled=   -1  'True
      Tab(2).Control(0)=   "Frame12"
      Tab(2).Control(0).Enabled=   0   'False
      Tab(2).Control(1)=   "Frame5"
      Tab(2).Control(1).Enabled=   0   'False
      Tab(2).Control(2)=   "Frame6"
      Tab(2).Control(2).Enabled=   0   'False
      Tab(2).Control(3)=   "Frame9"
      Tab(2).Control(3).Enabled=   0   'False
      Tab(2).Control(4)=   "Frame4"
      Tab(2).Control(4).Enabled=   0   'False
      Tab(2).Control(5)=   "Frame3"
      Tab(2).Control(5).Enabled=   0   'False
      Tab(2).Control(6)=   "Frame1"
      Tab(2).Control(6).Enabled=   0   'False
      Tab(2).Control(7)=   "Frame13"
      Tab(2).Control(7).Enabled=   0   'False
      Tab(2).ControlCount=   8
      TabCaption(3)   =   "Configuration Window"
      TabPicture(3)   =   "RS232.frx":1028
      Tab(3).ControlEnabled=   0   'False
      Tab(3).Control(0)=   "Text4"
      Tab(3).Control(0).Enabled=   0   'False
      Tab(3).ControlCount=   1
      Begin VB.Frame Frame13 
         BackColor       =   &H8000000A&
         Caption         =   "ASK"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   972
         Left            =   12360
         TabIndex        =   145
         Top             =   6840
         Width           =   2052
         Begin VB.CommandButton Command28 
            Caption         =   "Ext"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   14.4
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1320
            Style           =   1  'Graphical
            TabIndex        =   149
            Top             =   360
            Width           =   612
         End
         Begin VB.CommandButton Command27 
            Caption         =   "Manual"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   14.4
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   148
            Top             =   360
            Width           =   1092
         End
         Begin VB.CommandButton Command26 
            Caption         =   "Command9"
            Height          =   255
            Left            =   2160
            TabIndex        =   147
            Top             =   2280
            Width           =   255
         End
         Begin VB.CommandButton Command25 
            Caption         =   "Command8"
            Height          =   300
            Left            =   2160
            TabIndex        =   146
            Top             =   1920
            Width           =   255
         End
      End
      Begin VB.Frame Frame1 
         BackColor       =   &H8000000A&
         Caption         =   "FSK"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   972
         Left            =   7320
         TabIndex        =   139
         Top             =   6840
         Width           =   5052
         Begin VB.CommandButton Command24 
            Caption         =   "CH2"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   14.4
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   144
            Top             =   1800
            Width           =   1695
         End
         Begin VB.CommandButton Command23 
            Caption         =   "Ext"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   14.4
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   4320
            Style           =   1  'Graphical
            TabIndex        =   142
            Top             =   360
            Width           =   612
         End
         Begin VB.CommandButton Command22 
            Caption         =   "Manual"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   14.4
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   3120
            Style           =   1  'Graphical
            TabIndex        =   141
            Top             =   360
            Width           =   1092
         End
         Begin VB.TextBox Text32 
            Alignment       =   1  'Right Justify
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   15
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   840
            MaxLength       =   7
            TabIndex        =   140
            Text            =   "1000000"
            Top             =   360
            Width           =   2172
         End
         Begin VB.Label Label9 
            BackColor       =   &H8000000A&
            Caption         =   "FREQ2"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   10.8
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Index           =   1
            Left            =   120
            TabIndex        =   143
            Top             =   480
            Width           =   735
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "data Attribute "
         Height          =   1455
         Left            =   -70320
         TabIndex        =   132
         Top             =   6240
         Width           =   2055
         Begin VB.OptionButton Option7 
            Caption         =   "Hexadecimal Data"
            Height          =   375
            Left            =   120
            TabIndex        =   134
            Top             =   960
            Width           =   1815
         End
         Begin VB.OptionButton Option6 
            Caption         =   "Decimal Data"
            Height          =   255
            Left            =   120
            TabIndex        =   133
            Top             =   480
            Width           =   1575
         End
      End
      Begin VB.PictureBox Picture2 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H00C0FFC0&
         ForeColor       =   &H80000008&
         Height          =   1455
         Left            =   -67920
         ScaleHeight     =   1475
         ScaleMode       =   0  'User
         ScaleWidth      =   7185
         TabIndex        =   131
         Top             =   6240
         Width           =   7215
         Begin VB.Line Line3 
            BorderColor     =   &H00000000&
            BorderStyle     =   3  'Dot
            X1              =   0
            X2              =   7199.993
            Y1              =   745.763
            Y2              =   745.763
         End
         Begin VB.Line Line4 
            BorderColor     =   &H00000000&
            BorderStyle     =   3  'Dot
            Index           =   0
            X1              =   1800.248
            X2              =   1800.248
            Y1              =   0
            Y2              =   1490.494
         End
         Begin VB.Line Line4 
            BorderColor     =   &H00000000&
            BorderStyle     =   3  'Dot
            Index           =   1
            X1              =   3600.497
            X2              =   3600.497
            Y1              =   0
            Y2              =   1490.494
         End
         Begin VB.Line Line4 
            BorderColor     =   &H00000000&
            BorderStyle     =   3  'Dot
            Index           =   2
            X1              =   5399.745
            X2              =   5399.745
            Y1              =   0
            Y2              =   1490.494
         End
      End
      Begin VB.Frame Frame3 
         BackColor       =   &H8000000A&
         Caption         =   "CH1"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   4932
         Left            =   120
         TabIndex        =   79
         Top             =   480
         Width           =   7092
         Begin VB.HScrollBar HScroll12 
            Height          =   200
            Left            =   1080
            Max             =   10000
            TabIndex        =   137
            Top             =   4560
            Value           =   1
            Width           =   3135
         End
         Begin VB.TextBox Text31 
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   18
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   3720
            TabIndex        =   136
            Text            =   "nS"
            Top             =   4080
            Width           =   495
         End
         Begin VB.TextBox Text1 
            Alignment       =   1  'Right Justify
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   21.6
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   1080
            MaxLength       =   10
            TabIndex        =   135
            Text            =   "10.00"
            Top             =   4080
            Width           =   2655
         End
         Begin VB.TextBox Text5 
            Alignment       =   1  'Right Justify
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   21.6
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   525
            Left            =   1080
            MaxLength       =   11
            TabIndex        =   100
            Text            =   "10000.00"
            Top             =   1200
            Width           =   2655
         End
         Begin VB.HScrollBar HScroll1 
            Height          =   200
            Left            =   1080
            Max             =   20000
            TabIndex        =   99
            Top             =   1680
            Width           =   3135
         End
         Begin VB.TextBox Text13 
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   18
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   480
            Left            =   3720
            TabIndex        =   98
            Text            =   "Hz"
            Top             =   1200
            Width           =   495
         End
         Begin VB.Frame Frame7 
            BackColor       =   &H8000000A&
            Caption         =   "Duty"
            Height          =   1095
            Left            =   4440
            TabIndex        =   93
            Top             =   3720
            Width           =   2415
            Begin VB.TextBox Text12 
               Alignment       =   1  'Right Justify
               BeginProperty Font 
                  Name            =   "宋体"
                  Size            =   14.4
                  Charset         =   134
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Left            =   120
               MaxLength       =   4
               TabIndex        =   97
               Text            =   "50.0"
               Top             =   240
               Width           =   1335
            End
            Begin VB.HScrollBar HScroll2 
               Height          =   200
               Left            =   120
               Max             =   999
               Min             =   1
               MousePointer    =   4  'Icon
               TabIndex        =   96
               Top             =   720
               Value           =   500
               Width           =   1575
            End
            Begin VB.TextBox Text14 
               BeginProperty Font 
                  Name            =   "宋体"
                  Size            =   14.4
                  Charset         =   134
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Left            =   1440
               TabIndex        =   95
               Text            =   "%"
               Top             =   240
               Width           =   285
            End
            Begin VB.CommandButton Command20 
               Caption         =   "Set"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   12
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   615
               Left            =   1800
               Style           =   1  'Graphical
               TabIndex        =   94
               Top             =   240
               Width           =   495
            End
         End
         Begin VB.PictureBox Picture4 
            AutoRedraw      =   -1  'True
            AutoSize        =   -1  'True
            Height          =   1572
            Left            =   4440
            ScaleHeight     =   1566.417
            ScaleMode       =   0  'User
            ScaleWidth      =   2355
            TabIndex        =   92
            Top             =   360
            Width           =   2415
            Begin VB.Line Line6 
               BorderStyle     =   3  'Dot
               Index           =   8
               X1              =   5400.362
               X2              =   5400.362
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line6 
               BorderStyle     =   3  'Dot
               Index           =   7
               X1              =   4799.658
               X2              =   4799.658
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line6 
               BorderStyle     =   3  'Dot
               Index           =   6
               X1              =   4199.949
               X2              =   4199.949
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line6 
               BorderStyle     =   3  'Dot
               Index           =   5
               X1              =   3600.241
               X2              =   3600.241
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line5 
               BorderStyle     =   3  'Dot
               Index           =   4
               X1              =   0
               X2              =   6000.07
               Y1              =   2484.271
               Y2              =   2484.271
            End
            Begin VB.Line Line6 
               BorderStyle     =   3  'Dot
               Index           =   4
               X1              =   2999.537
               X2              =   2999.537
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line6 
               Index           =   3
               X1              =   2399.829
               X2              =   2399.829
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line6 
               BorderStyle     =   3  'Dot
               Index           =   2
               X1              =   1800.121
               X2              =   1800.121
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line6 
               BorderStyle     =   3  'Dot
               Index           =   1
               X1              =   1200.412
               X2              =   1200.412
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line5 
               BorderStyle     =   3  'Dot
               Index           =   3
               X1              =   0
               X2              =   6000.07
               Y1              =   1987.828
               Y2              =   1987.828
            End
            Begin VB.Line Line5 
               BorderStyle     =   3  'Dot
               Index           =   1
               X1              =   0
               X2              =   6000.07
               Y1              =   993.914
               Y2              =   993.914
            End
            Begin VB.Line Line6 
               BorderStyle     =   3  'Dot
               Index           =   0
               X1              =   599.708
               X2              =   599.708
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line5 
               BorderStyle     =   3  'Dot
               Index           =   0
               X1              =   0
               X2              =   6000.07
               Y1              =   496.443
               Y2              =   496.443
            End
         End
         Begin VB.TextBox Text9 
            Alignment       =   1  'Right Justify
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   21.6
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   1080
            MaxLength       =   5
            TabIndex        =   91
            Text            =   "10.00"
            Top             =   2160
            Width           =   2655
         End
         Begin VB.TextBox Text15 
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   18
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   3720
            TabIndex        =   90
            Text            =   "V"
            Top             =   2160
            Width           =   495
         End
         Begin VB.HScrollBar HScroll3 
            Height          =   200
            Left            =   1080
            Max             =   2000
            TabIndex        =   89
            Top             =   2640
            Value           =   1000
            Width           =   3135
         End
         Begin VB.TextBox Text16 
            Alignment       =   1  'Right Justify
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   21.6
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   1080
            MaxLength       =   6
            TabIndex        =   88
            Text            =   "0.00"
            Top             =   3120
            Width           =   2655
         End
         Begin VB.TextBox Text17 
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   18
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   3720
            TabIndex        =   87
            Text            =   "V"
            Top             =   3120
            Width           =   495
         End
         Begin VB.HScrollBar HScroll4 
            Height          =   200
            Left            =   1080
            Max             =   2000
            TabIndex        =   86
            Top             =   3600
            Value           =   1000
            Width           =   3135
         End
         Begin VB.ComboBox Combo3 
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15.6
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   408
            ItemData        =   "RS232.frx":1044
            Left            =   1080
            List            =   "RS232.frx":1087
            TabIndex        =   85
            Text            =   "Sine wave"
            Top             =   360
            Width           =   3135
         End
         Begin VB.HScrollBar HScroll5 
            Height          =   200
            Left            =   1080
            Max             =   20
            TabIndex        =   84
            Top             =   800
            Width           =   3135
         End
         Begin VB.Frame Frame8 
            BackColor       =   &H8000000A&
            Caption         =   "Reference Phase"
            Enabled         =   0   'False
            Height          =   1095
            Left            =   4440
            TabIndex        =   80
            Top             =   2280
            Width           =   2415
            Begin VB.HScrollBar HScroll11 
               Height          =   200
               Left            =   240
               Max             =   359
               TabIndex        =   83
               Top             =   720
               Width           =   1935
            End
            Begin VB.TextBox Text28 
               BeginProperty Font 
                  Name            =   "宋体"
                  Size            =   21.6
                  Charset         =   134
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   480
               Left            =   1800
               TabIndex        =   82
               Text            =   "°"
               Top             =   240
               Width           =   375
            End
            Begin VB.TextBox Text29 
               Alignment       =   1  'Right Justify
               BeginProperty Font 
                  Name            =   "宋体"
                  Size            =   21.6
                  Charset         =   134
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   480
               Left            =   240
               MaxLength       =   3
               TabIndex        =   81
               Text            =   "0"
               Top             =   240
               Width           =   1575
            End
         End
         Begin VB.Label Label3 
            BackColor       =   &H8000000A&
            Caption         =   "PULSE"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15.6
               Charset         =   134
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   372
            Index           =   2
            Left            =   240
            TabIndex        =   138
            Top             =   4200
            Width           =   852
         End
         Begin VB.Label Label1 
            BackColor       =   &H8000000A&
            Caption         =   "FREQ"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15.6
               Charset         =   134
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   372
            Index           =   0
            Left            =   240
            TabIndex        =   104
            Top             =   1320
            Width           =   732
         End
         Begin VB.Label Label3 
            BackColor       =   &H8000000A&
            Caption         =   "AMPL"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15.6
               Charset         =   134
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   372
            Index           =   0
            Left            =   240
            TabIndex        =   103
            Top             =   2280
            Width           =   732
         End
         Begin VB.Label Label5 
            BackColor       =   &H8000000A&
            Caption         =   "BIAS"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15.6
               Charset         =   134
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   372
            Index           =   0
            Left            =   240
            TabIndex        =   102
            Top             =   3240
            Width           =   732
         End
         Begin VB.Label Label7 
            BackColor       =   &H8000000A&
            Caption         =   "WAVE"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15.6
               Charset         =   134
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   372
            Index           =   0
            Left            =   240
            TabIndex        =   101
            Top             =   480
            Width           =   732
         End
      End
      Begin VB.Frame Frame4 
         BackColor       =   &H8000000A&
         Caption         =   "Save"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1332
         Left            =   12360
         TabIndex        =   73
         Top             =   5520
         Width           =   2052
         Begin VB.CommandButton Command8 
            Caption         =   "Command8"
            Height          =   300
            Left            =   2160
            TabIndex        =   78
            Top             =   1920
            Width           =   255
         End
         Begin VB.CommandButton Command9 
            Caption         =   "Command9"
            Height          =   255
            Left            =   2160
            TabIndex        =   77
            Top             =   2280
            Width           =   255
         End
         Begin VB.ComboBox Combo2 
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   12
               Charset         =   134
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   336
            ItemData        =   "RS232.frx":119E
            Left            =   120
            List            =   "RS232.frx":11DE
            TabIndex        =   76
            Text            =   "M0 Start data"
            Top             =   360
            Width           =   1740
         End
         Begin VB.CommandButton Command10 
            Caption         =   "SAVE"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   372
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   75
            Top             =   840
            Width           =   852
         End
         Begin VB.CommandButton Command11 
            Caption         =   "LOAD"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   372
            Left            =   1080
            Style           =   1  'Graphical
            TabIndex        =   74
            Top             =   840
            Width           =   852
         End
      End
      Begin VB.Frame Frame9 
         BackColor       =   &H8000000A&
         Caption         =   "CH2"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   4932
         Left            =   7320
         TabIndex        =   42
         Top             =   480
         Width           =   7092
         Begin VB.CheckBox Check4 
            BackColor       =   &H8000000A&
            Height          =   255
            Left            =   120
            TabIndex        =   68
            Top             =   480
            Width           =   255
         End
         Begin VB.CheckBox Check3 
            BackColor       =   &H8000000A&
            Height          =   255
            Left            =   120
            TabIndex        =   67
            Top             =   4080
            Width           =   255
         End
         Begin VB.CheckBox Check2 
            BackColor       =   &H8000000A&
            Height          =   255
            Left            =   120
            TabIndex        =   66
            Top             =   2880
            Width           =   255
         End
         Begin VB.CheckBox Check1 
            BackColor       =   &H8000000A&
            CausesValidation=   0   'False
            Height          =   255
            Left            =   120
            TabIndex        =   65
            Top             =   1680
            Width           =   255
         End
         Begin VB.PictureBox Picture5 
            AutoRedraw      =   -1  'True
            AutoSize        =   -1  'True
            Height          =   1572
            Left            =   4560
            ScaleHeight     =   1566.417
            ScaleMode       =   0  'User
            ScaleWidth      =   2355
            TabIndex        =   64
            Top             =   360
            Width           =   2415
            Begin VB.Line Line6 
               BorderStyle     =   3  'Dot
               Index           =   9
               X1              =   5400.362
               X2              =   5400.362
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line6 
               BorderStyle     =   3  'Dot
               Index           =   10
               X1              =   4799.658
               X2              =   4799.658
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line6 
               BorderStyle     =   3  'Dot
               Index           =   11
               X1              =   4199.949
               X2              =   4199.949
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line6 
               BorderStyle     =   3  'Dot
               Index           =   12
               X1              =   3600.241
               X2              =   3600.241
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line5 
               BorderStyle     =   3  'Dot
               Index           =   5
               X1              =   0
               X2              =   6000.07
               Y1              =   2484.271
               Y2              =   2484.271
            End
            Begin VB.Line Line6 
               BorderStyle     =   3  'Dot
               Index           =   13
               X1              =   2999.537
               X2              =   2999.537
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line6 
               Index           =   14
               X1              =   2399.829
               X2              =   2399.829
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line6 
               BorderStyle     =   3  'Dot
               Index           =   15
               X1              =   1800.121
               X2              =   1800.121
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line6 
               BorderStyle     =   3  'Dot
               Index           =   16
               X1              =   1200.412
               X2              =   1200.412
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line5 
               BorderStyle     =   3  'Dot
               Index           =   6
               X1              =   0
               X2              =   6000.07
               Y1              =   1987.828
               Y2              =   1987.828
            End
            Begin VB.Line Line5 
               BorderStyle     =   3  'Dot
               Index           =   8
               X1              =   0
               X2              =   6000.07
               Y1              =   993.914
               Y2              =   993.914
            End
            Begin VB.Line Line6 
               BorderStyle     =   3  'Dot
               Index           =   17
               X1              =   599.708
               X2              =   599.708
               Y1              =   0
               Y2              =   3353.818
            End
            Begin VB.Line Line5 
               BorderStyle     =   3  'Dot
               Index           =   9
               X1              =   0
               X2              =   6000.07
               Y1              =   496.443
               Y2              =   496.443
            End
         End
         Begin VB.Frame Frame10 
            BackColor       =   &H8000000A&
            Caption         =   "Duty"
            Height          =   1095
            Left            =   4560
            TabIndex        =   58
            Top             =   3480
            Width           =   2415
            Begin VB.CheckBox Check5 
               BackColor       =   &H8000000A&
               Height          =   255
               Left            =   120
               TabIndex        =   63
               Top             =   240
               Width           =   255
            End
            Begin VB.CommandButton Command7 
               Caption         =   "Set"
               BeginProperty Font 
                  Name            =   "Times New Roman"
                  Size            =   12
                  Charset         =   0
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   615
               Left            =   1800
               TabIndex        =   62
               Top             =   240
               Width           =   495
            End
            Begin VB.HScrollBar HScroll10 
               Height          =   200
               Left            =   480
               Max             =   999
               Min             =   1
               TabIndex        =   61
               Top             =   720
               Value           =   500
               Width           =   1215
            End
            Begin VB.TextBox Text25 
               BeginProperty Font 
                  Name            =   "宋体"
                  Size            =   14.4
                  Charset         =   134
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Left            =   1440
               TabIndex        =   60
               Text            =   "%"
               Top             =   240
               Width           =   255
            End
            Begin VB.TextBox Text24 
               Alignment       =   1  'Right Justify
               BeginProperty Font 
                  Name            =   "宋体"
                  Size            =   14.4
                  Charset         =   134
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Left            =   480
               MaxLength       =   4
               TabIndex        =   59
               Text            =   "50.0"
               Top             =   240
               Width           =   975
            End
         End
         Begin VB.Frame Frame11 
            BackColor       =   &H8000000A&
            Caption         =   "Skewing"
            Height          =   1095
            Left            =   4560
            TabIndex        =   54
            Top             =   2160
            Width           =   2415
            Begin VB.HScrollBar PH 
               Height          =   200
               Left            =   240
               Max             =   359
               TabIndex        =   57
               Top             =   720
               Width           =   1935
            End
            Begin VB.TextBox Text27 
               BeginProperty Font 
                  Name            =   "宋体"
                  Size            =   21.6
                  Charset         =   134
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   480
               Left            =   1800
               TabIndex        =   56
               Text            =   "°"
               Top             =   240
               Width           =   375
            End
            Begin VB.TextBox Text26 
               Alignment       =   1  'Right Justify
               BeginProperty Font 
                  Name            =   "宋体"
                  Size            =   21.6
                  Charset         =   134
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   480
               Left            =   240
               MaxLength       =   3
               TabIndex        =   55
               Text            =   "0"
               Top             =   240
               Width           =   1575
            End
         End
         Begin VB.HScrollBar HScroll9 
            Height          =   200
            Left            =   1200
            Max             =   19
            TabIndex        =   53
            Top             =   840
            Width           =   3135
         End
         Begin VB.HScrollBar HScroll8 
            Height          =   200
            Left            =   1200
            Max             =   2000
            TabIndex        =   52
            Top             =   4440
            Value           =   1000
            Width           =   3135
         End
         Begin VB.HScrollBar HScroll7 
            Height          =   200
            Left            =   1200
            Max             =   2000
            TabIndex        =   51
            Top             =   3240
            Value           =   1000
            Width           =   3135
         End
         Begin VB.HScrollBar HScroll6 
            Height          =   200
            Left            =   1200
            Max             =   20000
            TabIndex        =   50
            Top             =   2040
            Width           =   3135
         End
         Begin VB.ComboBox Combo4 
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15.6
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   408
            ItemData        =   "RS232.frx":1276
            Left            =   1200
            List            =   "RS232.frx":12B6
            TabIndex        =   49
            Text            =   "Sine wave"
            Top             =   360
            Width           =   3135
         End
         Begin VB.TextBox Text23 
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   18
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   3840
            TabIndex        =   48
            Text            =   "V"
            Top             =   3960
            Width           =   495
         End
         Begin VB.TextBox Text22 
            Alignment       =   1  'Right Justify
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   21.6
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   1200
            MaxLength       =   6
            TabIndex        =   47
            Text            =   "0.00"
            Top             =   3960
            Width           =   2655
         End
         Begin VB.TextBox Text21 
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   18
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   3840
            TabIndex        =   46
            Text            =   "V"
            Top             =   2760
            Width           =   495
         End
         Begin VB.TextBox Text20 
            Alignment       =   1  'Right Justify
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   21.6
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   1200
            TabIndex        =   45
            Text            =   "10.00"
            Top             =   2760
            Width           =   2655
         End
         Begin VB.TextBox Text19 
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   18
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   3840
            TabIndex        =   44
            Text            =   "Hz"
            Top             =   1560
            Width           =   495
         End
         Begin VB.TextBox Text18 
            Alignment       =   1  'Right Justify
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   21.6
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   1200
            TabIndex        =   43
            Text            =   "10000.00"
            Top             =   1560
            Width           =   2655
         End
         Begin VB.Label Label1 
            BackColor       =   &H8000000A&
            Caption         =   "FREQ"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15.6
               Charset         =   134
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   372
            Index           =   1
            Left            =   360
            TabIndex        =   72
            Top             =   1680
            Width           =   732
         End
         Begin VB.Label Label3 
            BackColor       =   &H8000000A&
            Caption         =   "AMPL"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15.6
               Charset         =   134
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   372
            Index           =   1
            Left            =   360
            TabIndex        =   71
            Top             =   2880
            Width           =   732
         End
         Begin VB.Label Label5 
            BackColor       =   &H8000000A&
            Caption         =   "BIAS"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15.6
               Charset         =   134
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   372
            Index           =   1
            Left            =   360
            TabIndex        =   70
            Top             =   4080
            Width           =   732
         End
         Begin VB.Label Label7 
            BackColor       =   &H8000000A&
            Caption         =   "WAVE"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15.6
               Charset         =   134
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   372
            Index           =   1
            Left            =   360
            TabIndex        =   69
            Top             =   480
            Width           =   732
         End
      End
      Begin VB.Frame Frame6 
         BackColor       =   &H8000000A&
         Caption         =   "Measure"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1332
         Left            =   7320
         TabIndex        =   31
         Top             =   5520
         Width           =   5055
         Begin VB.CommandButton Command19 
            Caption         =   "Stop"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   12
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   372
            Left            =   4200
            Style           =   1  'Graphical
            TabIndex        =   38
            Top             =   240
            Width           =   735
         End
         Begin VB.CommandButton Command18 
            Caption         =   "Pause"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   12
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   372
            Left            =   3360
            Style           =   1  'Graphical
            TabIndex        =   37
            Top             =   720
            Width           =   735
         End
         Begin VB.CommandButton Command15 
            Caption         =   "Clear"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   12
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   372
            Left            =   4200
            Style           =   1  'Graphical
            TabIndex        =   36
            Top             =   720
            Width           =   735
         End
         Begin VB.CommandButton Command14 
            Caption         =   "Count"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   12
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   372
            Left            =   2520
            Style           =   1  'Graphical
            TabIndex        =   35
            Top             =   720
            Width           =   735
         End
         Begin VB.CommandButton Command13 
            Caption         =   "Measure"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   12
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   372
            Left            =   2880
            Style           =   1  'Graphical
            TabIndex        =   34
            Top             =   240
            Width           =   1215
         End
         Begin VB.TextBox Text11 
            Alignment       =   1  'Right Justify
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   420
            Left            =   840
            MaxLength       =   11
            TabIndex        =   33
            Text            =   "0"
            Top             =   720
            Width           =   1575
         End
         Begin VB.TextBox Text10 
            Alignment       =   1  'Right Justify
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   420
            Left            =   840
            MaxLength       =   11
            TabIndex        =   32
            Text            =   "0"
            Top             =   240
            Width           =   1575
         End
         Begin VB.Label Label18 
            BackColor       =   &H8000000A&
            Caption         =   "Hz"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   252
            Index           =   8
            Left            =   2520
            TabIndex        =   41
            Top             =   360
            Width           =   372
         End
         Begin VB.Label Label19 
            BackColor       =   &H8000000A&
            Caption         =   "Counter"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   12
               Charset         =   134
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   252
            Index           =   1
            Left            =   120
            TabIndex        =   40
            Top             =   840
            Width           =   972
         End
         Begin VB.Label Label19 
            BackColor       =   &H8000000A&
            Caption         =   "Frequency"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   12
               Charset         =   134
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   252
            Index           =   0
            Left            =   120
            TabIndex        =   39
            Top             =   360
            Width           =   732
         End
      End
      Begin VB.Frame Frame5 
         BackColor       =   &H8000000A&
         Caption         =   "Sweep Frequency"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2295
         Left            =   2040
         TabIndex        =   18
         Top             =   5520
         Width           =   5172
         Begin VB.TextBox Text6 
            Alignment       =   1  'Right Justify
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   450
            Left            =   840
            MaxLength       =   11
            TabIndex        =   24
            Text            =   "100.00"
            Top             =   480
            Width           =   1935
         End
         Begin VB.TextBox Text7 
            Alignment       =   1  'Right Justify
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   450
            Left            =   840
            MaxLength       =   11
            TabIndex        =   23
            Text            =   "10000.00"
            Top             =   1080
            Width           =   1935
         End
         Begin VB.TextBox Text8 
            Alignment       =   1  'Right Justify
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   450
            Left            =   840
            MaxLength       =   2
            TabIndex        =   22
            Text            =   "2"
            Top             =   1680
            Width           =   1935
         End
         Begin VB.CommandButton Command12 
            Caption         =   "LIN-SWEEP"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   3360
            Style           =   1  'Graphical
            TabIndex        =   21
            Top             =   240
            Width           =   1575
         End
         Begin VB.CommandButton Command16 
            Caption         =   "LOG-SWEEP"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   3360
            Style           =   1  'Graphical
            TabIndex        =   20
            Top             =   960
            Width           =   1575
         End
         Begin VB.CommandButton Command17 
            Caption         =   "Stop"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   3360
            Style           =   1  'Graphical
            TabIndex        =   19
            Top             =   1680
            Width           =   1575
         End
         Begin VB.Label Label18 
            BackColor       =   &H8000000A&
            Caption         =   "Begin"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   12
               Charset         =   134
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   0
            Left            =   120
            TabIndex        =   30
            Top             =   600
            Width           =   975
         End
         Begin VB.Label Label18 
            BackColor       =   &H8000000A&
            Caption         =   "End"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   12
               Charset         =   134
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   1
            Left            =   120
            TabIndex        =   29
            Top             =   1200
            Width           =   975
         End
         Begin VB.Label Label18 
            BackColor       =   &H8000000A&
            Caption         =   "Hz"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   3
            Left            =   2880
            TabIndex        =   28
            Top             =   360
            Width           =   375
         End
         Begin VB.Label Label18 
            BackColor       =   &H8000000A&
            Caption         =   "Hz"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   4
            Left            =   2880
            TabIndex        =   27
            Top             =   1080
            Width           =   375
         End
         Begin VB.Label Label18 
            BackColor       =   &H8000000A&
            Caption         =   "Time"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   12
               Charset         =   134
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   6
            Left            =   120
            TabIndex        =   26
            Top             =   1800
            Width           =   975
         End
         Begin VB.Label Label18 
            BackColor       =   &H8000000A&
            Caption         =   "S"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   15
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Index           =   7
            Left            =   2880
            TabIndex        =   25
            Top             =   1800
            Width           =   255
         End
      End
      Begin VB.Frame Frame12 
         BackColor       =   &H8000000A&
         Caption         =   "Trigger"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2295
         Left            =   120
         TabIndex        =   12
         Top             =   5520
         Width           =   1935
         Begin VB.TextBox Text30 
            Alignment       =   1  'Right Justify
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   15
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   720
            MaxLength       =   7
            TabIndex        =   16
            Text            =   "1000000"
            Top             =   360
            Width           =   1095
         End
         Begin VB.CommandButton Command5 
            Caption         =   "Manual"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   14.4
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   15
            Top             =   840
            Width           =   1695
         End
         Begin VB.CommandButton Command6 
            Caption         =   "External"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   14.4
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   14
            Top             =   1320
            Width           =   1695
         End
         Begin VB.CommandButton Command21 
            Caption         =   "CH2"
            BeginProperty Font 
               Name            =   "宋体"
               Size            =   14.4
               Charset         =   134
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   13
            Top             =   1800
            Width           =   1695
         End
         Begin VB.Label Label9 
            BackColor       =   &H8000000A&
            Caption         =   "Cycles"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   10.8
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Index           =   0
            Left            =   120
            TabIndex        =   17
            Top             =   480
            Width           =   735
         End
      End
      Begin VB.TextBox Text4 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   7092
         Left            =   -74760
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   11
         TabStop         =   0   'False
         Text            =   "RS232.frx":13C6
         Top             =   600
         Width           =   14052
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Clear"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   -71880
         TabIndex        =   8
         Top             =   6360
         Width           =   1215
      End
      Begin VB.CommandButton Command3 
         Caption         =   "View"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   -73200
         TabIndex        =   7
         Top             =   6360
         Width           =   1215
      End
      Begin VB.CommandButton Cmdsend 
         Caption         =   "Send Data"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   12
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   -74760
         TabIndex        =   6
         Top             =   6360
         Width           =   1455
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Reset Waveform "
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   -71640
         TabIndex        =   5
         Top             =   7200
         Width           =   2775
      End
      Begin VB.CommandButton Command4 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Send Waveform Data"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   -74280
         MaskColor       =   &H00E0E0E0&
         TabIndex        =   4
         Top             =   7200
         Width           =   2535
      End
      Begin VB.TextBox Text3 
         Alignment       =   2  'Center
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0.00"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   2052
            SubFormatType   =   1
         EndProperty
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   -63000
         TabIndex        =   3
         Top             =   7320
         Width           =   2055
      End
      Begin VB.TextBox Textsend 
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   5532
         Left            =   -74760
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   2
         Top             =   480
         Width           =   14052
      End
      Begin VB.PictureBox Picture1 
         AutoRedraw      =   -1  'True
         BackColor       =   &H8000000E&
         Height          =   6372
         Left            =   -74160
         MouseIcon       =   "RS232.frx":1DCE
         ScaleHeight     =   6319.486
         ScaleMode       =   0  'User
         ScaleWidth      =   13340
         TabIndex        =   1
         Top             =   720
         Width           =   13455
         Begin VB.Line Line1 
            BorderColor     =   &H00000000&
            BorderStyle     =   3  'Dot
            Index           =   8
            X1              =   6692.89
            X2              =   6692.89
            Y1              =   0
            Y2              =   5764.882
         End
         Begin VB.Line Line2 
            BorderColor     =   &H00000000&
            BorderStyle     =   3  'Dot
            Index           =   4
            X1              =   0
            X2              =   13384.79
            Y1              =   2882.941
            Y2              =   2882.941
         End
         Begin VB.Line Line1 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   1
            X1              =   836.984
            X2              =   836.984
            Y1              =   0
            Y2              =   5764.882
         End
         Begin VB.Line Line1 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   14
            X1              =   11711.81
            X2              =   11711.81
            Y1              =   0
            Y2              =   5764.882
         End
         Begin VB.Line Line1 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   13
            X1              =   10874.83
            X2              =   10874.83
            Y1              =   0
            Y2              =   5764.882
         End
         Begin VB.Line Line1 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   12
            X1              =   10038.84
            X2              =   10038.84
            Y1              =   0
            Y2              =   5764.882
         End
         Begin VB.Line Line1 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   11
            X1              =   9201.854
            X2              =   9201.854
            Y1              =   0
            Y2              =   5764.882
         End
         Begin VB.Line Line1 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   10
            X1              =   8365.864
            X2              =   8365.864
            Y1              =   0
            Y2              =   5764.882
         End
         Begin VB.Line Line1 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   9
            X1              =   7528.879
            X2              =   7528.879
            Y1              =   0
            Y2              =   5764.882
         End
         Begin VB.Line Line1 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   7
            X1              =   5855.906
            X2              =   5855.906
            Y1              =   0
            Y2              =   5764.882
         End
         Begin VB.Line Line1 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   6
            X1              =   5018.921
            X2              =   5018.921
            Y1              =   0
            Y2              =   5764.882
         End
         Begin VB.Line Line1 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   15
            X1              =   12547.8
            X2              =   12547.8
            Y1              =   0
            Y2              =   5764.882
         End
         Begin VB.Line Line1 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   5
            X1              =   4182.932
            X2              =   4182.932
            Y1              =   0
            Y2              =   5764.882
         End
         Begin VB.Line Line1 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   4
            X1              =   3345.948
            X2              =   3345.948
            Y1              =   0
            Y2              =   5764.882
         End
         Begin VB.Line Line1 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   3
            X1              =   2509.958
            X2              =   2509.958
            Y1              =   0
            Y2              =   5764.882
         End
         Begin VB.Line Line1 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   2
            X1              =   1672.974
            X2              =   1672.974
            Y1              =   0
            Y2              =   5764.882
         End
         Begin VB.Line Line2 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   7
            X1              =   0
            X2              =   13384.79
            Y1              =   4924.482
            Y2              =   4924.482
         End
         Begin VB.Line Line2 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   6
            X1              =   0
            X2              =   13384.79
            Y1              =   4203.997
            Y2              =   4203.997
         End
         Begin VB.Line Line2 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   5
            X1              =   0
            X2              =   13384.79
            Y1              =   3483.512
            Y2              =   3483.512
         End
         Begin VB.Line Line2 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   3
            X1              =   0
            X2              =   13384.79
            Y1              =   2161.456
            Y2              =   2161.456
         End
         Begin VB.Line Line2 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   2
            X1              =   0
            X2              =   13384.79
            Y1              =   1440.971
            Y2              =   1440.971
         End
         Begin VB.Line Line2 
            BorderColor     =   &H00FFFF00&
            BorderStyle     =   3  'Dot
            Index           =   1
            X1              =   0
            X2              =   13384.79
            Y1              =   720.485
            Y2              =   720.485
         End
      End
      Begin VB.Label Label16 
         Caption         =   "1024"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   24
         Left            =   -67680
         TabIndex        =   130
         Top             =   480
         Width           =   492
      End
      Begin VB.Label Label14 
         Caption         =   "896"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   22
         Left            =   -68400
         TabIndex        =   129
         Top             =   480
         Width           =   372
      End
      Begin VB.Label Label12 
         Caption         =   "768"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   20
         Left            =   -69240
         TabIndex        =   128
         Top             =   480
         Width           =   372
      End
      Begin VB.Label Label10 
         Caption         =   "640"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   18
         Left            =   -70080
         TabIndex        =   127
         Top             =   480
         Width           =   372
      End
      Begin VB.Label Label8 
         Caption         =   "512"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   16
         Left            =   -70920
         TabIndex        =   126
         Top             =   480
         Width           =   372
      End
      Begin VB.Label Label6 
         Caption         =   "384"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   14
         Left            =   -71760
         TabIndex        =   125
         Top             =   480
         Width           =   372
      End
      Begin VB.Label Label4 
         Caption         =   "256"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   12
         Left            =   -72600
         TabIndex        =   124
         Top             =   480
         Width           =   372
      End
      Begin VB.Label Label2 
         Caption         =   "128"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   10
         Left            =   -73440
         TabIndex        =   123
         Top             =   480
         Width           =   372
      End
      Begin VB.Label Label16 
         Caption         =   "1152"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   0
         Left            =   -66840
         TabIndex        =   122
         Top             =   480
         Width           =   492
      End
      Begin VB.Label Label16 
         Caption         =   "1280"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   1
         Left            =   -66000
         TabIndex        =   121
         Top             =   480
         Width           =   492
      End
      Begin VB.Label Label16 
         Caption         =   "1408"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   2
         Left            =   -65160
         TabIndex        =   120
         Top             =   480
         Width           =   492
      End
      Begin VB.Label Label16 
         Caption         =   "1536"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   3
         Left            =   -64320
         TabIndex        =   119
         Top             =   480
         Width           =   492
      End
      Begin VB.Label Label16 
         Caption         =   "1664"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   4
         Left            =   -63480
         TabIndex        =   118
         Top             =   480
         Width           =   492
      End
      Begin VB.Label Label16 
         Caption         =   "1792"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   5
         Left            =   -62640
         TabIndex        =   117
         Top             =   480
         Width           =   492
      End
      Begin VB.Label Label16 
         Caption         =   "1920"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   6
         Left            =   -61800
         TabIndex        =   116
         Top             =   480
         Width           =   492
      End
      Begin VB.Label Label16 
         Caption         =   "2048"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   7
         Left            =   -61200
         TabIndex        =   115
         Top             =   480
         Width           =   492
      End
      Begin VB.Label Label28 
         Caption         =   "-10"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   8
         Left            =   -74760
         TabIndex        =   114
         Top             =   6720
         Width           =   492
      End
      Begin VB.Label Label26 
         Caption         =   "-5"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   6
         Left            =   -74760
         TabIndex        =   113
         Top             =   5280
         Width           =   372
      End
      Begin VB.Label Label20 
         Caption         =   "10"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   4
         Left            =   -74640
         TabIndex        =   112
         Top             =   600
         Width           =   255
      End
      Begin VB.Label Label22 
         Caption         =   "5"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   2
         Left            =   -74640
         TabIndex        =   111
         Top             =   2040
         Width           =   255
      End
      Begin VB.Label Label24 
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Index           =   0
         Left            =   -74640
         TabIndex        =   110
         Top             =   3480
         Width           =   255
      End
      Begin VB.Label Label17 
         Caption         =   " (4096)"
         Height          =   255
         Index           =   0
         Left            =   -74880
         TabIndex        =   109
         Top             =   840
         Width           =   735
      End
      Begin VB.Label Label17 
         Caption         =   " (3072)"
         Height          =   255
         Index           =   2
         Left            =   -74880
         TabIndex        =   108
         Top             =   2280
         Width           =   735
      End
      Begin VB.Label Label17 
         Caption         =   " (2048)"
         Height          =   255
         Index           =   3
         Left            =   -74880
         TabIndex        =   107
         Top             =   3720
         Width           =   735
      End
      Begin VB.Label Label17 
         Caption         =   " (1024)"
         Height          =   252
         Index           =   4
         Left            =   -74880
         TabIndex        =   106
         Top             =   5520
         Width           =   732
      End
      Begin VB.Label Label17 
         Caption         =   " (0)"
         Height          =   252
         Index           =   5
         Left            =   -74760
         TabIndex        =   105
         Top             =   6960
         Width           =   732
      End
   End
   Begin VB.Timer Timer1 
      Interval        =   40
      Left            =   9720
      Top             =   120
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   9000
      Top             =   120
      _ExtentX        =   995
      _ExtentY        =   995
      _Version        =   393216
      DTREnable       =   0   'False
      InBufferSize    =   4096
      OutBufferSize   =   4096
      EOFEnable       =   -1  'True
      InputMode       =   1
   End
   Begin MSComctlLib.ImageList imlToolbarIcons 
      Index           =   0
      Left            =   6660
      Top             =   4755
      _ExtentX        =   995
      _ExtentY        =   995
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   3
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":2698
            Key             =   "Open"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":27AA
            Key             =   "Save"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":28BC
            Key             =   "Rectangle"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList imlToolbarIcons 
      Index           =   1
      Left            =   6660
      Top             =   4755
      _ExtentX        =   995
      _ExtentY        =   995
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   8
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":29CE
            Key             =   "New"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":2AE0
            Key             =   "Open"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":2BF2
            Key             =   "Save"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":2D04
            Key             =   "乘1"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":AB956
            Key             =   "加1"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":1545A8
            Key             =   "X1"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":1FD1FA
            Key             =   "Y1"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":2A5E4C
            Key             =   "Help What's This"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList imlToolbarIcons 
      Index           =   2
      Left            =   6660
      Top             =   4965
      _ExtentX        =   995
      _ExtentY        =   995
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   8
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":2A5F5E
            Key             =   "New"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":2A6070
            Key             =   "Open"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":2A6182
            Key             =   "Save"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":2A6294
            Key             =   "幅度倍增"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":34EEE6
            Key             =   "直流叠加"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":3F7B38
            Key             =   "X轴镜像"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":4A078A
            Key             =   "Y轴镜像"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":5493DC
            Key             =   "Help What's This"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList imlToolbarIcons 
      Index           =   3
      Left            =   6660
      Top             =   4935
      _ExtentX        =   995
      _ExtentY        =   995
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   8
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":5494EE
            Key             =   "New"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":549600
            Key             =   "Open"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":549712
            Key             =   "Save"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":549824
            Key             =   "乘英文图标"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":5F2476
            Key             =   "加图标"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":69B0C8
            Key             =   "X图标"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":743D1A
            Key             =   "Y图标"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":7EC96C
            Key             =   "Help What's This"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList imlToolbarIcons 
      Index           =   4
      Left            =   6660
      Top             =   4365
      _ExtentX        =   995
      _ExtentY        =   995
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   8
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":7ECA7E
            Key             =   "New"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":7ECB90
            Key             =   "Open"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":7ECCA2
            Key             =   "Save"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":7ECDB4
            Key             =   "乘英文图标"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":895A06
            Key             =   "加图标"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":93E658
            Key             =   "X图标"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":9E72AA
            Key             =   "Y图标"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RS232.frx":A8FEFC
            Key             =   "Help What's This"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar Toolbar1 
      Height          =   312
      Left            =   0
      TabIndex        =   10
      Top             =   0
      Width           =   14772
      _ExtentX        =   26056
      _ExtentY        =   550
      ButtonWidth     =   487
      ButtonHeight    =   466
      Appearance      =   1
      ImageList       =   "imlToolbarIcons(4)"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   8
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "新建"
            Object.ToolTipText     =   "New"
            ImageKey        =   "New"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "打开"
            Object.ToolTipText     =   "Open"
            ImageKey        =   "Open"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "保存"
            Object.ToolTipText     =   "Save"
            ImageKey        =   "Save"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "幅度倍增"
            Object.ToolTipText     =   "Amplitude Multiplier"
            ImageKey        =   "乘英文图标"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "直流叠加"
            Object.ToolTipText     =   "DC Superposition"
            ImageKey        =   "加图标"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "X轴镜像"
            Object.ToolTipText     =   "X-axis Mirror"
            ImageKey        =   "X图标"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Y轴镜像"
            Object.ToolTipText     =   "Y-axis Mirror"
            ImageKey        =   "Y图标"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "帮助这是什么"
            Object.ToolTipText     =   "Help"
            ImageKey        =   "Help What's This"
         EndProperty
      EndProperty
   End
   Begin VB.Menu MNU_File 
      Caption         =   "File"
      NegotiatePosition=   3  'Right
      WindowList      =   -1  'True
      Begin VB.Menu Open 
         Caption         =   "Open"
         Shortcut        =   ^O
      End
      Begin VB.Menu Save 
         Caption         =   "Save"
         Shortcut        =   ^S
      End
   End
   Begin VB.Menu 标准波形 
      Caption         =   "Standard waveforms"
      Begin VB.Menu 正弦波 
         Caption         =   "Sine Wave"
      End
      Begin VB.Menu 三角波 
         Caption         =   "Triangular Wave"
      End
      Begin VB.Menu 锯齿波 
         Caption         =   "Sawtooth Wave"
      End
      Begin VB.Menu 阶梯波 
         Caption         =   "Step Wave"
      End
      Begin VB.Menu 矩形波 
         Caption         =   "Rectangular Wave"
      End
      Begin VB.Menu 调幅波 
         Caption         =   "AM Wave "
      End
      Begin VB.Menu 调频波 
         Caption         =   "FM wave"
      End
   End
   Begin VB.Menu 波形处理 
      Caption         =   "Waveform Processing"
      Begin VB.Menu 幅度倍增 
         Caption         =   "Amplitude Multiplier"
      End
      Begin VB.Menu 直流叠加 
         Caption         =   "DC Superposition"
      End
      Begin VB.Menu X轴镜像 
         Caption         =   "X-axis Mirror"
      End
      Begin VB.Menu Y轴镜像 
         Caption         =   "Y-axis Mirror"
      End
   End
   Begin VB.Menu 存储区域 
      Caption         =   "Memory Area"
      Begin VB.Menu 第一存储区 
         Caption         =   "First ROM "
      End
      Begin VB.Menu 第二存储区 
         Caption         =   "Second ROM "
      End
      Begin VB.Menu 第三存储区 
         Caption         =   "Third ROM"
      End
      Begin VB.Menu 第四存储区 
         Caption         =   "Fourth ROM"
      End
   End
   Begin VB.Menu 端口连接 
      Caption         =   "Port Connect"
      Begin VB.Menu 自动连接 
         Caption         =   "Auto Connection"
      End
      Begin VB.Menu COM1 
         Caption         =   "COM1"
      End
      Begin VB.Menu COM2 
         Caption         =   "COM2"
      End
      Begin VB.Menu COM3 
         Caption         =   "COM3"
      End
      Begin VB.Menu COM4 
         Caption         =   "COM4"
      End
      Begin VB.Menu COM5 
         Caption         =   "COM5"
      End
      Begin VB.Menu COM6 
         Caption         =   "COM6"
      End
      Begin VB.Menu COM7 
         Caption         =   "COM7"
      End
      Begin VB.Menu COM8 
         Caption         =   "COM8"
      End
      Begin VB.Menu COM9 
         Caption         =   "COM9"
      End
      Begin VB.Menu COM10 
         Caption         =   "COM10"
      End
      Begin VB.Menu COM11 
         Caption         =   "COM11"
      End
      Begin VB.Menu COM12 
         Caption         =   "COM12"
      End
      Begin VB.Menu COM13 
         Caption         =   "COM13"
      End
      Begin VB.Menu COM14 
         Caption         =   "COM14"
      End
      Begin VB.Menu COM15 
         Caption         =   "COM15"
      End
      Begin VB.Menu COM16 
         Caption         =   "COM16"
      End
   End
   Begin VB.Menu 帮助 
      Caption         =   "Help"
      Begin VB.Menu 软件使用说明 
         Caption         =   "Software User's Guide"
      End
      Begin VB.Menu 版本信息 
         Caption         =   "Version Information"
      End
   End
End
Attribute VB_Name = "COMForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Declare Sub sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function timeGetTime Lib "winmm.dll" () As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Private Declare Function RegEnumValue Lib "advapi32.dll" Alias "RegEnumValueA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpValueName As String, lpcbValueName As Long, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long

Dim HScro11  As Integer
Dim HScro12  As Integer
Dim HScro13 As Integer
Dim HScro14 As Integer
Dim HScro16 As Integer
Dim HScro17 As Integer
Dim HScro18 As Integer
Dim HScro10 As Integer

Dim SM  As Integer
Dim SMN As Integer
Dim CePing   As Integer
Dim CePingde As Integer
Dim JiShu    As Integer
Dim JiShude  As Integer

Dim mouse_X As Integer
Dim mouse_Y As Integer
Dim qmouse As Integer
Dim Savetime As Integer
Dim pic_rsh As Integer
Dim X_Ref As Single  'Integer
Dim Y_Ref As Single  'Integer
Dim X2_Ref As Single  'Integer
Dim Y2_Ref As Single  'Integer
Dim WAVE(6144) As Integer  'Byte  ' Integer 'Single

Dim JinDuTiao As Integer

Dim GongDongBL  As Long
Dim PingLvMax  As Long

Dim DDS_COM  As Integer
Dim Combo1max As Integer

Dim COM_SEL As Integer
Dim SAVE_SEL As String

Dim delay  As Long

Const HKEY_LOCAL_MACHINE = &H80000002
Const REG_SZ = 1
Dim i&, ComStr$(), S

Private Formrun  As Long '第一次打开
Private FormOldWidth  As Long '原始宽度
Private FormOldHeight As Long '原始高度

'在调用ResizeForm前先调用本函数
Public Sub ResizeInit(FormName As Form)

    Dim Obj     As Control
    
    FormOldWidth = FormName.ScaleWidth
    FormOldHeight = FormName.ScaleHeight
    
    On Error Resume Next
    
    For Each Obj In FormName
        Obj.Tag = Obj.Left & "   " & Obj.Top & "   " & Obj.Width & "   " & Obj.Height & "   "
    Next Obj
    
    On Error GoTo 0
    
End Sub

'按比例改变表单内各元件的大小，
'在调用ReSizeForm前先调用ReSizeInit函数
Public Sub ResizeForm(FormName As Form)

Dim Pos(4)   As Double
Dim i        As Long, TempPos   As Long, StartPos As Long
Dim Obj      As Control
Dim xScaleX  As Double, xScaleY As Double

xScaleX = FormName.ScaleWidth / FormOldWidth '保存窗体宽度缩放比例
xScaleY = FormName.ScaleHeight / FormOldHeight '保存窗体高度缩放比例

On Error Resume Next

For Each Obj In FormName
    StartPos = 1
    For i = 0 To 4
        '读取控件的原始位置与大小
        
        TempPos = InStr(StartPos, Obj.Tag, "   ", vbTextCompare)
        
        If TempPos > 0 Then
            Pos(i) = Mid(Obj.Tag, StartPos, TempPos - StartPos)
            StartPos = TempPos + 1
        Else
            Pos(i) = 0
        End If

    Next i
    
    '根据控件的原始位置及窗体改变大小
    '的比例对控件重新定位与改变大小
'    Obj.Move Pos(0) * xScaleX, Pos(1) * xScaleY, Pos(2) * xScaleX, Pos(3) * xScaleY
        
    '控件文字的改变可以用以下的设置，8可以根据屏幕需要更改尺寸。
    Obj.Font.Size = 11 * (xScaleX + xScaleY) / 2
    
Next Obj

On Error GoTo 0

End Sub


'延时'
Private Function delay_ms(mS As Integer) As Boolean
    
    de = timeGetTime '记下开始时的时间
    While timeGetTime <= de + mS '循环等待
        DoEvents '转让控制权，以便让操作系统处理其它的事件。
    Wend
  
End Function


Private Function GetAllPort() As Integer

    Dim str As String
    Dim i, j, m  As Integer
    Dim ss, ss2
   
    On Error Resume Next
    
    GetAllPort = False
    
    S = GetSerialPort(HKEY_LOCAL_MACHINE, "HARDWARE\DEVICEMAP\SERIALCOMM")
    
    If ComStr(0) = "" Then Exit Function
    
    GetAllPort = ""
    

    MSComm1.OutBufferCount = 0 '清空发送缓冲区
    MSComm1.InBufferCount = 0 '清空接收缓冲区
    
    For i = 0 To UBound(S)

'        GetAllPort = GetAllPort & S(i) & ","

        ss2 = Replace(Left(S(i), 5), "COM", "")

        MSComm1.CommPort = Val(ss2)                       '这里接收传入的串口号
        MSComm1.PortOpen = True
        MSComm1.PortOpen = False

        MSComm1.CommPort = Val(ss2)        '设置通信端口号为COM1
        MSComm1.Settings = "9600,N,8,1"  ' "9600,N,8,1"   '设置串口参数
        MSComm1.NullDiscard = False
        MSComm1.InputMode = 0 'ComInputModeBinary   '接收文本型数据
        MSComm1.PortOpen = True           '打开通信端口1

        MSComm1.Output = "a" + Chr(&HA)    '校验码

        delay_ms (80)

        str = Trim(MSComm1.Input)
        If Left(str, 4) = "FY32" Then
 
          Text36.Text = "MODEL:" + str
          
          m = Val(ss2)
          DDS_COM = m
          COM_SEL = m
          
          Text37.Text = "PORT:COM" + ss2 + " Connected"
          
          GetAllPort = True
          
          Call LianJie
          
          Exit Function
        End If
        
'        MSComm1.PortOpen = False

    Next i
    
    If GetAllPort = False Then
       Text37.Text = "PORT:No Connected"
    End If
    

End Function



Private Function GetSerialPort(RegAddr&, Items$) As String()
    
    On Error Resume Next
    
    Dim hKey&, S1$, S2$, L&, L1&, j&
    
    RegOpenKey RegAddr, Items, hKey
    
    ReDim Preserve ComStr$(0)
    
    ComStr(0) = "": i = 0: j = 0: Rtn = 0
    
    Do
        L = 1000: L1 = 1000
        S1 = Space(L): S2 = Space(L)
        Rtn = RegEnumValue(hKey, i, S1, L, 0, REG_SZ, S2, L1)
        
        If Rtn = 0 Then
            If InStr(S1, Chr(0)) > 0 And InStr(S2, Chr(0)) > 0 Then
                S1 = UCase(Left(S1, InStr(S1, Chr(0)) - 1))
                S2 = UCase(Left(S2, InStr(S2, Chr(0)) - 1))
                If InStr(S2, "COM") > 0 Then
                    ReDim Preserve ComStr$(j)
                    ComStr(j) = S2
                    j = j + 1
                End If
            End If
        End If
        i = i + 1
    Loop Until Rtn <> 0
    
    GetSerialPort = ComStr()
End Function


Private Sub HScroll12_Change()

If HScro12 = True Then
  Text1.Text = Format(Val(HScroll12.Value) * 100000)
End If

End Sub



Private Sub HScroll12_Scroll()
Call HScroll12_Change
End Sub

Private Sub Open_Click()
Call 打开_Click
End Sub

Private Sub Save_Click()
Call 保存_Click
End Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Private Sub SysInfo1_DeviceArrival(ByVal DeviceType As Long, ByVal DeviceID As Long, ByVal DeviceName As String, ByVal DeviceData As Long)
    
    Dim i, j  As Integer
    Dim ss2, str
    
    str = DeviceName

    If Left(str, 3) = "COM" Then 'DDS_COM
      Call GetAllPort
    End If

End Sub

Private Function Sendtest_COM(com_num As Integer) As Boolean

 On Error GoTo Comms_Error
    If (MSComm1.PortOpen = False) Then
        MSComm1.CommPort = com_num                         '这里接收传入的串口号
        MSComm1.PortOpen = True
        MSComm1.PortOpen = False
                                           '如果操作成功，则说明当前串口可用，返回1，表示串口可用
        MSComm1.CommPort = com_num        '设置通信端口号为COM1
        MSComm1.Settings = "9600,N,8,1"   '"9600,N,8,1"   '设置串口参数
        MSComm1.NullDiscard = False
        MSComm1.InputMode = 0 'ComInputModeBinary   '接收文本型数据
        MSComm1.PortOpen = True           '打开通信端口1

    End If

    Sendtest_COM = True

    Exit Function

Comms_Error:
        If Err.Number = 8002 Then
            MsgBox "Port does not exist!"  'MsgBox "端口不存在！"
        ElseIf Err.Number = 8005 Then
            MsgBox "Port is already open!"   '"端口已打开！"
        ElseIf Err.Number = 8016 Then
            MsgBox "Port occupied by other software!"    'MsgBox "端口被其他软件占用"
        Else
            MsgBox "Other errors!"  'MsgBox "端口打开失败"
        End If

        Sendtest_COM = False                                       '如果出错，则返回0
    Exit Function
    Resume Next

End Function


Private Function COM_XH(com_num As Integer) As Boolean

    Dim str As String
    
    COM_XH = False
    
 On Error GoTo Comms_Error

        If (MSComm1.PortOpen = True) Then
            MSComm1.PortOpen = False
        End If

        MSComm1.CommPort = com_num         '这里接收传入的串口号
        MSComm1.PortOpen = True
        MSComm1.PortOpen = False
                                           '如果操作成功，则说明当前串口可用，返回1，表示串口可用
        MSComm1.CommPort = com_num        '设置通信端口号为COM1
        MSComm1.Settings = "9600,N,8,1"   '"9600,N,8,1"   '设置串口参数
        MSComm1.NullDiscard = False
        MSComm1.InputMode = 0 'ComInputModeBinary   '接收文本型数据
        MSComm1.PortOpen = True           '打开通信端口1


        delay_ms (10)
        MSComm1.Output = "a" + Chr(&HA)    '校验码

        delay_ms (80)

        str = Trim(MSComm1.Input)
        If Left(str, 2) = "FY" Then
 
          Text36.Text = "MODEL:" + str
          
          Text37.Text = "PORT:COM" + Format(com_num) + " Connected"
          
          Call LianJie
          
          COM_XH = True
        
          Exit Function
        End If


Comms_Error:

        Text36.Text = "MODEL:"
        Text37.Text = "PORT:No Connected"
    
        If Err.Number = 8002 Then
            Text33.Text = "Port does not exist!"
            MsgBox "Port does not exist!"
        ElseIf Err.Number = 8005 Then
            Text33.Text = "Port is already open!"
        ElseIf Err.Number = 8016 Then
            Text33.Text = "Port occupied by other software!"
            MsgBox "Port occupied by other software!"
        ElseIf Err.Number = 8018 Then
            Text33.Text = "Port failed to open!"
            MsgBox "Port failed to open!"
        Else
            Text33.Text = "Unknown Error!"
            MsgBox "Unknown Error!"
        End If


End Function


Private Function COM_TV(com_num As Integer) As Boolean

 On Error GoTo Comms_Error
    If (MSComm1.PortOpen = False) Then
        MSComm1.CommPort = com_num                         '这里接收传入的串口号
        MSComm1.PortOpen = True
        MSComm1.PortOpen = False
                                           '如果操作成功，则说明当前串口可用，返回1，表示串口可用
        MSComm1.CommPort = com_num        '设置通信端口号为COM1
        MSComm1.Settings = "9600,N,8,1"   '"9600,N,8,1"   '设置串口参数
        MSComm1.NullDiscard = False
        MSComm1.InputMode = 0 'ComInputModeBinary   '接收文本型数据
        MSComm1.PortOpen = True           '打开通信端口1

    End If

    COM_TV = True

    Exit Function

Comms_Error:

 COM_TV = False
 
End Function


Private Function Cai_COMF()

    自动连接.Checked = False
    COM1.Checked = False
    COM2.Checked = False
    COM3.Checked = False
    COM4.Checked = False
    COM5.Checked = False
    COM6.Checked = False
    COM7.Checked = False
    COM8.Checked = False
    COM9.Checked = False
    COM10.Checked = False
    COM11.Checked = False
    COM12.Checked = False
    COM13.Checked = False
    COM14.Checked = False
    COM15.Checked = False
    COM16.Checked = False

End Function

Private Sub Text1_Change()

Dim strText As String
 
HScro12 = False

strText = Val(Text1.Text)
strText = Format(Val(strText))

If Val(strText) < 10 Then
  Text1.Text = "10"
  HScroll12.Value = 1
ElseIf Val(strText) <= 1000000000 Then

  If (Val(strText) / 100000) < 1 Then
    HScroll12.Value = 1
  Else
    HScroll12.Value = Val(strText) / 100000
  End If
  
Else
  Text1.Text = "1000000000"
  HScroll12.Value = 10000
End If

strText = Format(Val(Text1.Text))

HScro12 = True

 If (Sendtest_COM(COM_SEL) = True) Then
    SMN = True
    
    MSComm1.Output = "bu" + strText + Chr(&HA) '校验码
      
End If

End Sub

Private Sub Text32_Change()

Dim strText As String
 
HScro111 = False

strText = Val(Text29.Text)



If Val(Text32.Text) > PingLvMax Then
  Text32.Text = Format(Val(PingLvMax), "0.00")
End If

strText = Format(Val(Text32.Text), "0.00")
strText = Format(Val(strText) * 100, "0")

HScro111 = True

 If (Sendtest_COM(COM_SEL) = True) Then
    SMN = True
    
    MSComm1.Output = "tf" + strText + Chr(&HA) '校验码
End If

End Sub

Private Sub 自动连接_Click()

Call Cai_COMF

If GetAllPort = True Then
   自动连接.Checked = True
End If

End Sub


Private Sub COM1_Click()
COM_SEL = 1
Call Cai_COMF

If COM_XH(1) = True Then
  COM1.Checked = True
End If

End Sub

Private Sub COM2_Click()
COM_SEL = 2
Call Cai_COMF

If COM_XH(2) = True Then
  COM2.Checked = True
End If

End Sub

Private Sub COM3_Click()
COM_SEL = 3
Call Cai_COMF

If COM_XH(3) = True Then
  COM3.Checked = True
End If

End Sub

Private Sub COM4_Click()
COM_SEL = 4
Call Cai_COMF

If COM_XH(4) = True Then
  COM4.Checked = True
End If

End Sub

Private Sub COM5_Click()
COM_SEL = 5
Call Cai_COMF

If COM_XH(5) = True Then
  COM5.Checked = True
End If

End Sub

Private Sub COM6_Click()
COM_SEL = 6
Call Cai_COMF

If COM_XH(6) = True Then
  COM6.Checked = True
End If

End Sub

Private Sub COM7_Click()
COM_SEL = 7
Call Cai_COMF

If COM_XH(7) = True Then
  COM7.Checked = True
End If

End Sub

Private Sub COM8_Click()
COM_SEL = 8
Call Cai_COMF

If COM_XH(8) = True Then
  COM8.Checked = True
End If

End Sub

Private Sub COM9_Click()
COM_SEL = 9
Call Cai_COMF

If COM_XH(9) = True Then
  COM9.Checked = True
End If

End Sub

Private Sub COM10_Click()
COM_SEL = 10
Call Cai_COMF

If COM_XH(10) = True Then
  COM10.Checked = True
End If

End Sub

Private Sub COM11_Click()
COM_SEL = 11
Call Cai_COMF

If COM_XH(11) = True Then
  COM11.Checked = True
End If

End Sub

Private Sub COM12_Click()
COM_SEL = 12
Call Cai_COMF

If COM_XH(12) = True Then
  COM12.Checked = True
End If

End Sub

Private Sub COM13_Click()
COM_SEL = 13
Call Cai_COMF

If COM_XH(13) = True Then
  COM13.Checked = True
End If

End Sub

Private Sub COM14_Click()
COM_SEL = 14
Call Cai_COMF

If COM_XH(14) = True Then
  COM14.Checked = True
End If

End Sub

Private Sub COM15_Click()
COM_SEL = 15
Call Cai_COMF

If COM_XH(15) = True Then
  COM15.Checked = True
End If

End Sub

Private Sub COM16_Click()
COM_SEL = 16
Call Cai_COMF

If COM_XH(16) = True Then
  COM16.Checked = True
End If

End Sub


Private Function Cai_SAVE()

第一存储区.Checked = False
第二存储区.Checked = False
第三存储区.Checked = False
第四存储区.Checked = False

End Function



Private Sub 第一存储区_Click()
SAVE_SEL = "1" ' H1  'Chr(49)  '   "1"
Call Cai_SAVE
第一存储区.Checked = True

Text2.Text = "Data write area:1"
End Sub


Private Sub 第二存储区_Click()
SAVE_SEL = "2" 'H2  'Chr(50)  '    "2"
Call Cai_SAVE
第二存储区.Checked = True
Text2.Text = "Data write area:2"
End Sub

Private Sub 第三存储区_Click()
SAVE_SEL = "3" 'H3 ' Chr(51)   '    "3"
Call Cai_SAVE
第三存储区.Checked = True
Text2.Text = "Data write area:3"
End Sub

Private Sub 第四存储区_Click()
SAVE_SEL = "4" ' H4  'Chr(52)   '   "4"
Call Cai_SAVE
第四存储区.Checked = True
Text2.Text = "Data write area:4"
End Sub




Private Sub Combo3_Click()

Dim strText As String

CePing = False
JiShu = False

Command13.BackColor = RGB(244, 244, 244)
Command14.BackColor = RGB(244, 244, 244)

If (Not (Sendtest_COM(COM_SEL) = True)) Then
Exit Sub
End If

    Picture4.Cls
    Picture4.DrawWidth = 2
    
    
    If Combo3.ListIndex = 0 Then
        Xbuf = 0
        Xbuf1 = (Xbuf) * (Picture4.Width / 256)
        Ybuf1 = (Picture4.Height / 2) - Int(Sin(Xbuf * 2 * 3.1415926 / 256) * (Picture4.Height / 2))
        For Xbuf = 1 To 256
            Xbuf2 = (Xbuf) * (Picture4.Width / 256)
            Ybuf2 = (Picture4.Height / 2) - Int(Sin(Xbuf * 2 * 3.1415926 / 128) * (Picture4.Height / 2))
            Picture4.Line (Xbuf1, Ybuf1)-(Xbuf2, Ybuf2), RGB(0, 0, 256)
            Xbuf1 = Xbuf2
            Ybuf1 = Ybuf2
            
        Next Xbuf
    
    ElseIf Combo3.ListIndex = 1 Then
        For Xbuf = 0 To 200
            Xbuf2 = (Xbuf) * (Picture4.Width / 200)
            
            If Val(Text12.Text) < (Xbuf Mod 102) Then
              Ybuf2 = Picture4.Height - 5
            Else
              Ybuf2 = 5
            End If
            
            Picture4.Line (Xbuf1, Ybuf1)-(Xbuf2, Ybuf2), RGB(0, 0, 255)
            Xbuf1 = Xbuf2
            Ybuf1 = Ybuf2
            
        Next Xbuf
    ElseIf Combo3.ListIndex = 3 Then
        Xbuf1 = 0
        Ybuf1 = Picture4.Height
        For Xbuf = 1 To 200
            Xbuf2 = (Xbuf) * (Picture4.Width / 200)
            
            If (Xbuf Mod 100) < 50 Then
              Ybuf2 = Picture4.Height - (Xbuf Mod 100) * (Picture4.Height / 50)
            Else
              Ybuf2 = (Xbuf Mod 50) * (Picture4.Height / 50)
            End If
            
            
            Picture4.Line (Xbuf1, Ybuf1)-(Xbuf2, Ybuf2), RGB(0, 0, 255)
            Xbuf1 = Xbuf2
            Ybuf1 = Ybuf2
            
        Next Xbuf
    ElseIf Combo3.ListIndex = 4 Then
        Xbuf1 = 0
        Ybuf1 = Picture4.Height
        For Xbuf = 1 To 200
            Xbuf2 = (Xbuf) * (Picture4.Width / 200)
            
            Ybuf2 = Picture4.Height - (Xbuf Mod 100) * (Picture4.Height / 100)
            
            Picture4.Line (Xbuf1, Ybuf1)-(Xbuf2, Ybuf2), RGB(0, 0, 255)
            Xbuf1 = Xbuf2
            Ybuf1 = Ybuf2
            
        Next Xbuf
    ElseIf Combo3.ListIndex = 5 Then
        Xbuf1 = 0
        Ybuf1 = Picture4.Height
        For Xbuf = 1 To 200
            Xbuf2 = (Xbuf) * (Picture4.Width / 200)
            
            Ybuf2 = (Xbuf Mod 100) * (Picture4.Height / 100)
            
            Picture4.Line (Xbuf1, Ybuf1)-(Xbuf2, Ybuf2), RGB(0, 0, 255)
            Xbuf1 = Xbuf2
            Ybuf1 = Ybuf2
            
        Next Xbuf
     End If
     

    SMN = True 'MSComm1.Output = "br0"  + Chr(&HA)  '停止扫描
     
    HScroll5.Value = Combo3.ListIndex
    strText = Format(Combo3.ListIndex)
    MSComm1.Output = "bw" + strText + Chr(&HA)   '校验码
    
    If Check4.Value = 1 Then   '  同步
       Combo4.ListIndex = Combo3.ListIndex
    End If


End Sub

Private Sub Combo4_Click()

Dim strText As String

CePing = False
JiShu = False

Command13.BackColor = RGB(244, 244, 244)
Command14.BackColor = RGB(244, 244, 244)

If (Not (Sendtest_COM(COM_SEL) = True)) Then
Exit Sub
End If

Picture5.Cls
Picture5.DrawWidth = 2

If Combo4.ListIndex = 0 Then
        Xbuf = 0
        Xbuf1 = (Xbuf) * (Picture5.Width / 256)
        Ybuf1 = (Picture5.Height / 2) - Int(Sin(Xbuf * 2 * 3.1415926 / 256) * (Picture5.Height / 2))
        For Xbuf = 1 To 256
            Xbuf2 = (Xbuf) * (Picture5.Width / 256)
            Ybuf2 = (Picture5.Height / 2) - Int(Sin(Xbuf * 2 * 3.1415926 / 128) * (Picture5.Height / 2))
            Picture5.Line (Xbuf1, Ybuf1)-(Xbuf2, Ybuf2), RGB(0, 0, 256)
            Xbuf1 = Xbuf2
            Ybuf1 = Ybuf2
            
        Next Xbuf
    
    ElseIf Combo4.ListIndex = 1 Then
        For Xbuf = 0 To 200
            Xbuf2 = (Xbuf) * (Picture5.Width / 200)
            
            If Val(Text24.Text) < (Xbuf Mod 102) Then
              Ybuf2 = Picture5.Height - 5
            Else
              Ybuf2 = 5
            End If
            
            Picture5.Line (Xbuf1, Ybuf1)-(Xbuf2, Ybuf2), RGB(0, 0, 255)
            Xbuf1 = Xbuf2
            Ybuf1 = Ybuf2
            
        Next Xbuf
    ElseIf Combo4.ListIndex = 2 Then
        Xbuf1 = 0
        Ybuf1 = Picture5.Height
        For Xbuf = 1 To 200
            Xbuf2 = (Xbuf) * (Picture5.Width / 200)
            
            If (Xbuf Mod 100) < 50 Then
              Ybuf2 = Picture5.Height - (Xbuf Mod 100) * (Picture5.Height / 50)
            Else
              Ybuf2 = (Xbuf Mod 50) * (Picture5.Height / 50)
            End If
            
            Picture5.Line (Xbuf1, Ybuf1)-(Xbuf2, Ybuf2), RGB(0, 0, 255)
            Xbuf1 = Xbuf2
            Ybuf1 = Ybuf2
            
        Next Xbuf
    ElseIf Combo4.ListIndex = 3 Then
        Xbuf1 = 0
        Ybuf1 = Picture5.Height
        For Xbuf = 1 To 200
            Xbuf2 = (Xbuf) * (Picture5.Width / 200)
            
            Ybuf2 = Picture5.Height - (Xbuf Mod 100) * (Picture5.Height / 100)
            
            Picture5.Line (Xbuf1, Ybuf1)-(Xbuf2, Ybuf2), RGB(0, 0, 255)
            Xbuf1 = Xbuf2
            Ybuf1 = Ybuf2
            
        Next Xbuf
    ElseIf Combo4.ListIndex = 4 Then
        Xbuf1 = 0
        Ybuf1 = Picture5.Height
        For Xbuf = 1 To 200
            Xbuf2 = (Xbuf) * (Picture5.Width / 200)
            
            Ybuf2 = (Xbuf Mod 100) * (Picture5.Height / 100)

            Picture5.Line (Xbuf1, Ybuf1)-(Xbuf2, Ybuf2), RGB(0, 0, 255)
            Xbuf1 = Xbuf2
            Ybuf1 = Ybuf2
            
        Next Xbuf
     End If
     

SMN = True 'MSComm1.Output = "br0"  + Chr(&HA)  '停止扫描

HScroll9.Value = Combo4.ListIndex
strText = Format(Combo4.ListIndex)
MSComm1.Output = "dw" + strText + Chr(&HA)   '校验码

End Sub

Private Sub Command10_Click()

    Command16.BackColor = RGB(244, 244, 244)
    Command12.BackColor = RGB(244, 244, 244)
    
    Command18.BackColor = RGB(244, 244, 244)
    Command14.BackColor = RGB(244, 244, 244)
    Command13.BackColor = RGB(244, 244, 244)
    
    Command5.BackColor = RGB(244, 244, 244)
    Command6.BackColor = RGB(244, 244, 244)
    Command21.BackColor = RGB(244, 244, 244)
    
    JiShu = False
    CePing = False  '停止测频
    SMN = True      '停止扫描

 If (Sendtest_COM(COM_SEL) = True) Then
 
    SMN = True 'MSComm1.Output = "br0"  + Chr(&HA)  '停止扫描

    strText = "bs" + Format(Combo2.ListIndex, "00")   'Chr(Combo2.ListIndex + 48)  ' + Replace(Text5.Text, ".", "")
    MSComm1.Output = strText + Chr(&HA)   '校验码

    Command10.BackColor = RGB(0, 255, 0)  'vbBlue
    delay_ms (80)
    Command10.BackColor = RGB(244, 244, 244)
End If

End Sub


'开机加载扫频信息
Private Function SaoPingJiaZai() As Boolean
    
    Dim str As String
    Dim sdata As Long
    
    MSComm1.Output = "bl1" + Chr(&HA)  '加载第一组
    delay_ms (360)
    
    strText = "cf"  '读取保存的起始频率值
    MSComm1.Output = strText + Chr(&HA)
    delay_ms (50)
    str = Trim(MSComm1.Input)
    str = Replace(str, "cf", "")
    If (Len(str) > 0) Then
      str = Left(str, 8) + "." + Right(str, Len(str) - 8)
      str = Val(str)
      Text6.Text = str
    End If
    
    
    MSComm1.Output = "bl2" + Chr(&HA)  '加载第一组
    delay_ms (360)
    
    strText = "cf"  '读取保存的结束频率值
    MSComm1.Output = strText + Chr(&HA)
    delay_ms (50)
    str = Trim(MSComm1.Input)
    str = Replace(str, "cf", "")
    If (Len(str) > 0) Then
      str = Left(str, 8) + "." + Right(str, Len(str) - 8)
      str = Val(str)
      Text7.Text = str
    End If
    
    
    MSComm1.Output = "ct" + Chr(&HA)  '加载扫描时间

    delay_ms (50)
    str = Trim(MSComm1.Input)
    str = Replace(str, "ct", "")
    If (Len(str) > 0) Then
      str = Val(str)
      Text8.Text = str
    End If
    
    Call Command11_Click    '加载存储的第一组值
'    Call Command5_Click     '进入开机界面
    
End Function

Private Sub Command11_Click() '加载存储的值
 Dim str As String
 Dim sdata As Long
 
    Command16.BackColor = RGB(244, 244, 244)
    Command12.BackColor = RGB(244, 244, 244)
    
    Command18.BackColor = RGB(244, 244, 244)
    Command14.BackColor = RGB(244, 244, 244)
    Command13.BackColor = RGB(244, 244, 244)
    
    Command5.BackColor = RGB(244, 244, 244)
    Command6.BackColor = RGB(244, 244, 244)
    Command21.BackColor = RGB(244, 244, 244)
    
    JiShu = False
    CePing = False  '停止测频
    SMN = True      '停止扫描

 If (Sendtest_COM(COM_SEL) = True) Then
 
    Command11.BackColor = RGB(0, 255, 0)  'vbBlue
    
    SMN = True 'MSComm1.Output = "br0"  + Chr(&HA)  '停止扫描
    
    delay_ms (10)
    
    strText = "bl" + Format(Combo2.ListIndex, "00")   'Chr(Combo2.ListIndex + 48)  ' + Replace(Text5.Text, ".", "")
    MSComm1.Output = strText + Chr(&HA)   '校验码
    delay_ms (200)

Call ZhuangTai
    
    Command11.BackColor = RGB(244, 244, 244)
End If

End Sub

Private Sub Command12_Click()   '线性扫描方式
Dim doda As Long

 If (Sendtest_COM(COM_SEL) = True) Then
 
    Command16.BackColor = RGB(244, 244, 244)
    Command12.BackColor = RGB(244, 244, 244)
    
    Command18.BackColor = RGB(244, 244, 244)
    Command14.BackColor = RGB(244, 244, 244)
    Command13.BackColor = RGB(244, 244, 244)
    
    Command5.BackColor = RGB(244, 244, 244)
    Command6.BackColor = RGB(244, 244, 244)
    Command21.BackColor = RGB(244, 244, 244)
    
    JiShu = False
    CePing = False  '停止测频
'    SMN = True      '停止扫描
    
    Command12.BackColor = RGB(0, 255, 0)  'vbGreen
    
    CePing = False
    JiShu = False


    doda = Val(Text6.Text) * 100
    strText = doda
    strText = "bb" + Replace(strText, ".", "")
    MSComm1.Output = strText + Chr(&HA)
    delay_ms (20)
    
'    strText = "bb"
'    MSComm1.Output = strText + Chr(&HA)   '保存起始频率
'    delay_ms( 80
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    
    doda = Val(Text7.Text) * 100
    strText = doda
    strText = "be" + Replace(strText, ".", "")
    MSComm1.Output = strText + Chr(&HA)
    delay_ms (20)
    
'    strText = "be"
'    MSComm1.Output = strText + Chr(&HA)   '保存结束频率
'    delay_ms( 80
    
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    
    doda = Val(Text8.Text)
    strText = "bt" + Replace(doda, ".", "")
    MSComm1.Output = strText + Chr(&HA)   '扫描时间
    delay_ms (50)

    strText = "bm0"
    MSComm1.Output = strText + Chr(&HA)   '线性扫描
    delay_ms (30)
    
    strText = "br1"
    MSComm1.Output = strText + Chr(&HA)   '开始扫描
    delay_ms (30)
    
    SM = True

End If

End Sub

Private Sub Command13_Click()
    Command16.BackColor = RGB(244, 244, 244)
    Command12.BackColor = RGB(244, 244, 244)
    
    Command18.BackColor = RGB(244, 244, 244)
    Command14.BackColor = RGB(244, 244, 244)
    Command13.BackColor = RGB(244, 244, 244)
    
    Command5.BackColor = RGB(244, 244, 244)
    Command6.BackColor = RGB(244, 244, 244)
    Command21.BackColor = RGB(244, 244, 244)
    
'    JiShu = False
'    CePing = False  '停止测频
'    SMN = True      '停止扫描


''Call Command17_Click

If (Sendtest_COM(COM_SEL) = True) Then
 
  Command13.BackColor = RGB(0, 255, 0)  'vbBlue
  JiShu = False
  CePing = True
End If


End Sub

Private Sub Command14_Click()
    Command16.BackColor = RGB(244, 244, 244)
    Command12.BackColor = RGB(244, 244, 244)
    
    Command18.BackColor = RGB(244, 244, 244)
    Command14.BackColor = RGB(244, 244, 244)
    Command13.BackColor = RGB(244, 244, 244)
    
    Command5.BackColor = RGB(244, 244, 244)
    Command6.BackColor = RGB(244, 244, 244)
    Command21.BackColor = RGB(244, 244, 244)
    
'    JiShu = False
'    CePing = False  '停止测频
'    SMN = True      '停止扫描

''Call Command17_Click

If (Sendtest_COM(COM_SEL) = True) Then
  Command14.BackColor = RGB(0, 255, 0)  'vbBlue

  CePing = False
  JiShu = True
End If

End Sub

Private Sub Command15_Click()  '计数器清零
 If (Sendtest_COM(COM_SEL) = True) Then

    Command18.BackColor = RGB(244, 244, 244)
''    Command14.BackColor = RGB(244, 244, 244)
'    Command15.BackColor = RGB(244, 244, 244)

    
    MSComm1.Output = "bc" + vbLf 'Chr(&HA)   '校验码

    Command15.BackColor = RGB(0, 255, 0)  'vbBlue
    delay_ms (80)
    Command15.BackColor = RGB(244, 244, 244)
    
    Text11.Text = "0"
''    JiShu = False
End If
End Sub

Private Sub Command16_Click()    '对数扫描方式

Dim doda As Long

 If (Sendtest_COM(COM_SEL) = True) Then
 
    Command16.BackColor = RGB(244, 244, 244)
    Command12.BackColor = RGB(244, 244, 244)
    
    Command18.BackColor = RGB(244, 244, 244)
    Command14.BackColor = RGB(244, 244, 244)
    Command13.BackColor = RGB(244, 244, 244)
    
    Command5.BackColor = RGB(244, 244, 244)
    Command6.BackColor = RGB(244, 244, 244)
    Command21.BackColor = RGB(244, 244, 244)
    
    JiShu = False
    CePing = False  '停止测频
'    SMN = True      '停止扫描
    
    
    Command16.BackColor = RGB(0, 255, 0)  'vbBlue
    CePing = False
    JiShu = False


    doda = Val(Text6.Text) * 100
    strText = doda
    strText = "bb" + Replace(strText, ".", "")
    MSComm1.Output = strText + Chr(&HA)
    delay_ms (20)
    
'    strText = "bb"
'    MSComm1.Output = strText + Chr(&HA)   '保存起始频率
'    delay_ms( 80
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    
    doda = Val(Text7.Text) * 100
    strText = doda
    strText = "be" + Replace(strText, ".", "")
    MSComm1.Output = strText + Chr(&HA)
    delay_ms (20)
    
'    strText = "be"
'    MSComm1.Output = strText + Chr(&HA)   '保存结束频率
'    delay_ms( 80
    
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    
    doda = Val(Text8.Text)
    strText = "bt" + Replace(doda, ".", "")
    MSComm1.Output = strText + Chr(&HA)   '扫描时间
    delay_ms (50)

    strText = "bm1"
    MSComm1.Output = strText + Chr(&HA)   '对数扫描
    delay_ms (30)
    
    strText = "br1"
    MSComm1.Output = strText + Chr(&HA)   '开始扫描
    delay_ms (30)
    
    SM = True

End If

End Sub

Private Sub Command17_Click()
If (Sendtest_COM(COM_SEL) = True) Then
    Command16.BackColor = RGB(244, 244, 244)
    Command12.BackColor = RGB(244, 244, 244)
    
    strText = "br0"
    MSComm1.Output = strText + Chr(&HA)   '开始扫描
    
    Command17.BackColor = RGB(0, 255, 0)  'vbBlue
    delay_ms (80)
    Command17.BackColor = RGB(244, 244, 244)

End If
End Sub

Private Sub Command18_Click()

    Command16.BackColor = RGB(244, 244, 244)
    Command12.BackColor = RGB(244, 244, 244)
    
    Command18.BackColor = RGB(244, 244, 244)
    Command14.BackColor = RGB(244, 244, 244)
    Command13.BackColor = RGB(244, 244, 244)
    
    Command5.BackColor = RGB(244, 244, 244)
    Command6.BackColor = RGB(244, 244, 244)
    Command21.BackColor = RGB(244, 244, 244)
    
'    JiShu = False
'    CePing = False  '停止测频
'    SMN = True      '停止扫描
    
    
    Command18.BackColor = RGB(0, 255, 0)  'vbBlue
    
    JiShu = False
    
    ''Call Command17_Click

End Sub

Private Sub Command19_Click()

    Command16.BackColor = RGB(244, 244, 244)
    Command12.BackColor = RGB(244, 244, 244)
    
    Command18.BackColor = RGB(244, 244, 244)
    Command14.BackColor = RGB(244, 244, 244)
    Command13.BackColor = RGB(244, 244, 244)
    
    Command5.BackColor = RGB(244, 244, 244)
    Command6.BackColor = RGB(244, 244, 244)
    Command21.BackColor = RGB(244, 244, 244)
    
'    JiShu = False
'    CePing = False  '停止测频
'    SMN = True      '停止扫描
  
    CePing = False
    
    Command19.BackColor = RGB(0, 255, 0)  'vbBlue
    delay_ms (80)
    Command19.BackColor = RGB(244, 244, 244)

End Sub

Private Sub Command20_Click()

Text12.Text = "50.0"
Call Text12_Change

If Check5.Value = 1 Then   '  同步
    Text24.Text = Text12.Text
    Call Text24_Change
End If

Command20.BackColor = RGB(0, 255, 0)  'vbBlue
delay_ms (80)
Command20.BackColor = RGB(244, 244, 244)

End Sub



Private Sub Command22_Click()

CePing = False
JiShu = False

'Command23.BackColor = RGB(0, 255, 0)  'vbGreen
'Command28.BackColor = RGB(244, 255, 244)  'vbGreen

Call Text32_Change

If (Sendtest_COM(COM_SEL) = True) Then

    MSComm1.Output = "fm0" + Chr(&HA) '校验码
    
End If


End Sub

Private Sub Command23_Click()

CePing = False
JiShu = False

'Command23.BackColor = RGB(244, 255, 244) 'vbGreen
'Command28.BackColor = RGB(0, 255, 0)  'vbGreen

If (Sendtest_COM(COM_SEL) = True) Then

    MSComm1.Output = "fm1" + Chr(&HA) '校验码
    
End If

End Sub

Private Sub Command24_Click()

CePing = False
JiShu = False

    Picture4.Cls

 If (Sendtest_COM(COM_SEL) = True) Then

    strText = "bw07"   ' + Replace(Text5.Text, ".", "")
    
    MSComm1.Output = strText + Chr(&HA) '校验码
End If

End Sub

Private Sub Command25_Click()



CePing = False
JiShu = False

    Picture4.Cls


 If (Sendtest_COM(COM_SEL) = True) Then

    strText = "bw08"   ' + Replace(Text5.Text, ".", "")
    
    MSComm1.Output = strText + Chr(&HA) '校验码
End If

End Sub

Private Sub Command26_Click()


CePing = False
JiShu = False

    Picture4.Cls

 If (Sendtest_COM(COM_SEL) = True) Then

    strText = "bw09"   ' + Replace(Text5.Text, ".", "")
    
    MSComm1.Output = strText + Chr(&HA) '校验码
End If

End Sub

Private Sub Command27_Click()

CePing = False
JiShu = False

'Command22.BackColor = RGB(0, 255, 0)  'vbGreen
'Command29.BackColor = RGB(244, 255, 244)  'vbGreen

If (Sendtest_COM(COM_SEL) = True) Then

    MSComm1.Output = "sm0" + Chr(&HA) '校验码
    
End If

End Sub

Private Sub Command28_Click()

CePing = False
JiShu = False

'Command22.BackColor = RGB(244, 255, 244)   'vbGreen
'Command29.BackColor = RGB(0, 255, 0) 'vbGreen

Call Text32_Change

If (Sendtest_COM(COM_SEL) = True) Then

    MSComm1.Output = "sm1" + Chr(&HA) '校验码
    
End If

End Sub

Private Sub Command29_Click()



CePing = False
JiShu = False

    Picture4.Cls
  
 If (Sendtest_COM(COM_SEL) = True) Then

    strText = "bw12"   ' + Replace(Text5.Text, ".", "")
    
    MSComm1.Output = strText + Chr(&HA) '校验码
End If

End Sub

Private Sub Command30_Click()


CePing = False
JiShu = False

    Picture4.Cls

 If (Sendtest_COM(COM_SEL) = True) Then

    strText = "bw13"   ' + Replace(Text5.Text, ".", "")
    
    MSComm1.Output = strText + Chr(&HA) '校验码
End If

End Sub

Private Sub Command21_Click()

If (Sendtest_COM(COM_SEL) = True) Then

    strText = "tn" + Format(Val(Text30.Text), "0000000")
    MSComm1.Output = strText + Chr(&HA) '校验码
    
    Command16.BackColor = RGB(244, 244, 244)
    Command12.BackColor = RGB(244, 244, 244)
    
    Command18.BackColor = RGB(244, 244, 244)
    Command14.BackColor = RGB(244, 244, 244)
    Command13.BackColor = RGB(244, 244, 244)
    
    Command5.BackColor = RGB(244, 244, 244)
    Command6.BackColor = RGB(244, 244, 244)
    Command21.BackColor = RGB(244, 244, 244)
    
    JiShu = False
    CePing = False  '停止测频
    SMN = True      '停止扫描
    
    Command21.BackColor = RGB(0, 255, 0)  'vbBlue
    
    strText = "tt2"
    MSComm1.Output = strText + Chr(&HA)  '校验码
    
End If

End Sub

Private Sub Command5_Click()

If (Sendtest_COM(COM_SEL) = True) Then
    strText = "tn" + Format(Val(Text30.Text), "0000000")
    MSComm1.Output = strText + Chr(&HA) '校验码
    
    
    Command16.BackColor = RGB(244, 244, 244)
    Command12.BackColor = RGB(244, 244, 244)
    
    Command18.BackColor = RGB(244, 244, 244)
    Command14.BackColor = RGB(244, 244, 244)
    Command13.BackColor = RGB(244, 244, 244)
    
    Command5.BackColor = RGB(244, 244, 244)
    Command6.BackColor = RGB(244, 244, 244)
    Command21.BackColor = RGB(244, 244, 244)
    
    JiShu = False
    CePing = False  '停止测频
    SMN = True      '停止扫描
    
    Command5.BackColor = RGB(0, 255, 0)  'vbBlue
    delay_ms (80)
    Command5.BackColor = RGB(244, 244, 244)


    strText = "tt0"
    MSComm1.Output = strText + Chr(&HA)  '校验码
    
End If

End Sub

Private Sub Command6_Click()

If (Sendtest_COM(COM_SEL) = True) Then

    strText = "tn" + Format(Val(Text30.Text), "0000000")
    MSComm1.Output = strText + Chr(&HA) '校验码

    Command16.BackColor = RGB(244, 244, 244)
    Command12.BackColor = RGB(244, 244, 244)
    
    Command18.BackColor = RGB(244, 244, 244)
    Command14.BackColor = RGB(244, 244, 244)
    Command13.BackColor = RGB(244, 244, 244)
    
    Command5.BackColor = RGB(244, 244, 244)
    Command6.BackColor = RGB(244, 244, 244)
    Command21.BackColor = RGB(244, 244, 244)
    
    JiShu = False
    CePing = False  '停止测频
    SMN = True      '停止扫描
    
    Command6.BackColor = RGB(0, 255, 0)  'vbBlue
    
    strText = "tt1"
    MSComm1.Output = strText + Chr(&HA)  '校验码
    
End If

End Sub

Private Sub Command7_Click()

Text24.Text = 50#
'Call Text24_Change

Command7.BackColor = RGB(0, 255, 0)  'vbBlue
delay_ms (80)
Command7.BackColor = RGB(244, 244, 244)

End Sub



Private Sub HScroll1_Change()

Dim delay As Long

If HScro11 = True Then
    delay = HScroll1.Value
    delay = delay * GongDongBL   '500
    Text5.Text = Format(Val(delay), "0.00")
    'Text5.Text = Left(Text5.Text, 2) + "." + Right(Text5.Text, Len(Text5.Text) - 2)
    'Call Text5_Change
End If

End Sub

Private Sub HScroll1_Scroll()

Call HScroll1_Change
End Sub

Private Sub HScroll10_Change()
Text24.Text = Format(Val(HScroll10.Value) / 10, "00.0")
'Call Text24_Change
End Sub

Private Sub HScroll10_Scroll()

Call HScroll10_Change
End Sub

Private Sub HScroll2_Change()
Text12.Text = Format(Val(HScroll2.Value) / 10, "00.0")
'Call Text12_Change
End Sub

Private Sub HScroll2_Scroll()

Call HScroll2_Change
End Sub

Private Sub HScroll3_Change()

If HScro13 = True Then
  Text9.Text = Format(Val(HScroll3.Value) / 100, "00.00")
End If

End Sub

Private Sub HScroll3_Scroll()

Call HScroll3_Change
End Sub

Private Sub HScroll4_Change()

If HScro14 = True Then
  Text16.Text = Format(Val(HScroll4.Value) / 100 - 10, "00.00")
End If

End Sub

Private Sub HScroll4_Scroll()

Call HScroll4_Change
End Sub

Private Sub HScroll5_Change()

    Combo3.ListIndex = HScroll5.Value
    
End Sub


Private Sub HScroll5_Scroll()

Call HScroll5_Change
End Sub

Private Sub HScroll6_Change()
Dim delay As Long

If HScro16 = True Then
    delay = HScroll6.Value
    delay = delay * GongDongBL   '500
    Text18.Text = Format(Val(delay), "0.00")
End If

End Sub

Private Sub HScroll6_Scroll()

Call HScroll6_Change
End Sub


Private Sub HScroll7_Change()
If HScro17 = True Then
  Text20.Text = Format(Val(HScroll7.Value) / 100, "00.00")
End If
End Sub

Private Sub HScroll7_Scroll()

Call HScroll7_Change
End Sub


Private Sub HScroll8_Change()

If HScro18 = True Then
  Text22.Text = Format(Val(HScroll8.Value) / 100 - 10, "00.00")
End If

End Sub


Private Sub HScroll8_Scroll()

Call HScroll8_Change
End Sub

Private Sub HScroll9_Change()

 Combo4.ListIndex = HScroll9.Value
 
End Sub

Private Sub HScroll9_Scroll()

Call HScroll9_Change
End Sub



Private Sub PH_Change()

If HScro10 = True Then
  Text26.Text = Format(Val(PH.Value), "000")
End If

End Sub

Private Sub PH_Scroll()

Call PH_Change
End Sub

Private Sub SSTab1_Click(PreviousTab As Integer)

If (SSTab1.Tab = 2) Then




    If Sendtest_COM(COM_SEL) = True Then   '调用端口初始化程序

        Call LianJie

    End If
    
End If

End Sub

Private Function ZhuangTai()

    Dim str As String
    Dim str_zhank As String
    Dim str_PingL As String
    
    str_zhank = 500

   ' If Sendtest_COM(COM_SEL) = True Then   '调用端口初始化程序
        strText = "cf"  '读取当前DDS显示的频率值
        MSComm1.Output = strText + Chr(&HA)
        delay_ms (50)
        str = Trim(MSComm1.Input)
        str = Replace(str, "cf", "")
        If (Len(str) > 0) Then
            'Text5.Text = Format((Val(str) / 100), "0.00")
            str_PingL = Format((Val(str) / 100), "0.00")
        End If
        
        strText = "cd"   '读取保存的占空比
        MSComm1.Output = strText + Chr(&HA)
        delay_ms (50)
        str = Trim(MSComm1.Input)
        str = Replace(str, "cd", "")
        If (Len(str) > 0) Then
           str = Val(str)
           'Text12.Text = str
           str_zhank = str
        End If
        
        strText = "cw"   '读取保存的
        MSComm1.Output = strText + Chr(&HA)
        delay_ms (50)
        str = Trim(MSComm1.Input)
        str = Replace(str, "cw", "")
        If (Len(str) > 0) Then
           
           If Val(str) = 2 Then
              Command6.BackColor = vbGreen
           ElseIf Val(str) = 3 Then
              Command7.BackColor = vbGreen
           ElseIf Val(str) = 4 Then
              Command21.BackColor = vbGreen
           ElseIf Val(str) = 5 Then
              Command22.BackColor = vbGreen
           ElseIf Val(str) = 6 Then
              Command23.BackColor = vbGreen
           ElseIf Val(str) = 7 Then
              Command24.BackColor = vbGreen
           ElseIf Val(str) = 8 Then
              Command25.BackColor = vbGreen
           ElseIf Val(str) = 9 Then
              Command26.BackColor = vbGreen
           ElseIf Val(str) = 10 Then
              Command27.BackColor = vbGreen
           ElseIf Val(str) = 11 Then
              Command28.BackColor = vbGreen
           ElseIf Val(str) = 12 Then
              Command29.BackColor = vbGreen
           ElseIf Val(str) = 13 Then
              Command30.BackColor = vbGreen
           Else 'str = "01" Then
              Command5.BackColor = vbGreen
           End If
           
        End If
        
        
        
        Text12.Text = Format(str_zhank / 10, "00.0")
        Text5.Text = str_PingL

End Function


Private Function LianJie()
Dim str As String
Dim Pi  As Integer
Dim i As Integer
Dim X As String
Dim Y As String

GongDongBL = 100
PingLvMax = 2000000

 If (Sendtest_COM(COM_SEL) = True) Then

    MSComm1.Output = "a" + Chr(&HA)    '校验码

    delay_ms (100)
    
    str = Trim(MSComm1.Input)
    If (Len(str) > 0) Then
      Text33.Text = str
       
       i = Len(str)
       Do While i
          If Mid(str, i, 1) >= 0 And Mid(str, i, 1) <= 9 Then
             X = Mid(str, i, 1)
             Y = X + Y
             
          End If
          i = i - 1
       Loop

      PingLvMax = Val(Y)
      
      'Frame3.Caption = PingLvMax
      PingLvMax = (PingLvMax Mod 100) * 1000000
      GongDongBL = PingLvMax / 20000
      
      If PingLvMax = 0 Then
         GongDongBL = 100
         PingLvMax = 2000000
      End If
    
    End If
    
End If
End Function


Private Sub Text12_Change()

CePing = False
JiShu = False

'strText = Replace(Text12.Text, ".", "")
strText = Text12.Text
 If Val(strText) >= 100 Then
    Text12.Text = "99.9"
 ElseIf Val(strText) = 0 Then
    Text12.Text = "0.1"
 End If
HScroll2.Value = Val(Val(Text12.Text) * 10)

If (Sendtest_COM(COM_SEL) = True) Then
    SMN = True 'MSComm1.Output = "br0"  + Chr(&HA)  '停止扫描

    strText = "bd" + Format(Val(HScroll2.Value), "000")  'Replace(Text12.Text, ".", "")
    
    MSComm1.Output = strText + Chr(&HA) '校验码
    
    If Check5.Value = 1 Then   '  同步
       Text24.Text = Text12.Text
    End If
End If

If Combo3.ListIndex = 1 Then

    Picture4.Cls
    Picture4.DrawWidth = 2
    
    For Xbuf = 0 To 200
        Xbuf2 = (Xbuf) * (Picture4.Width / 200)
        
        If Val(Text12.Text) < (Xbuf Mod 102) Then
          Ybuf2 = Picture4.Height - 5
        Else
          Ybuf2 = 5
        End If
        
        Picture4.Line (Xbuf1, Ybuf1)-(Xbuf2, Ybuf2), RGB(0, 0, 255)
        Xbuf1 = Xbuf2
        Ybuf1 = Ybuf2
        
    Next Xbuf
ElseIf Combo3.ListIndex = 2 Then
    Picture4.Cls
    Picture4.DrawWidth = 2
    
    Xbuf1 = 0
    Ybuf1 = Picture4.Height
    For Xbuf = 1 To 200
        Xbuf2 = (Xbuf) * (Picture4.Width / 200)
        
        If Val(Text12.Text) > 50 Then
           Ybuf2 = Picture4.Height - (Xbuf Mod 100) * (Picture4.Height / 100)
        ElseIf Val(Text12.Text) < 50 Then
           Ybuf2 = (Xbuf Mod 100) * (Picture4.Height / 100)
           
        Else
            If (Xbuf Mod 100) < 50 Then
              Ybuf2 = Picture4.Height - (Xbuf Mod 100) * (Picture4.Height / 50)
            Else
              Ybuf2 = (Xbuf Mod 50) * (Picture4.Height / 50)
            End If
        End If
        
        Picture4.Line (Xbuf1, Ybuf1)-(Xbuf2, Ybuf2), RGB(0, 0, 255)
        Xbuf1 = Xbuf2
        Ybuf1 = Ybuf2
        
    Next Xbuf
End If

End Sub

Private Sub Text16_Change()

Dim strText As String
 
HScro14 = False

strText = Val(Text16.Text)
strText = Format(Val(strText), "00.00")

If Val(strText) < (-10) Then
  Text16.Text = "-10.00"
  HScroll4.Value = 0
ElseIf Val(strText) <= 10 Then
  HScroll4.Value = Val(strText) * 100 + 1000
Else
  Text16.Text = "10.00"
  HScroll4.Value = 2000
  Exit Sub
End If

HScro14 = True

 If (Sendtest_COM(COM_SEL) = True) Then
    SMN = True 'MSComm1.Output = "br0"  + Chr(&HA)  '停止扫描
    
    MSComm1.Output = "bo" + strText + Chr(&HA) '校验码
      
    If Check3.Value = 1 Then   '  同步
       Text22.Text = Text16.Text
    End If
End If

End Sub

Private Sub Text18_Change()

Dim doda As Long
 
HScro16 = False
If Val(Text8.Text) <= PingLvMax Then
  HScroll6.Value = Val(Text18.Text) / GongDongBL
Else
  Text8.Text = Format(Val(PingLvMax), "0.00")
  HScroll6.Value = Val(Text18.Text) / GongDongBL
  Exit Sub
End If
HScro16 = True

 If (Sendtest_COM(COM_SEL) = True) Then
'    doda = Val(Text18.Text) * 100    'doda = Format(doda, "00000000.00")
'    strText = doda
    strText = Format(Val(Text18.Text), "00000000.00")
    strText = "df" + Replace(strText, ".", "")
    
    SMN = True 'MSComm1.Output = "br0"  + Chr(&HA)  '停止扫描
    MSComm1.Output = strText + Chr(&HA) '校验码
End If

End Sub

Private Sub Text20_Change()
Dim strText As String
 
HScro17 = False

strText = Val(Text20.Text)
strText = Format(Val(strText), "00.00")

If Val(strText) <= 20 Then
  HScroll7.Value = Val(strText) * 100
Else
  Text20.Text = "20.00"
  HScroll7.Value = 2000
  Exit Sub
End If

HScro17 = True

 If (Sendtest_COM(COM_SEL) = True) Then
    SMN = True 'MSComm1.Output = "br0"  + Chr(&HA)  '停止扫描
    
    MSComm1.Output = "da" + strText + Chr(&HA) '校验码
End If
End Sub

Private Sub Text22_Change()

Dim strText As String
 
HScro18 = False

strText = Val(Text22.Text)
strText = Format(Val(strText), "00.00")

If Val(strText) < (-10) Then
  Text22.Text = "-10.00"
  HScroll8.Value = 0
ElseIf Val(strText) <= 10 Then
  HScroll8.Value = Val(strText) * 100 + 1000
Else
  Text22.Text = "10.00"
  HScroll8.Value = 2000
  Exit Sub
End If

HScro18 = True

 If (Sendtest_COM(COM_SEL) = True) Then
    SMN = True 'MSComm1.Output = "br0"  + Chr(&HA)  '停止扫描
    
    MSComm1.Output = "do" + strText + Chr(&HA) '校验码
End If
End Sub



Private Sub Text24_Change()


CePing = False
JiShu = False

strText = Text24.Text 'Replace(Text24.Text, ".", "")
 If Val(strText) >= 100 Then
    Text24.Text = "99.9"
 ElseIf Val(strText) = 0 Then
    Text24.Text = "0.1"
 End If
HScroll10.Value = Val(Text24.Text) * 10

If (Sendtest_COM(COM_SEL) = True) Then

    SMN = True 'MSComm1.Output = "br0"  + Chr(&HA)  '停止扫描

    strText = "dd" + Format(Val(HScroll10.Value), "000")  'Replace(Text24.Text, ".", "")
    
    MSComm1.Output = strText + Chr(&HA) '校验码
End If

If Combo4.ListIndex = 1 Then

    Picture5.Cls
    Picture5.DrawWidth = 2
    
    For Xbuf = 0 To 200
        Xbuf2 = (Xbuf) * (Picture5.Width / 200)
        
        If Val(Text24.Text) < (Xbuf Mod 102) Then
          Ybuf2 = Picture5.Height - 5
        Else
          Ybuf2 = 5
        End If
        
        Picture5.Line (Xbuf1, Ybuf1)-(Xbuf2, Ybuf2), RGB(0, 0, 255)
        Xbuf1 = Xbuf2
        Ybuf1 = Ybuf2
        
    Next Xbuf
ElseIf Combo4.ListIndex = 2 Then
    Picture5.Cls
    Picture5.DrawWidth = 2
    
    Xbuf1 = 0
    Ybuf1 = Picture5.Height
    For Xbuf = 1 To 200
        Xbuf2 = (Xbuf) * (Picture5.Width / 200)
        
        If Val(Text24.Text) > 50 Then
           Ybuf2 = Picture5.Height - (Xbuf Mod 100) * (Picture5.Height / 100)
        ElseIf Val(Text24.Text) < 50 Then
           Ybuf2 = (Xbuf Mod 100) * (Picture5.Height / 100)
           
        Else
            If (Xbuf Mod 100) < 50 Then
              Ybuf2 = Picture5.Height - (Xbuf Mod 100) * (Picture5.Height / 50)
            Else
              Ybuf2 = (Xbuf Mod 50) * (Picture5.Height / 50)
            End If
        End If
        
        Picture5.Line (Xbuf1, Ybuf1)-(Xbuf2, Ybuf2), RGB(0, 0, 255)
        Xbuf1 = Xbuf2
        Ybuf1 = Ybuf2
        
    Next Xbuf
End If
End Sub

Private Sub Text26_Change()

Dim strText As String
 
HScro10 = False

strText = Val(Text26.Text)
strText = Format(Val(strText), "000")


If Val(strText) <= 359 Then
  PH.Value = Val(strText)
Else
  Text26.Text = "359"
  HScroll8.Value = 359
  Exit Sub
End If

HScro10 = True

 If (Sendtest_COM(COM_SEL) = True) Then
    SMN = True 'MSComm1.Output = "br0"  + Chr(&HA)  '停止扫描
    
    MSComm1.Output = "dp" + strText + Chr(&HA) '校验码
End If

End Sub

Private Sub Text30_Change()

If (Sendtest_COM(COM_SEL) = True) Then

    If Val(Text30.Text) > 1048574 Then
       Text30.Text = 1048574
    End If

    strText = "tn" + Format(Val(Text30.Text), "0000000")
    MSComm1.Output = strText + Chr(&HA) '校验码
    
End If

End Sub


Private Sub Text5_Change()

Dim doda As Long
 
HScro11 = False
If Val(Text5.Text) <= PingLvMax Then
  HScroll1.Value = Val(Text5.Text) / GongDongBL
Else
  Text5.Text = Format(Val(PingLvMax), "0.00")
  HScroll1.Value = Val(Text5.Text) / GongDongBL
  Exit Sub
End If
HScro11 = True

 If (Sendtest_COM(COM_SEL) = True) Then
'    doda = Val(Text5.Text) * 100    'doda = Format(doda, "00000000.00")
'    strText = doda
    strText = Format(Val(Text5.Text), "00000000.00")
    strText = "bf" + Replace(strText, ".", "")
    
    SMN = True 'MSComm1.Output = "br0"  + Chr(&HA)  '停止扫描
    
    MSComm1.Output = strText + Chr(&HA) '校验码
    
    If Check1.Value = 1 Then   '  同步
       Text18.Text = Text5.Text
    End If
    

End If



End Sub

Private Sub Text9_Change()

Dim strText As String
 
HScro13 = False

strText = Val(Text9.Text)
strText = Format(Val(strText), "00.00")

If Val(strText) <= 20 Then
  HScroll3.Value = Val(strText) * 100
Else
  Text9.Text = "20.00"
  HScroll3.Value = 2000
  Exit Sub
End If

HScro13 = True

 If (Sendtest_COM(COM_SEL) = True) Then
    SMN = True 'MSComm1.Output = "br0"  + Chr(&HA)  '停止扫描
    
    MSComm1.Output = "ba" + strText + Chr(&HA) '校验码
    
    If Check2.Value = 1 Then   '  同步
       Text20.Text = Text9.Text
    End If
End If

End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
    On Error Resume Next
    Select Case Button.Key
        Case "新建"
            Call Command2_Click
            '应做:添加 '新建' 按钮代码。
            'MsgBox "添加 '新建' 按钮代码。"
        Case "打开"
            '应做:添加 '打开' 按钮代码。
            Call 打开_Click
            'MsgBox "添加 '打开' 按钮代码。"
        Case "保存"
            '应做:添加 '保存' 按钮代码。
            Call 保存_Click
            'MsgBox "添加 '保存' 按钮代码。"
        Case "幅度倍增"
            '应做:添加 '乘1' 按钮代码。
            Call 幅度倍增_Click
            'MsgBox "添加 '乘1' 按钮代码。"
        Case "直流叠加"
            '应做:添加 '加1' 按钮代码。
            Call 直流叠加_Click
            'MsgBox "添加 '加1' 按钮代码。"
        Case "X轴镜像"
            '应做:添加 'X1' 按钮代码。
            Call X轴镜像_Click
            'MsgBox "添加 'X1' 按钮代码。"
        Case "Y轴镜像"
            '应做:添加 'Y1' 按钮代码。
            Call Y轴镜像_Click
            'MsgBox "添加 'Y1' 按钮代码。"
        Case "帮助这是什么"
            SSTab1.Tab = 2
            '应做:添加 '帮助这是什么' 按钮代码。
           ' MsgBox "添加 '帮助这是什么' 按钮代码。"
    End Select
End Sub



 
'检测端口号函数'
Private Function Test_COM(com_num As Integer) As Boolean
    
    On Error GoTo Comm_Error
        MSComm1.CommPort = com_num                         '这里接收传入的串口号
        MSComm1.PortOpen = True
        MSComm1.PortOpen = False
        Test_COM = True                                    '如果操作成功，则说明当前串口可用，返回1，表示串口可用
        Text33.Text = "Port open succeeded."
       
        MSComm1.CommPort = com_num        '设置通信端口号为COM1
        MSComm1.Settings = "9600,N,8,1"  ' "9600,N,8,1"   '设置串口参数
        MSComm1.NullDiscard = False
        MSComm1.InputMode = 0 'ComInputModeBinary   '接收文本型数据
        MSComm1.PortOpen = True           '打开通信端口1
        com_last_open_num = 1             '表明端口打开
'        Shape1.FillColor = RGB(0, 255, 0)
        Exit Function
        
Comm_Error:
        
'        Shape1.FillColor = RGB(0, 0, 0)
        If Err.Number = 8002 Then
            Text33.Text = "Port does not exist!"
            MsgBox "Port does not exist!"
        ElseIf Err.Number = 8005 Then
            Text33.Text = "Port is already open!"
'            MsgBox "端口已打开！"
        ElseIf Err.Number = 8016 Then
            Text33.Text = "Port occupied by other software!"
            MsgBox "Port occupied by other software!"
        ElseIf Err.Number = 8018 Then
            Text33.Text = "Port failed to open!"
            MsgBox "Port failed to open!"
        Else
            Text33.Text = "Other errors!"
            MsgBox "Other errors!"
        End If
        
        Test_COM = False                                       '如果出错，则返回0
    Exit Function
    Resume Next

End Function


Private Sub Command1_Click()
   Textsend.Text = ""  '清空发送窗
End Sub


Private Sub Command2_Click() '波形窗置零
    'Set Picture1.Picture = Nothing
    'Call draw  '画表格
    For X = 0 To 2047
      WAVE(X) = 2047
    Next X
    pic_rsh = 255 '刷新图片框
End Sub

Private Sub Command3_Click()
    Dim Xbuf As Integer 'Single
    Dim Ybuf As Integer 'Single
    Dim bytSendByte() As Integer
    Dim strSendText As String    '发送文本数据
    
    Set Picture2.Picture = Nothing
    strSendText = Textsend.Text
    
    If Option6.Value = True Then
       Ybuf = strDecToByteArray(strSendText, bytSendByte())
    Else
       Ybuf = strHexToByteArray(strSendText, bytSendByte())
    End If
    
    For Xbuf = 1 To Ybuf - 1
       Picture2.Line ((Xbuf - 1) * X2_Ref, (4095 - bytSendByte(Xbuf - 1)) * Y2_Ref)-(Xbuf * X2_Ref, (4095 - bytSendByte(Xbuf)) * Y2_Ref), RGB(0, 0, 255)
    Next Xbuf
End Sub

Public Function draw()
    
    For Xbuf = 1 To 15   ' 划竖线
       If Xbuf = 8 Then
         Line1(Xbuf).BorderColor = RGB(0, 0, 0) '&H00FF00FF
       Else
         Line1(Xbuf).BorderColor = RGB(0, 255, 0)
       End If
       
       Line1(Xbuf).BorderWidth = 1
       Line1(Xbuf).BorderStyle = 3

       Line1(Xbuf).X1 = Xbuf * (Picture1.ScaleWidth / 16)
       Line1(Xbuf).Y1 = 0
       Line1(Xbuf).X2 = Xbuf * (Picture1.ScaleWidth / 16)
       Line1(Xbuf).Y2 = Picture1.ScaleHeight
    Next Xbuf

    For Xbuf = 1 To 7   ' 划横线
       If Xbuf = 4 Then
         Line2(Xbuf).BorderColor = RGB(0, 0, 0) '&H00FF00FF
       Else
         Line2(Xbuf).BorderColor = RGB(0, 255, 0)
       End If
       Line2(Xbuf).BorderWidth = 1
       Line2(Xbuf).BorderStyle = 3
       
       Line2(Xbuf).X1 = 0
       Line2(Xbuf).Y1 = Xbuf * (Picture1.ScaleHeight / 8)
       Line2(Xbuf).X2 = Picture1.ScaleWidth
       Line2(Xbuf).Y2 = Xbuf * (Picture1.ScaleHeight / 8)
    Next Xbuf
    
End Function


Private Sub Command4_Click()

 Dim WAVE_buf(4096) As Byte
 Dim aa(0) As Byte
 Dim bb(0) As Byte
 Dim buf$
 Dim longth As Integer
 Dim n As Integer
 Dim m As Integer
 Dim delay As Long
 'Dim Savetime As Double
 Dim strSendText As String    '发送文本数据
 Dim bytSendByte() As Byte    '发送二进制数据
 
 COMForm.Enabled = False
 
 If (Not (Sendtest_COM(COM_SEL) = True)) Then
   COMForm.Enabled = True
   Exit Sub
 End If

 
 MSComm1.OutBufferCount = 0 '清空发送缓冲区
 MSComm1.InBufferCount = 0 '清空接收缓冲区
 aa(0) = &HA5
 MSComm1.Output = "DDS_WAVE"    '校验码
 MSComm1.Output = aa            '命令码
 'MSComm1.InBufferCount = 0 '清空接收缓冲区
 
 JinDuTiao = 1   '进度条

 delay_ms (500)  '1ms延时
 DoEvents                     '转让控制权，以便让操作系统处理其它的事件。
 buf = Trim(MSComm1.Input)    '将缓冲区内的数据读入buf变量中
 
 
 'buf =buf-Asc("A")   ' H41
 If (buf = Chr(&H4C)) Then 'L
    Text33.Text = (" FY3212") + vbCrLf
  ElseIf (buf = Chr(&H58)) Then
    Text33.Text = (" FY3224") + vbCrLf
 ElseIf (buf = Chr(&H54)) Then
    Text33.Text = (" FY3220") + vbCrLf
 ElseIf (buf = Chr(&H4A)) Then
    Text33.Text = (" FY3210") + vbCrLf
 ElseIf (buf = Chr(&H49)) Then
    Text33.Text = (" FY3209") + vbCrLf
 ElseIf (buf = Chr(&H48)) Then
    Text33.Text = (" FY3208") + vbCrLf
 ElseIf (buf = Chr(&H45)) Then
    Text33.Text = (" FY3205") + vbCrLf
 ElseIf (buf = Chr(&H43)) Then
    Text33.Text = (" FY3203") + vbCrLf
 ElseIf (buf = Chr(&H42)) Then
    Text33.Text = (" FY3202") + vbCrLf
 Else
    Text33.Text = (" FY32xx") + vbCrLf
 End If

 
 buf = 0


' 清除对应区
 If SAVE_SEL = "1" Then
   aa(0) = &HF1
   strSend = "DDS_WAVE"
 ElseIf SAVE_SEL = "2" Then
   aa(0) = &HF2
   strSend = "DDS_WAVE"
 ElseIf SAVE_SEL = "3" Then
   aa(0) = &HF3
   strSend = "DDS_WAVE"
 ElseIf SAVE_SEL = "4" Then
   aa(0) = &HF4
   strSend = "DDS_WAVE"
 End If

 MSComm1.Output = strSend  '校验码
 MSComm1.Output = aa       '命令码

 delay_ms (500)  '1ms延时
 DoEvents                     '转让控制权，以便让操作系统处理其它的事件。
 buf = Trim(MSComm1.Input)    '将缓冲区内的数据读入buf变量中

 'Text34.Width = (Text1.Width / 15) * 1 '进度条值
  
 If buf = "SE" Then     'buf = "S" Or buf = "E" Or 单片机表明开始擦除波形存储区
     
     Text33.Text = "Start erase store." + vbCrLf
     
     
    If buf = "SE" Then  '单片机表示擦除完毕
      MSComm1.InBufferCount = 0 '清空接收缓冲区
      'Text34.Width = (Text1.Width / 15) * 2 '进度条值
        
      Text33.Text = "Erase is complete." + vbCrLf

      If SAVE_SEL = "1" Then
       aa(0) = &H1
       strSend = "DDS_WAVE"
     ElseIf SAVE_SEL = "2" Then
       aa(0) = &H2
       strSend = "DDS_WAVE"
     ElseIf SAVE_SEL = "3" Then
       aa(0) = &H3
       strSend = "DDS_WAVE"
    ElseIf SAVE_SEL = "4" Then
       aa(0) = &H4
       strSend = "DDS_WAVE"
     End If

     MSComm1.Output = strSend  '校验码-------------------------------------------------------------------
     MSComm1.Output = aa       '命令码
     
    MSComm1.InBufferCount = 0 '清空接收缓冲区
    delay_ms (500)  '1ms延时
    DoEvents                     '转让控制权，以便让操作系统处理其它的事件。
    buf = Trim(MSComm1.Input)    '将缓冲区内的数据读入buf变量中
 
     If buf = "W" Then  '单片机准备接收数据
     
        JinDuTiao = 2
        
        Text33.Text = "Data is being written." + vbCrLf
        
        delay_ms (1)

        
        longth = 2048

        Text33.Text = "Data length：" + Format(longth) + vbCrLf
        
        m = 0
        For n = 0 To 2047  '消除上次数据没有发完带来的影响
            WAVE_buf(m) = WAVE(n) Mod 256
            m = m + 1
            
            WAVE_buf(m) = Fix(WAVE(n) / 256)
            m = m + 1
            
            
            JinDuTiao = (2 + (3 / 2048) * n)    'Text34.Width = (3495 / 50) * (2 + (10 / 2048) * n) '进度条
            DoEvents
        Next n
        
        MSComm1.OutBufferCount = 0 '清空发送缓冲区
        MSComm1.InBufferCount = 0 '清空接收缓冲区

   
        delay = 0
        For n = 0 To 4095  '消除上次数据没有发完带来的影响
            aa(0) = WAVE_buf(n)
            MSComm1.Output = aa

            delay = timeGetTime '记下开始时的时间
            While timeGetTime <= delay + 1 '循环等待
                DoEvents '转让控制权，以便让操作系统处理其它的事件。
            Wend
            
            
'            delay_ms( 1
'            DoEvents
            
'            delay = delay + 1
'            If delay = 180000 Then
'              Text1.Text = ""
'              For m = 0 To 4096 '消除上次数据没有发完带来的影响
'                 MSComm1.Output = Chr(&H0)
'              Next m
'              pp = MsgBox("连接超时", 16)
'              Text34.Width = 0    '进度条值
'              COMForm.Enabled = True
'              Exit Sub
'            End If
            
            JinDuTiao = (5 + (25 / 4095) * n)
            
        Next n
        
        MSComm1.InputMode = 0 'comInputModeBinary   接收文本模式或16进制
        MSComm1.OutBufferCount = 0 '清空发送缓冲区
        MSComm1.InBufferCount = 0 '清空接收缓冲区
        
        For n = 0 To 200

            Text34.Width = (3495 / 50) * (30 + (20 / 200) * n) '进度条
            
            delay = timeGetTime '记下开始时的时间
            While timeGetTime <= delay + 1 '循环等待
                DoEvents '转让控制权，以便让操作系统处理其它的事件。
            Wend
           
'           DoEvents                     '转让控制权，以便让操作系统处理其它的事件。
'           delay_ms( 1
        Next n        '等待单片机回复数据 判断缓冲区内是否存在数据
        
        Text33.Text = "Data is written." + vbCrLf
        
      Else
         Text33.Text = ""
         For n = 0 To 4096 '消除上次数据没有发完带来的影响
            MSComm1.Output = Chr(&H0)
         Next n
         pp = MsgBox("Parity error2", 16)
         Text34.Width = 3495    '进度条值
         COMForm.Enabled = True
         Exit Sub
      End If
    Else
       For n = 0 To 4096 '消除上次数据没有发完带来的影响
         MSComm1.Output = Chr(&H0)
       Next n

       pp = MsgBox("Parity error1", 16)
       Text33.Text = ""
       Text34.Width = 3495    '进度条值
       COMForm.Enabled = True
    Exit Sub
    End If
 Else
    For n = 0 To 4096  '消除上次数据没有发完带来的影响
       MSComm1.Output = Chr(&H0)
    Next n
    pp = MsgBox("The port is not connected properly！", 16)
    Text33.Text = ""
    Text34.Width = 3495    '进度条值
    COMForm.Enabled = True
    Exit Sub
 End If
   COMForm.Enabled = True
   MSComm1.PortOpen = False   '关闭通信端口
End Sub


'串口初始化
Private Sub Form_Load()

    Dim Xbuf As Integer
    
    Formrun = True

'    Form1.Show '打开开机窗口
'    DoEvents
'    delay_ms( 200 '显示logo两秒
    
    SAVE_SEL = "1"
    第一存储区.Checked = True

    
    COM_SEL = 1
    自动连接.Checked = False
    
    
    HScro11 = True
    HScro12 = True
    HScro13 = True
    HScro14 = True
    HScro16 = True
    HScro17 = True
    HScro18 = True
    HScro10 = True
    
    CePing = False
    CePingde = 0
    JiShu = False
    JiShude = 0

'    Option1.Value = True
    Option6.Value = True
    
    X_Ref = (Picture1.ScaleWidth / 2048)
    Y_Ref = ((Picture1.ScaleHeight) / 4096)
    
    X2_Ref = (Picture2.ScaleWidth / 2048)
    Y2_Ref = ((Picture2.ScaleHeight - 10) / 4096)
    
    'Textsend.Text = Textsend.Text + "X_Ref =" + Format(X_Ref) + "  Y_Ref = " + Format(Y_Ref) + " , " '+ vbCrLf
    
    Call draw  '画表格VB
    Picture1.DrawWidth = 1
    For X = 0 To 2048
      WAVE(X) = 2047
    Next X

    For Xbuf = 1 To 2048
       Picture1.Line ((Xbuf - 1) * X_Ref, (4096 - WAVE(Xbuf - 1)) * Y_Ref)-(Xbuf * X_Ref, (4096 - WAVE(Xbuf)) * Y_Ref), RGB(0, 0, 255)
    Next Xbuf
    
    Combo2.ListIndex = 0
    
    pic_rsh = 0 '图片窗刷新标志
    qmouse = 0
    mouse_X = 0
    mouse_Y = 0
    Savetime = 0
    
    Call GetAllPort
    
    'Test_COM (1)          '端口初始化  调用端口初始化程序
    
'    Call LianJie
'    Call SaoPingJiaZai
'    Call Command5_Click

'     Call SSTab1_Click(2)
    
    
'    Unload Form1 '关闭开机窗口
'    Me.Show      '加载软件窗口

 ' 确保窗体改变时控件随之改变
      Call ResizeInit(Me)
  
End Sub

Private Sub Form_Resize()


  Dim H, i As Integer
  On Error Resume Next
  
  '在程序装入时必须加入
  If Formrun <> True Then
    Call ResizeForm(Me)
  End If
  
  Formrun = False
  
  Resize_ALL Me 'Me是窗体名，Form1,Form2等等都可以
  

  
  JDuTiao_L = Text34.Width

    X_Ref = (Picture1.ScaleWidth / 2048)
    Y_Ref = ((Picture1.ScaleHeight) / 4096)
    
    X2_Ref = (Picture2.ScaleWidth / 2048)
    Y2_Ref = ((Picture2.ScaleHeight - 10) / 4096)
    
'    If (SSTab1.Tab = 0) Then
    
        pic_rsh = 255 '图片窗刷新标志
    
'    End If



End Sub


'当用户选择端口号时
Private Sub Combo1_Click()
    If (MSComm1.PortOpen = True) Then
      MSComm1.PortOpen = False   '先关闭上一个打开的端口
    End If
    Test_COM (COM_SEL) '调用端口初始化程序
End Sub


'**********************************
'字符表示的十六进制数转化为相应的整数
'错误则返回  -1
'**********************************
Function ConvertHexChr(str As String) As Integer
    
    Dim test As Integer
    
    test = Asc(str)
    If test >= Asc("0") And test <= Asc("9") Then
        test = test - Asc("0")
    ElseIf test >= Asc("a") And test <= Asc("f") Then
        test = test - Asc("a") + 10
    ElseIf test >= Asc("A") And test <= Asc("F") Then
        test = test - Asc("A") + 10
    Else
        test = -1                                       '出错信息
    End If
    ConvertHexChr = test
    
End Function


'**********************************
'字符串表示的十六进制数据转化为相应的字节串
'返回转化后的字节数
'**********************************
Function strHexToByteArray(strText As String, bytByte() As Integer) As Integer
    
    Dim HexData As Integer          '十六进制(二进制)数据字节对应值
    Dim hstr As String * 1          '高位字符
    Dim mstr As String * 1          '低位字符
    Dim lstr As String * 1          '低位字符
    Dim HighHexData As Integer      '高位数值
    Dim MidHexData As Integer      '高位数值
    Dim LowHexData As Integer       '低位数值
    Dim HexDataLen As Integer       '字节数
    Dim StringLen As Integer        '字符串长度
    Dim Account As Integer          '计数
        
    HexDataLen = 0
    strHexToByteArray = 0
    
    StringLen = Len(strText)
    Account = StringLen \ 2
    ReDim bytByte(Account + 1)

    
    For n = 1 To StringLen + 20
        Do
          If n > StringLen Then
            'HexDataLen = HexDataLen
            Exit For
          End If
          hstr = Mid(strText, n, 1)    '清除开始 前空格
          n = n + 1
        Loop While (ConvertHexChr(hstr) = -1)
        
        mstr = Mid(strText, n, 1)
        If (ConvertHexChr(mstr) = -1) Or (n > StringLen) Then     '消除只有一位且前面没有0的 16进制数
           HighHexData = ConvertHexChr(hstr)
           bytByte(HexDataLen) = HighHexData
           HexDataLen = HexDataLen + 1
        Else
        
            n = n + 1
            lstr = Mid(strText, n, 1)
            If (ConvertHexChr(lstr) = -1) Or (n > StringLen) Then     '消除只有一位且前面没有0的 16进制数
               HighHexData = ConvertHexChr(hstr)
               LowHexData = ConvertHexChr(lstr)
               HexData = HighHexData * 16 + LowHexData
               bytByte(HexDataLen) = HexData
               HexDataLen = HexDataLen + 1
            Else
               HighHexData = ConvertHexChr(hstr)
               MidHexData = ConvertHexChr(mstr)
               LowHexData = ConvertHexChr(lstr)
               HexData = HighHexData * 256 + MidHexData * 16 + LowHexData
               bytByte(HexDataLen) = HexData
               HexDataLen = HexDataLen + 1
            End If
          End If
          
        
        lstr = Mid(strText, n + 1, 1)
        
        If (ConvertHexChr(lstr) >= 0 And ConvertHexChr(lstr) < 16) Or (HexData > 4096) Then
           pp = MsgBox(Format(HexDataLen + 1) + "rd data overflow", 16)
           HexDataLen = 0
           Exit Function
        End If

    Next n
    

    
    If HexDataLen > 0 Then                              '修正最后一次循环改变的数值
        HexDataLen = HexDataLen - 1
        ReDim Preserve bytByte(HexDataLen)
    Else
        ReDim Preserve bytByte(0)
    End If
    
    If StringLen = 0 Then                               '如果是空串,则不会进入循环体
        strHexToByteArray = 0
    Else
        strHexToByteArray = HexDataLen + 1
    End If
    
    
End Function

'**********************************
'字符串表示的十进制数据转化为相应的字节串
'返回转化后的字节数
'**********************************
Function strDecToByteArray(strText As String, bytByte() As Integer) As Integer
    
    Dim HexData As Integer          '十六进制(二进制)数据字节对应值
    Dim hstr As String * 1          '高位字符
    Dim mstr As String * 1          '中位字符
    Dim lstr As String * 1          '低位字符
    Dim llstr As String * 1          'l低位字符
    Dim HighHexData As Integer      '高位数值
    Dim MidHexData As Integer       '中位数值
    Dim LowHexData As Integer       '低位数值
    Dim LLowHexData As Integer       'L低位数值
    Dim HexDataLen As Integer       '字节数
    Dim StringLen As Integer        '字符串长度
    Dim Account As Integer          '计数
        
    HexDataLen = 0
    strDecToByteArray = 0
    
    StringLen = Len(strText)
    Account = StringLen \ 2
    ReDim bytByte(StringLen) 'Account + 1)
    
    For n = 1 To StringLen + 20
        Do
          If n > StringLen Then    '检测是否已经检索完毕
            'HexDataLen = HexDataLen - 1
            Exit For
          End If
          hstr = Mid(strText, n, 1)    '清除开始 前空格
          n = n + 1
        Loop While (ConvertHexChr(hstr) = -1)
        
        
        mstr = Mid(strText, n, 1)
        If (ConvertHexChr(mstr) = -1) Or (n > StringLen) Then     '消除只有一位且前面没有0的 16进制数
           HighHexData = ConvertHexChr(hstr)
           If hstr > 9 Then
               pp = MsgBox("Data overflow", 16)
               HexDataLen = 0
               Exit Function
           End If
           bytByte(HexDataLen) = HighHexData
           HexDataLen = HexDataLen + 1
        Else
           MidHexData = ConvertHexChr(mstr)
           If MidHexData > 9 Then
             pp = MsgBox("Data overflow", 16)
             HexDataLen = 0
             Exit Function
           End If
           
           n = n + 1
           lstr = Mid(strText, n, 1)
           If (ConvertHexChr(lstr) = -1) Or (n > StringLen) Then     '消除只有一位且前面没有0的 16进制数
               HighHexData = ConvertHexChr(hstr)
               MidHexData = ConvertHexChr(mstr)
               bytByte(HexDataLen) = HighHexData * 10 + MidHexData
               HexDataLen = HexDataLen + 1
            Else
               LowHexData = ConvertHexChr(lstr)
               If LowHexData > 9 Then
                 pp = MsgBox("Data overflow", 16)
                 HexDataLen = 0
                 Exit Function
               End If
               
               n = n + 1
               llstr = Mid(strText, n, 1)
               If (ConvertHexChr(llstr) = -1) Or (n > StringLen) Then     '消除只有一位且前面没有0的 16进制数
                    HighHexData = ConvertHexChr(hstr)
                    MidHexData = ConvertHexChr(mstr)
                    LowHexData = ConvertHexChr(lstr)
                    bytByte(HexDataLen) = HighHexData * 100 + MidHexData * 10 + LowHexData
                    HexDataLen = HexDataLen + 1
               Else
                    LLowHexData = ConvertHexChr(lstr)
                    If LowHexData > 9 Then
                      pp = MsgBox("Data overflow", 16)
                      HexDataLen = 0
                      Exit Function
                    End If
                    
               
                   HighHexData = ConvertHexChr(hstr)
                   MidHexData = ConvertHexChr(mstr)
                   LowHexData = ConvertHexChr(lstr)
                   LLowHexData = ConvertHexChr(llstr)
                   HexData = HighHexData * 1000 + MidHexData * 100 + LowHexData * 10 + LLowHexData
                   
                   If HexData > 4096 Then
                     pp = MsgBox(Format(HexDataLen + 1) + "rd data overflow", 16)
                     HexDataLen = 0
                     Exit Function
                   End If
                   
                   bytByte(HexDataLen) = HexData 'Mod 256  '求余256防止数据溢出
                   HexDataLen = HexDataLen + 1
                   
              End If
            End If
        End If
        
        If (Mid(strText, n + 1, 1) >= 0 And Mid(strText, n + 1, 1) < 10) Then
           pp = MsgBox(Format(HexDataLen + 1) + "rd data overflow", 16)
           HexDataLen = 0
           Exit Function
        End If
        
        
    Next n
    
    If HexDataLen > 0 Then                              '修正最后一次循环改变的数值
        HexDataLen = HexDataLen - 1
        ReDim Preserve bytByte(HexDataLen)
    Else
        ReDim Preserve bytByte(0)
    End If
    
    If StringLen = 0 Then                               '如果是空串,则不会进入循环体
        strDecToByteArray = 0
    Else
        strDecToByteArray = HexDataLen + 1
    End If
    
    
End Function


'**********************************
'读出.lvm文件
'返回转化后的字节数
'**********************************
Function DEDecToByteArray(strText As String, str As String) As Integer
    
    Dim HexData As Integer          '十六进制(二进制)数据字节对应值
    Dim hstr As String * 1          '高位字符
    Dim n As Long
    Dim StringLen As Long        '字符串长度
    
    strText = Replace(strText, "t", "  ")
    strText = Replace(strText, Chr(13), "  ")
    strText = Replace(strText, Chr(10), "  ")
    
    StringLen = Len(strText)
    
    'Textsend.Text = ""
    str = ""

    n = InStr(strText, "Commen")
    
    n = n + 12
    hstr = Mid(strText, n, 1)    '清除开始 前空格
              
    While n < StringLen
       Do
          str = str + hstr
          n = n + 1
          hstr = Mid(strText, n, 1)    '清除开始 前空格
          
          If n > StringLen Then
                'Textsend.Text = str
             Exit Function
          End If
        Loop While (Not ((hstr = ".") Or (hstr = " ")))

        Do
          n = n + 1
          If n > StringLen Then
                'Textsend.Text = str
             Exit Function
          End If
          hstr = Mid(strText, n, 1)    '清除开始 前空格

       Loop While (hstr <> " ")    '(InStr(hstr,vbLf)>0)
       
       Do
          n = n + 1
          If n > StringLen Then
             'Textsend.Text = str
             Exit Function
          End If
          hstr = Mid(strText, n, 1)    '清除开始 前空格

       Loop While (hstr = " ")    '(InStr(hstr,vbLf)>0)
       
       str = str + "  "
    Wend
    'Textsend.Text = str
    
End Function



'把字符通过串口发送出去
Private Sub Cmdsend_Click()

 Dim longth As Integer
 Dim n As Integer
 Dim m As Integer
 Dim strSendText As String    '发送文本数据
 Dim bytSendByte() As Integer    '发送二进制数据

 
    strSendText = Textsend.Text
    If Option6.Value = True Then
      longth = strDecToByteArray(strSendText, bytSendByte())
    Else
      longth = strHexToByteArray(strSendText, bytSendByte())
    End If
    
    
    Text33.Text = "Phase word length:" + Format(longth) + vbCrLf   '相位字长度为

    If longth = 0 Then
       Exit Sub
    End If
    
    If longth < 2048 Then
       
       
       For n = 0 To (2048 / longth + 1) '由于单片机接收数据需要验证码所以多发的数据不会影响波形的正确性
         For m = 0 To (longth - 1)
          WAVE(n * longth + m) = bytSendByte(m)
         Next m
       Next n
       Text1.ForeColor = RGB(255, 0, 0)
       Text33.Text = "The data is copied " + Format(n - 2) + " times after writing." + vbCrLf
    ElseIf longth > 2048 Then
       Text1.ForeColor = RGB(255, 0, 0)
       Text33.Text = "Phase word number is greater than 2048 !" + vbCrLf + "Only the first 2048 phase word is valid!"
       For m = 0 To 2047
          WAVE(m) = bytSendByte(m)
       Next m
    Else
       For m = 0 To 2047
          WAVE(m) = bytSendByte(m)
       Next m
    End If
    
    Call Command4_Click
        
        
End Sub


Private Sub Picture1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
qmouse = 0
End Sub


'鼠标坐标采集并显示MouseMove   MouseDown
Private Sub Picture1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single) 'X As Integer, Y As Integer)
    Dim Xbuf1 As Integer

  If Button = 1 Then
    If Int(Int(X) / X_Ref) > 2048 Or Int(X) < 0 Then  'Picture1.ScaleWidth
        Exit Sub
    End If
    If Int(Int(Y) / Y_Ref) >= 4096 Or Int(Y) < 0 Then 'Picture1.ScaleHeight
        Exit Sub
    End If
    
     WAVE(Int(Int(X) / X_Ref)) = 4095 - Int(Int(Y) / Y_Ref)

     'Text3.Text = "X=" + Format(Int(Int(X) / X_Ref)) + " Y=" + Format((128 - Int(Int(Y) / Y_Ref)) * (10 / 256), "0.000")
     'Textsend.Text = Textsend.Text + Format(255 - WAVE(Int(Int(X) / X_Ref))) + " "
     
     pic_rsh = 255 '表明鼠标有动作 '图片窗刷新标志

  End If
     
End Sub

'
'鼠标坐标采集并显示MouseMove   MouseDown
Private Sub Picture1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single) 'X As Integer, Y As Integer)
    Dim Xbuf As Integer
    Dim Xbuf1 As Integer
    Dim Ybuf1 As Integer
    Dim Xbuf2 As Integer
    Dim Ybuf2 As Integer
    
    
    If Int(Int(X) / X_Ref) > 2048 Or Int(X) < 0 Then  'Picture1.ScaleWidth
     Exit Sub
    End If
    If Int(Int(Y) / Y_Ref) >= 4096 Or Int(Y) < 0 Then 'Picture1.ScaleHeight
     Exit Sub
    End If
    
  If Button = 1 Then

     
     Xbuf2 = Int(Int(X) / X_Ref)
     Ybuf2 = 4095 - Int(Int(Y) / Y_Ref)
     WAVE(Xbuf2) = Ybuf2
     
     If (qmouse) > 0 Then
     
        If (Xbuf2 > mouse_X) Then
           For i = 0 To (Xbuf2 - mouse_X)
                WAVE(Xbuf2 - i) = Ybuf2 + ((mouse_Y - Ybuf2) / (Xbuf2 - mouse_X)) * i
           Next i
        ElseIf (Xbuf2 < mouse_X) Then
          For i = 0 To (mouse_X - Xbuf2)
                WAVE(Xbuf2 + i) = Ybuf2 + ((mouse_Y - Ybuf2) / (mouse_X - Xbuf2)) * i
          Next i
        End If
     End If
        
    mouse_X = Xbuf2
    mouse_Y = Ybuf2
    
    
    
    qmouse = 4096
    pic_rsh = 255 '表明鼠标有动作 '图片窗刷新标志
  Else
     qmouse = 0
  End If
  
 Text3.Text = "X=" + Format(Int(Int(X) / X_Ref)) + " Y=" + Format((2048 - Int(Int(Y) / Y_Ref)) * (20 / 4096), "0.000")
End Sub


'停止程序运行
Private Sub Cmdquit_Click()
  Unload Me
End Sub


'关闭通信端口,
Private Sub Form_Unload(Cancel As Integer)
    
'    If MsgBox(" 确定退出程序?" + vbCrLf + vbCrLf + "(请注意保存数据)", vbOKCancel + vbQuestion + vbDefaultButton2, "Quit") = vbCancel Then
    If MsgBox("Sure to quit?" + vbCrLf + vbCrLf, vbOKCancel + vbQuestion + vbDefaultButton2, "Quit") = vbCancel Then
      Cancel = True
    End If
    
    If (MSComm1.PortOpen = True) Then
      MSComm1.PortOpen = False   '先关闭上一个打开的端口
    End If
    
End Sub
 
Private Sub Picture3_Click()
ShellExecute Me.hwnd, "open", "http://www.feeltech.cn/", "", "", 5
End Sub

Private Sub Timer1_Timer()
    Dim Xbuf As Integer
    Dim Xbuf1 As Integer
    Dim Ybuf1 As Integer
    Dim Xbuf2 As Integer
    Dim Ybuf2 As Integer
    Dim sdata As Long
    Dim str   As String
    
    If JinDuTiao > 0 And JinDuTiao < 30 Then
     Text34.Width = (3495 / 50) * JinDuTiao  '进度条
    End If
    
    
    If SMN = True Then '停止扫描
       SMN = False
       
       If CePing = True Then
           Command13.BackColor = RGB(244, 244, 244)  'vbBlue
           CePing = False
       End If
       
       If JiShu = True Then
          Command18.BackColor = RGB(244, 244, 244)
          Command14.BackColor = RGB(244, 244, 244)
          JiShu = False
       End If
       
       If SM = True Then
          MSComm1.Output = "br0" + Chr(&HA)   '开始扫描
          SM = False
          Command16.BackColor = RGB(244, 244, 244)
          Command12.BackColor = RGB(244, 244, 244)
       End If
    End If
    
    If pic_rsh = 255 Then 'or Savetime> 250 Then  '相应鼠标动作
         pic_rsh = 0
         'Savetime= 0
         Picture1.Cls  'Set Picture1.Picture = Nothing 'Picture1.AutoRedraw = True    'Refresh
         Picture1.DrawWidth = 1
         Xbuf = 0
         Xbuf1 = (Xbuf) * X_Ref
         Ybuf1 = (4095 - WAVE(Xbuf)) * Y_Ref
         For Xbuf = 1 To 2047
           'Picture1.PSet (Xbuf1 * X_Ref, WAVE(Xbuf1) * Y_Ref)
           Xbuf2 = (Xbuf) * X_Ref
           Ybuf2 = (4095 - WAVE(Xbuf)) * Y_Ref
           Picture1.Line (Xbuf1, Ybuf1)-(Xbuf2, Ybuf2), RGB(0, 0, 255)
           Xbuf1 = Xbuf2
           Ybuf1 = Ybuf2
         Next Xbuf
    End If
    
If (SSTab1.Tab = 2) And (CePing = True) Then  '读出频率值
  If (CePingde = 1) Then
    'MSComm1.InBufferCount = 0 '清空接收缓冲区
    strText = "ce"
    MSComm1.Output = strText + Chr(&HA)   '校验码
  End If
  
  str = Trim(MSComm1.Input)
  If (Len(str) > 0) Then
    sdata = Val(Replace(str, "ce", ""))
    str = sdata
    Text10.Text = str
  End If
    
  If (CePingde > 25) Then
    CePingde = 0
  Else
    CePingde = CePingde + 1
  End If
End If

If (SSTab1.Tab = 2) And (JiShu = True) Then  '读出计数值

    strText = "cc"
    MSComm1.Output = strText + Chr(&HA)   '校验码
  
  str = Trim(MSComm1.Input)
  If (Len(str) > 0) Then
    sdata = Val(Replace(str, "cc", ""))
    str = sdata
    Text11.Text = str
  End If
  
End If
    
End Sub

Private Sub 软件使用说明_Click()
  SSTab1.Tab = 3
End Sub

Private Sub 版本信息_Click()
MsgBox (Chr(13) & Chr(10)) + "(C)版权所有 郑州飞逸科技有限公司" + (Chr(13) & Chr(10)) + (Chr(13) & Chr(10)) + "  未经授权不得使用、传播本软件"
End Sub


Private Sub 保存_Click()
    Dim addr As String
    Dim Lines As String
    Dim NextLine As String
    Dim i As Integer
    Dim str As String
    
    On Error GoTo SCancel  '跳出
    
    If SSTab1.Tab = 2 Then
       Exit Sub
    End If
    
    CommonDialog1.FileName = ""
    CommonDialog1.Filter = "波形数据(*.FY)|*.FY"      '  "*.txt|*.txt"
    CommonDialog1.ShowSave
    addr = CommonDialog1.FileName
    Open addr For Output As #1
    
    If SSTab1.Tab = 0 Then
       For i = 0 To 2047
          str = str + Format(WAVE(i)) + "  "
       Next i
       Print #1, str
    ElseIf SSTab1.Tab = 1 Then
       Print #1, Textsend.Text
    End If
    
    Close #1
SCancel:

End Sub

Private Sub 打开_Click()
    Dim str As String
    Dim addr As String
    Dim Lines As String
    Dim NextLine As String
    Dim i As Integer
    Dim bytSendByte() As Integer    '发送二进制数据
     
    On Error GoTo OCancel  '跳出
   
    
    CommonDialog1.FileName = ""
    CommonDialog1.Filter = "波形数据(*.FY),(*.lvm)|*.FY;*.lvm|所有文件(*.*)|*.*"    ' "波形数据(*.FY)|*.FY|波形数据(*.lvm)|*.lvm|所有文件(*.*)|*.*"
    CommonDialog1.ShowOpen
    addr = CommonDialog1.FileName
    
    'Textsend.Text = addr + vbCrLf
                                        ' "(此处输入txt路径+文件名)" For Input As #1
    Open addr For Input As #1
    'Input #1, addr
    
    Do While Not EOF(1)
        On Error Resume Next
        Line Input #1, NextLine
        Lines = Lines & NextLine & Chr(13) & Chr(10)
    Loop
    Close #1
    
    If SSTab1.Tab = 0 Then
       If InStr(addr, ".lvm") <> 0 Then
           Call DEDecToByteArray(Lines, str)
           i = strDecToByteArray(str, bytSendByte())
           For i = 0 To 2047
             WAVE(i) = bytSendByte(i)
           Next i
       Else
           Call strDecToByteArray(Lines, bytSendByte())
           For i = 0 To 2047
             WAVE(i) = bytSendByte(i)
           Next i
       End If
       pic_rsh = 255
    ElseIf SSTab1.Tab = 1 Then
        If InStr(addr, ".lvm") <> 0 Then
            Call DEDecToByteArray(Lines, str)
            Textsend.Text = str
        Else
            Textsend.Text = Lines   'Textsend.Text +
        End If
    End If

OCancel:

End Sub

Private Sub 调幅波_Click()
    Dim Xbuf As Integer
    Dim str As String
    str = ""
    
    
    If SSTab1.Tab = 0 Then
        For Xbuf = 0 To 2047
          WAVE(Xbuf) = Int((Sin(Xbuf * 3.1415926 / 2048) * Sin(Xbuf * 3.1415926 / 128)) * 2048 + 2048)
        Next Xbuf
    ElseIf SSTab1.Tab = 1 Then
        Textsend.Text = ""
        For Xbuf = 0 To 2047
          str = str + Format(Int((Sin(Xbuf * 3.1415926 / 2048) * Sin(Xbuf * 3.1415926 / 128)) * 2048 + 2048)) + "  "
        Next Xbuf
        Textsend.Text = str  'Textsend.Text + Format(Int((Sin(Xbuf * 3.1415926 / 1024) * Sin(Xbuf * 3.1415926 / 64)) * 128 + 128)) + "  "
    End If
    
    pic_rsh = 255  '刷新窗口
End Sub

Private Sub 调频波_Click()
    Dim Xbuf As Integer
    Dim str As String
    str = ""
    
    If SSTab1.Tab = 0 Then
        For Xbuf = 0 To 2047
          WAVE(Xbuf) = Int(Sin((Sin(Xbuf * 4 * 3.1415926 / 2048) * 8) + (Xbuf * 2 * 3.1415926 / 64)) * 2048 + 2048)
        Next Xbuf
    ElseIf SSTab1.Tab = 1 Then
        Textsend.Text = ""
        For Xbuf = 0 To 2047
          str = str + Format(Int(Sin((Sin(Xbuf * 4 * 3.1415926 / 2048) * 8) + (Xbuf * 2 * 3.1415926 / 64)) * 2048 + 2048)) + "  "
        Next Xbuf
        Textsend.Text = str   'Textsend.Text + Format(Int((Sin(Xbuf * 3.1415926 / 1024) * Sin(Xbuf * 3.1415926 / 64)) * 128 + 128)) + "  "
    End If
    
    pic_rsh = 255  '刷新窗口
End Sub

Private Sub 阶梯波_Click()
    Dim Xbuf As Integer
    Dim str As String
    str = ""
    
    If SSTab1.Tab = 0 Then
        For Xbuf = 0 To 2047     'Picture1.ScaleWidth
          WAVE(Xbuf) = Int(Xbuf / 64) * 128
        Next Xbuf
        pic_rsh = 255     '更新图版
    ElseIf SSTab1.Tab = 1 Then
        Textsend.Text = ""
        For Xbuf = 0 To 2047
          str = str + Format(Int(Xbuf / 64) * 128) + "  "
        Next Xbuf
        Textsend.Text = str   'Textsend.Text + Format(Int(Xbuf / 64) * 16) + "  "
    End If
End Sub

Private Sub 矩形波_Click()
    Dim Xbuf As Integer
    Dim str As String
    str = ""
    If SSTab1.Tab = 0 Then
        For Xbuf = 0 To 1023
          WAVE(Xbuf) = 4095
        Next Xbuf
        For Xbuf = 0 To 1023
          WAVE(Xbuf + 1024) = 0
        Next Xbuf
        pic_rsh = 255
    ElseIf SSTab1.Tab = 1 Then
        Textsend.Text = ""
        For Xbuf = 0 To 1023
          str = str + "4095" + "  "  'Textsend.Text = Textsend.Text + "255" + "  "
        Next Xbuf
        For Xbuf = 0 To 1023
          str = str + "0" + "  "    'Textsend.Text = Textsend.Text + "0" + "  "
        Next Xbuf
        Textsend.Text = str
    End If
End Sub

Private Sub 锯齿波_Click()
    Dim Xbuf As Integer
    Dim str As String
    str = ""
    
    If SSTab1.Tab = 0 Then
        For Xbuf = 0 To 2047     'Picture1.ScaleWidth
          WAVE(Xbuf) = Int(Xbuf * 2)
        Next Xbuf
        pic_rsh = 255     '更新图版
    ElseIf SSTab1.Tab = 1 Then
        Textsend.Text = ""
        For Xbuf = 0 To 2047
          str = str + Format(Int(Xbuf * 2)) + "  "
        Next Xbuf
        Textsend.Text = str  '  Textsend.Text + Format(Int(Xbuf / 4)) + "  "
    End If
End Sub

Private Sub 三角波_Click()
    Dim Xbuf As Integer
    Dim str As String
    str = ""
    
    If SSTab1.Tab = 0 Then
        For Xbuf = 0 To 1023
          WAVE(Xbuf) = Int(Xbuf * 4)
        Next Xbuf
        For Xbuf = 0 To 1023
          WAVE(Xbuf + 1024) = 4095 - Int(Xbuf * 4)
        Next Xbuf
        pic_rsh = 255
    ElseIf SSTab1.Tab = 1 Then
        Textsend.Text = ""
        For Xbuf = 0 To 1023
          str = str + Format(Int(Xbuf * 4)) + "  "         'Textsend.Text = Textsend.Text + Format(Int(Xbuf / 2)) + "  "
        Next Xbuf
        For Xbuf = 0 To 1023
          str = str + Format(4095 - Int(Xbuf * 4)) + "  "    'Textsend.Text = Textsend.Text + Format(255 - Int(Xbuf / 2)) + "  "
        Next Xbuf
        Textsend.Text = str
    End If
End Sub

Private Sub 正弦波_Click()
    Dim Xbuf As Integer
    Dim str As String
    str = ""
    
    If SSTab1.Tab = 0 Then
        For Xbuf = 0 To 2047
          WAVE(Xbuf) = Int(Sin(Xbuf * 2 * 3.1415926 / 2048) * 2048 + 2048)
        Next Xbuf
    ElseIf SSTab1.Tab = 1 Then
        Textsend.Text = ""
        For Xbuf = 0 To 2047
          str = str + Format(Int(Sin(Xbuf * 2 * 3.1415926 / 2048) * 2048 + 2048)) + "  "
        Next Xbuf
        Textsend.Text = str  'Textsend.Text = Textsend.Text + Format(Int(Sin(Xbuf * 2 * 3.1415926 / 1024) * 128 + 128)) + "  "
    End If
    
    pic_rsh = 255  '刷新窗口
End Sub


Private Sub 幅度倍增_Click()
    Dim AV As Single
    Dim Xbuf As Integer
    Dim data(2048) As Long
    Dim str As String
    
    On Error GoTo ACancel  '跳出
    If SSTab1.Tab = 0 Then
        str = ""
        str = InputBox("Please enter the amplitude of multiplier value" + (Chr(13) & Chr(10)) + (Chr(13) & Chr(10)) + "(The symbol floating point data is allowed)")
        AV = str
    
        For Xbuf = 0 To 2047
          data(Xbuf) = WAVE(Xbuf) - 2047 '处理成有符号便于运算
          data(Xbuf) = data(Xbuf) * AV
          
          If (data(Xbuf) + 2047) > 4095 Then
             WAVE(Xbuf) = 4095
          ElseIf (data(Xbuf) + 2047) < 0 Then
             WAVE(Xbuf) = 0
          Else
             WAVE(Xbuf) = Int(data(Xbuf) + 2047)  '处理成有无符号便于显示
          End If
          
        Next Xbuf
    Rem ElseIf SSTab1.Tab = 1 Then
        Rem For Xbuf = 0 To 1023
          Rem str = str +
        Rem Next Xbuf
        Rem Textsend.Text = str
    End If
    
    pic_rsh = 255  '刷新窗口
    
ACancel:
End Sub

Private Sub 直流叠加_Click()
    Dim AV As Single
    Dim Xbuf As Integer
    Dim str As String
    
    On Error GoTo DCancel  '跳出
    
     If SSTab1.Tab = 0 Then
        str = ""
        str = InputBox("Please input dc voltage" + (Chr(13) & Chr(10)) + (Chr(13) & Chr(10)) + "(The symbol floating point data is allowed)")
        AV = str
        
        For Xbuf = 0 To 2047
          If Int(WAVE(Xbuf) + AV) > 4095 Then
             WAVE(Xbuf) = 4095
          ElseIf Int(WAVE(Xbuf) + AV) < 0 Then
             WAVE(Xbuf) = 0
          Else
             WAVE(Xbuf) = Int(WAVE(Xbuf) + AV)
          End If
        Next Xbuf
    Rem ElseIf SSTab1.Tab = 1 Then
        Rem For Xbuf = 0 To 1023
          Rem str = str +
        Rem Next Xbuf
        Rem Textsend.Text = str
    End If
    
    pic_rsh = 255  '刷新窗口
    
DCancel:
End Sub

Private Sub X轴镜像_Click()
    Dim AV As Single
    Dim Xbuf As Integer
    Dim data(2048) As Long
    Dim str As String
    
    On Error GoTo CCancel  '跳出
 
    AV = -1
    
    If SSTab1.Tab = 0 Then
        For Xbuf = 0 To 2047
          data(Xbuf) = WAVE(Xbuf) - 2047 '处理成有符号便于运算
          data(Xbuf) = data(Xbuf) * AV
          
          If (data(Xbuf) + 2047) > 4095 Then
             WAVE(Xbuf) = 4095
          ElseIf (data(Xbuf) + 2047) < 0 Then
             WAVE(Xbuf) = 0
          Else
             WAVE(Xbuf) = Int(data(Xbuf) + 2047)  '处理成有无符号便于显示
          End If
          
        Next Xbuf
    Rem ElseIf SSTab1.Tab = 1 Then
        Rem For Xbuf = 0 To 1023
          Rem str = str +
        Rem Next Xbuf
        Rem Textsend.Text = str
    End If
    
    pic_rsh = 255  '刷新窗口
    
CCancel:
End Sub

Private Sub Y轴镜像_Click()
    Dim Xbuf As Integer
    Dim data As Integer
    
    On Error GoTo SCancel  '跳出
    
    If SSTab1.Tab = 0 Then
        For Xbuf = 0 To (2048 / 2)
           data = WAVE(Xbuf)
           WAVE(Xbuf) = WAVE(2047 - Xbuf)
           WAVE(2047 - Xbuf) = data
        Next Xbuf
    Rem ElseIf SSTab1.Tab = 1 Then
        Rem For Xbuf = 0 To 1023
          Rem str = str +
        Rem Next Xbuf
        Rem Textsend.Text = str
    End If
    
    pic_rsh = 255  '刷新窗口
    
SCancel:
End Sub





