Attribute VB_Name = "Funcoes"
Option Explicit

Public Troca As Long
Public Interasao As Long
Public CNDNumero As Long

Sub main()
     If Command = "" Then
        FRMgeral.Show
        Exit Sub
     End If
    Dim sArgs() As String
    CNDNumero = 0
    On Error Resume Next
    sArgs = Split(Command, "/") ', -1, 1)
    If IsNumeric(sArgs(1)) Then
        CNDNumero = Val(sArgs(1))
    End If
    FRMgeral.Show
End Sub


Public Sub QuickSort(Matrix() As Long)
    Interasao = 0
    Troca = 0
    Call Quick_Sort(LBound(Matrix), UBound(Matrix), Matrix)
End Sub
Private Sub Quick_Sort(LB As Variant, UB As Variant, Feld() As Long)
  
   Dim P1, P2 As Long
   Dim Ref As Long
   Dim TEMP As Long
   
   DoEvents
   
    P1 = LB
    P2 = UB

    Ref = Feld(Fix((P1 + P2) / 2))
    
    Do
        Do While (Feld(P1) < Ref)
            P1 = P1 + 1
        Loop
 
        Do While (Feld(P2) > Ref)
            P2 = P2 - 1
        Loop

        If P1 <= P2 Then
            TEMP = Feld(P1)
            Feld(P1) = Feld(P2)
            Feld(P2) = TEMP
            Troca = Troca + 1
            P1 = P1 + 1
            P2 = P2 - 1
        End If
    Loop Until (P1 > P2)
     
     If LB < P2 Then
        Interasao = Interasao + 1
        Call Quick_Sort(LB, P2, Feld)
    End If
    
    If P1 < UB Then
        Interasao = Interasao + 1
        Call Quick_Sort(P1, UB, Feld)
    End If
    
End Sub

