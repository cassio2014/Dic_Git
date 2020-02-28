VERSION 5.00
Begin VB.Form FRMgeral 
   BackColor       =   &H00400000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Clasifica"
   ClientHeight    =   5040
   ClientLeft      =   -12
   ClientTop       =   -12
   ClientWidth     =   7704
   Icon            =   "FRMgeral.frx":0000
   MaxButton       =   0   'False
   ScaleHeight     =   5040
   ScaleWidth      =   7704
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton CMDsair 
      Caption         =   "&Sair"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Left            =   24
      TabIndex        =   1
      Top             =   3444
      Width           =   2088
   End
   Begin VB.CommandButton CMDgerar 
      Caption         =   "&Clasificar"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   20.4
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1620
      Left            =   24
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   84
      Width           =   2088
   End
   Begin VB.TextBox TXTclasifica 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.4
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4908
      Left            =   2148
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Top             =   60
      Width           =   5505
   End
End
Attribute VB_Name = "FRMgeral"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Sub QuickSort Lib _
  "funcoes.dll" Alias _
  "CLASIFICAR" (Tabel As Long)

Private Declare Sub Quantos_itens Lib _
  "funcoes.dll" Alias "ToTALNUMEROS" _
  (TdeNumros As Long)


Private Declare Function Total_Interac Lib _
  "funcoes.dll" Alias "TOTALRECURS" () As Long

Private Declare Function Total_Trocas Lib _
  "funcoes.dll" Alias "TOTALTROCAS" () As Long

Dim x, NUmeros As Long
Dim Ver_interasao As Long
Dim Ver_trocas As Long
Dim Tinicial, Tfinal, Tdife
Dim Tabela() As Long

Private Sub CMDgerar_Click()
    TXTclasifica.Text = " "
    Tinicial = Time
    Randomize
    TXTclasifica.Text = "Gerando " & Format(NUmeros, "##,###,###,###") & " Numeros..." & vbNewLine
    CMDgerar.Enabled = False
    DoEvents
  For x = 0 To UBound(Tabela)
       On Error Resume Next
      Tabela(x) = Int(Rnd * NUmeros + 1)
   Next x
     
     Tfinal = Time
     Tdife = Tfinal - Tinicial

    TXTclasifica.Text = TXTclasifica.Text & _
      "Numeros Gerados em " & _
      Format(Tdife, " h:m:s") & " seg." & _
      vbNewLine & vbNewLine
'******************************************************
    Tinicial = Time
    TXTclasifica.Text = TXTclasifica.Text & _
      "Clasifica a Tabela..." & vbNewLine & _
      " Hora inicial   : " & Format(Tinicial, "h:mm:ss") _
      & vbNewLine
    
 On Error Resume Next
'*****************************
  Call QuickSort(Tabela(0))
'*****************************
  Ver_trocas = Total_Trocas
  Ver_interasao = Total_Interac
 '*****************************

  Tfinal = Time
  Tdife = Tfinal - Tinicial
   TXTclasifica.Text = TXTclasifica.Text & _
         " Hora final      : " & Format(Tfinal, "h:mm:ss") & vbNewLine & _
         "Clasificada em  " & _
         Format(Tdife, "h:mm:ss") & " Seg. " & vbNewLine & vbNewLine & _
          "Intera��o = " & Format(Ver_interasao, "#,###,###,###,###") & vbNewLine & _
            "Trocas     = " & Format(Ver_trocas, "#,###,###,###,###") & vbNewLine & vbNewLine
    
    
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
   CMDgerar.SetFocus
End Sub

Private Sub CMDsair_Click()
    End
End Sub

Private Sub Form_Activate()
  CMDgerar.SetFocus
End Sub

Private Sub Form_Load()
  TXTclasifica.Text = ""
  '*************************
     If CMDNumero > 0 Then
        NUmeros = CMDNumero
     Else
        NUmeros = 1000000
     End If
  '*************************
 ReDim Tabela(NUmeros)
 FRMgeral.Caption = "Clasifica " & _
   Format(NUmeros, "##,###,###,###")
 On Error Resume Next
 Call Quantos_itens(NUmeros)
End Sub


