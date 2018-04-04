VERSION 5.00
Begin VB.Form FRMgeral 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Clasifica"
   ClientHeight    =   4410
   ClientLeft      =   -15
   ClientTop       =   -15
   ClientWidth     =   7710
   Icon            =   "FRMgeral.frx":0000
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   ScaleHeight     =   4410
   ScaleWidth      =   7710
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton CMDsair 
      Caption         =   "&Sair"
      Height          =   1455
      Left            =   120
      TabIndex        =   1
      Top             =   2880
      Width           =   1815
   End
   Begin VB.CommandButton CMDgerar 
      Caption         =   "Gerar Numeros"
      Height          =   1575
      Left            =   120
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   360
      Width           =   1815
   End
   Begin VB.TextBox TXTclasifica 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3975
      Left            =   2040
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Top             =   360
      Width           =   5655
   End
End
Attribute VB_Name = "FRMgeral"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim x, NUmeros As Long
Dim Tinicial, Tfinal, Tdife
Dim Tabela() As Long

Private Sub Form_Load()
  TXTclasifica.Text = ""

  '***************************
     NUmeros = 1000000
  '****************************
 FRMgeral.Caption = "Clasifica " & Format(NUmeros, "##,###,###,###")
 ReDim Tabela(NUmeros)
End Sub

Private Sub CMDgerar_Click()

    CMDgerar.Enabled = False
    DoEvents
    TXTclasifica.Text = ""
     Tinicial = Time
     Randomize
     TXTclasifica.Text = "Gerando " & Format(NUmeros, "##,###,###,###") & " Numeros..." & vbNewLine
  For x = 0 To UBound(Tabela)
      Tabela(x) = Int(Rnd * NUmeros + 1)
   Next x
     Tfinal = Time
     Tdife = Tfinal - Tinicial

    TXTclasifica.Text = TXTclasifica.Text & "Numeros Gerados em " _
     & Format(Tdife, " h:m:s") & " seg." & vbNewLine & vbNewLine
'**********************************************************************
    Tinicial = Time
    TXTclasifica.Text = TXTclasifica.Text & "Clasifica a Tabela..." & vbNewLine & _
    " Hora inicial   : " & Format(Tinicial, "h:mm:ss") & vbNewLine
    On Error Resume Next
'*****************************
  Call QuickSort(Tabela)
'******************************
  Tfinal = Time
  Tdife = Tfinal - Tinicial
   TXTclasifica.Text = TXTclasifica.Text & _
         " Hora final      : " & Format(Tfinal, "h:mm:ss") & vbNewLine & _
         "Clasificada em  " & _
         Format(Tdife, "h:mm:ss") & " Seg. " & vbNewLine & vbNewLine & _
          "Interação = " & Format(Interasao, "##,###,###,###") & vbNewLine & _
            "Trocas     = " & Format(Troca, "##,###,###,###") & vbNewLine & vbNewLine
    
   CMDgerar.Enabled = True
End Sub

Private Sub CMDsair_Click()
    End
End Sub

