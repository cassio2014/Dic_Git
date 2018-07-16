VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00800000&
   Caption         =   "Form1"
   ClientHeight    =   3066
   ClientLeft      =   11732
   ClientTop       =   6566
   ClientWidth     =   4340
   FillColor       =   &H00C0FFFF&
   FillStyle       =   0  'Solid
   ForeColor       =   &H80000000&
   Icon            =   "Test.frx":0000
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3066
   ScaleWidth      =   4340
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "Sair"
      Height          =   372
      Left            =   1800
      TabIndex        =   2
      Top             =   2400
      Width           =   972
   End
   Begin VB.TextBox Text1 
      Height          =   2655
      Left            =   2880
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Test.frx":0442
      Top             =   120
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Test DLL"
      Height          =   735
      Left            =   1680
      TabIndex        =   0
      Top             =   120
      Width           =   1095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Declare Sub Mult Lib "Cmult.dll" Alias "Multiplica" _
(a As Single, b As Single, C As Single, ByVal n As Long)

Private Sub Command1_Click()
On Error Resume Next

Dim a(10) As Single, b(10) As Single, C(10) As Single, n As Integer
For n = 1 To 10
  a(n) = n * 1.1
  b(n) = n * 2.2
Next n

' comentario ¦

Call Mult(a(0), b(0), C(0), 10)
Form1.Cls
For n = 1 To 10
 
  Form1.Print "   C("; Format$(n); ")= "; Format$(C(n))
Next
End Sub

Private Sub Command2_Click()
End

End Sub
