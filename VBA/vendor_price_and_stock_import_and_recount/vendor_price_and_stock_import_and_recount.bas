Attribute VB_Name = "Module1"
Sub VendorDataInToMatchangler()

' Excel �������� ��� � �������� �� ������ ���������� � ���� MATCHANGLER
    WBName = ActiveWorkbook.Name
    WSNAME = ActiveCell.Worksheet.Name
    With Workbooks(WBName).Sheets(WSNAME)
    Workbooks.Open "c:\temp\���.xlsx"
    
    '�������� ���������� � ������ ������� �������� ����������
    'allvegagroundbaits
    'allvegamain
    'artax
    
    vendor = "Strike Pro"
    
    '� ����� ������ �������� ���� � ����� �������� ����������� � ����� �������� �������
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
    
    '���� ������ � ����� ��������� ����� ����������, ��������� � vendor
    
    Start = 0
    i = 1
    '���� ������ � �������� -  � ������� �������� ����� � ����� ������
    Do While (Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 1)) <> vendor And (i < 10000)
        i = i + 1
    Loop
    Start = i

    '���� ������ �� ��������� �������� ����� ������ - �������� ������, �� ������� ���� ����������� ����� � ����� ������
    i = i + 1
    Do While Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 1) = "" And (i < 10000)
        i = i + 1
    Loop
    Finish = i
    
    
    '������� ���� ������� �� ���������� � ����������� �� ���� ������� ��� �������, ��� � ������� "���� ����� ������ ����� "��" � �������� ������ ���������� �����������
    '����� �������� �������-��������� ������ �� ��������
    
    If StockSource <> 0 Then
    i = Start
    Do While i < Finish
        If (Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 3) <> "") And Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 23) = "��" Then
        Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 25) = ""
        Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 27) = ""
        End If
        i = i + 1
    Loop
    End If
    '���� ������ ����
    i = Start
    Do While i < Finish
        If (Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 3) <> "") And Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 35) = "��" Then
        Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 38) = ""
        Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 39) = ""
        Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 40) = ""
        Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 41) = ""
        Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 42) = ""
        Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 43) = ""
        Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 44) = ""
        End If
        i = i + 1
    Loop
    
       i = VenStart
        Do While i < VenFin
        j = Start
            Do While j < Finish
                a1 = CStr(.Cells(i, StrKey1))
                b1 = CStr(Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 17))
                a2 = CStr(.Cells(i, StrKey2))
                b2 = CStr(Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 18))
                a3 = CStr(.Cells(i, StrKey3))
                b3 = CStr(Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 19))
                    
                If a1 = b1 And a2 = b2 And a3 = b3 And a1 <> "" Then
                    '��������� �����
                    If StockSource <> 0 Then
                        Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 25) = CStr(.Cells(i, StockSource))
                        If .Cells(i, StockSource) <> "" Then Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 27) = "� �������"
                    End If
                    '��������� ���� ����� � ������ ��������
                    If OurPriceSource <> 0 Then Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 33) = .Cells(i, OurPriceSource) / Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 31)
                    '��������� ���� ��� � ������ ��������
                    If (MRPSource <> 0) And (Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 35) = "��") Then Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 36) = .Cells(i, MRPSource) / Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 31)
                    
                    .Cells(i, StrKey1) = "GOT IT!"
                End If
             j = j + 1
             Loop
        i = i + 1
        Loop
        
    '���������� ������ ����� ������������� "��� � �������"
    If StockSource <> 0 Then
        i = Start
        Do While i < Finish
            If (Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 3) <> "") And Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 23) = "��" And Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 25) = "" Then Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(i, 27) = "��� � �������"
            i = i + 1
        Loop
    End If
    
    '������� ����
    
    '���� ����� ���� � ���
    
    j = Start
    Do While j < Finish
    If Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 3) <> "" And Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 17) <> "k" And Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 33) <> "" And (Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 36) <> "") And (Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 37) = "") Then
                '��������� ������ ������� � ������ ����
                Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 45) = Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 44)
                '������������ ����� ������� � ���
                Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 44) = Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 36)
                '������� ��������� ������� � ���� ������ �� ����� � ����� �������
                Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 38) = (Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 44) - Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 33)) / (4 * Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 33))
                Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 40) = (Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 44) - Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 33)) / (2 * Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 33))
                Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 42) = (3 * (Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 44) - Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 33))) / (4 * Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 33))
                Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 39) = Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 33) * (1 + Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 38))
                Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 41) = Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 33) * (1 + Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 40))
                Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 43) = Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 33) * (1 + Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 42))
                '���� ����� ������� ����� ������ ����, �� �������� �������� ������ ����
                If Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 45) = Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 44) Then Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 45) = ""
               
    End If
    j = j + 1
    Loop
    
    '������ ��� ��������� � YM
    j = Start
    Do While j < Finish
    If ((Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 26) = "��� � �������") And (Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 27) = "��� � �������")) Or (Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 44) = "") Then Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 30) = 0
    If ((Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 26) = "� �������") Or (Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 27) = "� �������")) And (Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 44) <> "") Then Workbooks("���.xlsx").Worksheets("matchangler.ru").Cells(j, 30) = 1
    j = j + 1
    Loop
    
    '��������� ���� ��� �������� �� ����
    'Range("C:C,AA:AA,AB:AB,AC:AC").Select
    'Range("AC1").Activate
    'Selection.Copy
    'Workbooks.Add
    'ActiveSheet.Paste
    'ChDir "C:\temp"
    'ActiveWorkbook.SaveAs Filename:="C:\temp\������� �� ������ ����������.csv", _
    '    FileFormat:=xlCSV, CreateBackup:=False
End With
End Sub

