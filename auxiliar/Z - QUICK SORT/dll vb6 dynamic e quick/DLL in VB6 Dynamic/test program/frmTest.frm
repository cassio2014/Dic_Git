VERSION 5.00
Begin VB.Form frmTest 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Example program that uses the Test DLL file"
   ClientHeight    =   3168
   ClientLeft      =   48
   ClientTop       =   336
   ClientWidth     =   4788
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   ScaleHeight     =   3168
   ScaleWidth      =   4788
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   1440
      TabIndex        =   3
      Top             =   2640
      Width           =   1815
   End
   Begin VB.Label lblResult 
      AutoSize        =   -1  'True
      Caption         =   "add"
      Height          =   195
      Index           =   2
      Left            =   120
      TabIndex        =   5
      Top             =   2160
      Width           =   270
   End
   Begin VB.Label lblDesc 
      Caption         =   "If you like this, Please vote on PSC (see included text files)"
      Height          =   435
      Index           =   1
      Left            =   2280
      TabIndex        =   4
      Top             =   1920
      Width           =   2205
   End
   Begin VB.Label lblResult 
      AutoSize        =   -1  'True
      Caption         =   "sub"
      Height          =   195
      Index           =   1
      Left            =   120
      TabIndex        =   2
      Top             =   1920
      Width           =   255
   End
   Begin VB.Label lblResult 
      AutoSize        =   -1  'True
      Caption         =   "add"
      Height          =   195
      Index           =   0
      Left            =   120
      TabIndex        =   1
      Top             =   1680
      Width           =   270
   End
   Begin VB.Label lblDesc 
      Caption         =   $"frmTest.frx":0000
      Height          =   1395
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4485
   End
End
Attribute VB_Name = "frmTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function subtraction Lib "testDLL.DLL" (ByVal A As Double, ByVal B As Double) As Double
Private Declare Function addition Lib "testDLL.DLL" (ByVal A As Double, ByVal B As Double) As Double


Private Sub cmdExit_Click()
End
End Sub

Private Sub Form_Load()
On Error Resume Next
lblResult(0) = "9.87 + 2.99 = " & CStr(addition(9.87, 2.99))
lblResult(1) = "10 - 8.43 = " & CStr(subtraction(10, 8.43))
lblResult(2) = "9999 + 1543 = " & CStr(addition(9999, 1543))
End Sub
