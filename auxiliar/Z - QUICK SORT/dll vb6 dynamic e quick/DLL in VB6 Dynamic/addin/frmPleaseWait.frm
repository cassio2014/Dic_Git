VERSION 5.00
Begin VB.Form frmPleaseWait 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   504
   ClientLeft      =   48
   ClientTop       =   48
   ClientWidth     =   4488
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   504
   ScaleWidth      =   4488
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer tmrFlashLabel 
      Interval        =   500
      Left            =   3600
      Top             =   480
   End
   Begin VB.Label lblWait 
      AutoSize        =   -1  'True
      Caption         =   "Aguarde a compilação da DLL...."
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   14.4
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   348
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4128
   End
End
Attribute VB_Name = "frmPleaseWait"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub tmrFlashLabel_Timer()
If lblWait.ForeColor = &H0 Then
    lblWait.ForeColor = &HC00000
Else
    lblWait.ForeColor = &H0
End If
End Sub
