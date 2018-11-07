Attribute VB_Name = "Module1"
Public Type ctrObj
  Name As String
  Index As Long
  Parrent As String
  Top As Long
  Left As Long
  Height As Long
  Width As Long
  ScaleHeight As Long
  ScaleWidth As Long
End Type

Private FormRecord() As ctrObj
Private ControlRecord() As ctrObj
Private bRunning As Boolean
Private MaxForm As Long
Private MaxControl As Long
Private Const WM_NCLBUTTONDOWN = &HA1
Private Declare Function SendMessage Lib "USER32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function ReleaseCapture Lib "USER32" () As Long

Function ActualPos(plLeft As Long) As Long

  If plLeft < 0 Then
    ActualPos = plLeft + 75000
  Else
    ActualPos = plLeft
  End If

End Function

Function FindForm(pfrmIn As Form) As Long

  Dim i As Long
  FindForm = -1

  If MaxForm > 0 Then
 
    For i = 0 To (MaxForm - 1)
      If FormRecord(i).Name = pfrmIn.Name Then
        FindForm = i
        Exit Function
      End If
    Next i
  End If

End Function


Function AddForm(pfrmIn As Form) As Long

  Dim FormControl As Control
  Dim i As Long
  ReDim Preserve FormRecord(MaxForm + 1)

  FormRecord(MaxForm).Name = pfrmIn.Name
  FormRecord(MaxForm).Top = pfrmIn.Top
  FormRecord(MaxForm).Left = pfrmIn.Left
  FormRecord(MaxForm).Height = pfrmIn.Height
  FormRecord(MaxForm).Width = pfrmIn.Width
  FormRecord(MaxForm).ScaleHeight = pfrmIn.ScaleHeight
  FormRecord(MaxForm).ScaleWidth = pfrmIn.ScaleWidth
  AddForm = MaxForm
  MaxForm = MaxForm + 1

  For Each FormControl In pfrmIn
    i = FindControl(FormControl, pfrmIn.Name)
    If i < 0 Then
      i = AddControl(FormControl, pfrmIn.Name)
    End If
  Next FormControl

End Function

Function FindControl(inControl As Control, inName As String) As Long

  Dim i As Long
  FindControl = -1

  For i = 0 To (MaxControl - 1)
    If ControlRecord(i).Parrent = inName Then
      If ControlRecord(i).Name = inControl.Name Then
        On Error Resume Next
        If ControlRecord(i).Index = inControl.Index Then
          FindControl = i
          Exit Function
        End If
        On Error GoTo 0
      End If
    End If
  Next i
End Function

Function AddControl(inControl As Control, inName As String) As Long

  ReDim Preserve ControlRecord(MaxControl + 1)
  On Error Resume Next
  ControlRecord(MaxControl).Name = inControl.Name
  ControlRecord(MaxControl).Index = inControl.Index
  ControlRecord(MaxControl).Parrent = inName

  If TypeOf inControl Is Line Then
    ControlRecord(MaxControl).Top = inControl.Y1
    ControlRecord(MaxControl).Left = ActualPos(inControl.X1)
    ControlRecord(MaxControl).Height = inControl.Y2
    ControlRecord(MaxControl).Width = ActualPos(inControl.X2)
  Else
    ControlRecord(MaxControl).Top = inControl.Top
    ControlRecord(MaxControl).Left = ActualPos(inControl.Left)
    ControlRecord(MaxControl).Height = inControl.Height
    ControlRecord(MaxControl).Width = inControl.Width
  End If

  inControl.IntegralHeight = False
  On Error GoTo 0
  AddControl = MaxControl
  MaxControl = MaxControl + 1
End Function

Function PerWidth(pfrmIn As Form) As Long

  Dim i As Long
  i = FindForm(pfrmIn)

  If i < 0 Then
    i = AddForm(pfrmIn)
  End If

  PerWidth = (pfrmIn.ScaleWidth * 100) \ FormRecord(i).ScaleWidth
End Function

Function PerHeight(pfrmIn As Form) As Double

  Dim i As Long
  i = FindForm(pfrmIn)

  If i < 0 Then
    i = AddForm(pfrmIn)
  End If

  PerHeight = (pfrmIn.ScaleHeight * 100) \ FormRecord(i).ScaleHeight
End Function

'各控件处理
Public Sub ResizeControl(inControl As Control, pfrmIn As Form)

  On Error Resume Next
  Dim i As Long
  Dim widthfactor As Single, heightfactor As Single
  Dim minFactor As Single
  Dim yRatio, xRatio, lTop, lLeft, lWidth, lHeight As Long
  
  yRatio = PerHeight(pfrmIn)
  xRatio = PerWidth(pfrmIn)
  i = FindControl(inControl, pfrmIn.Name)

  If inControl.Left < 0 Then
    lLeft = CLng(((ControlRecord(i).Left * xRatio) \ 100) - 75000)
  Else
    lLeft = CLng((ControlRecord(i).Left * xRatio) \ 100)
  End If

  lTop = CLng((ControlRecord(i).Top * yRatio) \ 100)
  lWidth = CLng((ControlRecord(i).Width * xRatio) \ 100)
  lHeight = CLng((ControlRecord(i).Height * yRatio) \ 100)
  
  If TypeOf inControl Is Line Then

    If inControl.X1 < 0 Then
      inControl.X1 = CLng(((ControlRecord(i).Left * xRatio) \ 100) - 75000)
    Else
      inControl.X1 = CLng((ControlRecord(i).Left * xRatio) \ 100)
    End If

    inControl.Y1 = CLng((ControlRecord(i).Top * yRatio) \ 100)
    If inControl.X2 < 0 Then
      inControl.X2 = CLng(((ControlRecord(i).Width * xRatio) \ 100) - 75000)
    Else
      inControl.X2 = CLng((ControlRecord(i).Width * xRatio) \ 100)
    End If

    inControl.Y2 = CLng((ControlRecord(i).Height * yRatio) \ 100)
  Else
    inControl.Move lLeft, lTop, lWidth, lHeight
    inControl.Move lLeft, lTop, lWidth
    inControl.Move lLeft, lTop
  End If

End Sub

Public Sub ResizeForm(pfrmIn As Form)

  Dim FormControl As Control
  Dim isVisible As Boolean
  Dim StartX, StartY, MaxX, MaxY As Long
  Dim bNew As Boolean

  If Not bRunning Then
    bRunning = True

    If FindForm(pfrmIn) < 0 Then
      bNew = True
    Else
      bNew = False
    End If
    If pfrmIn.Top < 30000 Then
      isVisible = pfrmIn.Visible
      On Error Resume Next
      If Not pfrmIn.MDIChild Then
        On Error GoTo 0
        ' ' pfrmIn.Visible = False
      Else

        If bNew Then
          StartY = pfrmIn.Height
          StartX = pfrmIn.Width
          On Error Resume Next
          For Each FormControl In pfrmIn
            If FormControl.Left + FormControl.Width + 200 > MaxX Then
              MaxX = FormControl.Left + FormControl.Width + 200
            End If

            If FormControl.Top + FormControl.Height + 500 > MaxY Then
              MaxY = FormControl.Top + FormControl.Height + 500
            End If

            If FormControl.X1 + 200 > MaxX Then
              MaxX = FormControl.X1 + 200
            End If

            If FormControl.Y1 + 500 > MaxY Then
              MaxY = FormControl.Y1 + 500
            End If

            If FormControl.X2 + 200 > MaxX Then
              MaxX = FormControl.X2 + 200
            End If

            If FormControl.Y2 + 500 > MaxY Then
              MaxY = FormControl.Y2 + 500
            End If

          Next FormControl

          On Error GoTo 0
          pfrmIn.Height = MaxY
          pfrmIn.Width = MaxX
        End If

        On Error GoTo 0
      End If

      For Each FormControl In pfrmIn
        ResizeControl FormControl, pfrmIn
      Next FormControl

      On Error Resume Next

      If Not pfrmIn.MDIChild Then
        On Error GoTo 0
        pfrmIn.Visible = isVisible
      Else

        If bNew Then
        pfrmIn.Height = StartY
        pfrmIn.Width = StartX

        For Each FormControl In pfrmIn
          ResizeControl FormControl, pfrmIn
        Next FormControl

      End If
    End If
    On Error GoTo 0
  End If
  bRunning = False
End If

End Sub

Public Sub SaveFormPosition(pfrmIn As Form)

  Dim i As Long

  If MaxForm > 0 Then

    For i = 0 To (MaxForm - 1)

      If FormRecord(i).Name = pfrmIn.Name Then

        FormRecord(i).Top = pfrmIn.Top
        FormRecord(i).Left = pfrmIn.Left
        FormRecord(i).Height = pfrmIn.Height
        FormRecord(i).Width = pfrmIn.Width
        Exit Sub
      End If
    Next i

    AddForm (pfrmIn)
  End If
End Sub

Public Sub RestoreFormPosition(pfrmIn As Form)

  Dim i As Long
  If MaxForm > 0 Then
    For i = 0 To (MaxForm - 1)
      If FormRecord(i).Name = pfrmIn.Name Then
        If FormRecord(i).Top < 0 Then
          pfrmIn.WindowState = 2
        ElseIf FormRecord(i).Top < 30000 Then
          pfrmIn.WindowState = 0
          pfrmIn.Move FormRecord(i).Left, FormRecord(i).Top, FormRecord(i).Width, FormRecord(i).Height
        Else
          pfrmIn.WindowState = 1
        End If
          Exit Sub
      End If
    Next i
  End If
End Sub

'总调用函数
Public Sub Resize_ALL(Form_Name As Form)

  Dim Obj As Object
  For Each Obj In Form_Name
    ResizeControl Obj, Form_Name
  Next Obj
End Sub

Public Sub DragForm(frm As Form)

  On Local Error Resume Next
  Call ReleaseCapture
  Call SendMessage(frm.hwnd, WM_NCLBUTTONDOWN, 2, 0)

End Sub


