VERSION 5.00
Begin VB.Form FRMgeral 
   BackColor       =   &H00004000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Clasifica"
   ClientHeight    =   5340
   ClientLeft      =   -15
   ClientTop       =   -15
   ClientWidth     =   8745
   Icon            =   "FRMgeral.frx":0000
   MaxButton       =   0   'False
   ScaleHeight     =   5340
   ScaleWidth      =   8745
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton CMDsair 
      Caption         =   "&Sair"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1455
      Left            =   180
      TabIndex        =   1
      Top             =   3564
      Width           =   2592
   End
   Begin VB.CommandButton CMDgerar 
      Caption         =   "Clasificar"
      BeginProperty Font 
         Name            =   "DejaVu Sans Mono"
         Size            =   19.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1575
      Left            =   120
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   360
      Width           =   2592
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
      Height          =   4656
      Left            =   2940
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Top             =   360
      Width           =   5676
   End
End
Attribute VB_Name = "FRMgeral"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Sub QuickSort Lib "funcoes.dll" (Matrix() As Long)
Private Declare Function TOTAL_TROCAS Lib "funcoes.dll" () As Long
Private Declare Function TOTAL_INTERACAO Lib "funcoes.dll" () As Long

Dim x, NUmeros As Long
Dim Tinicial, Tfinal, Tdife
Dim Tabela() As Long

Private Sub Form_Load()
  TXTclasifica.Text = ""
  '****************************
  If CMDNumero <> 0 Then
        NUmeros = CMDNumero
   Else
        NUmeros = 100000
  End If
  '****************************
 FRMgeral.Caption = "Clasifica " & Format(NUmeros, "##,###,###,###")
 ReDim Tabela(NUmeros)
End Sub

Private Sub CMDgerar_Click()

    CMDgerar.Enabled = False
    TXTclasifica.Text = ""
    DoEvents
    Tinicial = Time
    Randomize
    TXTclasifica.Text = "Gerando " & Format(NUmeros, "##,###,###,###") & " Numeros..." & vbNewLine
'**********************************************************************
  For x = 0 To UBound(Tabela)
      Tabela(x) = Int(Rnd * NUmeros + 1)
   Next x
'**********************************************************************
     Tfinal = Time
     Tdife = Tfinal - Tinicial
'**********************************************************************
    TXTclasifica.Text = TXTclasifica.Text & "Numeros Gerados em " _
     & Format(Tdife, " h:m:s") & " seg." & vbNewLine & vbNewLine
'**********************************************************************
    Tinicial = Time
    TXTclasifica.Text = TXTclasifica.Text & "Clasifica a Tabela..." & vbNewLine & _
    " Hora inicial   : " & Format(Tinicial, "h:mm:ss") & vbNewLine
    DoEvents
    On Error Resume Next
'******************************
  Call QuickSort(Tabela)
'******************************
  Tfinal = Time
  Tdife = Tfinal - Tinicial
  On Error Resume Next
   TXTclasifica.Text = TXTclasifica.Text & _
         " Hora final      : " & Format(Tfinal, "h:mm:ss") & vbNewLine & _
         "Clasificada em  " & _
         Format(Tdife, "h:mm:ss") & " Seg. " & vbNewLine & vbNewLine & _
          "Interação = " & Format(TOTAL_INTERACAO, "##,###,###,###") & vbNewLine & _
            "Trocas     = " & Format(TOTAL_TROCAS, "##,###,###,###") & vbNewLine & vbNewLine
            
   TXTclasifica.Text = _
         TXTclasifica.Text & "{ "

   For x = 0 To 10
      TXTclasifica.Text = _
            TXTclasifica.Text & Tabela(x) & "  "
      DoEvents
   Next x

   TXTclasifica.Text = _
         TXTclasifica.Text & "... }" & vbNewLine

            
   CMDgerar.Enabled = True
End Sub

Private Sub CMDsair_Click()
    End
End Sub

