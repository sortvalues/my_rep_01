Attribute VB_Name = "Module4"
Sub value_scoring()
WBName = ActiveWorkbook.Name
WSNAME = ActiveCell.Worksheet.Name
With Workbooks(WBName).Sheets(WSNAME)
    
Finish = 1
Do While .Cells(Finish + 2, 3) <> ""

    i = Finish + 1
    Do While .Cells(i, 3) = ""
        i = i + 1
    Loop
    .Cells(i, 4) = "start"
    .Cells(i, 5) = i + 1
    Start = i + 1
    
    i = Start
    Do While .Cells(i, 3) <> ""
        i = i + 1
    Loop
   .Cells(i, 4) = "finish"
   .Cells(i, 5) = i - 1
   Finish = i - 1
   
   i = Start
   Min = 1000000
   Max = -1000000
   Sum = 0
   Do While i <= Finish
        If .Cells(i, 3) < Min Then Min = .Cells(i, 3)
        If .Cells(i, 3) > Max Then Max = .Cells(i, 3)
        Sum = Sum + .Cells(i, 3)
        i = i + 1
   Loop
   
   .Cells(Start, 4) = "min"
   .Cells(Start, 5) = Min
   .Cells(Finish, 4) = "max"
   .Cells(Finish, 5) = Max
   Mean = Sum / (Finish - Start + 1)
   .Cells(Start + Round((Finish - Start) / 2, 0), 4) = "mean"
   .Cells(Start + Round((Finish - Start) / 2, 0), 5) = Round(Mean, 2)
   
   i = Start
   Do While i <= Finish
        .Cells(i, 6) = Round((.Cells(i, 3) - Mean), 2)
        i = i + 1
   Loop
   
   i = Start
   Do While i <= Finish
        If .Cells(i, 6) > 0 And .Cells(i, 6) > 0.7 * (Max - Mean) Then
            .Cells(i, 3).Select
            With Selection.Interior
             .Pattern = xlSolid
             .PatternColorIndex = xlAutomatic
             .ThemeColor = xlThemeColorAccent2
             .TintAndShade = 0.599993896298105
             .PatternTintAndShade = 0
            End With
        End If
        If .Cells(i, 6) < 0 And Abs(.Cells(i, 6)) > 0.7 * (Mean - Min) Then
            .Cells(i, 3).Select
            With Selection.Interior
                .Pattern = xlSolid
                .PatternColorIndex = xlAutomatic
                .ThemeColor = xlThemeColorAccent5
                .TintAndShade = 0.599993896298105
                .PatternTintAndShade = 0
            End With
        End If
        i = i + 1
        
   Loop
Loop
.Cells(1, 3).Select
End With
End Sub

