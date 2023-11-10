Attribute VB_Name = "Modul1"
Public UserPath As String

Sub ExportProjectDataToExcel()
    Dim pjApp As Object
    Dim pjProj As Object
    Dim xlApp As Object
    Dim xlWb As Object
    Dim xlWs As Object
    Dim t As Object
    Dim Resources As Resources
    
    Set Resources = ActiveProject.Resources
    

    
    ' Erstellen einer Instanz von MS Project.
    Set pjApp = CreateObject("MSProject.Application")
    
    ' Überprüfen ob ein Projekt geöffnet ist.
    If pjApp.ActiveProject Is Nothing Then
        MsgBox "Kein Projekt geöffnet."
        Exit Sub
    End If
    
    ' Erstellen einer Instanz von MS Excl
    Set xlApp = CreateObject("Excel.Application")
    
    ' Erstellen Sie eine neue Excel-Arbeitsmappe.
    Set xlWb = xlApp.Workbooks.Add
    
    ' Überprüfen ob die Arbeitsmappe erstellt wurde.
    If xlWb Is Nothing Then
        MsgBox "Fehler beim Erstellen der Arbeitsmappe."
        Exit Sub
    End If
    
    ' Wähle Arbeitsblatt aus oder erstellen ein neues.
    On Error Resume Next
    Set xlWs = xlWb.worksheets(1)
    On Error GoTo 0
    
    ' Wenn das Arbeitsblatt nicht gefunden wurde, erstelle ein neues.
    If xlWs Is Nothing Then
        Set xlWs = xlWb.worksheets.Add
    End If
    
    ' Überschriften
    xlWs.Cells(1, 1).value = "Aufgabenname"
    xlWs.Cells(1, 2).value = "Startdatum"
    xlWs.Cells(1, 3).value = "Enddatum"
    xlWs.Cells(1, 4).value = "Arbeitstage"
    xlWs.Cells(1, 5).value = "Kosten"
    xlWs.Cells(1, 6).value = "Summary"
    xlWs.Cells(1, 7).value = "Vorgänger"
    
    ' Durchlaufen der Aufgaben im Projekt und export dieser
    Set pjProj = pjApp.ActiveProject
    For Each t In pjProj.Tasks
        Dim DifferenzInTagen As Integer
        xlWs.Cells(t.ID + 1, 1).value = t.Name
        xlWs.Cells(t.ID + 1, 2).value = t.Start
        xlWs.Cells(t.ID + 1, 3).value = t.Finish
        
        
        DifferenzInTagen = t.Duration / 480
        xlWs.Cells(t.ID + 1, 4).value = DifferenzInTagen
        xlWs.Cells(t.ID + 1, 5).value = t.Cost & " €"
        xlWs.Cells(t.ID + 1, 6).value = t.Summary
        xlWs.Cells(t.ID + 1, 7).value = t.Predecessors
        
        If t.Summary Then
            xlWs.Cells(t.ID + 1, 1).Font.Bold = True
            xlWs.Cells(t.ID + 1, 5).Font.Bold = True
        End If
        
    Next t
    
    xlWs.Columns("A:C").AutoFit
    
    ' Speichern der Arbeitsmappe
    FilePath = "C:\Users\npawelka\Desktop\Beispiel.xlsm"
    
    If Dir(FilePath) <> "" Then
        Kill FilePath
    End If
    
    xlWb.SaveAs FilePath, 52 '52 = Macro Enabled
    
    xlApp.Visible = True
    
    ' Schließen der Arbeitsmappe und Excl
    'xlWb.Close
    'xlApp.Quit
    
    ' Schließen des Projekts und Project
    'pjApp.Quit
    
    ' Freigeben der verwendeten Objekte.
    Set xlWs = Nothing
    Set xlWb = Nothing
    Set xlApp = Nothing
    Set pjProj = Nothing
    Set pjApp = Nothing
    
    MsgBox "Daten wurden erfolgreich exportiert!"
End Sub

Function link_python_excel(caller)
    Dim objShell As Object
    Dim PythonExe, PythonScript As String
    
    PythonExe = Search()
    PythonScript = UserPath & "\PDCA\export.py"

    Set objShell = VBA.CreateObject("Wscript.shell")
    
    PythonExe = """" & PythonExe & """"
    PythonExe = Replace(PythonExe, vbNewLine, "")

    PythonScript = PythonScript & " """ & caller & """"

    objShell.Run PythonExe & PythonScript
End Function

Function Search()
    Dim strCommand As String
    Dim strOutput As String
    Dim objShell As Object
    Dim objCmd As Object
    Dim objOutput As Object
    
    strCommand = "where python"
    
    Set objShell = CreateObject("WScript.Shell")
    
    Set objCmd = objShell.Exec(strCommand)
    Set objOutput = objCmd.StdOut
    
    strOutput = objOutput.ReadAll
    
    objOutput.Close
    Set objOutput = Nothing
    Set objCmd = Nothing
    Set objShell = Nothing
    
    
    Search = strOutput
End Function

Sub ImportDataFromExcel()
    Dim erfolg As Integer
    CreateScriptFolder
    
    If Not IsPythonInstalled() Then
        Dim localFolderPath As String
        MsgBox "Python ist noch nicht installiert. Installation wird nach schließen dieses Fensters gestartet... "
        localFolderPath = Environ("UserProfile") & "\script\PDCA\PythonSetup.exe"
        Call Shell(localFolderPath, vbHide)
        If Not WasExecuted(localFolderPath) Then
            MsgBox "Installation wurde abgebrochen. Um die volle Funktionalität des PDCA Planners zu nutzen müssen Sie diese Installation durchführen"
            Exit Sub
        End If
        MsgBox "Python ist jetzt installiert"
    End If
        
    erfolg = CloneGitRepo()
    If erfolg = 0 Then
        MsgBox "Fehler bei der Initialisierung"
        Exit Sub
    End If
    link_python_excel (ThisProject.FullName)
End Sub

Sub update()
    link_python_excel ("update")
End Sub


Function CreateScriptFolder()
    Dim UserProfilePath As String
    Dim ScriptFolderPath As String
    
    ' User Level Pfad
    UserProfilePath = Environ("UserProfile")
    
    ' Ordner Pfad
    ScriptFolderPath = UserProfilePath & "\script"
    UserPath = ScriptFolderPath
    
    ' Check ob der Ordner bereits existiert
    If Dir(ScriptFolderPath, vbDirectory) = "" Then
        MkDir ScriptFolderPath

    End If
End Function

Function CloneGitRepo()
    CloneGitRepo = 0
    
    Dim gitRepoURL As String
    Dim localFolderPath As String
    Dim cmd As String
    Dim shellPath As String

    gitRepoURL = "https://github.com/NicolasPawelka/Download.git"
    
    localFolderPath = Environ("UserProfile") & "/script"
    
    cmd = "git clone " & gitRepoURL & " " & localFolderPath
    
    shellPath = "C:\Windows\System32\cmd.exe"
    
    Call Shell(shellPath & " /k " & cmd, vbHide)
    
    CloneGitRepo = 1
    
End Function

Function IsPythonInstalled() As Boolean
    Dim pythonPath As String
    pythonPath = Search()
    
    ' Überprüfen, ob der Python-Pfad mit "C:" beginnt
    If Left(pythonPath, 2) = "C:" Then
        IsPythonInstalled = True
    Else
        IsPythonInstalled = False
    End If
End Function

Function WasExecuted(exePath As String) As Boolean
 Dim exeName As String
    Dim lastRunDate As Date
    Dim currentDate As Date
    
    ' Extrahieren des Dateinamens aus dem Dateipfad
    exeName = Right(exePath, Len(exePath) - InStrRev(exePath, "\"))
    
    ' Überprüfen des Dateizeitstempels der EXE-Datei
    lastRunDate = FileDateTime(exePath)
    
    ' Aktuelles Datum
    currentDate = Date
    
    ' Überprüfen, ob die EXE-Datei am heutigen Tag ausgeführt wurde
    If DateValue(lastRunDate) = currentDate Then
        WasExeRunToday = True
    Else
        WasExeRunToday = False
    End If
End Function



