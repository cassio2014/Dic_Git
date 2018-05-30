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
      BeginProperty Font 
         Name            =   "Roboto Bk"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1395
      Left            =   30
      TabIndex        =   1
      Top             =   2880
      Width           =   1845
   End
   Begin VB.CommandButton CMDgerar 
      Caption         =   "&Clasificar"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Roboto"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1515
      Left            =   90
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   405
      Width           =   1845
   End
   Begin VB.TextBox TXTclasifica 
      BeginProperty Font 
         Name            =   "Arimo"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3930
      Left            =   2115
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Top             =   330
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
  "funcoes.dll" Alias "ToTALNUMEROS" (TdeNumros As Long)


Private Declare Function Total_Interac Lib _
  "funcoes.dll" Alias "TOTALRECURS" () As Long

Private Declare Function Total_Trocas Lib _
  "funcoes.dll" Alias "TOTALTROCAS" () As Long

Dim x, NUmeros As Long
Dim Ver_interasao As Long
Dim Ver_trocas As Long
Dim Tinicial, Tfinal, Tdife
Dim Tabela() As Long

Private Sub Form_Activate()
  CMDgerar.SetFocus
End Sub

Private Sub Form_Load()
  TXTclasifica.Text = ""
  '*************************
     NUmeros = 1000000
  '*************************
 FRMgeral.Caption = "Clasifica " & Format(NUmeros, "##,###,###,###")
 ReDim Tabela(NUmeros)
 FRMgeral.Caption = "Clasifica " & Format(NUmeros, "##,###,###,###")
 On Error Resume Next
 Call Quantos_itens(NUmeros)

End Sub

Private Sub CMDgerar_Click()
     TXTclasifica.Text = " "
    CMDgerar.Enabled = False

     Tinicial = Time
     Randomize
     TXTclasifica.Text = "Gerando " & Format(NUmeros, "##,###,###,###") & " Numeros..." & vbNewLine
    
  For x = 0 To UBound(Tabela)
      DoEvents
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
          "Interação = " & Format(Ver_interasao, "#,###,###,###,###") & vbNewLine & _
            "Trocas     = " & Format(Ver_trocas, "#,###,###,###,###") & vbNewLine & vbNewLine
    
   CMDgerar.Enabled = True
   CMDgerar.SetFocus
End Sub

Private Sub CMDsair_Click()
    End
End Sub

