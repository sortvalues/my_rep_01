Attribute VB_Name = "Module1"
Sub VendorDataInToMatchangler()

' Excel загрузка цен и остатков из данных ПОСТАВЩИКА в лист MATCHANGLER
    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    Workbooks.Open "c:\temp\АВС.xlsx"
    
    'название поставщика в первом столбце остатков поставщика
    'allvegagroundbaits
    'allvegamain
    'artax
    
    vendor = "Strike Pro"
    
    'в какой строке ключевое поле в файле остатков поставщикаи в какой колонкеу остаток
    If vendor = "Strike Pro" Then
        StrKey1 = 2
        StrKey2 = 18
        StrKey3 = 19
        OurPriceSource = 8
        MRPSource = 9
        StockSource = 6
        VenStart = 1
        VenFin = 8200
    End If
    
    
    If vendor = "artax" Then
        StrKey1 = 1
        StrKey2 = 11
        StrKey3 = 12
        OurPriceSource = 4
        MRPSource = 5
        StockSource = 1
        VenStart = 5
        VenFin = 4200
    End If
    
    If vendor = "Salmo" Then
        StrKey1 = 2
        StrKey2 = 11
        StrKey3 = 12
        OurPriceSource = 9
        MRPSource = 8
        StockSource = 0
        VenStart = 5
        VenFin = 12300
    End If
    
    'Ищем начало и конец диапазона строк поставщика, заданного в vendor
    
    Start = 0
    i = 1
    'ищем строку с маркером -  с которой начинать поиск в нашем прайсе
    Do While (Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 1)) <> vendor And (i < 10000)
        i = i + 1
    Loop
    Start = i

    'ищем строку со следующим маркером после нашего - конечную строку, до которой надо производить поиск в нашем прайсе
    i = i + 1
    Do While Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 1) = "" And (i < 10000)
        i = i + 1
    Loop
    Finish = i
    
    
    'Очищаем наши остатки по поставщику и загружаемую на сайт колонку при условии, что в колонке "очищ склад постав стоит "да" и загрузка склада поставщика планируется
    'через указание колонки-источника данных об остатках
    
    If StockSource <> 0 Then
    i = Start
    Do While i < Finish
        If (Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 3) <> "") And Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 23) = "да" Then
        Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 25) = ""
        Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 27) = ""
        End If
        i = i + 1
    Loop
    End If
    'трем старые цены
    i = Start
    Do While i < Finish
        If (Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 3) <> "") And Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 35) = "да" Then
        Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 38) = ""
        Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 39) = ""
        Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 40) = ""
        Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 41) = ""
        Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 42) = ""
        Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 43) = ""
        Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 44) = ""
        End If
        i = i + 1
    Loop
    
       i = VenStart
        Do While i < VenFin
        j = Start
            Do While j < Finish
                a1 = CStr(.Cells(i, StrKey1))
                b1 = CStr(Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 17))
                a2 = CStr(.Cells(i, StrKey2))
                b2 = CStr(Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 18))
                a3 = CStr(.Cells(i, StrKey3))
                b3 = CStr(Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 19))
                    
                If a1 = b1 And a2 = b2 And a3 = b3 And a1 <> "" Then
                    'загружаем склад
                    If StockSource <> 0 Then
                        Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 25) = CStr(.Cells(i, StockSource))
                        If .Cells(i, StockSource) <> "" Then Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 27) = "в наличии"
                    End If
                    'загружаем цену входа с учетом делителя
                    If OurPriceSource <> 0 Then Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 33) = .Cells(i, OurPriceSource) / Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 31)
                    'загружаем цену МРЦ с учетом делителя
                    If (MRPSource <> 0) And (Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 35) = "да") Then Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 36) = .Cells(i, MRPSource) / Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 31)
                    
                    .Cells(i, StrKey1) = "GOT IT!"
                End If
             j = j + 1
             Loop
        i = i + 1
        Loop
        
    'заполнение пустых ячеек формулировкой "нет в наличии"
    If StockSource <> 0 Then
        i = Start
        Do While i < Finish
            If (Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 3) <> "") And Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 23) = "да" And Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 25) = "" Then Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(i, 27) = "нет в наличии"
            i = i + 1
        Loop
    End If
    
    'Считаем цены
    
    'Если задан вход и МРЦ
    
    j = Start
    Do While j < Finish
    If Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 3) <> "" And Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 17) <> "k" And Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 33) <> "" And (Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 36) <> "") And (Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 37) = "") Then
                'переносим старую розницу в старую цену
                Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 45) = Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 44)
                'приравниваем новую розницу к МРЦ
                Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 44) = Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 36)
                'считаем остальные наценки и цены исходя из входа и новой розницы
                Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 38) = (Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 44) - Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 33)) / (4 * Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 33))
                Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 40) = (Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 44) - Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 33)) / (2 * Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 33))
                Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 42) = (3 * (Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 44) - Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 33))) / (4 * Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 33))
                Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 39) = Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 38))
                Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 41) = Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 40))
                Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 43) = Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 33) * (1 + Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 42))
                'если новая розница равна старой цене, то вычищаем значение старой цены
                If Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 45) = Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 44) Then Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 45) = ""
               
    End If
    j = j + 1
    Loop
    
    'решаем что выгружать в YM
    j = Start
    Do While j < Finish
    If ((Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 26) = "нет в наличии") And (Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 27) = "нет в наличии")) Or (Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 44) = "") Then Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 30) = 0
    If ((Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 26) = "в наличии") Or (Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 27) = "в наличии")) And (Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 44) <> "") Then Workbooks("АВС.xlsx").Worksheets("matchangler.ru").Cells(j, 30) = 1
    j = j + 1
    Loop
    
    'Формируем файл для загрузки на сайт
    'Range("C:C,AA:AA,AB:AB,AC:AC").Select
    'Range("AC1").Activate
    'Selection.Copy
    'Workbooks.Add
    'ActiveSheet.Paste
    'ChDir "C:\temp"
    'ActiveWorkbook.SaveAs Filename:="C:\temp\наличие на складе поставщика.csv", _
    '    FileFormat:=xlCSV, CreateBackup:=False
End With
End Sub

