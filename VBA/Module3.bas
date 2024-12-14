Attribute VB_Name = "Module3"
Sub FoxweldStock()


    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    
    i = 7

    Do While i < 2000
    '  If .Cells(i, 1) <> "" Then .Cells(i, 5) = .Cells(i, 4) * 1.1
      If .Cells(i, 1) <> "" And .Cells(i, 6) = "нет" Then .Cells(i, 8) = ""
      If .Cells(i, 1) <> "" And .Cells(i, 6) = "+" Then .Cells(i, 8) = ""
      If .Cells(i, 1) <> "" And .Cells(i, 6) = "++" Then .Cells(i, 8) = 100
      If .Cells(i, 1) <> "" And .Cells(i, 6) = "+++" Then .Cells(i, 8) = 1000
        i = i + 1
    Loop
    
  
    End With
End Sub

Sub GCE_Price()

'загрузка ссылок на картинки, паспорта и сертификаты из выгрузки с сайта

    
    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    
    Workbooks.Open "c:\temp\gce.xlsx"
    
    i = 2
    a = 0
    b = 0
    с = 0

    Do While i < 1250
        If .Cells(i, 3) <> "" Then
            a = .Cells(i, 1)
            
            j = 2
            Do While j < 600
                b = Workbooks("gce.xlsx").Worksheets("1").Cells(j, 1)
  
                If b = a Then
                    
                  Workbooks("gce.xlsx").Worksheets("1").Cells(j, 7) = .Cells(i, 6)
                  
                   
                 End If
  
                j = j + 1
  
             Loop
  
  
        End If
       i = i + 1
    Loop
    
   

    End With
End Sub
Sub PriceJET()
'перенос кода 1с в колонку для синхронизации с csv форматом выгрузки из ЦМС

    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    
    i = 8

    Do While i < 2000
    If .Cells(i, 3) <> "" And .Cells(i, 5) > 0 And .Cells(i, 5) <= 500 Then .Cells(i, 8) = .Cells(i, 5) * 2.1
      If .Cells(i, 3) <> "" And .Cells(i, 5) > 50 And .Cells(i, 5) <= 100 Then .Cells(i, 8) = .Cells(i, 5) * 1.9
      If .Cells(i, 3) <> "" And .Cells(i, 5) > 100 And .Cells(i, 5) <= 200 Then .Cells(i, 8) = .Cells(i, 5) * 1.7
      If .Cells(i, 3) <> "" And .Cells(i, 5) > 200 And .Cells(i, 5) <= 1000 Then .Cells(i, 8) = .Cells(i, 5) * 1.5
      If .Cells(i, 3) <> "" And .Cells(i, 5) > 1000 And .Cells(i, 5) <= 3000 Then .Cells(i, 8) = .Cells(i, 5) * 1.45
      If .Cells(i, 3) <> "" And .Cells(i, 5) > 3000 Then .Cells(i, 8) = .Cells(i, 5) * 1.4
     ' If .Cells(i, 4) = "" And .Cells(i, 5) <> "" Then .Cells(i, 7) = .Cells(i, 5) + .Cells(i, 6)
     ' If .Cells(i, 4) = "" And .Cells(i, 5) = "" Then .Cells(i, 7) = .Cells(i, 6)
      '  If Left(.Cells(i, 2), 1) = " " Then .Cells(i, 3) = Mid(.Cells(i, 2), 2)
       
        i = i + 1
    Loop
    
  
    End With
End Sub
Sub CodePrepare222()
'перенос кода 1с в колонку для синхронизации с csv форматом выгрузки из ЦМС

    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    
    i = 2

    Do While i < 1400
        If .Cells(i, 6) <> 0 Then .Cells(i, 4) = .Cells(i, 6)
        
       
        i = i + 1
    Loop
    
  
    End With
End Sub

Sub CodePrepare()
'перенос кода 1с в колонку для синхронизации с csv форматом выгрузки из ЦМС

    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    
    i = 2
    a = 0

    Do While i < 1428
    
        If .Cells(i, 1) <> "" Then a = "https://allweld.ru/upload/images/" + Str(.Cells(i, 1)) + ".jpg"
        If .Cells(i, 2) <> "" Then a = a + ";" + "https://allweld.ru/upload/images/" + .Cells(i, 2) + ".jpg"
        If .Cells(i, 3) <> "" Then a = a + ";" + "https://allweld.ru/upload/images/" + .Cells(i, 3) + ".jpg"
        If .Cells(i, 4) <> "" Then a = a + ";" + "https://allweld.ru/upload/images/" + .Cells(i, 4) + ".jpg"
        If .Cells(i, 5) <> "" Then a = a + ";" + "https://allweld.ru/upload/images/" + .Cells(i, 5) + ".jpg"
        If .Cells(i, 6) <> "" Then a = a + ";" + "https://allweld.ru/upload/images/" + .Cells(i, 6) + ".jpg"
        If .Cells(i, 7) <> "" Then a = a + ";" + "https://allweld.ru/upload/images/" + .Cells(i, 7) + ".jpg"
        If .Cells(i, 8) <> "" Then a = a + ";" + "https://allweld.ru/upload/images/" + .Cells(i, 8) + ".jpg"
        If .Cells(i, 9) <> "" Then a = a + ";" + "https://allweld.ru/upload/images/" + .Cells(i, 9) + ".jpg"
        If .Cells(i, 10) <> "" Then a = a + ";" + "https://allweld.ru/upload/images/" + .Cells(i, 10) + ".jpg"
        If .Cells(i, 11) <> "" Then a = a + ";" + "https://allweld.ru/upload/images/" + .Cells(i, 11) + ".jpg"
        .Cells(i, 13) = a
    
     '   .Cells(i, 3) = .Cells(i, 2) + "-1"
     '   .Cells(i, 4) = .Cells(i, 2) + "-2"
     '   .Cells(i, 5) = .Cells(i, 2) + "-3"
     '   .Cells(i, 6) = .Cells(i, 2) + "-4"
     '   .Cells(i, 7) = .Cells(i, 2) + "-5"
     '   .Cells(i, 8) = .Cells(i, 2) + "-6"
     '   .Cells(i, 9) = .Cells(i, 2) + "-7"
     '   .Cells(i, 10) = .Cells(i, 2) + "-8"
     '   .Cells(i, 11) = .Cells(i, 2) + "-9"
     '   .Cells(i, 12) = .Cells(i, 2) + "-10"
     '   .Cells(i, 13) = .Cells(i, 2) + "-11"
     '   .Cells(i, 14) = .Cells(i, 2) + "-12"
     '   .Cells(i, 15) = .Cells(i, 2) + "-13"
        
        
        
     'If .Cells(i, 13) <> "" Then .Cells(i, 14) = "https://allweld.ru/upload/images/" + .Cells(i, 13) + ".jpg"
     ' If .Cells(i, 2) <> "" And .Cells(i, 3) = "" Then .Cells(i, 16) = .Cells(i, 2)
     '  .Cells(i, 17) = "https://allweld.ru/upload/images/" + .Cells(i, 3) + ".jpg"
     '  .Cells(i, 18) = "https://allweld.ru/upload/images/" + .Cells(i, 4) + ".jpg"
     '  .Cells(i, 19) = "https://allweld.ru/upload/images/" + .Cells(i, 5) + ".jpg"
     '  .Cells(i, 20) = "https://allweld.ru/upload/images/" + .Cells(i, 6) + ".jpg"
     '  .Cells(i, 21) = "https://allweld.ru/upload/images/" + .Cells(i, 7) + ".jpg"
     '  .Cells(i, 22) = "https://allweld.ru/upload/images/" + .Cells(i, 8) + ".jpg"
     '  .Cells(i, 23) = "https://allweld.ru/upload/images/" + .Cells(i, 9) + ".jpg"
     '  .Cells(i, 24) = "https://allweld.ru/upload/images/" + .Cells(i, 10) + ".jpg"
     '  .Cells(i, 25) = "https://allweld.ru/upload/images/" + .Cells(i, 11) + ".jpg"
     '  .Cells(i, 26) = "https://allweld.ru/upload/images/" + .Cells(i, 12) + ".jpg"
     '  .Cells(i, 27) = "https://allweld.ru/upload/images/" + .Cells(i, 13) + ".jpg"
     '  .Cells(i, 28) = "https://allweld.ru/upload/images/" + .Cells(i, 14) + ".jpg"
     '  .Cells(i, 29) = "https://allweld.ru/upload/images/" + .Cells(i, 15) + ".jpg"
       
       
     '  .Cells(i, 30) = .Cells(i, 17) + ";" + .Cells(i, 18) + ";" + .Cells(i, 19) + ";" + .Cells(i, 20) + ";" + .Cells(i, 21) + ";" + .Cells(i, 22) + ";" + .Cells(i, 23) + ";" + .Cells(i, 24) + ";" + .Cells(i, 25) + ";" + .Cells(i, 26) + ";" + .Cells(i, 27) + ";" + .Cells(i, 28) + ";" + .Cells(i, 29)
        i = i + 1
    Loop
    
  
    End With
End Sub

Sub CodePrepare1()
'перенос кода 1с в колонку для синхронизации с csv форматом выгрузки из ЦМС

    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    
    i = 1

    Do While i < 1127
        
        .Cells(i, 5) = CStr(.Cells(i, 3))
        
        i = i + 1
    Loop
    
  
    End With
End Sub

Sub CodePrepare2()
'перенос кода 1с в колонку для синхронизации с csv форматом выгрузки из ЦМС

    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    
    i = 1

    Do While i < 505
        
        If .Cells(i, 3) <> "" Then .Cells(i, 5) = .Cells(i, 3) + " " + .Cells(i, 4)
        If .Cells(i, 3) = "" Then .Cells(i, 5) = .Cells(i, 4)
        
        i = i + 1
    Loop
    
  
    End With
End Sub

Sub ischemNEW()

'загрузка ссылок на картинки, паспорта и сертификаты из выгрузки с сайта

    
    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    
    Workbooks.Open "c:\temp\111.xlsx"
    
    i = 2
    a = 0
    b = 0

    Do While i < 1250
        If .Cells(i, 3) <> "" Then
            a = .Cells(i, 3)
  
            j = 2
            Do While j < 1210
                b = Workbooks("111.xlsx").Worksheets("Лист 1").Cells(j, 3)
  
                If b = a Then
                    
                  
                    
                   .Cells(i, 1) = "есть"
                '   .Cells(i, 10) = Workbooks("111.xls").Worksheets("TDSheet").Cells(j, 2)
                '     .Cells(i, 18) = Workbooks("123.xls").Worksheets("TDSheet").Cells(j, 4)
  
                 End If
  
                j = j + 1
  
             Loop
  
  
        End If
       i = i + 1
    Loop
    
   

    End With
End Sub

Sub ischemOLD()

'загрузка ссылок на картинки, паспорта и сертификаты из выгрузки с сайта

    
    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    
    Workbooks.Open "c:\temp\items.xlsx"
    
    i = 2
    a = 0
    b = 0

    Do While i < 1250
        If .Cells(i, 3) <> "" Then
            a = .Cells(i, 3)
  
            j = 2
            Do While j < 1250
                b = Workbooks("items.xlsx").Worksheets("items").Cells(j, 3)
  
                If b = a Then
                    
                  
                    
                   .Cells(i, 4) = "есть"
                '   .Cells(i, 10) = Workbooks("111.xls").Worksheets("TDSheet").Cells(j, 2)
                '     .Cells(i, 18) = Workbooks("123.xls").Worksheets("TDSheet").Cells(j, 4)
  
                 End If
  
                j = j + 1
  
             Loop
  
  
        End If
       i = i + 1
    Loop
    
   

    End With
End Sub


Sub num1()
'проверка наличия позиций из 1С в АВС
    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    Workbooks.Open "c:\temp\АВС.xlsx"
    


        i = 2
    
        Do While i < 5100
            j = 2
                Do While j < 5000
                a = CStr(.Cells(i, 3))
                b = CStr(Workbooks("АВС.xlsx").Worksheets("allweld.ru").Cells(j, 3))
                    
                If a = b And a <> "" Then .Cells(i, 3) = "GOT IT!"
                
           
            j = j + 1
            Loop
            i = i + 1
        Loop
    
   
End With
End Sub

Sub NewPositions()


    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    
        i = 2
        Do While i < 1368
            
            If .Cells(i, 1) <> "" Then .Cells(i, 1) = .Cells(i, 1) + " " + CStr(.Cells(i, 2))
            
            i = i + 1
        Loop

      
End With
End Sub

Sub New11()


    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    
        i = 2
        Do While i < 3000
            
            If .Cells(i, 2) = .Cells(i - 1, 2) Then
                If .Cells(i, 5) <> "" Then .Cells(i - 1, 5) = .Cells(i - 1, 5) + ";" + .Cells(i, 5)
                .Cells(i, 5).Activate
                ActiveCell.EntireRow.Delete
                i = i - 1
            End If
            
            i = i + 1
        Loop

      
End With
End Sub

Sub new12345()


    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    
        i = 2
        Do While i < 1368
            
            j = 10
            .Cells(i, 9) = "Характеристики:<br> <ul>"
            Do While j < 139
               If .Cells(i, j) <> "" Then .Cells(i, 9) = .Cells(i, 9) + "<li>" + .Cells(1, j) + " : " + CStr(.Cells(i, j)) + "</li>"
            j = j + 1
            Loop
            
        If .Cells(i, 9) <> "" Then .Cells(i, 9) = .Cells(i, 9) + "</ul>"
        If .Cells(i, 9) = "Характеристики:<br> <ul> <li>" Then .Cells(i, 9) = ""
        
            
            i = i + 1
        Loop

      
End With
End Sub
