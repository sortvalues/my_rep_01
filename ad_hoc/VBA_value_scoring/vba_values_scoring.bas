Attribute VB_Name = "Module4"
Sub value_scoring()
WBName = ActiveWorkbook.Name
WSNAME = ActiveCell.Worksheet.Name
With Workbooks(WBName).Sheets(WSNAME)
    
finish = 1
Do While .Cells(finish + 2, 3) <> ""

    i = finish + 1
    Do While .Cells(i, 3) = ""
        i = i + 1
    Loop
    Cells(i, 4) = i
    Start = i + 1
    
    i = Start
    Do While .Cells(i, 3) <> ""
        i = i + 1
    Loop
   .Cells(i, 4) = i
   finish = i - 1
   
   i = Start
   Min = 1000000
   Max = -1000000
   Sum = 0
   Do While i <= finish
        If .Cells(i, 3) < Min Then Min = .Cells(i, 3)
        If .Cells(i, 3) > Max Then Max = .Cells(i, 3)
        Sum = Sum + .Cells(i, 3)
        i = i + 1
   Loop
   Mean = Sum / (finish - Start)

   i = Start
   Do While i <= finish
        .Cells(i, 5) = Round((.Cells(i, 3) - Mean), 2)
        i = i + 1
   Loop
   
   i = Start
   Do While i <= finish
        If .Cells(i, 5) > 0 And .Cells(i, 5) > 0.8 * (Max - Mean) Then
            .Cells(i, 6).Select
            With Selection.Interior
                .Pattern = xlSolid
                .PatternColorIndex = xlAutomatic
                .Color = 255
                .TintAndShade = 0
                .PatternTintAndShade = 0
            End With
        End If
        If .Cells(i, 5) < 0 And Abs(.Cells(i, 5)) > 0.8 * (Mean - Min) Then
            .Cells(i, 6).Select
            With Selection.Interior
                .Pattern = xlSolid
                .PatternColorIndex = xlAutomatic
                .ThemeColor = xlThemeColorLight2
                .TintAndShade = -0.249977111117893
                .PatternTintAndShade = 0
            End With
        End If
        i = i + 1
        
   Loop
Loop
End With
End Sub

