VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Puzzle"
   ClientHeight    =   5535
   ClientLeft      =   5595
   ClientTop       =   3405
   ClientWidth     =   3690
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   ScaleHeight     =   5535
   ScaleWidth      =   3690
   Begin VB.Frame Frame1 
      BackColor       =   &H00AD3E14&
      BorderStyle     =   0  'None
      ForeColor       =   &H00000000&
      Height          =   3794
      Left            =   -14
      TabIndex        =   2
      Top             =   14
      Width           =   3738
      Begin VB.Label LBpos 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00AD3E14&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "16"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   36.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00AD3E14&
         Height          =   1170
         Index           =   15
         Left            =   2775
         TabIndex        =   19
         Top             =   2835
         Width           =   945
      End
      Begin VB.Label LBpos 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "15"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   36.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00AD3E14&
         Height          =   960
         Index           =   14
         Left            =   1860
         TabIndex        =   18
         Top             =   2835
         Width           =   930
      End
      Begin VB.Label LBpos 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "14"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   36.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00AD3E14&
         Height          =   960
         Index           =   13
         Left            =   930
         TabIndex        =   17
         Top             =   2835
         Width           =   945
      End
      Begin VB.Label LBpos 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "13"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   36.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00AD3E14&
         Height          =   960
         Index           =   12
         Left            =   0
         TabIndex        =   16
         Top             =   2835
         Width           =   945
      End
      Begin VB.Label LBpos 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "12"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   36.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00AD3E14&
         Height          =   960
         Index           =   11
         Left            =   2790
         TabIndex        =   15
         Top             =   1890
         Width           =   945
      End
      Begin VB.Label LBpos 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "11"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   36.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00AD3E14&
         Height          =   960
         Index           =   10
         Left            =   1860
         TabIndex        =   14
         Top             =   1890
         Width           =   945
      End
      Begin VB.Label LBpos 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "10"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   36.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00AD3E14&
         Height          =   960
         Index           =   9
         Left            =   930
         TabIndex        =   13
         Top             =   1890
         Width           =   945
      End
      Begin VB.Label LBpos 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "9"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   36.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00AD3E14&
         Height          =   960
         Index           =   8
         Left            =   0
         TabIndex        =   12
         Top             =   1890
         Width           =   945
      End
      Begin VB.Label LBpos 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "8"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   36.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00AD3E14&
         Height          =   960
         Index           =   7
         Left            =   2790
         TabIndex        =   11
         Top             =   945
         Width           =   945
      End
      Begin VB.Label LBpos 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "7"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   36.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00AD3E14&
         Height          =   960
         Index           =   6
         Left            =   1860
         TabIndex        =   10
         Top             =   945
         Width           =   945
      End
      Begin VB.Label LBpos 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "6"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   36.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00AD3E14&
         Height          =   960
         Index           =   5
         Left            =   930
         TabIndex        =   9
         Top             =   945
         Width           =   945
      End
      Begin VB.Label LBpos 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "5"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   36.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00AD3E14&
         Height          =   960
         Index           =   4
         Left            =   0
         TabIndex        =   8
         Top             =   945
         Width           =   945
      End
      Begin VB.Label LBpos 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "4"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   36.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00AD3E14&
         Height          =   960
         Index           =   3
         Left            =   2790
         TabIndex        =   7
         Top             =   0
         Width           =   945
      End
      Begin VB.Label LBpos 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "3"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   36.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00AD3E14&
         Height          =   960
         Index           =   2
         Left            =   1860
         TabIndex        =   6
         Top             =   0
         Width           =   945
      End
      Begin VB.Label LBpos 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "2"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   36.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00AD3E14&
         Height          =   960
         Index           =   1
         Left            =   930
         TabIndex        =   5
         Top             =   0
         Width           =   945
      End
      Begin VB.Label LBpos 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "Microsoft Sans Serif"
            Size            =   36.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00AD3E14&
         Height          =   960
         Index           =   0
         Left            =   0
         TabIndex        =   4
         Top             =   0
         Width           =   945
      End
   End
   Begin VB.CommandButton BTN_Saida 
      Caption         =   "&Sair"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   27.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   885
      Left            =   1725
      TabIndex        =   0
      Top             =   4676
      Width           =   2010
   End
   Begin VB.CommandButton CMDMistura 
      Caption         =   "&Misturar"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   19.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   882
      Left            =   1740
      TabIndex        =   1
      Top             =   3836
      Width           =   2030
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   3752
      Y1              =   3808
      Y2              =   3808
   End
   Begin VB.Label LContador 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Sitka Display"
         Size            =   48
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00400040&
      Height          =   1750
      Left            =   -14
      TabIndex        =   3
      Top             =   3794
      Width           =   1764
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
  ' Variavis Globais.
Dim Contador_Cliques  As Integer
    
Sub Pos_Mais_1(index As Integer)
 If LBpos(index + 1).Caption = "16" Then
   Troca_caption index, (index + 1)
   Contador_Cliques = Contador_Cliques + 1
   If Contador_Cliques = 999 Then
      Beep
      CMDMistura_Click
      Exit Sub
   End If
 End If
End Sub

Sub Pos_Menos_1(index As Integer)
 If LBpos(index - 1).Caption = "16" Then
   Troca_caption index, (index - 1)
   Contador_Cliques = Contador_Cliques + 1
   If Contador_Cliques = 999 Then
      Beep
      CMDMistura_Click
      Exit Sub
   End If
 End If
End Sub

Sub Pos_Mais_4(index As Integer)
 If LBpos(index + 4).Caption = "16" Then
   Troca_caption index, (index + 4)
   Contador_Cliques = Contador_Cliques + 1
   If Contador_Cliques = 999 Then
      Beep
      CMDMistura_Click
      Exit Sub
   End If
 End If
End Sub

Sub Pos_Menos_4(index As Integer)
 If LBpos(index - 4).Caption = "16" Then
   Troca_caption index, (index - 4)
   Contador_Cliques = Contador_Cliques + 1
   If Contador_Cliques = 999 Then
      Beep
      CMDMistura_Click
      Exit Sub
   End If
 End If
End Sub

Sub LpCor() ' pem cor aos numeros

   Dim Cor01, Cor02 As ColorConstants
   Dim index  As Integer
   
   Cor01 = vbBlack
   Cor02 = vbBlue  ' &HAD3E14
   
   For index = 0 To 15
      If LBpos(index).Caption = "16" Then GoTo volta
      
      If LBpos(index).Caption = (index + 1) Then
         LBpos(index).ForeColor = Cor02
       Else
         LBpos(index).ForeColor = Cor01
      End If
volta:
   Next

End Sub

  
Private Sub Verrifica()

  Dim Passou As Boolean
  Dim Pergunta As String
  Dim Resposta As Variant
  
  Pergunta = "Você ganhou com " + Str(Contador_Cliques) + " cliques.!!!" + vbNewLine + _
             "Quer jogar de novo ?"
   
  Passou = False
  
  For i = 0 To 15
      If LBpos(i).Caption = (i + 1) Then
        Passou = True
      Else
        Passou = False
        Exit For
      End If
  Next
   
  If Passou Then
      Resposta = MsgBox(Pergunta, _
                        vbYesNo + _
                        vbQuestion + _
                        vbDefaultButton2, _
                        "** Puzzle **")
      If Resposta = vbNo Then
         End ' FIM DE JOGO
       Else
          CMDMistura.Enabled = True
      End If
  End If
End Sub


Private Sub Troca_caption(index1 As Integer, _
                               index2 As Integer)
   Dim Btroc As String
   Dim Bcor, Fcor As ColorConstants
   
    
   Btroc = LBpos(index1).Caption
   LBpos(index1).Caption = LBpos(index2).Caption
   LBpos(index2).Caption = Btroc
   
   Bcor = LBpos(index1).BackColor
   LBpos(index1).BackColor = LBpos(index2).BackColor
   LBpos(index2).BackColor = Bcor
   
   Fcor = LBpos(index1).ForeColor
   LBpos(index1).ForeColor = LBpos(index2).ForeColor
   LBpos(index2).ForeColor = Fcor
       
End Sub

Private Sub BTN_Saida_Click()
   Unload Me
End Sub

Private Sub CMDMistura_Click()
    
   If Contador_Cliques = 999 Then
      Dim Aviso As String
      LContador.Caption = Contador_Cliques
      Aviso = "Voce atingiu o limite de " + _
               vbNewLine + _
               "999 cliques, o programa ira " + _
               vbNewLine + _
               "misturar e reiniciar !!!."
      MsgBox Aviso, vbCritical, "** Puzzle **"
   End If
   


   CMDMistura.Enabled = False
   Contador_Cliques = 0
   LContador.Caption = Contador_Cliques
    
   Dim d1, d2, i As Integer
    
   For i = 0 To 255
      Randomize
      d1 = Int(Rnd(2) * 100)
      Randomize
      d2 = Int(Rnd(2) * 100)
      If d1 > 15 Then
         d1 = 15
      End If
      If d2 > 15 Then
         d2 = 0
      End If
      
  Troca_caption Int(d1), Int(d2)
   Next i
LpCor ' ajuda a ver a posição correta
End Sub


Private Sub Form_Paint()
   Contador_Cliques = 0
   CMDMistura_Click
End Sub


Private Sub LBpos_Click(index As Integer)
 
Select Case index

   Case 0
       Pos_Mais_1 index
       Pos_Mais_4 index
       
   Case 1 To 2
       Pos_Menos_1 index
       Pos_Mais_1 index
       Pos_Mais_4 index
       
   Case 3
      Pos_Menos_1 index
      Pos_Mais_4 index
       
   Case 4
       Pos_Mais_1 index
       Pos_Menos_4 index
       Pos_Mais_4 index
       
   Case 5 To 6
       Pos_Menos_1 index
       Pos_Mais_1 index
       Pos_Menos_4 index
       Pos_Mais_4 index
       
   Case 7
       Pos_Menos_1 index
       Pos_Mais_4 index
       Pos_Menos_4 index
   
   Case 8
       Pos_Mais_1 index
       Pos_Mais_4 index
       Pos_Menos_4 index
       
   Case 9 To 10
       Pos_Menos_1 index
       Pos_Mais_1 index
       Pos_Menos_4 index
       Pos_Mais_4 index
         
   Case 11
       Pos_Menos_1 index
       Pos_Menos_4 index
       Pos_Mais_4 index
       
   Case 12
       Pos_Mais_1 index
       Pos_Menos_4 index
       
   Case 13 To 14
       Pos_Menos_1 index
       Pos_Mais_1 index
       Pos_Menos_4 index
       
   Case 15
       Pos_Menos_1 index
       Pos_Menos_4 index
End Select

LpCor ' colore os numeros

LContador.Caption = Contador_Cliques

Verrifica

End Sub

Private Sub LContador_Click()
CMDMistura.Enabled = True
End Sub
