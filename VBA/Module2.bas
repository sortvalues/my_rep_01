Attribute VB_Name = "Module2"
Sub forward()


    
    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    
    Workbooks.Open "c:\temp\perfomance.csv"
    
    Windows("perfomance.csv").Activate
    
        Columns("A:A").Select
        Selection.TextToColumns Destination:=Range("A1"), DataType:=xlDelimited, _
        TextQualifier:=xlDoubleQuote, ConsecutiveDelimiter:=False, Tab:=False, _
        Semicolon:=True, Comma:=False, Space:=False, Other:=False, FieldInfo _
        :=Array(Array(1, 1), Array(2, 1), Array(3, 1), Array(4, 1), Array(5, 1)), _
        TrailingMinusNumbers:=True
    
        
        
        Windows("TSL.xlsx").Activate
    
    i = 3
    

    Do While i < 1000
        If .Cells(i, 5) = "" Then
            
  
            j = 1
            Do While j < 42
                
  
                If Workbooks("perfomance.csv").Worksheets("perfomance").Cells(j, 1) = "Доходность в год" Then .Cells(i, 7) = Workbooks("perfomance.csv").Worksheets("perfomance").Cells(j, 2)
                If Workbooks("perfomance.csv").Worksheets("perfomance").Cells(j, 1) = "Выиграно %" Then .Cells(i, 5) = Workbooks("perfomance.csv").Worksheets("perfomance").Cells(j, 2)
                If Workbooks("perfomance.csv").Worksheets("perfomance").Cells(j, 1) = "Средний П/У" Then .Cells(i, 6) = Workbooks("perfomance.csv").Worksheets("perfomance").Cells(j, 2)
                If Workbooks("perfomance.csv").Worksheets("perfomance").Cells(j, 1) = "Количество сделок" Then .Cells(i, 8) = Workbooks("perfomance.csv").Worksheets("perfomance").Cells(j, 2)
                If Workbooks("perfomance.csv").Worksheets("perfomance").Cells(j, 1) = "Макс. просадка" Then .Cells(i, 9) = Workbooks("perfomance.csv").Worksheets("perfomance").Cells(j, 2)
                If Workbooks("perfomance.csv").Worksheets("perfomance").Cells(j, 1) = "Макс. просадка %" Then .Cells(i, 10) = Workbooks("perfomance.csv").Worksheets("perfomance").Cells(j, 2)
                If Workbooks("perfomance.csv").Worksheets("perfomance").Cells(j, 1) = "Профит фактор" Then .Cells(i, 11) = Workbooks("perfomance.csv").Worksheets("perfomance").Cells(j, 2)
                If Workbooks("perfomance.csv").Worksheets("perfomance").Cells(j, 1) = "Фактор восстановления" Then .Cells(i, 12) = Workbooks("perfomance.csv").Worksheets("perfomance").Cells(j, 2)
                 
                j = j + 1
  
             Loop
        Exit Do
          
        End If
       i = i + 1
    Loop
    
 

    End With
End Sub
