Attribute VB_Name = "Module1"
' ГОТОВЫЕ РАБОЧИЕ СБОРКИ МАКРОСОВ ALLWELD


Sub OurStockInToAllweld()
'загрузка наших остатков из 1С в лист Allweld
    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    Workbooks.Open "c:\temp\АВС.xlsx"
      
    'Очищаем наши остатки по всей номенклатуре и загружаемую на сайт колонку при условии, что в колонке "очищ наш склад стоит "да"
    
    i = 2
    Do While Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 3) <> "*"
        If (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 3) <> "") And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 22) = "да" Then
        Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 24) = ""
        Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 26) = ""
        Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 49) = ""
        Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 50) = ""
        Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 51) = ""
        End If
        i = i + 1
    Loop
    
    'Грузим наши остатки в файл АВС
        i = 9
        Do While i < 1700
        j = 2
            Do While j < 3000
                a = CStr(.Cells(i, 1))
                b = CStr(Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 3))
                    
                If a = b And a <> "" And .Cells(i, 18) <> "" And .Cells(i, 18) > 0 Then
                    Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 24) = .Cells(i, 18)
                    Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 26) = "в наличии"
                    .Cells(i, 1) = "GOT IT!"
                End If
             j = j + 1
             Loop
        i = i + 1
        Loop
        
    'заполнение пустых ячеек формулировкой "нет в наличии"
    i = 2
    Do While Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 3) <> "*"
        If (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 3) <> "") And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 22) = "да" And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 24) = "" Then Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 26) = "нет в наличии"
        If (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 26) = "в наличии") Then Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 49) = 1
        If (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 26) <> "в наличии") And (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 3) <> "") Then Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 49) = 0
        If (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 27) = "в наличии") And (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 26) <> "в наличии") Then Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 50) = 1
        If ((Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 27) <> "в наличии") Or (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 26) = "в наличии")) And (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 3) <> "") Then Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 50) = 0
        If (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 26) <> "в наличии") And (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 27) <> "в наличии") And (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 29) <> "") Then Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 51) = 1
        If (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 29) = "") And (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 3) <> "") Then Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(i, 51) = 0
        i = i + 1
    Loop
        
    'Формируем файл для загрузки на сайт
    
    Range("C:C,D:D,E:E,F:F,G:G,H:H,I:I").Select
    Range("I1").Activate
    
    Range("C:C,D:D,E:E,F:F,G:G,H:H,I:I,J:J").Select
    Range("J1").Activate
    ActiveWindow.ScrollColumn = 8
    ActiveWindow.ScrollColumn = 9
    ActiveWindow.ScrollColumn = 10
    Range("C:C,D:D,E:E,F:F,G:G,H:H,I:I,J:J,K:K").Select
    Range("K1").Activate
    
    Range("C:C,D:D,E:E,F:F,G:G,H:H,I:I,J:J,K:K,L:L,M:M,N:N,O:O").Select
    Range("O1").Activate
    
    Range("C:C,D:D,E:E,F:F,G:G,H:H,I:I,J:J,K:K,L:L,M:M,N:N,O:O,S:S,T:T,X:X").Select
    Range("X1").Activate
    
    Range( _
        "C:C,D:D,E:E,F:F,G:G,H:H,I:I,J:J,K:K,L:L,M:M,N:N,O:O,S:S,T:T,X:X,Z:Z,AA:AA,AB:AB,AC:AC,AD:AD" _
        ).Select
    Range("AD1").Activate
    
    Range( _
        "C:C,D:D,E:E,F:F,G:G,H:H,I:I,J:J,K:K,L:L,M:M,N:N,O:O,S:S,T:T,X:X,Z:Z,AA:AA,AB:AB,AC:AC,AD:AD,AR:AR,AS:AS,AT:AT" _
        ).Select
    Range("AT1").Activate
    
    Range( _
        "C:C,D:D,E:E,F:F,G:G,H:H,I:I,J:J,K:K,L:L,M:M,N:N,O:O,S:S,T:T,X:X,Z:Z,AA:AA,AB:AB,AC:AC,AD:AD,AR:AR,AS:AS,AT:AT,AW:AW,AX:AX,AY:AY,AZ:AZ" _
        ).Select
    Range("AZ1").Activate
    
    Union(Range( _
        "BH:BH,C:C,D:D,E:E,F:F,G:G,H:H,I:I,J:J,K:K,L:L,M:M,N:N,O:O,S:S,T:T,X:X,Z:Z,AA:AA,AB:AB,AC:AC,AD:AD,AR:AR,AS:AS,AT:AT,AW:AW,AX:AX,AY:AY,AZ:AZ,BA:BA,BB:BB,BD:BD" _
        ), Columns("BF:BF")).Select
    Range("BH1").Activate
    
    Selection.Copy
    Workbooks.Add
    ActiveSheet.Paste
    
    
    Application.CutCopyMode = False
    ChDir "C:\temp"
    ActiveWorkbook.SaveAs Filename:="C:\temp\загрузка нашего склада на сайт.csv" _
        , FileFormat:=xlCSV, CreateBackup:=False

   
End With
End Sub

Sub AllPriceRecount()


    'Считаем цены
    
    j = 2
    
    Do While j < 27
    
    'если есть вход и наценка
    If (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) <> "") And (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 34) <> "") And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 35) = "да" Then
                'переносим старую розницу в старую цену
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 45) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 44)
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 44) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 34))
                
                'считаем остальные наценки и цены исходя из входа и новой розницы
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 38) = 0.05
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 40) = (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 44) - Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33)) / (2 * Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33))
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 42) = (3 * (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 44) - Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33))) / (4 * Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33))
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 39) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 38))
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 41) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 40))
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 43) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 42))
                'если новая розница равна старой цене, то вычищаем значение старой цены
                If Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 45) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 44) Then Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 45) = ""
     End If
     
    
    j = j + 1
    Loop

End Sub



Sub PriceGCE()

'загрузка прайс-листа ГСЕ в лист ALLWELD
    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    Workbooks.Open "c:\temp\АВС.xlsx"

        i = 11
        Do While i < 1316
            j = 2
            Do While j < 2420
                   
                If CStr(.Cells(i, 1)) = CStr(Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 17)) Then

                    If (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 35) = "да") Then Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36) = .Cells(i, 6) / Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 31)

                     Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36) * (1 - Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 37))
                    ' Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 14) = .Cells(i, 11) * 1000 * 1.2
                    ' Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 19) = .Cells(i, 4)
                    .Cells(i, 1) = "GOT IT!"
                End If
                j = j + 1
             Loop
            i = i + 1
        Loop

    'Считаем цены
    
    j = 2
    Do While j < 2420
    If Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 35) = "да" And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 16) = "GCE" And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36) <> 0 And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36) <> "" Then
                'приравниваем новую розницу к МРЦ
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 44) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36)
                'считаем остальные наценки и цены исходя из входа и новой розницы
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 38) = 0.05
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 39) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 38))
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 40) = (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 44) - Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33)) / (2 * Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33))
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 42) = (3 * (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 44) - Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33))) / (4 * Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33))
                
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 41) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 40))
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 43) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 42))
                
    End If
    j = j + 1
    Loop
    
End With
End Sub

Sub PriceSvarog()

'загрузка прайс-листа ГСЕ в лист ALLWELD
    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    Workbooks.Open "c:\temp\АВС.xlsx"

        i = 2
        Do While i < 1000
            j = 2
            Do While j < 2711
                   
                If CStr(.Cells(i, 1)) = CStr(Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 17)) And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 16) = "Сварог" Then

                    If (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 35) = "да") Then Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36) = .Cells(i, 4) / Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 31)

                     Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36) * (1 - Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 37))
                     
                    .Cells(i, 1) = "GOT IT!"
                End If
                j = j + 1
             Loop
            i = i + 1
        Loop

    'Считаем цены
    
    j = 2
    Do While j < 2711
    If Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 35) = "да" And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 16) = "Сварог" And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36) <> 0 And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36) <> "" Then
                'приравниваем новую розницу к МРЦ
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 44) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36)
                'считаем остальные наценки и цены исходя из входа и новой розницы
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 38) = 0.05
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 39) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 38))
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 40) = (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 44) - Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33)) / (2 * Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33))
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 42) = (3 * (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 44) - Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33))) / (4 * Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33))
                
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 41) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 40))
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 43) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 42))
                
    End If
    j = j + 1
    Loop
    
End With
End Sub

Sub PriceDonmet()

'загрузка прайс-листа ГСЕ в лист ALLWELD
    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    Workbooks.Open "c:\temp\АВС.xlsx"

        i = 11
        Do While i < 400
            j = 2
            Do While j < 3520
                   
                If CStr(.Cells(i, 5)) = CStr(Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 17)) And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 16) = "Донмет" Then

                    If (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 35) = "да") Then Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36) = .Cells(i, 7) / Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 31)

                     Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36) * (1 - Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 37))
                     
                    .Cells(i, 1) = "GOT IT!"
                End If
                j = j + 1
             Loop
            i = i + 1
        Loop

    'Считаем цены
    
    j = 2
    Do While j < 3520
    If Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 35) = "да" And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 16) = "Донмет" And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36) <> 0 And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36) <> "" Then
                'приравниваем новую розницу к МРЦ
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 44) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 34))
                'считаем остальные наценки и цены исходя из входа и новой розницы
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 38) = 0.05
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 39) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 38))
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 40) = (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 44) - Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33)) / (2 * Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33))
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 42) = (3 * (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 44) - Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33))) / (4 * Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33))
                
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 41) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 40))
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 43) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 42))
                
    End If
    j = j + 1
    Loop
    
End With
End Sub


Sub PriceTecmen()

'загрузка прайс-листа Tecmen в лист ALLWELD
    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    Workbooks.Open "c:\temp\АВС.xlsx"

        i = 2
        Do While i < 210
            j = 2
            Do While j < 2600
                   
                If .Cells(i, 1) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 17) And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 16) = "Tecmen" Then

                    If (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 35) = "да") Then Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36) = .Cells(i, 5) / Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 31)

                     Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36) * (1 - Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 37))
                     
                     
                    .Cells(i, 1) = "GOT IT!"
                End If
                j = j + 1
             Loop
            i = i + 1
        Loop

    'Считаем цены
    
    j = 2
    Do While j < 2600
    If Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 35) = "да" And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 16) = "Tecmen" And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36) <> 0 And Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36) <> "" Then
                'приравниваем новую розницу к МРЦ
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 44) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 36)
                'считаем остальные наценки и цены исходя из входа и новой розницы
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 38) = 0.05
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 39) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 38))
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 40) = (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 44) - Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33)) / (2 * Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33))
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 42) = (3 * (Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 44) - Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33))) / (4 * Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33))
                
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 41) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 40))
                Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 43) = Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 42))
                
    End If
    j = j + 1
    Loop
    
End With
End Sub





Sub AssortCheck()

'проверка наличия позиций из прайс-листа поставщика в файле АВС

    
    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    
    Workbooks.Open "c:\temp\АВС.xlsx"
    
    vendor = "ГСЕ"
    
    'в какой строке ключевое поле в файле остатков поставщикаи в какой колонкеу остаток
    If vendor = "ГСЕ" Then
        i = 2
        a = 0
        b = 0
        art = 1
        finish = 1000
    End If
    
    If vendor = "Сварог" Then
        i = 2
        a = 0
        b = 0
        art = 1
        finish = 1000
    End If
    

    Do While i < finish
        If .Cells(i, art) <> "" Then
            a = CStr(.Cells(i, art))
            
            j = 2
            Do While j < 5000
                b = CStr(Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 17))
                'If Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 16) = vendor Then Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 2) = "-"
                
                If b = a Then
                    'Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 2) = "+"
                    'Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 18) = .Cells(i, 2)
                    Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 19) = .Cells(i, 4)
                   .Cells(i, art) = "GOT IT!"
                    
                             
                
                 End If
          
                j = j + 1
        
             Loop
     
        
        End If
        i = i + 1
    Loop
    
  
    End With
End Sub

Sub PricePrepare()
'подготовка прайс-листа

    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    
    Columns("G:K").Select
    Selection.Delete Shift:=xlToLeft
    Range("H:AI,AK:AK,AN:AO").Select
    Range("AN1").Activate
    Selection.Delete Shift:=xlToLeft
    Columns("L:Q").Select
    Selection.Delete Shift:=xlToLeft
    Columns("N:DP").Select
    Selection.Delete Shift:=xlToLeft
    Columns("K:K").Select
    Selection.Delete Shift:=xlToLeft
    Range("E1").Select
    ActiveWorkbook.SaveAs Filename:="C:\temp\прайс-лист-АВС-allweld-ru.xlsx", _
        FileFormat:=xlOpenXMLWorkbook, CreateBackup:=False
    
  
    End With
End Sub
Sub intfix()
'округление цен
    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    
    i = 4

    Do While i < 5000
        
        If .Cells(i, 3) <> "" Then
        
            If (0 < .Cells(i, 39)) <= 300 And (.Cells(i, 39) <> "") Then .Cells(i, 39) = Int(.Cells(i, 39))
            If (0 < .Cells(i, 41)) <= 300 And (.Cells(i, 41) <> "") Then .Cells(i, 41) = Int(.Cells(i, 41))
            If (0 < .Cells(i, 43)) <= 300 And (.Cells(i, 43) <> "") Then .Cells(i, 43) = Int(.Cells(i, 43))
            If (0 < .Cells(i, 44)) <= 300 And (.Cells(i, 44) <> "") Then .Cells(i, 44) = Int(.Cells(i, 44))
            
            If (300 < .Cells(i, 39)) And (.Cells(i, 39) <> "") Then .Cells(i, 39) = Int((.Cells(i, 39)) / 10) * 10
            If (300 < .Cells(i, 41)) And (.Cells(i, 41) <> "") Then .Cells(i, 41) = Int((.Cells(i, 41)) / 10) * 10
            If (300 < .Cells(i, 43)) And (.Cells(i, 43) <> "") Then .Cells(i, 43) = Int((.Cells(i, 43)) / 10) * 10
            If (300 < .Cells(i, 44)) And (.Cells(i, 44) <> "") Then .Cells(i, 44) = Int((.Cells(i, 44)) / 10) * 10
       End If
        i = i + 1
    Loop
    
  
    End With
End Sub

Sub VendorPrice()

    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    
    i = 2

    Do While .Cells(i, 1) <> "*"
        
        If .Cells(i, 21) = "" Then
        
            .Cells(i, 21).Activate
            ActiveCell.EntireRow.Delete
            i = i - 1
            
       End If
        i = i + 1
    Loop
    
    i = 2
    Do While .Cells(i, 1) <> "*"
        
        If (.Cells(i, 2) <> "") And (.Cells(i + 1, 3)) = "" Then
        
            .Cells(i, 2).Activate
            ActiveCell.EntireRow.Delete
            i = i - 1
            
       End If
        i = i + 1
    Loop
    
    Columns("G:K").Select
    Selection.Delete Shift:=xlToLeft
    Columns("H:M").Select
    Selection.Delete Shift:=xlToLeft
    Columns("I:AC").Select
    Selection.Delete Shift:=xlToLeft
    Columns("J:J").Select
    Selection.Delete Shift:=xlToLeft
    Columns("L:T").Select
    Selection.Delete Shift:=xlToLeft
    Columns("N:DG").Select
    Selection.Delete Shift:=xlToLeft
    Range("K4").Select
    
    ActiveWorkbook.SaveAs Filename:="C:\temp\прайс-лист-GCE.xlsx", _
        FileFormat:=xlOpenXMLWorkbook, CreateBackup:=False
  
    End With
End Sub
