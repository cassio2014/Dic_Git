VERSION 5.00
Begin VB.Form FRMgeral 
   BackColor       =   &H00404000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Clasifica"
   ClientHeight    =   4725
   ClientLeft      =   -15
   ClientTop       =   -15
   ClientWidth     =   8865
   Icon            =   "FRMgeral.frx":0000
   MaxButton       =   0   'False
   ScaleHeight     =   4725
   ScaleWidth      =   8865
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton CMDsair 
      Caption         =   "&Sair"
      BeginProperty Font 
         Name            =   "Lucida Console"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2310
      Left            =   30
      TabIndex        =   1
      Top             =   2385
      Width           =   2964
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
      Height          =   2325
      Left            =   36
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   72
      Width           =   2964
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
      Height          =   4584
      Left            =   3108
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Top             =   84
      Width           =   5700
   End
End
Attribute VB_Name = "FRMgeral"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim x, NUmeros As Long
Dim Tinicial, Tfinal, Tdife
Dim Tabela() As Long

Private Sub Form_Load()
  TXTclasifica.Text = ""

'***************************
   If CNDNumero > 0 Then
      NUmeros = CNDNumero
   Else
      NUmeros = 100000
   End If
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

