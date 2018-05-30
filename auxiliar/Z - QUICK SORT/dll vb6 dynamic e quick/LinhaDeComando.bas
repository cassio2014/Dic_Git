Attribute VB_Name = "LinhaDeComando"
Public CMDNumero As Long

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
        CMDNumero = Val(sArgs(1))
        Debug.Print CMDNumero
    End If
    FRMgeral.Show
End Sub

